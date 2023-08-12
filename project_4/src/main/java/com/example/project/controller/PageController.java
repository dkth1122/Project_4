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

import com.example.project.dao.TestService;
import com.example.project.model.Test;
import com.google.gson.Gson;

import jakarta.servlet.http.HttpServletRequest;

@Controller
public class PageController {
	
	@Autowired
	TestService testService;
	

	@RequestMapping("/hetest.do") 
	public String head(HttpServletRequest request, Model model, @RequestParam HashMap<String, Object> map) throws Exception{
		return "/page/haedtest";
	}
	
	@RequestMapping("/test.do") 
    public String test(HttpServletRequest request, Model model, @RequestParam HashMap<String, Object> map) throws Exception{
        return "/test";
    }
	@RequestMapping("/header.do") 
	public String header(HttpServletRequest request, Model model, @RequestParam HashMap<String, Object> map) throws Exception{
		return "/page/header";
	}
	@RequestMapping("/home.do") 
	public String home(HttpServletRequest request, Model model, @RequestParam HashMap<String, Object> map) throws Exception{
		return "/page/home";
	}
	
	@RequestMapping("/faq.do") 
	public String faq(HttpServletRequest request, Model model, @RequestParam HashMap<String, Object> map) throws Exception{
		return "/page/faq";
	}
	
	@RequestMapping("/mypage.do") 
	public String mypage(HttpServletRequest request, Model model, @RequestParam HashMap<String, Object> map) throws Exception{
		return "/page/mypage";
	}
	
	@RequestMapping("/faqlist.do") 
	public String list(HttpServletRequest request, Model model, @RequestParam HashMap<String, Object> map) throws Exception{
		return "/page/faq-list";
	}
	
	@RequestMapping("/faqadd.do") 
	public String add(HttpServletRequest request, Model model, @RequestParam HashMap<String, Object> map) throws Exception{
		return "/page/faq-add";
	}
	
	@RequestMapping("/mypageinclude.do") 
	public String mypageinclude(HttpServletRequest request, Model model, @RequestParam HashMap<String, Object> map) throws Exception{
		return "/page/mypageinclude";
	}
	
	@RequestMapping("/artistpage.do") 
	public String artistpage(HttpServletRequest request, Model model, @RequestParam HashMap<String, Object> map) throws Exception{
		return "/page/artistpage";
	}
	
	@RequestMapping("/productpage.do") 
	public String productpage(HttpServletRequest request, Model model, @RequestParam HashMap<String, Object> map) throws Exception{
		return "/page/productpage";
	}
	
	@RequestMapping("/eventpage.do") 
	public String eventpage(HttpServletRequest request, Model model, @RequestParam HashMap<String, Object> map) throws Exception{
		return "/page/eventpage";
	}
	
	@RequestMapping("/notifypage.do") 
	public String notifypage(HttpServletRequest request, Model model, @RequestParam HashMap<String, Object> map) throws Exception{
		return "/page/notifypage";
	}
	
	
	@RequestMapping("/search.do") 
	public String search(HttpServletRequest request, Model model, @RequestParam HashMap<String, Object> map) throws Exception{
		return "/page/search";
	}
	
	@RequestMapping("/bookmark.do") 
	public String bookmark(HttpServletRequest request, Model model, @RequestParam HashMap<String, Object> map) throws Exception{
		return "/page/bookmark";
	}
	
	@RequestMapping(value = "/list.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String boardList(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		List<Test> list = testService.searchTest();
		resultMap.put("list", list);
		return new Gson().toJson(resultMap);
	}
}
