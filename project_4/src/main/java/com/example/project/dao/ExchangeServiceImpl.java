package com.example.project.dao;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.project.mapper.DeliveryMapper;
import com.example.project.mapper.ExchangeMapper;
import com.example.project.model.DeliveryUser;
import com.example.project.model.Order;

@Service
public class ExchangeServiceImpl implements ExchangeService{

	@Autowired
	ExchangeMapper exchangeMapper;

	@Override
	public List<Order> selectExchangeList(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		return exchangeMapper.selectExchangeList(map);
	}

	
}
