package com.example.project.dao;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.project.mapper.OrderMapper;
import com.example.project.mapper.PaymentMapper;
import com.example.project.model.Order;

@Service
public class PaymentServiceImpl implements PaymentService{

	@Autowired
	PaymentMapper paymentMapper;
	
	//결제 오더 테이블 등록
	@Override
	public int addProductBuy(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		return paymentMapper.insertProductBuy(map);
	}

	//결제 후 배송 테이블 등록 
	@Override
	public int insertProductBuy2(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		return paymentMapper.insertProductBuy2(map);
	}

	
}
