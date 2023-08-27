<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="../js/jquery.js"></script>
<style type="text/css">
*{
  margin:0;
  padding:0;
  box-sizing: border-box;
}

pre { 
font-size: 1.2em;  
}
 
p{
  margin-top:10px;
}
.container{
  z-index:9999;
  width:100%;
}
.modal-btn-box{
  font-size:2em;
  width:100%;
  text-align:center;
}
.modal-btn-box button{
  display:inline-block;
  width:150px;
  height:50px;
  border: 0px solid ;
  cursor:pointer;
  padding-top:8px;
  font-weight: bold;
}
.popup-wrap{
  justify-content:center;
  align-items:center;
  position:fixed;
  top:0;
  left:0;
  right:0;
  bottom:0;
  display:none;
  padding:15px;
 }
.popup{
 z-index:9999;
  width:100%;
  max-width:800px;
  overflow:hidden;
  background-color:#d0d0d0;
  box-shadow: 5px 10px 10px 1px rgba(0,0,0,.3);
  
}

.popup-body{
  width:100%;
  background-color:#ffffff;
 
}
.body-content{
  width:100%;
  padding:30px;
}
.body-titlebox{
  text-align:center;
  width:100%;
  height:40px;
  margin-bottom:10px;
}
.body-contentbox{
  word-break:break-word;
  overflow-y:auto;
  min-height:500;
  max-height:700px;
}
.popup-foot{
  width:30px;
  height:30px;
  border-radius:15%;
  text-align: center;
}
.popup-foot:hover{
  background-color: #F3918F;
  color: #ffffff;
}

span.pop-btn.confirm {
 margin-left: 7px;
 margin-top:2px;
 }
.pop-btn{
  display:inline-flex;
  width:50%;
  height:100%;
  float:left;
  justify-content:center;
  align-items:center;
  color:#ffffff;
  cursor:pointer;
}


body .footer{
	margin:0%;
	text-align: center;
	background-color: #F2DAED;
	line-height: 30px;
	height: 400px;
	
}
.modal-open{
border:0px;
background-color:#F2DAED
}

.sns{
margin-left:50px;
cursor:pointer;
border:0px;
background-color:#F2DAED
}
</style>
</head>

<body >
<div id="footer">
  <div class="container">

    <div class="footer">
        <div class="modal-btn-box">
      <button type="button" class="modal-open">개인정보처리방침</button>
      <button type="button" class="modal-open">이용약관</button>
      <button type="button" class="modal-open">유료서비스 이용 약관</button>
      <button type="button" class="modal-open">쿠키정책</button>
       </div>
       <div class="sns-box">
      <button type="button"  class="sns" id="insta"><i class="fa-brands fa-instagram fa- fa-xl" style="color: #000000;"></i></button>
      <button type="button" class="sns" id="facebook"><i class="fa-brands fa-facebook fa- fa-xl" style="color: #000000;"></i></button>
      <button type="button" class="sns" id="kakao"><i class="fa-regular fa-message fa- fa-xl" style="color: #000000; "></i></button>
  	   </div>
COMPANYVery peri COMPANY Inc.CEO 한나라 CALL <br>
CENTER1544-0790FAX(+82)-2-2144-9399주소<br>
인천 부평구 경원대로 1366 7층 더조은컴퓨터아카데미 인천캠퍼스<br>
개인정보관리책임자 여대현 (happy940823@Very perishop.io)사업자등록번호716-87-01158 <br>
사업자정보확인통신판매업 신고번호제 2022-성남분당A-0557 호호스팅 <br>
서비스 사업자Amazon Web Services, Inc.<br>
Very peri Shop 은 해당 상품의 통신판매중개자이며, 통신판매의 당사자가 아닙니다.
 따라서 Very peri Shop은 해당 상품의 상품, 거래 정보 및 거래에 대하여 책임을
 지지 않습니다.<br> 유형 상품인 경우, 배송 운영과 배송에 대한 책임은 위버스컴퍼니에
 있습니다.<br>
Copyright by Very peri COMPANY INC. or its affiliates (Very peri JAPAN & Very peri AMERICA Inc)<br> All rights reserved. 
@ Very peri COMPANY Inc.


    </div>
  </div>

  <div class="popup-wrap" id="popup1">
    <div class="popup">
       <div class="popup-foot"> 
         <span class="pop-btn confirm"><i class="fa-solid fa-xmark fa-lg" style="color: #000000;"></i></span>
      </div>
      <div class="popup-body">
        <div class="body-content">
          <div class="body-titlebox">
            <h1>Very peri 서비스 개인정보 처리방침
            </h1>
          </div>
          <div class="body-contentbox">
            <pre class="contents">
         	저희가 알아서 자알 처리할테니까 걱정하지 마십쇼.
            </pre>
          </div>
        </div>
      </div>
    
    </div>
  </div>

  <div class="popup-wrap" id="popup2">
    <div class="popup">
      <div class="popup-foot">
        <span class="pop-btn confirm"><i class="fa-solid fa-xmark fa-lg" style="color: #000000;"></i></span>
      </div>
      <div class="popup-body">
        <div class="body-content">
          <div class="body-titlebox">
            <h1>이용약관</h1>
          </div>
          <div class="body-contentbox">
            <pre>
             제 1조 (목적)
1 Very peri 서비스 이용약관은 본 약관 및 추후 추가될 수 있는 별도의 약관들(유료서비스 이용약관 등)을 포함한 ‘서비스’에 대한 전체 약관을 말하며, 이하 ‘약관’이라 합니다.

2 Very peri 서비스 이용약관은 주식회사 위버스컴퍼니(이하, ‘회사’라 함)가 모바일 어플리케이션을 통해 제공하는 Very peri 서비스(이하 ‘서비스’라 함)를 본 약관에 따라 이용계약을 체결한 이용자(이하, 해당 계약을 ‘이용계약’, 해당 이용자를 ‘회원’이라 함)가 이용함에 있어 ‘회사’와 ‘회원’과의 법률관계를 명확히 함을 그 목적으로 합니다.

제2조 (위버스 계정 생성 및 이용)
1 위버스 계정이란 ‘회사’가 제공하는 ‘서비스’를 사용하기 위해서, ‘회원’이 생성한 로그인 계정을 의미합니다. 위버스 계정은 ‘회원’이 ‘약관’에 동의하고, 계정 정보를 입력하시면, ‘회사’가 일정 정보를 인증(이메일 주소 확인)한 후 가입을 인증하는 절차로 생성됩니다.

2 ‘회사’가 제공하는 ‘서비스’를 원활히 이용하기 위해서는 위버스 계정이 필요하며, 일부 메뉴 및 ‘서비스’는 ‘회원’ 가입 없이도 이용이 가능합니다.

3 위버스 계정을 생성한 이후에는 ‘회사’가 제공하는 위버스 계정 연동 서비스 전체를 이용하실 수 있습니다. 다만, ‘회사’의 신규 서비스에 최초 로그인 시 사용 동의 및 개별 서비스 이용약관에 대한 동의 등의 절차를 진행합니다.

제3조 (이용계약의 체결)
1 ‘이용계약’은 ‘회원’이 되고자 하는 자(이하, ‘가입신청자’라 함)가 ‘약관’의 내용에 대하여 동의를 한 다음 회원가입신청을 하고, ‘회사’가 이러한 신청에 대하여 승낙함으로써 체결되며, ‘가입신청자’는 ‘회사’의 승낙에 따라 ‘이용계약’이 체결되는 시점부터 ‘회원’이 되어 ‘약관’에 따라 ‘서비스’를 이용할 수 있습니다.

2 ‘회사’는 ‘이용계약’ 체결 과정에서 ‘가입신청자’의 이메일 주소 등의 (개인)정보를 수집할 수 있으며, 이 경우 ‘가입신청자’는 정확한(거짓이 아닌) 정보를 제공하여야 합니다. 본 항에 따른 개인정보의 수집 및 이용과 보관 등에 대해서는 별도로 게시되는 개인정보처리방침이 적용됩니다.

3 ‘회사’는 ‘가입신청자’의 회원가입신청에 ‘서비스’ 시스템에의 기계적 접근 또는 계정도용, 거짓된 정보의 제공 및 ‘가입신청자’의 ‘서비스’ 어뷰징 내역 확인 등의 사유가 있어 ‘회사’가 ‘가입신청자’의 신청을 승낙하는 것이 적절하지 않은 경우 그 승낙을 유보 또는 거부하거나, 사후에 이용계약을 해지할 수 있습니다.

4 ‘회사'는 아동(내국인의 경우 만14세 미만, 외국인의 경우 만16세 미만)을 대상으로 ‘서비스’를 제공하지 않습니다.

제4조 (약관의 개정)
1 ‘회사’는 관련법령에 위배되지 않는 범위에서 ‘약관’을 개정할 수 있습니다.

2 ‘회사’는 전 항에 따라 ‘약관’을 개정할 경우, 적용일자와 변경내용 및 사유를 명시하여 ‘서비스’를 통해 사전 공지합니다. 다만, 그 변경내용이 법적으로 ‘회원’에게 불리한 것일 경우, 그 적용일자 30일 이전부터 변경내용을 ‘서비스’를 통해 공지할 뿐만 아니라, 해당 내용을 ‘회원’의 이메일, 로그인 시 동의창 등의 전자적 수단을 통해 명확히 통지합니다.

3 ‘회원’은 변경되는 약관에 동의하지 않을 경우 ‘약관’을 통해 체결되었던 ‘서비스’에 대한 이용계약을 해지하고 ‘서비스’의 이용을 중단할 수 있습니다.

4 ‘회사’가 본 조 제2항에 따라 약관의 개정을 공지 또는 통지하면서 적용일자 이전에 거부 의사를 표시하지 않으면 개정 약관에 동의한 것으로 본다는 뜻을 함께 공지 또는 통지하였음에도 불구하고 ‘회원’이 명시적으로 거절의 의사표시를 하지 않은 경우에는 ‘회원’이 개정 약관에 동의한 것으로 봅니다.

제5조 (서비스의 변경 및 중단 등)
1 ‘회사’는 필요한 경우 ‘서비스’의 내용을 변경할 수 있습니다. 다만, ‘서비스’ 내용의 변경이 ‘회원’의 권리와 의무에 중대한 영향을 미치는 경우에는 제4조에 따른 공지 및 통지의 절차를 거쳐 변경합니다.

2 ‘회사’는 정보통신설비의 보수점검, 교체 및 고장, 통신두절 또는 운영상 상당한 이유가 있는 경우 ‘서비스’의 제공을 일시적으로 중단할 수 있습니다.

3 ‘회사’는 ‘서비스’의 제공에 필요한 경우 정기점검을 실시할 수 있으며, 정기점검이 실시되는 과정에서 ‘서비스’의 제공을 일시적으로 중단할 수 있습니다.

4 ‘회사’는 ‘회사’의 경영상의 이유 등의 사유로 ‘서비스’를 중단할 수 있습니다.

제6조 (광고의 게재)
‘회사’는 ‘서비스’에 ‘회사’ 또는 제3자의 광고를 게재할 수 있습니다.

제7조 (회원의 권리 및 의무)
1 ‘회원’은 ‘서비스’를 통해 ‘회원’에게 제공되는 상품소개, 아티스트 소개, My NX 엠블럼 및 멤버십 서베이 등의 콘텐츠(이하 ‘콘텐츠’라 함)를 개인적, 비영리적으로 사용하고 ‘회사’가 ‘서비스’를 통해 허용하는 행위(예를 들면 댓글을 작성하는 행위 등)를 할 수 있습니다.

2 ‘회원’은 전 항의 제한된 권리 외에 ‘서비스’를 통하여 제공 받은 ‘콘텐츠’에 대해 어떠한 권리도 취득하지 않습니다.

3 ‘회원’은 ‘콘텐츠’를 다음 각 호와 같이 본 조에 의해 허락 받은 범위를 넘어서서 이용하는 행위를 해서는 안되며, 이와 같은 행위를 할 경우 그에 대한 모든 민형사상 법적 책임을 집니다.

1. ‘콘텐츠’를 임의로 별도의 동영상 파일 등으로 제작하는 행위

2. ‘콘텐츠’를 임의로 인터넷에 게시하는 행위

3. ‘콘텐츠’를 임의로 제3자에게 제공하는 행위

4. 기타 ‘콘텐츠’에 대한 모든 저작권 침해 행위

④ ‘회원’은 ‘서비스’의 서버와 네트워크 시스템에 허락되지 않은 방식으로 접근하는 일체의 행위 또는 ‘서비스’의 제공을 방해하는 행위를 해서는 안됩니다.

⑤ ‘회원’은 다음 각 호와 같은 행위를 해서는 안됩니다.

1. ‘회사’에 허위정보를 제공하거나 타인의 정보를 도용하는 행위

2. ‘회사’와 기타 제3자의 저작권 등 지적재산권에 대한 침해 행위

3. ‘회사’와 기타 제3자의 명예를 손상시키거나 업무를 방해하는 행위

4. ‘회사’의 동의 없이 ‘서비스’를 영리적으로 사용하는 행위

5. ‘서비스’와 관련하여 ‘회사’를 사칭하거나 허위 정보를 유포하는 행위

6. 「정보통신망 이용촉진 및 정보보호 등에 관한 법률」 등 관련법령에서 금지하는 행위 등 기타 불법적이거나 부당한 행위

6 ‘회원’은 ID와 비밀번호에 대한 관리책임이 있으며, ‘회원’의 고의 또는 과실로 일어날 수 있는 각종 손해에 대한 책임은 ‘회원’ 본인에게 있으며, ‘회원’은 자신의 ID 및 비밀번호를 도난 당하거나 제3자가 사용하고 있음을 인지한 경우에는 즉시 ‘회사’에 통보하고 ‘회사’의 안내가 있는 경우에는 그에 따라야 합니다.

제8조 (회원콘텐츠 작성/운영정책 및 위반 시 제재의 내용)
1 ‘회원’이 작성하는 게시글, 댓글을 포함하는 모든 콘텐츠(이하 ‘회원콘텐츠’라 함)에 대해서는 본 조의 정책이 적용됩니다.

1 금지행위: ‘회원’은 아래 각 호의 내용이 포함되는 ‘회원콘텐츠’를 작성하거나 아래에서 금지하는 행위를 해서는 안됩니다.

1. 타인(‘회사’ 및 ‘회사’ 소속 아티스트 포함)의 명예를 훼손하거나 근거 없이 비방하는 내용

2. 욕설, 음란/외설적 내용, 폭력적인 내용 등 미풍양속에 반하는 내용

3. 근거 없이 공포심이나 불안감을 지속적으로 유발하는 내용

4. 법령에 따라 금지되는 사해행위와 관련된 내용

5. 법령에 따라 분류된 영업비밀 또는 국가기밀 등을 누설하는 내용

6. 범죄를 목적으로 하거나 범죄를 교사 또는 방조하는 내용

7. 기타 관련 법령에 따라 게시가 금지된 불법적인 내용

8. 동일/유사한 '회원콘텐츠'를 지속적/반복적으로 게시하는 행위 등 제7조 제3항 내지 제7조 제5항에서 금지하는 행위

③ 위반 시 제재의 내용: 위 제2항을 위반할 경우, 아래와 같은 조치가 취해질 수 있습니다.

1. 제2항의 위반 사유가 확인되었거나 일정 횟수 이상 신고를 받은 ‘회원콘텐츠’는 자동적으로 임시삭제 조치가 취해지며, 해당 콘텐츠를 작성한 ‘회원’은 해당 콘텐츠가 제2항의 위반 사유에 해당하지 않음을 소명하여 해당 조치를 해제할 수 있습니다.

2. 제2항의 위반 사유가 확인되었거나 일정 횟수 이상 신고를 받은 ‘회원’은 자동적으로 일정한 기간 동안 ‘회원콘텐츠’ 작성이 제한되게 되며, 해당 ‘회원’은 해당 기간 이내에도 자신이 작성한 콘텐츠가 제2항의 위반 사유에 해당하지 않았음을 소명하여 해당 제한조치를 해제할 수 있습니다.

※ 위 제1호 및 제2호에서의 제재의 기준 횟수 및 제재기간은 ‘서비스’의 운영 과정에서 ‘서비스’ 및 ‘회원’을 부적절한 콘텐츠로부터 보호하기 위한 가장 적절한 횟수로 수시로 정해지게 됩니다.

4 ‘회원’이 작성한 ‘회원콘텐츠’에 대한 사용권의 부여: ‘회사’는 필요할 경우 ‘회원콘텐츠’를 사용할 수 있습니다.

제9조 (이용제한)
1 ‘회사’는 본 조의 경우, ‘회원’의 ‘서비스’ 이용을 일시적 또는 영구적으로 제한할 수 있습니다.

2 일시적 이용제한

1. ‘회원’이 제7조의 회원의 의무를 위반하는 경우

2. ‘회원’이 제8조의 ‘회원콘텐츠’ 작성/운영정책을 위반하는 경우

3 영구적 이용제한

1. ‘회원’이 제7조의 회원의 의무를 상습적으로 위반하는 경우

2. ‘회원’의 제7조의 의무위반 행위가 범죄를 구성하는 경우

3. ‘회원’이 제8조의 ‘회원콘텐츠’ 작성/운영정책을 상습적으로 위반하는 경우

4. ‘회원’의 제8조의 ‘회원콘텐츠’ 작성/운영정책의 위반 행위가 범죄를 구성하는 경우

제10조 (회사의 권리, 의무 및 면책)
1 ‘회사’는 ‘서비스’에 대한 모든 권리를 보유합니다.

2 ‘회사’는 ‘서비스’를 안정적으로 제공하기 위해 노력하나, 천재지변, 전쟁 및 기타 이에 준하는 불가항력의 경우, 그리고 제5조의 경우에 ‘서비스’ 제공이 중지 또는 중단될 수 있으며, 이에 대해서 ‘회사’는 책임을 지지 않습니다.

3 ‘회사’는 ‘회원’이 ‘콘텐츠’를 이용함으로 인해 발생하는 손해에 대해서 ‘회사’의 고의 또는 과실 등 귀책이 없는 한 책임지지 않습니다.

제11조 (통지)
1 ‘회사’가 ‘회원’에게 개별 통지하는 경우 ‘약관’에서 달리 정하지 않는 한 이메일 주소로 할 수 있습니다.

② 제1항에도 불구하고 ‘회사’가 불특정 다수의 ‘회원’에게 통지하는 경우 ‘서비스 내 공지’ 화면에 7일 이상 해당 사실을 게시함으로서 개별 통지에 갈음할 수 있습니다.

제12조 (Very peri Cash)
1 ‘회사’는 적립금 개념의 Very peri Cash 제도를 운영할 수 있습니다.

2 Very peri Cash란 ‘회사’로부터 상품을 구매하는 등 ‘회사’가 지정한 경우에 보상받는 점수로 상품 구매 시 결제 등 ‘회사’가 정한 경우에 사용될 수 있습니다.

3 ‘회사’는 운영정책에 따라 Very peri Cash 적립을 할 수 있으며, '회사'의 사정에 따라 지정된 일부 상품은 제외 될 수 있습니다.

4 Very peri Cash는 ‘회원’이 결제등에 사용하는 통화로 전환되어 사용될 수 있으며, 전환비율은 ‘회사’가 정한 비율에 의합니다.

5 Very peri Cash의 사용 최소 단위는 한화(KRW)의 경우 \ 1, 미화(USD)의 경우 $ 0.01, 엔화(￥)의 경우 1엔입니다.

6 Very peri Cash의 구체적인 적립 및 사용방법(위 제2항 내지 제5항을 포함하나 이에 국한되지 아니함)은 ‘회사’의 운영정책에 따라 정해지며, 세부적인 운영정책의 내용은 고객센터 내 FAQ에 따릅니다.

7 ‘회원’의 주문 취소 처리시 이미 사용된 Very peri Cash는 즉시 복원 처리되어 사용한 Very peri Cash 전액이 재 적립되며, 재 적립된 Very peri Cash의 유효기간은 기존 유효기간으로 원상 복구됩니다.

8 ‘회원’이 Very peri Cash를 부당하게 적립한 경우 ‘회사’는 사전통지 없이 ‘회원’의 Very peri Cash를 삭제할 수 있고, 그 삭제 사항을 ‘회원’에게 통지할 수 있으며 ‘회원’의 ‘서비스’ 이용을 제한할 수 있습니다.

9 Very peri Cash는 타인에게 양도할 수 없으며, ‘회원’ 자격상실 시 ‘회원’의 Very peri Cash는 자동으로 소멸됩니다. 또한, ‘회원’ 탈퇴 시 잔여 Very peri Cash는 전부 소멸되며, 재가입시 기존 Very peri Cash 내역의 신규 계정 또는 타인 계정으로의 이관은 불가합니다.

10 Very peri Cash는 ‘회원’의 Very peri Cash 획득일로부터 60개월(5년)이 지나면 소멸됩니다. 다만, 이벤트에 의해 부여된 Very peri Cash에 해당 이벤트상 개별 유효기간이 설정되어 있는 경우, 해당 기간 만료 시에 소멸됩니다.

11 이 밖에 Very peri Cash에 관하여 본 이용약관에서 규정하지 않은 사항에 관하여는 별도 공지된 고객센터 내 FAQ에 따릅니다.

제13조 (휴면계정)
1 ‘회원’이 1년동안 ‘서비스’를 이용하지 않았을 경우 원활한 ‘회원’관리를 위하여 휴면계정으로 처리하며, ‘회원’ 활동과 Very peri Cash의 사용을 제한할 수 있습니다.

2 ‘회사’는 ‘회원’이 휴면계정으로 처리된 후 일정기간이 지나면 ‘회사’는 제11조에서 정한 방법으로 통지 후 해당 ‘회원’의 적립금을 소멸시킬 수 있습니다.

제14조 (손해배상)
‘회사’와 ‘회원’은 각자의 귀책에 의해 상대방에 손해를 끼친 경우, 그에 대한 손해배상 책임을 집니다. 특히 ‘회원’이 제7조 제3항을 위반하여 ‘콘텐츠’의 저작권을 침해한 경우, ‘회원’은 그에 대한 모든 민형사상 책임을 부담합니다.

제15조 (서비스 주체의 변경)
1 ‘회사’는 영업의 전부 또는 일부의 양도·합병, 인적·물적 분할, 자산 양수도 등으로 ‘서비스’ 주체가 변경될 경우에는 정보통신망법 제26조에 따라 개인정보의 이전을 ‘회원’에게 알리도록 합니다.

2 ‘회사’가 제1항에 따른 ‘서비스’ 주체가 변경될 경우 ‘약관’에 따른 ‘회사’와 ‘회원’이 체결한 ‘이용계약’이 변경되는 ‘서비스’ 주체에게 포괄적으로 이전됩니다.

3 ‘회사’는 ‘회원’이 개인정보의 이전과 ‘이용계약’의 이전을 원하지 아니하는 경우 개인정보 수집 및 이용에 관한 동의와 ‘약관’ 동의를 철회할 수 있는 방법과 절차를 안내합니다.

제16조 (준거법 및 재판 관할)
1 본 약관에 대해서는 대한민국법을 준거법으로 하고, 대한민국 법원이 관할권을 갖는 것으로 합니다.

2 ‘회사’와 ‘회원’ 간 발생한 분쟁에 관한 소송은 제소 당시의 회원의 주소에 의하고, 주소가 없는 경우 거소를 관할하는 지방법원의 전속관할로 합니다. 단, 제소 당시 회원의 주소 또는 거소가 명확하지 아니한 경우의 관할법원은 민사소송법에 따라 정합니다. 해외에 주소나 거소가 있는 고객의 경우 회사와 고객간 발생한 분쟁에 관한 소송은 대한민국 서울중앙지방법원을 관할법원으로 합니다.

적용일 : 2021년 02월 10일
            </pre>
          </div>
        </div>
      </div>
     
    </div>
  </div>

  <div class="popup-wrap" id="popup3">
    <div class="popup">
      <div class="popup-foot">
        <span class="pop-btn confirm"><i class="fa-solid fa-xmark fa-lg" style="color: #000000;"></i></span>
      </div>
      <div class="popup-body">
        <div class="body-content">
          <div class="body-titlebox">
            <h1>유료서비스 이용약관</h1>
          </div>
          <div class="body-contentbox">
            <pre>
          제1조 (목적 및 적용의 범위 등)
① 본 약관은 ‘서비스’ 내에서 판매되는 ‘유료상품’의 판매(구매)이용환불 등과 관련하여 ‘회사’와 ‘회원’ 간의 권리관계를 명확히 하는 것을 그 목적으로 합니다.

② 본 약관은 ‘유료상품’을 구매하는 ‘회원’에게 적용됩니다.

③ 본 약관은 ‘이용약관’에 대한 부수적 약관으로, 본 약관에서 정하지 않은 부분은 ‘이용약관’에서 정한 바에 따릅니다.

제2조 (용어의 정의)
① ‘이용약관’에서 정의된 용어는 본 약관에서도 동일한 의미를 갖습니다.

② 본 약관에서 추가적으로 정의하는 용어는 다음과 같습니다.

1. ‘유료상품’이란 ‘회원’이 ‘서비스’에서 유료로 구매할 수 있는 각종 상품(앨범, MD제품 등)을 의미합니다.

제3조 (유료상품의 내용 및 이용기간 등)
① ‘회사’는 ‘회원’이 ‘유료상품’의 구입 전에 ‘유료상품’의 거래(구입)조건을 정확하게 이해하고 실수나 착오 없이 거래할 수 있도록 다음 각 호의 사항들을 적절한 방법으로 본 약관 및 ‘서비스’ 내에서 고지합니다. 아래 제2호의 설명 페이지 내용을 포함하여 각 호의 내용은 약관의 일부로서 ‘회사’와 ‘회원’을 구속합니다.

1. 판매자의 상호, 대표자의 성명·주소 및 전화번호 등

2. ‘유료상품’의 종류 및 가격, 이용방법, 이용시기, 이용조건 등 구체적 내용

3. 청약철회 및 계약해제의 기한·행사방법 및 효과, 환불 등에 관한 사항

4. 소비자의 피해보상, 불만 처리 및 분쟁 처리에 관한 사항

제4조 (유료상품 구매계약의 성립)
‘유료상품’의 구매계약은 ‘회원’이 본 약관에 동의하고, ‘회사’가 정하는 결제수단과 방법을 통해 ‘유료상품’을 구매함으로써 성립됩니다.

제5조 (유료상품의 구매 및 환불)
① ‘유료상품’의 구매는 신용카드, 휴대폰, 계좌이체 등 회사에서 서비스 플랫폼 별로 제공 가능한 결제방식을 통해서 이루어집니다. 단, ‘회원’이 선택한 결제수단을 운영하는 사업자가 별도로 있는 경우, ‘회원’은 해당 결제수단을 이용하기 전에 해당 결제수단의 사업자가 요구하는 절차를 이행하여야 해당 결제수단을 이용하여 결제를 진행할 수 있습니다.

② ‘회사’는 다음의 각 호의 경우에는 ‘회원’의 구매 신청을 승낙하지 않거나 승낙을 유보하거나, 추후 승낙을 취소함으로서, ‘유료상품’ 구매계약의 성립을 거부하거나 취소할 수 있습니다.

1. 실명이 아니거나 타인의 명의를 이용한 경우

2. 동일IP의 대량 결제, 유사 ID에서의 연속적인 결제, 도용이력 등을 고려하여 지정된 위험 IP에서의 결제 등 도용에 의한 충전으로 판단되는 경우

3. 구매 과정에서 허위의 정보를 기재하거나, 필수사항을 기재하지 않은 경우

4. 만 19세 미만의 미성년자가 법정대리인의 동의 없이 신청한 경우

5. 결제에 대한 지급이 실제로 이루어지지 않았거나 않을 가능성이 있는 경우

6. (‘유료상품’을 포함하여) ‘콘텐츠’에 대한 저작권 침해 등 ‘이용약관’을 위반한 ‘회원’인 경우

7. ‘이용약관’ 제7조에 따라 이용제한을 받은 ‘회원’인 경우

8. 위 1항 내지 7항을 위반한 사실이 있는 ‘회원’인 경우

9. 기타 이용 신청을 승인하는 것이 관계 법령이 위반되거나 사회 안녕 질서 및 미풍양속, 회사의 관련 약관 등에 위반되는 경우

③ ‘회사’는 다음의 각 호의 경우에는 각 호의 사유가 해소될 때까지 승인을 유보할 수 있습니다.

1. ‘서비스’에 장애가 발생한 경우

2. ‘서비스’의 정상적인 운영을 위한 설비 혹은 관련 인력이 부족한 경우

④ ‘회사’는 ‘회원’이 정상적으로 ‘유료상품’을 구매하여 ‘유료상품’ 구매계약이 체결된 경우, 3.1.항 각 호의 내용을 포함하여 계약체결의 내용을 즉시 ‘회원’에게 교부한다.

제6조 (미성년자 등의 계약체결에 대한 특칙)
① ‘회원’이 미성년자(만 19세 미만) 또는 제한능력자인 경우, ‘회원’은 ‘유료상품’ 구매를 위해 결제하기 전에, 법정대리인(부모 등)의 동의를 받아야 합니다.

② 법정대리인은 언제든지 고객센터 또는 별도의 페이지를 통해 미성년자의 유료상품 구매를 철회 요청하실 수 있습니다.
▶고객센터: 1544-0790

③ ‘회원’이 미성년자임에도 불구하고 구매 과정에서 성년자(성인)인 타인의 고유정보를 도용하는 등의 방법으로 본인이 성년자(성인)인 것으로 표시하거나 또는 성년자(성인)인 타인의 결제정보를 이용하여 결제를 하는 등 속임수로써 ‘회사’로 하여금 ‘회원’이 성인(성년자)이거나 ‘회원’의 법정대리인의 동의가 있었던 것으로 믿게 한 경우에는 법정대리인의 동의가 없었더라도 ‘유료상품’ 구매를 ‘회원’ 또는 ‘회원’의 법정대리인이 일방적으로 취소하지 못합니다(민법 제17조).

제7조 (청약철회 등)
① ‘회원’은 「전자상거래등에서의 소비자 보호에 관한 법률」(이하 ‘전자상거래법’)에 따라 유상으로 구매한 상품에 대하여 계약체결에 대한 내용을 교부 받은 시점 혹은 상품을 공급 받은 시점으로부터 7일 이내에 청약의 철회 및 계약의 해제(이하 ‘청약철회등’)를 할 수 있습니다. 다만, ‘회원’이 구매한 상품을 이미 사용한 경우에는 사용한 부분에 대해서는 ‘청약철회등’이 불가능하며, 이러한 불가능 사유에 대해서는 상품 구입 시 ‘회사’가 ‘회원’에게 명확하게 고지합니다.

② 위 7.1.항에도 불구하고 상품의 내용이 표시·광고의 내용과 다르거나 계약내용과 다르게 이행된 경우에는 ‘회원’은 그 상품을 공급받은 날부터 3개월 이내, 그 사실을 안 날 또는 알 수 있었던 날부터 30일 이내에 ‘청약철회등’을 할 수 있습니다.

③ 위 7.1.항 혹은 7.2.항에 따라서 ‘회원’이 ‘청약철회등’을 한 경우, ‘전자상거래법’에 따라 ‘회원’이 구매한 상품은 반환되며, ‘회사’는 ‘전자상거래법’에 따라 환급 절차를 진행합니다.

④ 기타 본 조에 따른 ‘청약철회등’에 대한 사항은 ‘전자상거래법’에 따라 규율 및 처리됩니다.

제8조 (청약철회등 이외의 환급 및 환불 등)
① ‘회원’은 개봉 및 사용하지 않은 ‘유료상품’에 대해서 환불 요청을 할 수 있으며, ‘회사’는 ‘회원’의 환불 요청에 대해서 관련 법령을 준수하여 환불을 진행합니다. 다만, 이러한 환불 요청은 유상으로 구매한 ‘유료상품’에 대해서만 가능합니다.

제9조 (계약의 해지 등)
① ‘회원’과 ‘회사’는 상대방이 ‘유료상품’ 구매계약에 따라 약정한 의무를 상당한 기간 이내에도 이행하지 않을 경우, 해당 계약을 해지할 수 있습니다.

② ‘회사’는 ‘회원’이 5.2.항의 ① 내지 ⑦(영구적 이용제한 행위로 한정한다)의 행위를 한 것을 확인한 경우, 해당 ‘회원’과의 ‘유료상품’ 구매계약을 즉시 해지할 수 있습니다.

제10조 (책임의 제한)
① ‘회사’는 천재지변 또는 이에 준하는 불가항력으로 인하여 구매된 ‘유료상품’을 약정한대로 제공할 수 없는 경우에는 그에 대한 책임이 면제됩니다.

② ‘회사’는 ‘회원’의 귀책사유로 인해 구매된 ‘유료상품’을 약정한대로 제공할 수 없는 경우에는 그에 대하여 ‘회사’의 고의 또는 중과실이 없는 한 책임이 면제됩니다

③ ‘회사’는 ‘회원’ 상호간 또는 ‘회원’과 제3자 간에 ‘유료상품’을 매개로 하여 발생한 분쟁 등에 대하여는 책임을 지지 않습니다.

제11조 (양도금지)
‘회원’은 본 약관에 따라 발생한 계약상 지위 및 권리의무를 타인에게 양도하거나, 질권의 목적으로 삼는 등 일체의 처분행위를 할 수 없습니다.

제12조 (기타 소비자 피해보상 및 불만처리 등)
① ‘회사’의 고의 또는 과실로 인해 ‘회원’이 구매한 ‘유료상품’을 정상적으로 이용할 수 없는 등 ‘회원’에게 피해가 발생할 경우, ‘회사’는 그에 대한 해결을 위해서 최선의 노력을 하며 그와 더불어 해당 피해에 대한 적절한 보상을 합니다.

② ‘회사’는 소비자의 피해보상, 불만 처리 및 분쟁 처리에 관한 사항, 환불에 대한 사항 등 소비자의 문제 제기에 대해서 해결하기 위해서 모바일 어플리케이션 My > 1:1문의 창구를 운영합니다.
            </p>
          </div>
        </div>
      </div>
      
    </div>
  </div>

  <div class="popup-wrap" id="popup4">
    <div class="popup">
      <div class="popup-foot">
        <span class="pop-btn confirm"><i class="fa-solid fa-xmark fa-lg" style="color: #000000;"></i></span>
      </div>
      <div class="popup-body">
        <div class="body-content">
          <div class="body-titlebox">
            <h1>쿠키 정의</h1>
          </div>
          <div class="body-contentbox">
            <pre>
              
쿠키는 주식회사 Very peri(이하 ‘회사’)의 회사가 제공하는 서비스(이하 ‘서비스’)에 접속 할 때 이용자의 디바이스에 저장되는 온라인 사이트 활동 기록으로 소량의 정보를 포함한 텍스트 파일입니다.
쿠키는 이용자가 당사 서비스 기능을 보다 편리하게 이용하기 위한 환경 개선의 목적으로 사용되며 개인을 식별할 수 있는 정보는 포함하지 않습니다.
회사는 동일한 목적으로 사용하는 브라우저의 “로컬스토리지” 또한 일반적인 의미로 “쿠키”라고 총칭하며, 본 방침의 모든 사항을 동일하게 적용 받습니다.
이용자가 회사의 서비스를 이용함에 있어 회사의 쿠키 사용에 동의하게 됩니다.
회사는 쿠키를 통해 수집한 정보를 아래 ‘쿠키의 사용’에 명시한 목적으로 사용합니다.
쿠키 정책을 통해 언급되지 않은 개인정보보호 관련 자세한 사항은 Very peri 개인정보처리방침을 참고하여 주시기 바랍니다.
쿠키의 종류
쿠키의 종류는 여러 가지입니다.
1. 세션 쿠키 : 이용자가 웹사이트 이용을 종료하면 사라지는 쿠키입니다.
2. 영구 쿠키 : 이용자가 브라우저 설정에서 쿠키를 삭제할 때까지 이용자의 기기에 저장됩니다.
쿠키의 사용
당사 사이트에서는 아래의 쿠키를 사용하고 있습니다.
1. 서비스 이용에 필수적인 쿠키
사이트에 로그인할 때 생성되는 쿠키로 마이페이지에 접속하는 등 주요 기능을 사용하기 위해 반드시 필요합니다.
이 쿠키의 사용을 비활성화하면 해당 서비스와 기능을 사용할 수 없게 됩니다.
이 쿠키를 통해 수집되는 정보는 회사 서비스의 원활한 이용 목적으로만 사용되며, 제3자에게 공유되거나 판매하지 않습니다.
2. 서비스 개선에 필요한 쿠키
익명의 정보를 수집해 이용자들이 회사의 서비스를 어떻게 활용하는지 이해하고, 사용자가 겪는 오류를 모니터링하거나 분석 할 수 있게 합니다.
회사 서비스를 개선하고 더 나은 사용자 경험을 제공하기 위해 이 쿠키가 필요하며, 쿠키를 통해 수집된 정보는 회사 서비스 개선을 위한 목적으로 사용되며, 제3자에게 공유되거나 판매하지 않습니다.
3. 마케팅 및 광고 쿠키
회사는 이 쿠키를 이용하여 페이스북이나 구글 같은 채널을 사용해 다른 사이트에 회사 서비스에 대한 광고 배너를 게재합니다.
광고 캠페인의 효과를 모니터링하고 개선하며, 광고 캠페인의 목표 대상을 조정해 회사 서비스 이용자에게 가장 관련 있는 콘텐츠를 표시할 수 있게 해줍니다.
이 쿠키로 수집된 데이터는 익명성이 유지되며, 제3자에게 공유되거나 판매하지 않습니다.
사용자는 이 쿠키를 거부할 수 있으며, 거부 방법은 쿠키의 관리에서의 방법을 통해 거부할 수 있습니다.
쿠키의 관리
이용자는 브라우저의 설정을 이용하여 전체 또는 일부 쿠키를 차단할 수 있습니다.
사이트의 특정 페이지는 쿠키를 사용하도록 설정한 경우에만 접근할 수 있으며,
쿠키를 사용하지 않도록 설정한 경우 일부 콘텐츠를 이용할 수 없거나 서비스 이용에 필수적인 쿠키 사용을 거부 할 경우 서비스의 모든 서비스를 이용하지 못할 수도 있습니다.
1. 인터넷 익스플로러에서 쿠키 사용 관리
인터넷 익스플로러에서 쿠키를 관리하는 방법은 쿠키 삭제 및 관리 페이지 를 참고하시어 관리하실 수 있습니다.
2. 구글 크롬에서 쿠키 사용 관리
구글 크롬에서 쿠키를 관리하는 방법은 Google 고객 센터의 쿠키 사용 설정 또는 중지 페이지를 참고하시어 관리하실 수 있습니다.
3. 모질라 파이어폭스에서 쿠키 사용 관리
모질라 파이어폭스에서 쿠키를 관리하는 방법은 웹 사이트용 쿠키 사용 설정하기 페이지를 참고하시어 관리하실 수 있습니다.
4. 사파리에서 쿠키 사용 관리
사파리에서 쿠키를 관리하는 방법은 Safari 사용 설명서 를 참고하시어 관리하실 수 있습니다.

            </pre>
          </div>
        </div>
      </div>
      
    </div>
  </div>
</div>

<script>

//인스타
document.getElementById("insta").addEventListener("click", function() {
 window.location.href = "https://www.instagram.com/nalanhl"; // 네이버 링크로 변경
});
//페북
document.getElementById("facebook").addEventListener("click", function() {
 window.location.href = "https://www.instagram.com/nalanhl"; // 네이버 링크로 변경
});
//카카오
document.getElementById("kakao").addEventListener("click", function() {
 window.location.href = "https://www.instagram.com/nalanhl"; // 네이버 링크로 변경
});


$(function(){
	  $(".modal-open").click(function() {
	    var index = $(this).index();
	    $(".popup-wrap").eq(index).css('display', 'flex').hide().fadeIn();
	  });

	  $(".pop-btn.confirm").click(function() {
	    modalClose.call(this);
	  });

	  function modalClose() {
	    $(this).closest(".popup-wrap").fadeOut();
	  }
	});
var footer = document.getElementById("footer");

/* window.onscroll = function() {
  var scrollBottom = document.body.scrollHeight - window.innerHeight - window.scrollY + 650;

  if (scrollBottom <= footer.offsetHeight) {
    // 스크롤이 맨 아래 위치할 때부터 footer가 보이도록
    footer.style.bottom = "0";
    footer.style.opacity = "1";
    footer.style.transition = "opacity 3s ease"; // 그라데이션 효과 추가
    footer.style.zIndex = "999999";
  } else {
    // 스크롤이 맨 아래가 아닐 때
    footer.style.bottom = "-550px"; // 또는 숨길 높이 값으로 조정
    footer.style.opacity = "0";
    footer.style.transition = "opacity 3s ease"; // 그라데이션 효과 추가
  }
};
 */</script>
</body>
</html>