package com.example.project.mapper;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.example.project.model.Product;

@Mapper
public interface ProductMapper {
	
	//상품 등록
	int insertProduct(HashMap<String, Object> map);
	
	//상품 리스트
	List<Product>selectProductList(HashMap<String, Object> map);
	
	//상품 하나 조회
	Product selectProductInfo(HashMap<String, Object> map);
	
	//상품 삭제
	int deleteProduct(HashMap<String, Object> map);
	
}
