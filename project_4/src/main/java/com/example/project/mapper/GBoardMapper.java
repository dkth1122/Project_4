package com.example.project.mapper;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.example.project.model.GBoard;


@Mapper
public interface GBoardMapper {
	
	//게시글 전체 출력
	List<GBoard> selectGBoardList(HashMap<String, Object> map);
	
	//게시글 등록
	int insertGBoard(HashMap<String, Object> map);
	
	//게시글 삭제
	int deleteGBoard(HashMap<String, Object> map);
	
	//게시글 검색 
	List<GBoard> selectGBoardInfo(HashMap<String, Object> map);
	
	//GBoard에 gLike +1 
	int plusLikeGBoard(HashMap<String, Object> map);
	
	//GBoard에 gLike -1 
	int minusLikeGBoard(HashMap<String, Object> map);
	
	//GBoard_Like에 좋아요 +1 기능
	int plusLike(HashMap<String, Object> map);
	
	//GBoard_Like에 좋아요 -1 기능
	int minusLike(HashMap<String, Object> map);
	
	//GBoard_Like에 좋아요 했는지 안헀는지 체크 
	int checkLike(HashMap<String, Object> map);
	
}
