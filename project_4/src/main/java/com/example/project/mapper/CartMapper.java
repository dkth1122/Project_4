package com.example.project.mapper;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.example.project.model.Cart;

@Mapper
public interface CartMapper {
	
	// 장바구니에 상품 추가
	int insertCart(HashMap<String, Object> map);
	
	//상품에 수량 추가
	int updateCnt(HashMap<String, Object> map);
	
	//장바구니 목록에 같은 상품 있는지 확인
	Cart selectCartList(HashMap<String, Object> map);
	
}