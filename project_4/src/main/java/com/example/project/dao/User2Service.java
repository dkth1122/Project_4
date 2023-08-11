package com.example.project.dao;

import java.util.HashMap;
import java.util.List;

import com.example.project.model.User;

public interface User2Service {
	List<User> selectUserList(HashMap<String, Object> map);
}
