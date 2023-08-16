package com.example.project.dao;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.project.mapper.ABoardMapper;
import com.example.project.mapper.ProductMapper;
import com.example.project.model.ABoard;
import com.example.project.model.Product;


@Service
public class ProductServiceImpl implements ProductService{
	
	@Autowired
	ProductMapper productMapper;

	@Override
	public int insertProduct(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		return productMapper.insertProduct(map);
	}

	@Override
	public HashMap<String, Object> selectProductList(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		resultMap.put("list", productMapper.selectProductList(map));
		resultMap.put("cnt", productMapper.selectCnt(map));
		return resultMap;
	}

	@Override
	public Product selectProductInfo(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		return productMapper.selectProductInfo(map);
	}

	@Override
	public int deleteProduct(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		return productMapper.deleteProduct(map);
	}

	@Override
	public int productStockPLUS(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		
		return productMapper.productStockPLUS(map);
	}

	
}
