package com.example.project.controller;

import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.example.project.dao.UserService;
import com.example.project.model.User;
import com.google.gson.Gson;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

@Controller
public class UserController {
	
	@Autowired
	UserService userService;
	@Autowired
	HttpSession session;
	
	@RequestMapping("/join.do") 
    public String join(HttpServletRequest request, Model model, @RequestParam HashMap<String, Object> map) throws Exception{
        return "/join/join";
    }
	@RequestMapping("/login.do") 
    public String login(HttpServletRequest request, Model model, @RequestParam HashMap<String, Object> map) throws Exception{
        return "/join/login";
    }
	@RequestMapping("/main.do") 
    public String main(HttpServletRequest request, Model model, @RequestParam HashMap<String, Object> map) throws Exception{
        return "/join/main";
    }
	@RequestMapping("/findId.do") 
    public String findId(HttpServletRequest request, Model model, @RequestParam HashMap<String, Object> map) throws Exception{
        return "/join/findId";
    }
	@RequestMapping("/findIdView.do") 
    public String findIdView(HttpServletRequest request, Model model, @RequestParam HashMap<String, Object> map) throws Exception{
		request.setAttribute("map", map);
        return "/join/findIdView";
    }
	@RequestMapping("/findPw.do") 
    public String findPw(HttpServletRequest request, Model model, @RequestParam HashMap<String, Object> map) throws Exception{
        return "/join/findPw";
    }
	@RequestMapping("/findPwView.do") 
    public String findPwView(HttpServletRequest request, Model model, @RequestParam HashMap<String, Object> map) throws Exception{
		request.setAttribute("map", map);
        return "/join/findPwView";
    }
	
	@RequestMapping(value = "/user.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String viewId(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		User findId = userService.viewUserId(map);
		resultMap.put("findId", findId);
		return new Gson().toJson(resultMap);
	}
	@RequestMapping(value = "/user2.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String viewPw(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		User findPw = userService.viewUserPw(map);
		resultMap.put("findPw", findPw);
		return new Gson().toJson(resultMap);
	}
	
	@RequestMapping(value = "/add.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String join(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		userService.addUser(map);
		return new Gson().toJson(resultMap);
	}
	
	@RequestMapping(value = "/login.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String login(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		resultMap = userService.userLogin(map);
		if(resultMap.containsKey("user")) {
			User user = (User)resultMap.get("user");
			session.setAttribute("sessionId", user.getuId());
			session.setAttribute("sessionName", user.getuName());
			//session.setAttribute("sessionStatus", user.getStatus());
		}
		return new Gson().toJson(resultMap);
	}
	
	@RequestMapping(value = "/findId.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String findId(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		User user = userService.searchUserId(map);
		resultMap.put("user", user);
		return new Gson().toJson(resultMap);
	}
	
	@RequestMapping(value = "/check.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String check(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		int cnt = userService.searchUserCnt(map);
		resultMap.put("cnt", cnt);
		return new Gson().toJson(resultMap);
	}
	
	@RequestMapping(value = "/findPw.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String findPw(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		User user = userService.searchUserPw(map);
		resultMap.put("user", user);
		return new Gson().toJson(resultMap);
	}
	
	
}
