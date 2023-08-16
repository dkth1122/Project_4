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
import com.example.project.dao.ProductService;
import com.example.project.model.DeliveryUser;
import com.example.project.model.Order;
import com.example.project.model.Wish;
import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.google.gson.Gson;

import jakarta.servlet.http.HttpSession;

@Controller
public class MyPagController2 {
	
	@Autowired
	HttpSession session;
	
	@Autowired
	ProductService productService;
	
	@Autowired
	DeliveryService deliveryService;
	
	//마이페이지 보이기
		@RequestMapping("/main/hd.do") 
	    public String mainGBoard(Model model) throws Exception{
	        return "/Product/hd";
	    }
//		관심 상품 페이지
		@RequestMapping("/mypag/myPageInterest.do") 
	    public String myPageInterest(Model model) throws Exception{
	        return "/myPag/myPageInterest";
	    }
//		적립금 페이지
		@RequestMapping("/mypag/mypageReserves.do") 
	    public String mypageReserves(Model model) throws Exception{
	        return "/myPag/mypageReserves";
	    }
		
		
		
		
		
		
		//마이페이지 찜목록 리스트
		 @RequestMapping(value = "/mypag/wishlist.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
		@ResponseBody
		public String infoAddr(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
			HashMap<String, Object> resultMap = new HashMap<String, Object>();
			List<Wish> list = productService.searchWishProdeuct(map);
			resultMap.put("list", list);
			return new Gson().toJson(resultMap);
		}
	
		//마이페이지 찜목록 단일 삭제
		@RequestMapping(value = "/mypag/removeSingleProdeuctWish.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
		@ResponseBody
		public String removeSingle(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
			HashMap<String, Object> resultMap = new HashMap<String, Object>();
			productService.removeSingleProdeuctWish(map);
			resultMap.put("list", "삭제 완료");
			return new Gson().toJson(resultMap);
		}
		//마이페이지 찜목록 전체 삭제
		@RequestMapping(value = "/mypag/removeAllProdeuctWish.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
		@ResponseBody
		public String removeAll(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
			HashMap<String, Object> resultMap = new HashMap<String, Object>();
			productService.removeAllWish(map);
			resultMap.put("list", "삭제 완료");
			return new Gson().toJson(resultMap);
		}
		
		//마이페이지 찜목록 장바구니 등록 
		@RequestMapping(value = "/mypag/editCart.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
		@ResponseBody
		public String eidtcart(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
			HashMap<String, Object> resultMap = new HashMap<String, Object>();
			productService.editcart(map);
			resultMap.put("list", "장바구니이동완료");
			return new Gson().toJson(resultMap);
		}
// 삭제 전체 삭제 
	  @RequestMapping(value = "/mypag/removeWishProduct.dox", method = RequestMethod.POST,produces = "application/json;charset=UTF-8")  
	  @ResponseBody
	  public String remove(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
	  HashMap<String, Object> resultMap = new HashMap<String, Object>();
	  String json = map.get("selectItem").toString();
	  ObjectMapper mapper = new ObjectMapper();
	  List<Object> list = mapper.readValue(json, new TypeReference<List<Object>>(){});
	  map.put("list", list);
	  productService.removeWishProduct(map); 
	  return new Gson().toJson(resultMap);
		}
		
		
		
		
		
		
		
}
