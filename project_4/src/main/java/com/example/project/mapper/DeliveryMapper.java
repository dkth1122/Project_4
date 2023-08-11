package com.example.project.mapper;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.example.project.model.DeliveryUser;

@Mapper
public interface DeliveryMapper {
	//유저배송주소록 출력
	List<DeliveryUser> selectDeliveryUser(HashMap<String, Object> map);
}
