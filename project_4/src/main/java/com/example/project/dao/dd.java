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


}
