package com.example.project.dao;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.project.mapper.EventMapper;
import com.example.project.model.Event;

@Service
public class EventServiceImpl implements EventService{

	@Autowired
	EventMapper eventMapper;

	@Override
	public List<Event> selectEventList(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		return eventMapper.selectEventList(map);
	}

	@Override
	public int insertEvent(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		return eventMapper.insertEvent(map);
	}

	@Override
	public int updateEvent(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		return eventMapper.updateEvent(map);
	}

	
}
