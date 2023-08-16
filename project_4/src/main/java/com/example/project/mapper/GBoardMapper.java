package com.example.project.mapper;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.example.project.model.GBoard;


@Mapper
public interface GBoardMapper {
	
	//게시글 전체 출력
	List<GBoard> selectGBoardList(HashMap<String, Object> map);
	
	//아티스트 게시글만 출력
	List<GBoard> selectArtistGBoard(HashMap<String, Object> map);
	
	//게시글 등록
	int insertGBoard(HashMap<String, Object> map);
	//게시글 등록 시 이미지 첨부 
	int insertGBoardImg(HashMap<String, Object> map);
	
	//게시글 삭제
	int deleteGBoard(HashMap<String, Object> map);
	
	//게시글 삭제 시 이미지도 삭제
	int deleteGBoardImg(HashMap<String, Object> map);
	
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
	
	//GBoard_Like에 좋아요 눌렀는지 아닌지 체크 
	int checkLike(HashMap<String, Object> map);
	
	//GCOMMENTS 댓글 조회 
	List<GBoard> selectComment(HashMap<String, Object> map);
	
	//GCOMMENTS에 댓글 추가
	int insertComment(HashMap<String, Object> map);
	
	//GCOMMENTS 댓글 삭제
	int deleteComment(HashMap<String, Object> map);
	
	//좋아요 기능 구현
	
	//T4_GCOMMENTS 좋아요 +1 or 좋아요 -1
	int plusLikeComment(HashMap<String, Object> map);
	int minusLikeComment(HashMap<String, Object> map);
	
	//T4_GCOMMENTS_LIKE 좋아요 +1 or 좋아요 -1
	int plusLikeComment2(HashMap<String, Object> map);
	int minusLikeComment2(HashMap<String, Object> map);
	
	//	//T4_GCOMMENTS_LIKE 좋아요 눌렀는지 아닌지 체크
	int checkLikeComment(HashMap<String, Object> map);
	
	//GCOMMENTS 에 대댓글 추가 기능 구현
	int insertCocomment(HashMap<String, Object> map);
	
	//GCOMMENTS 대댓글 조회 기능
	List<GBoard> selectCocomment(HashMap<String, Object> map);
	
	//GCOMMENTS 대댓글 삭제 기능 
	int deleteCocomment(HashMap<String, Object> map);
	
	//신고 기능 구현 
	
	//1. Report 테이블에 신고 추가
	int insertReport(HashMap<String, Object> map);
	//2. Gboard에 신고 횟수 추가 
	int reportCnt(HashMap<String, Object> map);
	
	//1.댓글용 Report 테이블에 신고 추가
	int insertGCReport(HashMap<String, Object> map);
	//2. GComments 테이블 신고 횟수 추가
	int gcBanCnt(HashMap<String, Object> map);
	
}
