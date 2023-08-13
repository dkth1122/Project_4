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

import jakarta.servlet.http.HttpSession;

@Controller
public class MyPagController2 {
	
	@Autowired
	HttpSession session;
	
	@Autowired
	OrderService orderService;
	
	@Autowired
	DeliveryService deliveryService;
	
	//마이페이지 보이기
		@RequestMapping("/main/hd.do") 
	    public String mainGBoard(Model model) throws Exception{
	        return "/Product/hd";
	    }

}
