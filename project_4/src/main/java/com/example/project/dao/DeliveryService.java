package com.example.project.dao;

import java.util.HashMap;
import java.util.List;

import com.example.project.model.DeliveryUser;

public interface DeliveryService {
	List<DeliveryUser> searchDeliveryUser(HashMap<String, Object> map);
}
