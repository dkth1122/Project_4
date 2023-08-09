package com.example.project.service;

import java.util.HashMap;

import com.example.project.model.User;

public interface UserService {
	//회원가입
	int addUser(HashMap<String, Object> map);
	//로그인
	HashMap<String, Object> userLogin(HashMap<String, Object> map);
	//유저아이디 찾기
	User searchUserId(HashMap<String, Object> map);
}
