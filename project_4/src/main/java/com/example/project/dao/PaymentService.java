package com.example.project.dao;

import java.util.HashMap;
import java.util.List;

import com.example.project.model.Order;
import com.example.project.model.Test;

public interface PaymentService {
	//결제시 오더 테이블 등록
	HashMap<String, Object> addProductBuy(HashMap<String, Object> map);
	//결제시 딜리버리 테이블 등록
	int insertProductBuy2(HashMap<String, Object> map);
	
}