package com.example.project.dao;

import java.util.HashMap;
import java.util.List;

import com.example.project.model.Cart;



public interface CartService {
	
	//장바구니 전체 목록 출력
	List<Cart> searchCartListAll(HashMap<String, Object> map);
	
	//장바구니에서 상품 삭제
	int removeCart(HashMap<String, Object> map);
	
	//장바구니 동일 제품 들어가있는지 확인 후 추가
	HashMap<String, Object> searchCartProduct(HashMap<String, Object> map);

	
	
	
}
	
