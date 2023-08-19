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

import com.example.project.dao.ProductService;
import com.example.project.model.GBoard;
import com.example.project.model.Product;
import com.google.gson.Gson;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

@Controller
public class ProductPagController {
	
	@Autowired
	HttpSession session;
	
	@Autowired
	ProductService productService;
	
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
	
	// 게시글 전체 조회 기능
	@RequestMapping(value = "/product/producListMain.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String select(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		int startNum = Integer.parseInt(String.valueOf(map.get("startNum")));
		int lastNum = Integer.parseInt(String.valueOf(map.get("lastNum")));
		map.put("startNum", startNum);
		map.put("lastNum", lastNum);
		resultMap = productService.searchProductMain(map);
		return new Gson().toJson(resultMap);
	}

}
