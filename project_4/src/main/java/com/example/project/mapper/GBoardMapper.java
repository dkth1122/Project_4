package com.example.project.mapper;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.example.project.model.GBoard;


@Mapper
public interface GBoardMapper {
	List<GBoard> selectGBoardList(HashMap<String, Object> map);
	
	int insertGBoard(HashMap<String, Object> map);
	//ㅇㅇㅇㅇㅇㅇ
}
