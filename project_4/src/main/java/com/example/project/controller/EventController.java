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

import com.example.project.dao.EventService;
import com.example.project.model.Event;
import com.google.gson.Gson;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

@Controller
public class EventController {
	
	
	  @Autowired EventService eventService;
	  
	  @Autowired HttpSession session;
	 
	
	@RequestMapping("event/list.do") 
    public String list(HttpServletRequest request, Model model, @RequestParam HashMap<String, Object> map) throws Exception{
        return "/Event/event-list";
    }
	
	@RequestMapping("event/add.do") 
	public String add(HttpServletRequest request, Model model, @RequestParam HashMap<String, Object> map) throws Exception{
		return "/Event/event-add";
	}
	
	@RequestMapping(value = "/event/list.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String eventlist(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		int startNum = Integer.parseInt(String.valueOf(map.get("startNum")));
		int lastNum = Integer.parseInt(String.valueOf(map.get("lastNum")));
		map.put("startNum", startNum);
		map.put("lastNum", lastNum);
		resultMap = eventService.selectEventList(map);
		return new Gson().toJson(resultMap);
	}
	
	@RequestMapping(value = "/event/add.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String eventAdd(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		eventService.insertEvent(map);
		resultMap.put("message", "success");
		return new Gson().toJson(resultMap);
	}
	
	@RequestMapping(value = "/event/update.do", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String eventUpdate(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		eventService.updateEvent(map);
		resultMap.put("message", "success");
		return new Gson().toJson(resultMap);
	}
	
	
}
