<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<script src="../js/jquery.js"></script>    
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css" integrity="sha512-z3gLpd7yknf1YoNbCzqRKc4qyor8gaKU1qmn+CShxbuBusANI9QpRohGBreCFkKxLhei6S9CQXFEbbKuqLg0DA==" crossorigin="anonymous" referrerpolicy="no-referrer" />
<link href="../css/mypag.css" rel="stylesheet" type="text/css">
<script src="https://cdn.jsdelivr.net/npm/vue@2.6.14/dist/vue.js"></script>
 <meta charset="UTF-8">
  <title>마이페이지</title>
  <style type="text/css">
  	#useGuide{
  		margin-top : 150px;
		width: 1200px;
		text-align: center;  		
  	}
  	#radioMenu{
		    display: flex;
   			flex-direction: row;
  			justify-content: space-evenly;
	}
	
	#radioMenu > div{
		width: 200px;
		height: 50px;
		text-align: center;
		line-height: 50px;
		font-size: 1.2em;
		font-weight: bold;
	}
	#useGuide{
  		font-size: 4em;  		
		margin :150px auto;
		text-align: center;  		
  	}
  </style>
</head>
<body>
<div id="app">
    <div id="wc">
    	<h1 id="useGuide">이용 안내</h1>
    	
    	<div id="radioMenu">
    		<input id="1" type="radio" name="Menu" value="회원가입" v-model="selectedMenu" hidden>
    		<div><label for="1"><a href="#javascript:;">회원가입</a></label></div>
    		<input id="2" type="radio" name="Menu" value="주문" v-model="selectedMenu" hidden>
    		<div><label for="2"><a href="#javascript:;">주문</a></label></div>
    		<input id="3" type="radio" name="Menu" value="결제" v-model="selectedMenu" hidden>
    		<div><label for="3"><a href="#javascript:;">결제</a></label></div>
    		<input id="4" type="radio" name="Menu" value="배송" v-model="selectedMenu" hidden>
    		<div><label for="4"><a href="#javascript:;">배송</a></label></div>
    		<input id="5" type="radio" name="Menu" value="교환/반품" v-model="selectedMenu" hidden>
    		<div><label for="5"><a href="#javascript:;">교환/반품</a></label></div>
    		<input id="6" type="radio" name="Menu" value="환불" v-model="selectedMenu" hidden>
    		<div><label for="6"><a href="#javascript:;">환불</a></label></div>
    		<input id="7" type="radio" name="Menu" value="기타" v-model="selectedMenu" hidden>
    		<div><label for="7"><a href="#javascript:;">기타</a></label></div>
    	</div>
    	
    	<div id="selectedMenu">
    		<pre v-if = "selectedMenu == '회원가입'">
<h3>회원가입 안내</h3>
[JOIN]을 통해 이용약관, 개인정보보호정책 동의 및 일정 양식의 가입항목을 기입함으로써 회원에 가입되며, 가입 즉시 서비스를 무료로 이용하실 수 있습니다.
주문하실 때에 입력해야하는 각종 정보들을 일일이 입력하지 않으셔도 됩니다.
회원가입을 하시면 회원을 위한 각종 이벤트, 할인행사, 예약구매 등에 참여하실 수 있습니다.


<strong>SMTOWN &STORE 회원등급별 혜택 안내</strong>

SMTOWN &STORE에 가입한 모든 회원들에게 특별한 혜택을 제공합니다.
회원 가입 후 이용실적에 따라 적립금, 쿠폰 등이 제공되며 회원등급별 제공되는 혜택은 다음과 같습니다.

PINK
-대상 : 최근 6개월 간 구매금액 50만원 미만
-적립금 : 구매금액의 0.5%

PINK SILVER
-대상 : 최근 6개월 간 구매금액 50만원 이상 ~ 100만원 미만
-적립금 : 구매금액의 0.7%
-쿠폰 : 무료배송 쿠폰 1장

PINK GOLD
-대상 : 최근 6개월 간 구매금액 100만원 이상
-적립금 : 구매금액의 1.0%
-쿠폰 : 무료배송 쿠폰 2장

※참고사항

-최근 6개월 간 구매금액(배송비, 적립금, 쿠폰 등을 제외한 결제 금액))에 따라 회원 등급 산정
-2019년 4월 5일 SMTOWN &STORE 오픈일로부터 매월 5일 새로운 회원등급 산정 및 등급별 혜택 제공
-배송완료 기준 7일 후 등급별 적립금 지급
-등급별 쿠폰은 월 1회 발급되며 발급일로부터 30일간 사용 가능(미사용 시 매월 5일 자동 소멸)
-SMTOWN &STORE 온라인스토어에서만 사용 가능
-상품 구매 후 단순변심에 의한 주문 취소 및 상품의 교환/환불 시 사용한 쿠폰 재사용 불가
-무료배송 쿠폰은 국내 배송에서만 사용 가능(해외 배송 시 사용불가)
    			
    		</pre>
    		<pre v-if="selectedMenu=='주문'">
<h3>주문 안내</h3>
상품주문은 다음단계로 이루어집니다.

- Step1: 상품검색
- Step2: 장바구니에 담기
- Step3: 회원ID 로그인
- Step4: 주문서 작성
- Step5: 결제방법선택 및 결제
- Step6: 주문 성공 화면 (주문번호)

비회원 주문인경우 6단계에서 주문번호와 승인번호(카드결제시)를 꼭 메모해 두시기 바랍니다. 
단, 회원인 경우 자동 저장되므로 따로 관리하실 필요가 없습니다.
    		</pre>
    		<pre v-if="selectedMenu=='결제'">
<h3>결제안내</h3>
・결제수단 : 신용카드, 실시간 계좌이체

- 고액결제의 경우 안전을 위해 카드사에서 확인전화를 드릴 수도 있습니다.
- 확인과정 중 도난카드의 사용이나 타인명의의 주문 등 정상적인 주문이 아니라고 판단될 경우 임의로 주문을 취소 또는 보류할 수 있습니다.    			
    		</pre>
    		<pre v-if="selectedMenu=='배송'">
<h3>배송안내</h3>
[국내 일반 배송]
・배송방식 : SMTOWN &STORE  물류센터 직접배송(CJ대한통운)
・배송지역 : 전국(일부지역 제외)
・배송비용 : 3,000원 / 주문금액 50,000원 이상 시 무료배송
・도서산간지역은 추가 배송비가 발생할 수 있습니다.
・배송기간 : 결제 후 3~5일 이내 (영업일 기준)



- 상품의 재고상황에 따라 배송기간이 다소 지연될 수도 있습니다.
- 물류센터 사정으로 인해 배송이 지연될 수 있습니다.

<span style="color:red;">- 예약판매 상품, 아티스트 케이스 상품 등 당일 배송이 어려운 상품을 함께 구매하는 경우
  모든 상품이 배송 가능한 상태가 되는 시점에 주문하신 상품이 함께 배송됩니다.
  (예약판매 상품은 순차배송일 기준, 아티스트 케이스는 주문완료 후 약 2주 소요)</span>
- 기본 배송기간 이상 소요되는 상품이거나 품절된 상품은 개별 연락 드리겠습니다.
    		</pre>
    		<pre v-if="selectedMenu=='교환/반품'">
<h3>교환/반품안내</h3>
[교환∙반품 방법]

- 상품 수령일로부터 7일 이내 교환/반품 사유가 가능한 사진 (상품 전체 혹은 불량 부분 확대사진)을 첨부하여 주문번호, 상품 바코드, 사유 등을 1:1문의 또는 고객센터(1661-6110) 접수 바랍니다.
- 첨부파일의 용량이 큰 경우 CSCENTER@SMTOWN.COM으로 메일 발송 후 1:1문의 또는 고객센터(1661-6110) 접수 바랍니다.

・상품교환∙반품단계
- Step1: 교환∙반품 기간확인
- Step2: 마이페이지 또는 1:1문의로 교환∙반품접수
- Step3: CS담당자의 안내 후 7일 이내 지정 반품지 및 지정 반품수단으로 교환, 반품 배송
- Step4: 반품지에 상품 입고 및 검품 후 교환∙반품 진행
- Step5: 교환∙반품 완료



[교환∙반품시 유의사항]
・상품의 색상은 모니터 사양에 따라 실제 색상과는 다소 차이가 있을 수 있으며, 
   상품 라벨의 위치나 색상은 이미지와 다를 수 있습니다.
- 구성품 누락 및 불량으로 인한 교환/환불을 위해서는 택배 박스 및 상품 개봉(구성품 포함) 영상이 반드시 필요합니다.
  개봉 영상이 없을 경우 교환 및 환불이 어려울 수 있습니다
- 개봉 영상은 개봉 전 박스의 모든 면이 보이고, 상품 개봉 장면이 온전하게 보이도록 촬영 하셔야 합니다.
- 구성품이 랜덤인 상품의 경우, 교환 진행 시 교환 상품도 랜덤으로 발송됩니다.
- 상품 결함의 경우 5mm 이하의 찍힘 자국과 상품 공정상 발견 될 수 있는 스크래치 및 눌림, 찍힘 자국은 교환 및 반품의 대상이 되지 않습니다.
- 인화류/지류 및 초상 상품의 경우 뒷면, 배경 등 초상 이외의 결함과 공정 과정에서 발생 할 수 있는 스크래치, 눌림 및 찍힘은 교환 및 반품의 대상이 되지 않습니다.
- 모든 상품은 빛 반사가 없는 상태에서 보이는 하자일 경우에만 교환/환불 가능합니다.
- PVC 상품의 경우 소재 특성상 주변환경(온. 습도)의 영향에 따라 형태의 변형 또는 PVC 간 달라붙음 등의 하자가 발생할 수 있으며, 그로인한 교환 및 반품의 대상이 되지 않습니다.

・교환∙반품 가능기간
- 변심, 배송오류, 파손, 불량 등 상품 결함 : 단순 변심, 상품 하자, 오배송의 경우 수령일로부터 7일 이내까지 1:1문의 또는 CS CENTER로 접수 가능합니다.

・교환∙반품 불가한 경우
- 상품 수령 후 7일을 초과한 경우
- 상품의 가치가 감소한 경우 (포장지 훼손, 세탁, 상품 얼룩, 향수 냄새, 탈취제 냄새, 증정품 훼손, 구성품 훼손, 사용 흔적 등)
- 구매자의 사용 또는 일부 소비에 의하여 상품의 가치가 현저히 감소한 경우
- 시간의 경과에 의하여 재판매가 곤란할 정도로 상품등의 가치가 현저히 감소한 경우(상품 바코드 제거, 수선 등)
- 주문제작 상품이나 세일 상품, 음반 등 상품 상세페이지에 교환/환불 불가를 공지한 상품의 경우 
- 복제가 가능한 상품등의 포장을 훼손한 경우
- 제품의 오배송, 불량 상품이라도 사용 흔적, 훼손 등의 흔적이 있을 경우 
- 촬영 또는 해상도 등의 영향으로 고객님의 모니터에서 확인되는 색상과 실제 수령한 상품의 색상 차이가 있을 경우 
- 상품의 프린트 혹은 패턴이 있는 경우 상품상세페이지 이미지와 다를 수 있습니다.
- 교환/반품 진행시 이벤트, 프로모션으로 증정된 증정품을 함께 보내주셔야 하며, 누락시 교환/환불이 불가합니다.
- 모든 상품 특성상 재고가 조기 소진될 수 있어 단순변심에 의한 교환은 어려울 수 있으며, 
   반품/교환은 전자상거래 등에서의 소비자 보호에 관한 법률에 의거한 규정을 따릅니다.
- SMTOWN &STORE 온라인스토어에서 구매하신 상품은 공식 오프라인 매장에서 교환/환불이 절대 불가합니다.
- 공식 오프라인 매장에서 구매하신 상품은 SMTOWN &STORE 온라인스토어에서 교환/환불이 절대 불가합니다.
- 각 상품별로 교환/환불 정책은 차이가 있을 수 있으며 자세한 사항은 상품정보에서 확인 부탁드립니다.
 (자세한 내용은 1:1문의 또는 CS CENTER를 이용해 주시기 바랍니다)

・교환∙반품 비용
- 변심 : 단순 변심으로 반품을 원할 경우에는 구매자가 왕복배송비 지불
- 배송오류, 파손, 불량 등 상품 결함 : 상품하자, 오배송의 경우에는 판매자가 배송비 지불
 (정확한 교환∙반품비용은 1:1문의 또는 CS CENTER를 이용해 주시기 바랍니다)



[미성년자 권리보호안내]
미성년 고객께서 상품을 주문(계약) 하시는 경우, 법정대리인(부모님 등)이 그 주문(계약)에 동의하지 않으면
미성년자 본인 또는 법정대리인(부모님 등)이 그 주문(계약)을 취소하실 수 있습니다. 
    		</pre>
    		<pre v-if="selectedMenu=='환불'">
<h3>환불안내</h3>
환불시 반품 확인여부를 확인한 후 영업일 3일이내에 결제 금액을 환불해 드립니다.
신용카드로 결제하신 경우는 신용카드 승인을 취소하여 결제 대금이 청구되지 않게 합니다.
(단, 신용카드 결제일자에 맞추어 대금이 청구 될수 있으면 이경우 익월 신용카드 대금청구시 카드사에서 환급처리됩니다.)
    		</pre>
    		<pre v-if="selectedMenu=='기타'">
<h3>기타안내</h3>
<strong>적립금</strong>



・이용기간

주문으로 발생한 적립금은 배송완료 체크시점으로 부터 7일이 지나야 실제 사용 가능 적립금으로 변환됩니다.

7일 동안은 미가용 적립금으로 분류 됩니다. 미가용 적립금은 반품, 구매취소 등을 대비한 실질적인 구입이 되지 않은 주문의 적립금 입니다.
사용이 가능한 적립금(총 적립금-사용된적립금-미가용적립금)은 상품구매시 즉시 사용하실 수 있습니다.

・이용조건
적립금 사용시 최소구매가능적립금(구매가능한 적립금 요구선)은 1원 입니다.
적립금 사용시 최대구매가능적립금(적립금 1회 사용 가능 최대금액)은 '한도제한'이 없습니다.
적립금의 유효 기간은 적립금 지급일로부터 2년 입니다. 2년이 지난 적립금은 자동적으로 소멸 됩니다.

・소멸조건
주문취소/환불시에 상품구매로 적립된 적립금은 함께 취소됩니다.
회원탈퇴시 적립금은 자동적으로 소멸됩니다.


<strong>가온차트/한터차트 집계 반영 안내</strong>
SMTOWN &STORE에서 판매되는 모든 음반 판매량은 기준에 따라 정직하게 가온차트와 한터차트 집계에 반영됩니다.


・가온차트

가온차트는 한국음악콘텐츠산업협회가 운영, 관리하는 한국 대중음악 공인차트입니다.
집계 부문 7가지 중 앨범 차트는 앨범을 배포하는 제작사의 도매, 온라인 판매처의 출고량 및 반품 수치까지 고려되어 집계가 이루어집니다.

SMTOWN &STORE가 고객님께 판매 중인 모든 음반은 제작사로부터 공급받으므로 가온차트에 정상적으로 반영됩니다.



・한터차트

SMTOWN &STORE의 음반 판매자료는 출고 완료 이후 매시 정각 한터차트로 자동 전송되어 차트에 자동 집계됩니다.
또한, 주문번호 한 건당 여러 장의 음반을 구입할 경우, 해당 음반의 수량만큼 한터차트 측에 반영됩니다.

앨범의 발매 후 실제 출고되는 수량을 자동 전송, 집계하므로 누락은 발생하지 않습니다.



<strong>CS CENTER 안내</strong>

・고객센터: 1661-6110

・상담시간: 평일 10:00~ 17:00 (점심시간 12:00 ~ 13:00) 토/일/공휴일 휴무


    		</pre>
    	</div>
    	
	</div>
</div>
</body>
</html>
<script type="text/javascript">
var app = new Vue({
    el: '#app',
    data: {
       list : [],
       uId : "${sessionId}",
       selectedMenu : '회원가입'
    },
    methods: {
       fnGetList : function(){
            var self = this;
			var param = {};           
        }
    },
    created: function() {
      var self = this;
      self.fnGetList();
      // Vue.js ì½ë ìì± ê°ë¥
    }
});
</script>