package com.example.project.dao;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.project.mapper.GBoardMapper;
import com.example.project.model.GBoard;

@Service
public class GBoardServiceImpl implements GBoardService{
	@Autowired
	GBoardMapper gboardMapper;

	//전체 게시글 출력
	@Override
	public List<GBoard> searchGBoardList(HashMap<String, Object> map) {
		return gboardMapper.selectGBoardList(map);
	}

	//아티스트 글만 출력
	@Override
	public List<GBoard> searchArtistGBoard(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		return gboardMapper.selectArtistGBoard(map);
	}
	
	//게시글 작성 기능
	@Override
	public HashMap<String, Object> addGBoard(HashMap<String, Object> map) {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		gboardMapper.insertGBoard(map);
		resultMap.put("gNo", map.get("gNo"));
		return resultMap;
	}
	
	//게시글 작성 후 이미지 파일 첨부
	@Override
	public int addGBoardImg(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		return gboardMapper.insertGBoardImg(map);
	}
	
	//게시글 삭제 기능
	@Override
	public int removeGBoard(HashMap<String, Object> map) {
		gboardMapper.deleteGBoardImg(map);
		return gboardMapper.deleteGBoard(map);
	}

	//게시글 검색 기능
	@Override	
	public List<GBoard> searchGBoardInfo(HashMap<String, Object> map) {
		return gboardMapper.selectGBoardInfo(map);
	}

	//게시글 좋아요 +1 하거나 이미 했으면 -1 하는 기능
	@Override
	public int likeGBoard(HashMap<String, Object> map) {
	    int result = gboardMapper.checkLike(map);
	    
	    if (result > 0) {
	        gboardMapper.minusLikeGBoard(map);
	        gboardMapper.minusLike(map);
	        return -1; // 좋아요 취소된 경우 -1 반환
	    } else {
	        gboardMapper.plusLikeGBoard(map);
	        gboardMapper.plusLike(map);
	        return 1; // 좋아요 추가된 경우 1 반환
	    }
	}

	//댓글 출력
	@Override
	public List<GBoard> searchComment(HashMap<String, Object> map) {
		return gboardMapper.selectComment(map);
	}
	
	
	//댓글 추가
	@Override
	public int addComment(HashMap<String, Object> map) {
		return gboardMapper.insertComment(map);
	}

	//댓글 삭제
	@Override
	public int removeComment(HashMap<String, Object> map) {
		return gboardMapper.deleteComment(map);
	}

	//댓글 좋아요
	@Override
	public int likeComment(HashMap<String, Object> map) {
	    int result = gboardMapper.checkLikeComment(map);
	    
	    if (result > 0) {
	        gboardMapper.minusLikeComment(map);
	        gboardMapper.minusLikeComment2(map);
	        return -1; // 좋아요 취소된 경우 -1 반환
	    } else {
	        gboardMapper.plusLikeComment(map);
	        gboardMapper.plusLikeComment2(map);
	        return 1; // 좋아요 추가된 경우 1 반환
	    }
	}

	//대댓글 추가 
	@Override
	public int addCocomment(HashMap<String, Object> map) {
		return gboardMapper.insertCocomment(map);
	}
	
	//대댓글 출력
	@Override
	public List<GBoard> searchCocomment(HashMap<String, Object> map) {
		return gboardMapper.selectCocomment(map);
	}

	//대댓글 삭제
	@Override
	public int removeCocomment(HashMap<String, Object> map) {
		return gboardMapper.deleteCocomment(map);
	}

	//신고 -> 게시글 신고 횟수 증가 + 신고 테이블에 insert
	@Override
	public int addReport(HashMap<String, Object> map) {
		gboardMapper.reportCnt(map);
		return gboardMapper.insertReport(map);
	}
	
	//신고 -> 댓글 신고 횟수 증가 + 댓글용 신고 테이블에 insert
	@Override
	public int addGCReport(HashMap<String, Object> map) {
		gboardMapper.gcBanCnt(map);
		return gboardMapper.insertGCReport(map);
	}

}
