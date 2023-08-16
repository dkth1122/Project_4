package com.example.project.dao;

import java.util.HashMap;
import java.util.List;

import com.example.project.model.ABoard;
import com.example.project.model.Product;
import com.example.project.model.Wish;


public interface ProductService {

	HashMap<String, Object> insertProduct(HashMap<String, Object> map);
	
	HashMap<String, Object> selectProductList(HashMap<String, Object> map);
	
	Product selectProductInfo(HashMap<String, Object> map);
	
	int deleteProduct(HashMap<String, Object> map);
	
	int productStockPLUS(HashMap<String, Object> map);
	
	int insertProductImg(HashMap<String, Object> map);
	
	// 체크박스 찜목록 삭제
	int removeWishProduct(HashMap<String, Object> map);	
	//찜목록 출력
	List<Wish> searchWishProdeuct(HashMap<String, Object> map);
	// 찜목록 단일제거
	int removeSingleProdeuctWish(HashMap<String, Object> map);
	// 찜목록 전체 삭제
	int removeAllWish(HashMap<String, Object> map);
	// 장바구니 등록 > 이동 
	int editcart(HashMap<String, Object> map);

}
