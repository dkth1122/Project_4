package com.example.project.dao;

import java.util.HashMap;

import com.example.project.model.User;

public interface UserService {
	//회원가입
	int addUser(HashMap<String, Object> map);
	//로그인
	HashMap<String, Object> userLogin(HashMap<String, Object> map);
	//유저아이디 찾기
	User searchUserId(HashMap<String, Object> map);
	//회원가입 아이디 중복체크
	int searchUserCnt(HashMap<String, Object> map);
	//아이디찾기 유저출력
	User viewUserId(HashMap<String, Object> map);
	//유저비밀번호 찾기
	User searchUserPw(HashMap<String, Object> map);
	//비밀번호찾기 유저출력
	User viewUserPw(HashMap<String, Object> map);
	//비회원 주문조회 찾기
	User searchNonOrder(HashMap<String, Object> map);
	//비회원 주문조회 출력
	User searchNonOrderNo(HashMap<String, Object> map);
	//회원정보수정
	int editInfo(HashMap<String, Object> map);
}
