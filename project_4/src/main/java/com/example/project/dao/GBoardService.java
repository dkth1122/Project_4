package com.example.project.dao;

import java.util.HashMap;
import java.util.List;

import com.example.project.model.GBoard;

public interface GBoardService {
	
	//전체 게시글 출력
	List<GBoard> searchGBoardList(HashMap<String, Object> map);
	
	//전체 아티스트 게시글 출력
	List<GBoard> searchArtistGBoard(HashMap<String, Object> map);
	
	//게시글 등록
	HashMap<String, Object> addGBoard(HashMap<String, Object> map);
	
	//게시글 등록 중 이미지 파일 첨부
	int addGBoardImg(HashMap<String, Object> map);
	
	//게시글 삭제
	int removeGBoard(HashMap<String, Object> map);
	
	//게시글 검색
	List<GBoard> searchGBoardInfo(HashMap<String, Object> map);
	
	//좋아요 기능
	int likeGBoard(HashMap<String, Object> map);
	
	//GCOMMENTS 댓글 조회 
	List<GBoard> searchComment(HashMap<String, Object> map);
	
	//GCOMMENTS에 댓글 추가
	int addComment(HashMap<String, Object> map);
	
	//GCOMMENTS 댓글 삭제
	int removeComment(HashMap<String, Object> map);
	
	//댓글 좋아요 기능 
	int likeComment(HashMap<String, Object> map);
	
	//대댓글 달기 기능
	int addCocomment(HashMap<String, Object> map);
	
	//대댓글 조회 기능
	List<GBoard> searchCocomment(HashMap<String, Object> map);
	
	//대댓글 삭제 기능
	int removeCocomment(HashMap<String, Object> map);
	
	//신고 기능 구현
	
	//1. 신고 ->  Report 테이블에 추가 + 게시글 테이블에 신고 횟수 증가
	int addReport(HashMap<String, Object> map);
	
	//2. 신고 ->  댓글용 Report 테이블에 추가 + 댓글 테이블에 신고 횟수 증가
	int addGCReport(HashMap<String, Object> map);


}
