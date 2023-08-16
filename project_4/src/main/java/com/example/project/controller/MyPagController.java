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
import com.example.project.dao.InquiryService;
import com.example.project.dao.OrderService;
import com.example.project.model.DeliveryUser;
import com.example.project.model.Inquiry;
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
	
	@Autowired
	InquiryService inquiryService;
	
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
    public String editAddr(HttpServletRequest request,Model model,@RequestParam HashMap<String, Object> map) throws Exception{
		request.setAttribute("map", map);
        return "/myPag/editAddr";
    }
	//배송주소록 등록
	@RequestMapping("/mypag/addAddr.do") 
    public String addAddr(HttpServletRequest request,Model model,@RequestParam HashMap<String, Object> map) throws Exception{
		request.setAttribute("map", map);
        return "/myPag/addAddr";
    }
	//주소API
	@RequestMapping("/mypag/addr.do") 
    public String addr(Model model, @RequestParam HashMap<String, Object> map, HttpServletRequest request) throws Exception{
		
		return "/myPag/jusoPopup";
    }
	//주문내역
	@RequestMapping("/mypag/myInformation.do") 
    public String myProductInformation1(Model model, @RequestParam HashMap<String, Object> map, HttpServletRequest request) throws Exception{
        return "/myPag/myInformation";
    }
	//마이페이지 1:1문의 myInquiry
	@RequestMapping("/mypag/myInquiry.do") 
	public String myInquiry(Model model) throws Exception{
		return "/myPag/myInquiry";
	}
	//마이페이지 1:1문의 글쓰기
		@RequestMapping("/mypag/myAddInquiry.do") 
		public String myAddInquiry(Model model) throws Exception{
			return "/myPag/myAddInquiry";
	}
	//마이페이지 문의글 상세보기
		@RequestMapping("/mypag/myInquiryView.do") 
		public String myInquiryView(HttpServletRequest request,Model model,@RequestParam HashMap<String, Object> map) throws Exception{
			request.setAttribute("map", map);
			return "/myPag/myInquiryView";
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
		
	//마이페이지 배송주소록수정
		@RequestMapping(value = "/mypag/editAddr.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
		@ResponseBody
		public String editAddr(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
			HashMap<String, Object> resultMap = new HashMap<String, Object>();
			deliveryService.editAddr(map);
			return new Gson().toJson(resultMap);
		}
	//마이페이지 배송주소록등록
		@RequestMapping(value = "/mypag/addAddr.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
		@ResponseBody
		public String addAddr(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
			HashMap<String, Object> resultMap = new HashMap<String, Object>();
			deliveryService.addAddr(map);
			return new Gson().toJson(resultMap);
		}
	//마이페이지 배송주소록삭제
		@RequestMapping(value = "/mypag/deleteAddr.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
		@ResponseBody
		public String deleteAddr(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
			HashMap<String, Object> resultMap = new HashMap<String, Object>();
			deliveryService.deleteAddr(map);
			return new Gson().toJson(resultMap);
		}
	//마이페이지 1:1문의내역 출력
		@RequestMapping(value = "/mypag/userInquiry.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
		@ResponseBody
		public String userInquiry(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
			HashMap<String, Object> resultMap = new HashMap<String, Object>();
			List<Inquiry> list = inquiryService.searchMypageInquiry(map);
			resultMap.put("list", list);
			return new Gson().toJson(resultMap);
		}
	//마이페이지 배송주소록등록
		@RequestMapping(value = "/mypag/myPageAddInquiry.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
		@ResponseBody
		public String myPageAddInquiry(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
				HashMap<String, Object> resultMap = new HashMap<String, Object>();
				inquiryService.myPageAddBoard(map);
				return new Gson().toJson(resultMap);
		}
	//마이페이지 문의 첨부파일추가
		
		
	

}
