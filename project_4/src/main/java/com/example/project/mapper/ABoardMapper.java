package com.example.project.mapper;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.example.project.model.ABoard;


@Mapper
public interface ABoardMapper {
	
	//공지 리스트 출력
	List<ABoard> selectABoardList (HashMap<String, Object> map);
	
	//공지 등록
	int insertABoard(HashMap<String, Object> map);
	
	//공지 상세 보기
	ABoard selectABoardInfo(HashMap<String, Object> map);
	
	//게시글 수정
	int updateABoard(HashMap<String, Object> map);
	
	//게시글 삭제
	int deleteABoard(HashMap<String, Object> map);
}
