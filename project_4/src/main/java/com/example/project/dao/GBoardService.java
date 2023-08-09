package com.example.project.dao;

import java.util.HashMap;
import java.util.List;

import com.example.project.model.GBoard;

public interface GBoardService {
	
	List<GBoard> searchGBoardList(HashMap<String, Object> map);
	
	int addGBoard(HashMap<String, Object> map);
	
}
