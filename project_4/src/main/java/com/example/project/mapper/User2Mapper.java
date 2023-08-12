package com.example.project.mapper;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.example.project.model.User;

@Mapper
public interface User2Mapper {
	//회원 조회
	List<User> selectUserList(HashMap<String, Object> map);
	
	//비밀번호 오류횟수 초기화
	int userCntReset(HashMap<String, Object> map);
	
	//회원 상세 보기
	User selectUserInfo(HashMap<String, Object> map);
	
	//비밀번호 초기화
	int userPwReset(HashMap<String, Object> map);
	
	//회원 포인트 수정
	int userPointAdd(HashMap<String, Object> map);
}
