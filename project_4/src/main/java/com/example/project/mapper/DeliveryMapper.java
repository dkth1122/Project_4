package com.example.project.mapper;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.example.project.model.DeliveryUser;

@Mapper
public interface DeliveryMapper {
	//유저배송주소록 출력
	List<DeliveryUser> selectDeliveryUser(HashMap<String, Object> map);
	//유저배송주소록 수정
	int updateAddr(HashMap<String, Object> map);
	//배송주소록 추가
	int insertAddr(HashMap<String, Object> map);
	//배송주소록 삭제
	int deleteAddr(HashMap<String, Object> map);
}
