package com.example.project.controller;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.example.project.dao.PaymentService;
import com.example.project.model.Product;
import com.google.gson.Gson;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

@Controller
public class PaymentController {

	@Autowired
	HttpSession session;
	
	@Autowired
	PaymentService paymentService;

	//바로 구매 - 결제 페이지
	@RequestMapping("/payment/payment.do") 
    public String payment(HttpServletRequest request, Model model, @RequestParam HashMap<String, Object> map) throws Exception{
		request.setAttribute("map", map);
        return "/PaymentAndCart/payment";
    }
	
	//테스트
	@RequestMapping("/staff/testGraph.do") 
    public String test(HttpServletRequest request, Model model, @RequestParam HashMap<String, Object> map) throws Exception{
		request.setAttribute("map", map);
        return "/Staff/staff-testGraph";
    }
	
	//장바구니 - 결제 페이지
	@RequestMapping("/payment/cartPayment.do") 
    public String cartPayment(HttpServletRequest request, Model model, @RequestParam HashMap<String, Object> map) throws Exception{
		request.setAttribute("map", map);
        return "/PaymentAndCart/cartPayment";
    }
	
	//바로 구매용 dox : fnGetList
	@RequestMapping(value = "/payment/searchProductAll.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String searchProductAll(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		List<Product> list = paymentService.searchProductAll(map);
		resultMap.put("list", list);
		return new Gson().toJson(resultMap);
	}
	
	 
	//결제 후 -> 인서트 여러개 하기
	@RequestMapping(value = "/payment/insertALL.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String insertALL(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		resultMap = paymentService.addProductBuy(map);
		
		System.out.println(resultMap.get("buyNo"));
		
		return new Gson().toJson(resultMap);
	}
	
	//결제 -> 인서트 후 -> 딜리버리 테이블에 등록
	 @RequestMapping(value = "/payment/insertDelivery.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
		@ResponseBody
		public String addDelivery(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
			HashMap<String, Object> resultMap = new HashMap<String, Object>();
			paymentService.addDelivery(map);
			resultMap.put("message", "success");
			return new Gson().toJson(resultMap);
	}
	
		
}
