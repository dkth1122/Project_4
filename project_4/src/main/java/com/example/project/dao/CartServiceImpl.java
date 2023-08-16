package com.example.project.dao;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.project.mapper.CartMapper;
import com.example.project.model.Wish;

@Service
public class CartServiceImpl implements CartService{

	@Autowired
	CartMapper cartMapper;
	@Override
	public List<Wish> cart(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		return cartMapper.cart(map);
		
	}
	
	@Override
	public int deletecart(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		return cartMapper.deletecart(map);
	}
	

}
