package com.example.project.mapper;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.example.project.model.Event;

@Mapper
public interface EventMapper {
	
	//이벤트 목록 출력
	List<Event> selectEventList(HashMap<String, Object> map);
	
	//이벤트 추가
	int insertEvent(HashMap<String, Object> map);
	
	//이벤트 활성화 수정
	int updateEvent(HashMap<String, Object> map);
	
	// 페이징용 카운트
	int selectCnt(HashMap<String, Object> map);
	
	
	
}
