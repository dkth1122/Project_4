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

import com.example.project.dao.OrderService;
import com.example.project.model.Order;
import com.example.project.model.Staff;
import com.google.gson.Gson;

import jakarta.servlet.http.HttpSession;

@Controller
public class MyPagController {
	
	@Autowired
	HttpSession session;
	
	@Autowired
	OrderService orderService;
	
	//마이페이지 주소
	@RequestMapping("/mypag/main.do") 
    public String mainGBoard(Model model) throws Exception{

        return "/myPag/myPag01";
    }
	
	@RequestMapping(value = "/mypag/infoCnt.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String add(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();	
		Order infoCnt = orderService.orderCntsearch(map);
		resultMap.put("infoCnt", infoCnt );
		return new Gson().toJson(resultMap);
	}

	

}
