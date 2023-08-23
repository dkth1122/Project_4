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


	//구매확정으로 업데이트
	@Override
	public int mypageOrderConfirm(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		return ddd.mypageOrderConfirm(map);
	}
	
	//구매 전 취소
	@Override
	public int mypageOrderCancel(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		return ddd.mypageOrderCancel(map);
	}

	//배송 완료 후 교환/반품
	@Override
	public int mypageOrderchange(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
			ddd.mypageOrderchangeUpdate(map);
		return ddd.mypageOrderchangeInsert(map);
	}
	
}
