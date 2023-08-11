package com.example.project.mapper;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.example.project.model.User;

@Mapper
public interface User2Mapper {
	//회원 조회
	List<User> selectUserList(HashMap<String, Object> map);
}
