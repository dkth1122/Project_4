package com.example.project.dao;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.project.mapper.OrderMapper;
import com.example.project.mapper.PaymentMapper;
import com.example.project.model.Order;
import com.example.project.model.Product;

@Service
public class PaymentServiceImpl implements PaymentService{

	@Autowired
	PaymentMapper paymentMapper;
	
	//결제 오더 테이블 등록
	@Override
	public HashMap<String, Object> addProductBuy(HashMap<String, Object> map) {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		
		int subscribe = paymentMapper.selectMembershipProduct(map);
		
		int kitYn = paymentMapper.selecKitProduct(map);

		//키트인지 아닌지 체크, 키트면 
		if( kitYn > 0) {
			//키트 구매이력 Y로 변경
			paymentMapper.updateMembershipKit(map);
			System.out.println("키트 맞아용 체크 함");
			}

		//멤버쉽 구독 상품 구매 체크 후 맞으면 멤버쉽 테이블 업데이트 
		if( subscribe > 0) {
			paymentMapper.insertMembership(map);
			System.out.println("멤버쉽 구독 맞아용 멤버쉽 테이블 추가함~");
			paymentMapper.updateUserMembershipY(map);
			System.out.println("멤버쉽 구독 맞아용 유저 테이블 업데이트함~");
			}
		
			/*
			 * if() { paymentMapper.selectMember(map); }
			 */
		
		System.out.println("위에 두 개 체크 함");
		
		//재고 업데이트
		paymentMapper.updateStock(map);
		System.out.println("재고 업데이트 함");
		
		//주문내역 테이블 업데이트 + buyNo 탈취
		paymentMapper.insertProductBuy(map);
		resultMap.put("buyNo", map.get("buyNo"));
		
		System.out.println("주문 테이블 업데이트 함");
		
		return resultMap;
		
	}

	//결제 후 배송 테이블 등록 
	@Override
	public int addDelivery(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
			
		return paymentMapper.insertDelivery(map);
	}

	@Override
	public List<Product> searchProductAll(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		return paymentMapper.selectProductAll(map);
	}

	
}
