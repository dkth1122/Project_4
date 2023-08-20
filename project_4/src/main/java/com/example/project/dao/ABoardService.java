package com.example.project.dao;

import java.util.HashMap;
import java.util.List;

import com.example.project.model.ABoard;


public interface ABoardService {
	
	HashMap<String, Object> selectABoardList(HashMap<String, Object> map);
	
	HashMap<String, Object> selectABoardList2(HashMap<String, Object> map);
	
	HashMap<String, Object> insertABoard(HashMap<String, Object> map);
	
	int insertAboardImg(HashMap<String, Object> map);
	
	ABoard selectABoardInfo(HashMap<String, Object> map);
	
	int updateABoard(HashMap<String, Object> map);
	
	int deleteABoard(HashMap<String, Object> map);
	
	//공지만 출력
	HashMap<String, Object> selectABoardList3 (HashMap<String, Object> map);

}
