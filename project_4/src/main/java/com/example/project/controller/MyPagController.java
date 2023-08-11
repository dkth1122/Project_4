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

import com.example.project.dao.DeliveryService;
import com.example.project.dao.OrderService;
import com.example.project.model.DeliveryUser;
import com.example.project.model.Order;
import com.google.gson.Gson;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

@Controller
public class MyPagController {
	
	@Autowired
	HttpSession session;
	
	@Autowired
	OrderService orderService;
	
	@Autowired
	DeliveryService deliveryService;
	
	//마이페이지 보이기
	@RequestMapping("/mypag/main.do") 
    public String mainGBoard(Model model) throws Exception{
        return "/myPag/myPag01";
    }
	//회원정보수정 페이지
	@RequestMapping("/mypag/infoUpdate.do") 
    public String infoUpdate(Model model) throws Exception{
        return "/myPag/infoUpdate";
    }
	//회원정보 배송주소록
	@RequestMapping("/mypag/infoAddr.do") 
    public String infoAddr(Model model) throws Exception{
        return "/myPag/infoAddr";
    }
	//배송주소록 수정
	@RequestMapping("/mypag/editAddr.do") 
    public String editAddr(Model model) throws Exception{
        return "/myPag/editAddr";
    }
	//주소API
	@RequestMapping("/mypag/addr.do") 
    public String addr(Model model, @RequestParam HashMap<String, Object> map, HttpServletRequest request) throws Exception{
		
		return "/myPag/jusoPopup";
    }
	//주문내역
	@RequestMapping("/mypag/productInformation.do") 
    public String myProductInformation(Model model) throws Exception{
        return "/myPag/myProductInformation";
    }

	//마이페이지 상단 프로필  구매 / 환불 /반품 카운터  정보
	@RequestMapping(value = "/mypag/listExchange.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String listExchange(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
			HashMap<String, Object> resultMap = new HashMap<String, Object>();
			List<Order> list = orderService.orderCntsearch(map);
			resultMap.put("list", list);
			return new Gson().toJson(resultMap);
	}
	
	
	//마이페이지 사용자 정보
	@RequestMapping(value = "/mypag/Info.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String mypagInfo(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		return new Gson().toJson(resultMap);
	}
	//마이페이지 배송주소록
	 @RequestMapping(value = "/delivery/list.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String infoAddr(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		List<DeliveryUser> list = deliveryService.searchDeliveryUser(map);
		resultMap.put("list", list);
		return new Gson().toJson(resultMap);
	}
	
	//마이페이지 주문내역
		@RequestMapping(value = "/mypag/productInformation.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
		@ResponseBody
		public String productInformation(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		List<Order> list = orderService.orderProductSearch(map);
		resultMap.put("list", list);
		return new Gson().toJson(resultMap);
		}

}
