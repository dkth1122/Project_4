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
import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
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
	
	//장바구니 - 결제 페이지
	@RequestMapping("/payment/cartPayment.do") 
    public String cartPayment(HttpServletRequest request, Model model, @RequestParam HashMap<String, Object> map) throws Exception{
		request.setAttribute("map", map);
        return "/PaymentAndCart/cartPayment";
    }
	
	 
	 @RequestMapping(value = "/payment/insertProductPayment2.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
		@ResponseBody
		public String insertProductPayment2(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
			HashMap<String, Object> resultMap = new HashMap<String, Object>();
			paymentService.insertProductBuy2(map);
			resultMap.put("message", "success");
			return new Gson().toJson(resultMap);
	}
	
	 //여러 값 체크박스로 보내기
		@RequestMapping(value = "/payment/insertALL.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
		@ResponseBody
		public String removeBoard(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
			HashMap<String, Object> resultMap = new HashMap<String, Object>();
			 paymentService.addProductBuy(map);
			 
			return new Gson().toJson(resultMap);
		}
		
		
}
