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

	@Override
	public List<GBoard> searchGBoardList(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		return gboardMapper.selectGBoardList(map);
	}

	@Override
	public int addGBoard(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		return gboardMapper.insertGBoard(map);
	}


}
