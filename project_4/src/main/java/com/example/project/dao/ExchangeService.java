package com.example.project.dao;

import java.util.HashMap;
import java.util.List;

import com.example.project.model.DeliveryUser;
import com.example.project.model.Order;

public interface ExchangeService {
	// 교환/환불 접수 리스트
	List<Order> selectExchangeList(HashMap<String, Object> map);
}
