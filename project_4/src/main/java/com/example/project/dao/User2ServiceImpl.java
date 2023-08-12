package com.example.project.dao;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.project.mapper.User2Mapper;
import com.example.project.model.User;

@Service
public class User2ServiceImpl implements User2Service{

	@Autowired
	User2Mapper user2Mapper;

	@Override
	public List<User> selectUserList(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		return user2Mapper.selectUserList(map);
	}

	@Override
	public int userCntReset(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		return user2Mapper.userCntReset(map);
	}

	@Override
	public User selectUserInfo(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		return user2Mapper.selectUserInfo(map);
	}

	@Override
	public int userPwReset(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		return user2Mapper.userPwReset(map);
	}

	@Override
	public int userPointAdd(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		return user2Mapper.userPointAdd(map);
	}
	
}
