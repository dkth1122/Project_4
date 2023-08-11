package com.example.project.controller;

import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;

import jakarta.servlet.http.HttpSession;

@Controller
public class MyPagController {
	
	@Autowired
	HttpSession session;
	
	//마이페이지 보이기
	@RequestMapping("/mypag/main.do") 
    public String mainGBoard(Model model) throws Exception{

        return "/myPag/myPag01";
    }
	
	//마이페이지 사용자 정보
	@RequestMapping(value = "/mypag/Info.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String mypagInfo(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		
		resultMap.put("message", "");
		return new Gson().toJson(resultMap);
	}
	

}
