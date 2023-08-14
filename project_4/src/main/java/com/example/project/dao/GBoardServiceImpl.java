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
		// TODO Auto-generated method stub
		return gboardMapper.selectGBoardList(map);
	}

	//게시글 작성 기능
	@Override
	public int addGBoard(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		return gboardMapper.insertGBoard(map);
	}
	
	//게시글 삭제 기능
	@Override
	public int removeGBoard(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
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

}
