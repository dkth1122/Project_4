package com.example.project.dao;

import java.util.HashMap;
import java.util.List;

import com.example.project.model.DeliveryUser;
import com.example.project.model.Product;

public interface PaymentService {
	
	//바로 구매용 
	List<Product> searchProductAll (HashMap<String, Object> map);
	
	//배송주소록 출력용
	List<DeliveryUser> searchDeliveryUserInfo(HashMap<String, Object> map);
	
	//멤버쉽 유저 체크
	HashMap<String, Object> searchMembershipCheck(HashMap<String, Object> map);
	
	//결제 시 조건 충족 확인 후 오더 테이블 등록
	HashMap<String, Object> addProductBuy(HashMap<String, Object> map);
	
	//결제 시 딜리버리 테이블 등록
	int addDelivery(HashMap<String, Object> map);
	
}