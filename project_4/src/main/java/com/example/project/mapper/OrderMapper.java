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
	// 주문정보 확인
	List<Order> selectOrderList(HashMap<String, Object> map);
	//페이징용 카운트
	int selectCnt3(HashMap<String, Object> map);
	//오더 상태 변경
	int updateOrder(HashMap<String, Object> map);
	//오더 상태 개별 변경
	int updateOrderInfo(HashMap<String, Object> map);
	
	
}
