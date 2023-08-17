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
  </style>
</head>
<body>
<div id="app">
    <div id="wc">
    	<h1 id="useGuide">FAQ</h1>
    	
    	<div id="radioMenu">
    		<input id="2" type="radio" name="Menu" value="회원/로그인" v-model="selectedMenu">
    		<label for="2">회원/로그인</label>
    		<input id="3" type="radio" name="Menu" value="상품" v-model="selectedMenu">
    		<label for="3">상품</label>
    		<input id="4" type="radio" name="Menu" value="주문/결제" v-model="selectedMenu">
    		<label for="4">주문/결제</label>
    		<input id="5" type="radio" name="Menu" value="배송" v-model="selectedMenu">
    		<label for="5">배송</label>
    		<input id="6" type="radio" name="Menu" value="교환/반품" v-model="selectedMenu">
    		<label for="6">교환/반품</label>
    		<input id="7" type="radio" name="Menu" value="기타" v-model="selectedMenu">
    		<label for="7">기타</label>
    	</div>
   
	    <template>
		  <div>
		    <div v-if="selectedMenu == menuOption.label || menuOption.label == 'Notice'" v-for="(menuOption, index) in menuOptions" :key="index">
		      <ul>
		        <li>
		          <a :id="'menuOption_' + index" @click="toggleNotice(index)">
		            <span style="font-weight:bold;"> {{ menuOption.label }} </span>
		            {{ menuOption.content }}
		          </a>
		          <div v-show="noticeVisible[index]" style="margin-left : 60px;">
		            <pre>{{ menuOption.details }}</pre>
		          </div>
		        </li>
		      </ul>
		    </div>
		  </div>
		</template>
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
       selectedMenu : '회원/로그인',
       menuOptions: [
           {
             label: 'Notice',
             content: '고객센터 운영안내',
             details: '[CS CENTER]\n대표전화 : 1661-6110\n상담시간 : 평일 10:00~ 17:00 (점심시간 12:00 ~ 13:00) / 주말 및 공휴일 휴무'
           },
           {
             label: '주문/결제',
             content: '주문한 상품을 전체취소하고 싶어요',
             details: "판매 기간 내 마이페이지에서 직접 취소 가능하며,\n취소 신청 방법은 아래와 같습니다.\n■ PC 버전 :[마이페이지] - [나의 쇼핑 정보] - [전체 보기] - 취소할 주문 [취소 신청]\n■ 모바일 버전 : [마이페이지] - [최근 주문 상품] - [전체 보기] - 취소할 주문 [취소 신청]\n※이미 송장 정보가 등록되어 출고 준비가 완료된 경우에는 처리가 어려울 수 있습니다.\n취소 신청 시 환불은 순차처리 예정이며,\n직접 취소 처리가 불가한 경우 1:1문의를 통해 접수 바랍니다."
           },
           {
               label: '회원/로그인',
               content: '회원탈퇴는 어떻게 하나요?',
               details: "회원탈퇴는 PC 환경에서만 신청이 가능하며, \nSMTOWN &STORE 홈페이지 접속하여 [MY PAGE] - [회원정보 수정]으로 이동하시어 맨 하단 [회원탈퇴] 버튼을 통해 신청 가능합니다. \n(배송이 완료되지 않은 주문이 있을 경우 회원탈퇴 불가)\n회원탈퇴 시 동일한 회원정보로 30일간 재가입이 불가하며\n보유하신 미사용 쿠폰 및 적립금은 모두 소멸되고 복원 및 양도가 불가하오니 유의하시길 바랍니다."
           },
           {
               label: '배송',
               content: '주문한 상품 중 일부가 오지 않았어요',
               details: "주문한 상품이 누락 된 경우 수령한 박스 또는 안전봉투의 개봉 전부터 촬영한 영상을 CSCENTER@SMTOWN.COM 으로 발송 후 \n1:1 문의를 통해 주문번호와 누락된 상품, 수량을 기재하여 접수 시 확인하여 빠른 도움 드리겠습니다.\n단, 개봉영상이 없는 경우 신청하신 내용이 접수 되지 않을 수 있는 점 유의 바랍니다.\n※ 재고 현황에 따라 교환이 불가한 경우 반품/환불로 진행 될 수 있음"
           },
           {
               label: '회원/로그인',
               content: '아이디/비밀번호를 잊어버렸어요',
               details: "가입하신 아이디 또는 비밀번호를 분실하신 경우 아래 경로를 통해 등록한 정보를 찾을 수 있습니다.\n- SMTOWN &STORE 메인 화면 상단 [Login]을 클릭 ▶ [아이디 찾기] / [비밀번호 찾기]\n※ [휴대폰인증(본인명의)]을 통해 아이디를 찾으실 경우 가입된 아이디 전체 확인이 가능합니다."
           },
           {
               label: '회원/로그인',
               content: '연동한 간편로그인 계정을 삭제했어요',
               details: "가입 시 사용하신 간편 로그인 가입 계정을 삭제한 경우 SMTOWN &STORE 이용이 불가합니다.\n사이트 하단의 [비회원 문의]를 통해 접수해 주시면 간편로그인을 통해 가입하신 계정의 [회원탈퇴] 신청이 가능합니다.\n단, 회원탈퇴 후 30일 이내 동일한 회원정보로의 재가입이 불가하며 보유한 쿠폰과 적립금은 모두 소멸 됩니다."
           },
           {
               label: '주문/결제',
               content: '주문한 상품 중 일부 상품만 취소하고 싶어요',
               details: "판매 기간 내 마이페이지에서 직접 취소 가능하며 취소 방법은 아래와 같습니다.\n- PC 버전 : [마이페이지] - [나의 쇼핑정보] - [전체보기] - 취소할 상품 및 수량 선택 후 [취소 신청] \n- 모바일 버전 : [마이페이지] - [최근 주문한 상품] - [전체보기] - 취소할 상품 및 수량 선택 후 [취소 신청]\n※ 이미 송장 정보가 등록되어 출고 준비가 완료된 경우에는 처리가 어려울 수 있습니다. \n취소 신청 시 환불은 순차 처리되며 직접 취소신청이 불가한 경우 1:1문의를 통해 접수 바랍니다. "
           },
           {
               label: '주문/결제',
               content: '배송 정보를 변경하고 싶어요',
               details: "SMTOWN &STORE의 모든 주문은 결제 이후 주소 변경이 불가합니다.\n고객님의 원활한 배송을 위한 결정으로 깊은 양해 부탁드립니다.\n부득이하게 주소 변경이 필요한 경우 1:1문의를 통해 수령 정보를 전달 바라오며,\n다수의 주문을 변경 요청하시는 경우 최대 5개씩 나누어 1:1문의로 접수 부탁드립니다. "
           },
           {
               label: '주문/결제',
               content: '구매한 리딤코드 상품을 취소하고 싶어요',
               details: "코드를 미열람하신 고객님에 한하여 결제 후 7일 이내에 주문 취소 가능합니다.\n단, 아래의 경우에는 주문 취소 및 환불이 불가하오니 참고 바랍니다.\n- 코드를 이미 열람한 경우 \n- 코드를 타인에게 선물한 경우"
           },
           {
               label: '배송',
               content: '해외배송도 가능한가요?',
               details: "SMTOWN &STORE는 전세계 배송서비스를 제공하고 있습니다. 우측 상단의 국가언어를 선택하시면 해당 국가에서 상품을 수령할 수 있습니다.\n(다만, 국가이슈에 따라 배송제한이 있을 수 있는 점 양해 바랍니다.)"
           },
           {
               label: '회원/로그인',
               content: '개명을 했는데 회원정보에서 이름은 어떻게 수정하나요?',
               details: "개명으로 인하여 회원정보(이름변경) 수정이 필요한 경우 가입자 본인 확인을 위해 아래 정보를 1:1문의를 통해 전달 부탁드립니다.\n1. 가입 시 등록한 회원명\n2. 변경 신청하는 이름\n3. 본인 변경 신청임을 인증할 수 있는 개명 서류\n신청하신 회원정보(이름변경) 수정이 정상 접수 될 경우 5~7영업일 이내 반영 완료됩니다.\n만약 접수하신 날로부터 14일이 경과하였음에도 요청하신 내용이 반영되지 않을 경우 1:1문의 또는 CS CENTER(1661-6110)를 통해 접수 바랍니다. "
           },
           {
               label: '주문/결제',
               content: '등급 쿠폰은 어떻게 사용하나요?',
               details: "등급별 쿠폰은 월 1회 발급되며 발급일로부터 30일간 사용 가능하며 SMTOWN &STORE 온라인스토어에서만 상품 구매 시에만 사용 가능합니다.\n단, 상품 구매 후 단순 변심에 의한 주문 취소 및 상품의 교환/환불 시 사용한 쿠폰은 복원되지 않으며 재사용이 불가하오니 유의하시기 바랍니다. "
           },
           {
               label: '기타',
               content: '팬 이벤트에 응모했는데 개인정보를 잘못 적었어요',
               details: "환불완료 후 실제 대금환급은 3-5 영업일 소요 되며 7영업일 이상 환불 금액이 확인되지 않을 경우 결제사로 문의 바랍니다.\n신용카드로 결제하신 경우 신용카드 승인을 취소하여 결제대금 청구 시 제외 됩니다. \n(단, 신용카드 결제 일자에 따라 대금이 청구될 수 있으며 이 경우 다음달 신용카드 대금 청구 시 카드사에서 환급 처리됩니다.)"
           },
           {
               label: '주문/결제',
               content: '결제 취소 완료되었다는데 환불 금액이 입금되지 않았어요',
               details: "이벤트 응모에 참여하신 경우 주문 시 입력한 주문자 및 수령자 정보 변경이 어려우며 응모 기간에 따라 아래와 같이 안내 드립니다. \n[응모 기간인 경우]\n- 주문 취소 후 재주문 하시어 올바른 개인정보를 입력바랍니다.\n[응모 기간이 종료된 경우]\n- 고객이 등록한 정보와 당첨자 정보가 다를 경우 이벤트 참여 불가합니다. \n- 개명으로 인한 정보 변경 시 개명 확인 서류를 1:1문의를 통해 전달 바랍니다. \n※ 배송지 주소 정보는 1:1문의를 통해 배송 전까지 변경 신청 가능하니 참고 부탁드립니다."
           },
           {
               label: '기타',
               content: '결제 취소 완료되었다는데 환불 금액이 입금되지 않았어요',
               details: "이벤트 응모에 참여하신 경우 주문 시 입력한 주문자 및 수령자 정보 변경이 어려우며 응모 기간에 따라 아래와 같이 안내 드립니다. \n[응모 기간인 경우]\n- 주문 취소 후 재주문 하시어 올바른 개인정보를 입력바랍니다.\n[응모 기간이 종료된 경우]\n- 고객이 등록한 정보와 당첨자 정보가 다를 경우 이벤트 참여 불가합니다. \n- 개명으로 인한 정보 변경 시 개명 확인 서류를 1:1문의를 통해 전달 바랍니다. \n※ 배송지 주소 정보는 1:1문의를 통해 배송 전까지 변경 신청 가능하니 참고 부탁드립니다."
           },
           {
               label: '교환/반품',
               content: '상품 하자 또는 누락으로 교환/반품 하고 싶어요',
               details: "접수하시는 상품에 따라 교환/환불 정책이 상이할 수 있으며 자세한 사항은 상품 상세정보란을 확인 부탁드립니다. \n[상품 하자로 인한 경우]\n- 상품 전체가 나오는 사진에서 하자 부분을 동그라미(○)로 표시하여 1:1문의를 통해 신청 바랍니다. \n※ 접수하신 상품이 랜덤 구성품인 경우 받으시는 구성품 또한 랜덤으로 지급됩니다. \n[상품(구성품) 누락으로 인한 경우]\n- 정확한 확인을 위해 택배 박스 및 상품 개봉(구성품 포함) 영상이 반드시 필요합니다.\n- 개봉 영상은 송장과 개봉 전 박스의 모든 면이 보이고, 상품 개봉 장면이 온전하게 보이도록 촬영하셔야 합니다.\n※ 만약 개봉 영상이 없는 경우 불리하게 적용될 수 있어 촬영을 권장 드립니다. "
           },
           {
               label: '교환/반품',
               content: '구매한 공식 응원봉이 고장났어요. A/S 받을 수 있나요?',
               details: "공식 응원봉을 구매하시고 90일이 경과하지 않은 자체 결함의 경우 무상으로 수리 가능합니다. \n단, 고객 과실로 인하여 상품의 하자가 발생하거나 파손된 경우 무상수리가 불가하오니 이 점 유의하시기 바랍니다. \n※ 무상수리 기간이 만료되었거나 고객 과실로 인해 고장이 난 경우 제작처 고객센터(1577-5557)로 접수 바랍니다."
           },
           {
               label: '배송',
               content: '주문한 상품을 묶음 OR 개별 배송으로 받고 싶어요',
               details: "시스템 상 주문번호로 나누어 배송이 되기 때문에 주문번호에 있는 상품을 나누어 배송하거나 또는 다른 주문번호와 묶음으로 배송할 수 없습니다.\n개별 또는 묶음배송을 원하는 경우 주문취소 후 희망하는 배송 방법에 따라 주문 및 재결제 바랍니다."
           }
          
         ],
         noticeVisible: {}
    },
    methods: {
       fnGetList : function(){
            var self = this;
			var param = {};           
        },
        toggleNotice : function(index){
        	 this.$set(this.noticeVisible, index, !this.noticeVisible[index]); // 상태를 토글
          }
    },
    created: function() {
      var self = this;
      self.fnGetList();
      // Vue.js ì½ë ìì± ê°ë¥
    }
});
</script>