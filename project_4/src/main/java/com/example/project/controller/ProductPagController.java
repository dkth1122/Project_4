package com.example.project.controller;

import java.util.HashMap;
import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;



@Controller
public class ProductPagController {
	
	
	@RequestMapping("/Product/a_1.do") 
    public String memberBoard5(Model model) throws Exception{

        return "/Product/ProductPag";
    }
	
	
}
