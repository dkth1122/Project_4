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

import com.example.project.dao.InquiryService;
import com.example.project.model.Inquiry;
import com.google.gson.Gson;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

@Controller
public class InquiryController {
	
	@Autowired
	HttpSession session;
	
	@Autowired
	InquiryService inquiryService;
	 
	@RequestMapping("/inquiry/list.do") 
    public String list(Model model) throws Exception{

        return "/Inquiry/inquiry-list";
    }
	
	@RequestMapping("/inquiry/view.do") 
	public String view(HttpServletRequest request, Model model, @RequestParam HashMap<String, Object> map) throws Exception{
		request.setAttribute("map", map);
		return "/Inquiry/inquiry-view";
	}
	
	@RequestMapping(value = "/inquiry/list.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String inquiryList(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		List<Inquiry> list = inquiryService.selectProductList(map);
		resultMap.put("list", list);
		return new Gson().toJson(resultMap);
	}
	
	@RequestMapping(value = "/inquiry/info.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String inquiryInfo(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		Inquiry info = inquiryService.selectProductInfo(map);
		resultMap.put("info", info);
		return new Gson().toJson(resultMap);
	}
	
	@RequestMapping(value = "/inquiry/answer.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String answer(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		inquiryService.updateInquiryAnswer(map);
		resultMap.put("message", "success");
		return new Gson().toJson(resultMap);
	}

}
