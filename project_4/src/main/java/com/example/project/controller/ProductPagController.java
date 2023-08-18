package com.example.project.controller;

import java.util.HashMap;
import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;



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
	
	
	
	
	
}
