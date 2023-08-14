package com.example.project.dao;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.project.mapper.DeliveryMapper;
import com.example.project.model.DeliveryUser;

@Service
public class DeliveryServiceImpl implements DeliveryService{

	@Autowired
	DeliveryMapper deliveryMapper;

	@Override
	public List<DeliveryUser> searchDeliveryUser(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		return deliveryMapper.selectDeliveryUser(map);
	}

	@Override
	public int editAddr(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		return deliveryMapper.updateAddr(map);
	}

	@Override
	public int addAddr(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		return deliveryMapper.insertAddr(map);
	}

	@Override
	public int deleteAddr(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		return deliveryMapper.deleteAddr(map);
	}

	
	
}
