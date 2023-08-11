package com.example.project.mapper;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.example.project.model.Order;

@Mapper
public interface OrderMapper {
	// 구매 상품 갯수 
	List<Order> orderCntselect(HashMap<String, Object> map);
	//구매한 상품 확인 (join)
	List<Order> orderProductSelect(HashMap<String, Object> map);
}
