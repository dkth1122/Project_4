package com.example.project.mapper;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.example.project.model.Order;

@Mapper
public interface PaymentMapper {
	
	//결제시 오더 테이블 등록
	int insertProductBuy(HashMap<String, Object> map);
	//결제시 딜리버리 테이블 등록
	int insertProductBuy2(HashMap<String, Object> map);
}
