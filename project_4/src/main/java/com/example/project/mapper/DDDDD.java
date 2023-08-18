package com.example.project.mapper;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.example.project.model.Order;
import com.example.project.model.Product;

@Mapper
public interface DDDDD {
	//구매내역 확인
	
	List<Product> selectOrderp(HashMap<String, Object> map);
	// 사용자 장바구니 출력
	List<Product> selectcartlist(HashMap<String, Object> map);
	
	
	
	
}
