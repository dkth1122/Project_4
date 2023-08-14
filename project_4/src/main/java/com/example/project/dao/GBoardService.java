package com.example.project.dao;

import java.util.HashMap;
import java.util.List;

import com.example.project.model.GBoard;

public interface GBoardService {
	
	//전체 게시글 출력
	List<GBoard> searchGBoardList(HashMap<String, Object> map);
	
	//게시글 등록
	int addGBoard(HashMap<String, Object> map);
	
	//게시글 삭제
	int removeGBoard(HashMap<String, Object> map);
	
	//게시글 검색
	List<GBoard> searchGBoardInfo(HashMap<String, Object> map);
	
	//좋아요 기능
	int likeGBoard(HashMap<String, Object> map);

}
