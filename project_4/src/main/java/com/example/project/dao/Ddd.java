package com.example.project.dao;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.project.mapper.DDDDD;
import com.example.project.model.Product;


@Service
public class Ddd implements dd{
	
	@Autowired
	DDDDD ddd;

	
	//구매자 상품목록 출력 
	@Override
	public List<Product> searchOrderp(HashMap<String, Object> map) {
	// TODO Auto-generated method stub
	return ddd.selectOrderp(map);
	}	
	
	
	
	// 사용자 장바구니 출력 
	@Override
	public List<Product> selectcartlist(HashMap<String, Object> map) {
	// TODO Auto-generated method stub
	return ddd.selectcartlist(map);
	}
	
	
	
}
