package com.example.project.dao;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.project.mapper.ABoardMapper;
import com.example.project.model.ABoard;


@Service
public class ABoardServiceImpl implements ABoardService{
	
	@Autowired
	ABoardMapper aboardMapper;
	
	@Override
	public HashMap<String, Object> selectABoardList(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		resultMap.put("list", aboardMapper.selectABoardList(map));
		resultMap.put("cnt", aboardMapper.selectCnt(map));
		return resultMap;
	}

	@Override
	public int insertABoard(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		return aboardMapper.insertABoard(map);
	}

	@Override
	public ABoard selectABoardInfo(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		return aboardMapper.selectABoardInfo(map);
	}

	@Override
	public int updateABoard(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		return aboardMapper.updateABoard(map);
	}

	@Override
	public int deleteABoard(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		return aboardMapper.deleteABoard(map);
	}
}
