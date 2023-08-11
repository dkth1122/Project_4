package com.example.project.dao;

import java.util.HashMap;
import java.util.List;

import com.example.project.model.ABoard;
import com.example.project.model.Product;


public interface ProductService {

	int insertProduct(HashMap<String, Object> map);
	
	List<Product>selectProductList(HashMap<String, Object> map);
	
	Product selectProductInfo(HashMap<String, Object> map);
	
	int deleteProduct(HashMap<String, Object> map);

}
