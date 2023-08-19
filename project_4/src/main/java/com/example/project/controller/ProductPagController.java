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
	
	//BTS 상품 메인 페이지 (전체 상품 최신순 정렬)
	@RequestMapping("/product/BTS.do") 
	public String productPrintBTS(Model model) throws Exception{
			
		return "/Product/BTS/productList_Main";
	}
	
	//TXT 상품 메인 페이지 (전체 상품 최신순 정렬)
	@RequestMapping("/product/TXT.do") 
	public String productPrintTXT(Model model) throws Exception{
			
		return "/Product/TXT/productList_Main";
	}

	//EHP 상품 메인 페이지 (전체 상품 최신순 정렬)
	@RequestMapping("/product/EHP.do") 
	public String productPrintEHP(Model model) throws Exception{
			
		return "/Product/EHP/productList_Main";
	}

	//SVT 상품 메인 페이지 (전체 상품 최신순 정렬)
	@RequestMapping("/product/SVT.do") 
	public String productPrintSVT(Model model) throws Exception{
			
		return "/Product/SVT/productList_Main";
	}

	//FMN 상품 메인 페이지 (전체 상품 최신순 정렬)
	@RequestMapping("/product/FMN.do") 
	public String productPrintFMN(Model model) throws Exception{
			
		return "/Product/FMN/productList_Main";
	}

	//LSF 상품 메인 페이지 (전체 상품 최신순 정렬)
	@RequestMapping("/product/LSF.do") 
	public String productPrintLSF(Model model) throws Exception{
			
		return "/Product/LSF/productList_Main";
	}

	//NJS 상품 메인 페이지 (전체 상품 최신순 정렬)
	@RequestMapping("/product/NJS.do") 
	public String productPrintNJS(Model model) throws Exception{
			
		return "/Product/NJS/productList_Main";
	}

	//BND 상품 메인 페이지 (전체 상품 최신순 정렬)
	@RequestMapping("/product/BND.do") 
	public String productPrintBND(Model model) throws Exception{
			
		return "/Product/BND/productList_Main";
	}

	//ZIC 상품 메인 페이지 (전체 상품 최신순 정렬)
	@RequestMapping("/product/ZIC.do") 
	public String productPrintZIC(Model model) throws Exception{
			
		return "/Product/ZIC/productList_Main";
	}

	
	
}
