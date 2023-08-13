package com.example.project.dao;

import java.util.HashMap;
import java.util.List;

import com.example.project.model.DeliveryUser;

public interface DeliveryService {
	List<DeliveryUser> searchDeliveryUser(HashMap<String, Object> map);
	//유저 배송주소록 수정
	int editAddr(HashMap<String, Object> map);
}
