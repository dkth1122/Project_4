package com.example.project.mapper;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.example.project.model.Order;
import com.example.project.model.Wish;

@Mapper
public interface CartMapper {
	/* 장바구니목록 */
List<Wish> cart(HashMap<String, Object> map);
 /* 장바구니에서 삭제*/
int deletecart(HashMap<String, Object> map);
}