package com.example.project.dao;

import java.util.HashMap;
import java.util.List;

import com.example.project.model.Cart;



public interface CartService {
	
	//장바구니 동일 제품 들어가있는지 확인 후 추가
	HashMap<String, Object> searchCartProduct(HashMap<String, Object> map);

	
}
	
