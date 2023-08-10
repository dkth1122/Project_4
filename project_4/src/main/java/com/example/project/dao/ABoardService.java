package com.example.project.dao;

import java.util.HashMap;
import java.util.List;

import com.example.project.model.ABoard;


public interface ABoardService {
	
	List<ABoard> selectABoardList(HashMap<String, Object> map);
	
	int insertABoard(HashMap<String, Object> map);
	
	ABoard selectABoardInfo(HashMap<String, Object> map);

}
