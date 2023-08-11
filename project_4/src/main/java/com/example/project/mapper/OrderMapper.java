package com.example.project.mapper;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.example.project.model.Order;
import com.example.project.model.Test;

@Mapper
public interface OrderMapper {
	Order orderCntselect(HashMap<String, Object> map);
}
