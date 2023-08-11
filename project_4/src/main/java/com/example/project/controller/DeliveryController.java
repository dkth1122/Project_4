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
import com.example.project.model.DeliveryUser;
import com.google.gson.Gson;

import jakarta.servlet.http.HttpServletRequest;

@Controller
public class DeliveryController {
	
	@Autowired
	DeliveryService deliveryService;
	
	/* 
	 * @RequestMapping("mypag/infoAddr.do") public String
	 * infoAddr(HttpServletRequest request, Model model, @RequestParam
	 * HashMap<String, Object> map) throws Exception{ return "/myPag/infoAddr"; }
	 * 
	 * @RequestMapping(value = "/delivery/list.dox", method = RequestMethod.POST,
	 * produces = "application/json;charset=UTF-8")
	 * 
	 * @ResponseBody public String infoAddr(Model model, @RequestParam
	 * HashMap<String, Object> map) throws Exception { HashMap<String, Object>
	 * resultMap = new HashMap<String, Object>(); List<DeliveryUser> list =
	 * deliveryService.searchDeliveryUser(map); resultMap.put("list", list); return
	 * new Gson().toJson(resultMap); }
	 */
}
