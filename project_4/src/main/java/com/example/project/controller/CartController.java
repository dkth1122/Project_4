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

import com.example.project.dao.CartService;
import com.example.project.dao.PaymentService;
import com.example.project.dao.TestService;
import com.example.project.model.Test;
import com.example.project.model.Wish;
import com.google.gson.Gson;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

@Controller
public class CartController {
	
	@Autowired
	CartService cartService;
	
	@Autowired
	HttpSession session;

	//결제 페이지
	@RequestMapping("/cart/cartList.do") 
    public String mainGBoard(Model model) throws Exception{

        return "/PaymentAndCart/cart";
    }
	
	@RequestMapping(value = "/cart/addCart.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String addCart(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		resultMap = cartService.searchCartProduct(map);
		return new Gson().toJson(resultMap);
	}
	
}
