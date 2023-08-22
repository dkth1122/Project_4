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
	public HashMap<String, Object> addProductBuy(HashMap<String, Object> map) {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		int subscribe = paymentMapper.selectMembershipProduct(map);
		
		
		//키트 Y로 업데이트
			paymentMapper.updateMembershipKit(map);

		//멤버쉽 구독 상품 구매 체크 후 맞으면 멤버쉽 테이블 업데이트 
		if( subscribe !=0) {
			paymentMapper.insertMembership(map);
		}
		
		//재고 업데이트
		paymentMapper.updateStock(map);
		
		//주문내역 테이블 업데이트
		paymentMapper.insertProductBuy(map);
		
		resultMap.put("message", "성공");
		return resultMap;
		
		
	}

	//결제 후 배송 테이블 등록 
	@Override
	public int insertProductBuy2(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		return paymentMapper.insertProductBuy2(map);
	}

	
}
