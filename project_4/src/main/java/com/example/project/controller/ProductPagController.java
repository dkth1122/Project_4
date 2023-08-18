package com.example.project.controller;

import java.util.HashMap;
import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import jakarta.servlet.http.HttpServletRequest;



@Controller
public class ProductPagController {
	
	
	@RequestMapping("/product/main.do") 
    public String memberBoard5(Model model) throws Exception{

        return "/Product/productPag";
    }
	
	// BTS DVD 상품 리스트
	@RequestMapping("/product/productPagBTS_DVD.do") 
    public String BTS_DVD(Model model) throws Exception{

        return "/Product/productPagBTS_DVD";
    }
	
	// 상품 상세 페이지
		@RequestMapping("/product/productView.do") 
		public String productView(HttpServletRequest request, Model model, @RequestParam HashMap<String, Object> map) throws Exception{
			request.setAttribute("map", map);
	        return "/Product/productView";
	    }
	
	
	
}
