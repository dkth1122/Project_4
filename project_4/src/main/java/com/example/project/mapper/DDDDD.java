package com.example.project.mapper;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.example.project.model.Order;
import com.example.project.model.Product;

@Mapper
public interface DDDDD {
	//구매내역 확인
	
	List<Product> selectOrderp(HashMap<String, Object> map);
	
	
}
