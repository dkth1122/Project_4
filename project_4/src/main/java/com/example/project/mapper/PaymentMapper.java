package com.example.project.mapper;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.example.project.model.Order;

@Mapper
public interface PaymentMapper {
	
	//결제시 오더 테이블 등록
	int insertProductBuy(HashMap<String, Object> map);
	//결제시 딜리버리 테이블 등록
	int insertDelivery(HashMap<String, Object> map);
	
	//조건

	/* <!-- 재고 수 체크 0이면 재고 없음, 1이면 재고 있음 ========실패 사유 메시지 "재고 부족"--> */
	int selectStock(HashMap<String, Object> map);

	
	/* <!-- P_LIMIT 유저 구매 제한 갯수 체크 ========실패 사유 메시지 "사용자 구매횟수 초과" --> */
	int selectPLimit(HashMap<String, Object> map);

	/*
	 * <!-- 멤버쉽 상품 : 해당 제품과 동일한 아티스트를 멤버쉽 구독 했을 때에만 구매 가능 
	 * ========실패 사유 메시지 ====="멤버쉽 구독 필요한 상품"-->
	 */
	int selectMember(HashMap<String, Object> map);
	
	/*
	 * <!--키트 구매 이력 체크(멤버쉽테이블) 1. 키트인지(멤버쉽Y+카테고리MEM), 2. 해당 int
	 * selectPLimit(HashMap<String, Object> map); 키트 구매 여부(N일때만) ======== 실패 사유 메시지
	 * "키트 구매 이력 확인" -->
	 */
	int selectMemberKit(HashMap<String, Object> map);
	
	//키트인지 아닌지 체크 
	int selecKitProduct(HashMap<String, Object> map);

	/* <!-- 위에 키트 조건 만족 시 : 키트 구매 업데이트 --> */
	int updateMembershipKit(HashMap<String, Object> map);
	
	/* <!-- 멤버쉽 구독 상품인지 체크 ======= 맞으면 멤버쉽 테이블 업데이트 진행--> */
	int selectMembershipProduct(HashMap<String, Object> map);
	
	/* <!-- 위에 조건 만족 시 : 멤버쉽 구독 상품 구매 시 멤버쉽 테이블 업데이트 --> */
	int insertMembership(HashMap<String, Object> map);
   	
	/* <!--  위에 조건 전부 만족 시 : 구매 완료 되면서 STOCK 재고 줄이기 -->*/
	int updateStock(HashMap<String, Object> map);
   
}
