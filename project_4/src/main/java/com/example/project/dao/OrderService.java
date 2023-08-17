package com.example.project.dao;

import java.util.HashMap;
import java.util.List;

import com.example.project.model.Order;
import com.example.project.model.Test;

public interface OrderService {
	// 구매 상품 갯수 
	List<Order> orderCntsearch(HashMap<String, Object> map);
	//구매한 상품 확인 (join)
	List<Order> orderProductSearch(HashMap<String, Object> map);
	
	HashMap<String, Object> selectOrderList(HashMap<String, Object> map);
}
