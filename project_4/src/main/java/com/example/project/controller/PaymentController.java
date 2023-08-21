package com.example.project.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.example.project.dao.PaymentService;

import jakarta.servlet.http.HttpSession;

@Controller
public class PaymentController {

	@Autowired
	HttpSession session;
	
	@Autowired
	PaymentService paymentService;

	//결제 페이지
	@RequestMapping("/payment.do") 
    public String mainGBoard(Model model) throws Exception{

        return "/PaymentAndCart/payment";
    }
	
		
		
}
