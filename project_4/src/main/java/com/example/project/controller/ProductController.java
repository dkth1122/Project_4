package com.example.project.controller;

import java.util.HashMap;
import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;



@Controller
public class ProductController {
	
	@RequestMapping("/product/add.do") 
	public String add(Model model) throws Exception{
		
		return "/Product/product-add";
	}
	
	
}
