package com.example.project.dao;

import java.util.HashMap;
import java.util.List;

import com.example.project.model.Wish;



public interface CartService {
	/* 장바구니목록 */
	List<Wish> cart(HashMap<String, Object> map);

	/* 장바구니에서 삭제 */
	int deletecart(HashMap<String, Object> map);
}