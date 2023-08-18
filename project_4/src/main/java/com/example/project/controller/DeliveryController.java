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
import com.example.project.model.Order;
import com.google.gson.Gson;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

@Controller
public class DeliveryController {
	
	@Autowired
	DeliveryService deliveryService;
	
	@Autowired
	HttpSession session;
	
	@RequestMapping("/delivery/list.do") 
    public String deliveryList(Model model) throws Exception{

        return "/Delivery/delivery-list";
    }
	
	@RequestMapping("/delivery/view.do") 
	public String deliveryView(HttpServletRequest request, Model model, @RequestParam HashMap<String, Object> map) throws Exception{
		request.setAttribute("map", map);
		return "/Delivery/delivery-view";
	}
	
	
	@RequestMapping(value = "/delivery/listSelect.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String deliveryList(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		int startNum = Integer.parseInt(String.valueOf(map.get("startNum")));
		int lastNum = Integer.parseInt(String.valueOf(map.get("lastNum")));
		map.put("startNum", startNum);
		map.put("lastNum", lastNum);
		resultMap = deliveryService.deliveryListSelect(map);
		return new Gson().toJson(resultMap);
	}
	
	@RequestMapping(value = "/delivery/listInfo.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String boardList(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		List<Order> list = deliveryService.deliveryInfoSelect(map);
		resultMap.put("list", list);
		return new Gson().toJson(resultMap);
	}
}
