package com.example.project.dao;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.project.mapper.ABoardMapper;
import com.example.project.mapper.ProductMapper;
import com.example.project.model.ABoard;
import com.example.project.model.Product;
import com.example.project.model.Wish;


@Service
public class ProductServiceImpl implements ProductService{
	
	@Autowired
	ProductMapper productMapper;

	@Override
	public HashMap<String, Object> insertProduct(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		productMapper.insertProduct(map);
		resultMap.put("pNo", map.get("pNo"));
		System.out.println(resultMap);
		return resultMap;
	}

	
	@Override
	public int insertProductImg(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		return productMapper.insertProductImg(map);
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

	
	//체크박스 찜목록 삭제
		@Override
		public int removeWishProduct(HashMap<String, Object> map) {
			// TODO Auto-generated method stub
			return productMapper.deleteWishProduct(map);
		}
		
		//찜목록 상품 출력
		@Override
		public List<Wish> searchWishProdeuct(HashMap<String, Object> map) {
			// TODO Auto-generated method stub
			return productMapper.selectWishProdeuct(map);
		}

		//단일상품 제거
		@Override
		public int removeSingleProdeuctWish(HashMap<String, Object> map) {
			// TODO Auto-generated method stub
			return productMapper.deleteSingleProdeuctWish(map);
		}
		//찜목록 전체 제거
		@Override
		public int removeAllWish(HashMap<String, Object> map) {
			// TODO Auto-generated method stub
			return productMapper.deleteAllWish(map);
		}
		//장바구니 등록
		@Override
		public int editcart(HashMap<String, Object> map) {
			// TODO Auto-generated method stub
			return productMapper.insertcart(map);
		}


		@Override
		public HashMap<String, Object> searchProductList(HashMap<String, Object> map) {
			// TODO Auto-generated method stub
			HashMap<String, Object> resultMap = new HashMap<String, Object>();
			resultMap.put("list", productMapper.searchProductList(map));
			resultMap.put("cnt", productMapper.selectCnt(map));
			return resultMap;
		}
	
}
