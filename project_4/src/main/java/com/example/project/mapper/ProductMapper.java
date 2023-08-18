package com.example.project.mapper;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.example.project.model.Product;
import com.example.project.model.Wish;

@Mapper
public interface ProductMapper {
	
	//상품 등록
	int insertProduct(HashMap<String, Object> map);
	
	//상품 리스트
	List<Product>selectProductList(HashMap<String, Object> map);

	List<Product>selectVProductList(HashMap<String, Object> map);
	
	//상품페이징용 갯수
	int selectCnt(HashMap<String, Object> map);
	
	//상품 하나 조회
	Product selectProductInfo(HashMap<String, Object> map);
	
	//아티스트별 상품 조회 > 어드민 페이지
	List<Product> searchProductList(HashMap<String, Object> map);
	
	//아티스트별 상품 조회 > 어드민 페이지
	List<Product> searchProductList2(HashMap<String, Object> map);
	
	//상품 삭제
	int deleteProduct(HashMap<String, Object> map);
	
	//상품 재고 조정
	int productStockPLUS(HashMap<String, Object> map);
	//이미지등록
	int insertProductImg(HashMap<String, Object> map);
	
	//------- 찜목록 삭제 체크박스 선택 
		int deleteWishProduct(HashMap<String, Object> map);
		
		// 찜목록 상품 출력
		List<Wish> selectWishProdeuct(HashMap<String, Object> map);
		// 단일찜목록 제거
		int deleteSingleProdeuctWish(HashMap<String, Object> map);
		// 찜목록 전체제거
		int deleteAllWish(HashMap<String, Object> map);
		//장바구니 등록 > 이동
		int insertcart(HashMap<String, Object> map);
	//결제시 오더 테이블 등록
	int insertProductBuy(HashMap<String, Object> map);
	//결제시 딜리버리 테이블 등록
	int insertProductBuy2(HashMap<String, Object> map);
	
		
}
