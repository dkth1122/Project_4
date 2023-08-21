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
import com.example.project.dao.dd;
import com.example.project.model.Product;
import com.example.project.model.Wish;
import com.google.gson.Gson;

import jakarta.servlet.http.HttpSession;

@Controller
public class ㄷㅎㅋ {
	

	@Autowired
	HttpSession session;
	
	@Autowired
	dd dd;

	//결제 페이지
	@RequestMapping("/mypag/Order.do") 
    public String mainGBoard(Model model) throws Exception{

        return "/myPag/Order";
    }
	//헤더
	@RequestMapping("sexyheader.do") 
	public String sexyheader(Model model) throws Exception{

	return "/Product/sexyheader";
	}
	
	//구매자 리스트
	@RequestMapping(value = "/mypag/Orderp.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String boardList(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		List<Product> list = dd.searchOrderp(map);
		resultMap.put("list", list);
		return new Gson().toJson(resultMap);
	}
		
	
		
	
		
		
	@RequestMapping(value = "/mypag/selectcartlist.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String selectcartlist(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		List<Product> list = dd.selectcartlist(map);
		resultMap.put("list", list);
		return new Gson().toJson(resultMap);
	}
		
		
		
		
		
}
