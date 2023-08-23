package com.example.project.dao;

import java.util.HashMap;
import java.util.List;

import com.example.project.model.ABoard;
import com.example.project.model.Product;
import com.example.project.model.Wish;


public interface dd {
	//구매자 상품목록 출력 
	List<Product> searchOrderp(HashMap<String, Object> map);
	// 사용자 장바구니 출력 
	List<Product> selectcartlist(HashMap<String, Object> map);
	
	//구매확정으로 업데이트
	int mypageOrderConfirm(HashMap<String, Object> map);
	
	//구매 전 취소
	int mypageOrderCancel(HashMap<String, Object> map);
	
	//배송 완료 후 교환/반품
	int mypageOrderchange(HashMap<String, Object> map);



}
