package com.example.project.dao;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.project.mapper.DDDDD;
import com.example.project.model.Product;
import com.example.project.model.Wish;


@Service
public class Ddd implements dd{
	
	@Autowired
	DDDDD ddd;

	@Override
	public List<Product> searchOrderp(HashMap<String, Object> map) {
	// TODO Auto-generated method stub
	return ddd.selectOrderp(map);
	}	
	
	
	
	
	
}
