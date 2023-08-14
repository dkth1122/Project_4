package com.example.project.dao;

import java.util.HashMap;
import java.util.List;

import com.example.project.model.Event;
import com.example.project.model.User;
import com.example.project.model.User2;

public interface EventService {
	
	List<Event> selectEventList(HashMap<String, Object> map);
	
	int insertEvent(HashMap<String, Object> map);
	
	int updateEvent(HashMap<String, Object> map);
}
