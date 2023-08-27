package com.example.project.dao;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.project.mapper.OrderMapper;
import com.example.project.mapper.PaymentMapper;
import com.example.project.model.DeliveryUser;
import com.example.project.model.Order;
import com.example.project.model.Product;

@Service
public class PaymentServiceImpl implements PaymentService{

	@Autowired
	PaymentMapper paymentMapper;
	
	//상품 출력 
	@Override
	public List<Product> searchProductAll(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		return paymentMapper.selectProductAll(map);
	}
	
	@Override
	public List<DeliveryUser> searchDeliveryUserInfo(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		return paymentMapper.selectDeliveryUserInfo(map);
	}
	
	//멤버쉽 유저인지 체크
	@Override
	public HashMap<String, Object> searchMembershipCheck(HashMap<String, Object> map) {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		int memCheck = paymentMapper.selectMembershipCheck(map);
		Product Kit = paymentMapper.selectMembershipKit(map);
		
		if(memCheck == 0) {
			//멤버쉽 구독 안함
			resultMap.put("sub", 0);
		}
		else {
			//멤버쉽 구독함
			resultMap.put("sub", 1);
		}
		
		if(Kit != null){
			//멤버쉽 키트 구매 함
			if(Kit.getKitYn() =='Y') {
				resultMap.put("kit", 1);
			}else{
				//구매 안햇음
				resultMap.put("kit", 0);
			}
		}
		
		return resultMap;
	}
	
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
		
		paymentMapper.paymentPointUse(map);
		System.out.println("포인트 테이블 얹혀갈게요 ㅎㅅㅎ");
		
		return resultMap;
		
	}

	//결제 후 배송 테이블 등록 
	@Override
	public int addDelivery(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		
			paymentMapper.paymentPointInsert(map);
		return paymentMapper.insertDelivery(map);
	}



	
}
