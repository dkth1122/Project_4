package com.example.project.dao;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.project.mapper.OrderMapper;
import com.example.project.model.Order;

@Service
public class OrderServiceImpl implements OrderService{

	@Autowired
	OrderMapper orderMapper;
	
	@Override
	public List<Order> orderCntsearch(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		return orderMapper.orderCntselect(map);
	}
	

	@Override
	public List<Order> orderProductSearch(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		return orderMapper.orderProductSelect(map);
	}

	
}
