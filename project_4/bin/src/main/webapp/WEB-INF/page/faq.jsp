<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<script src="../js/jquery.js"></script>
<script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.js"></script>
<meta charset="EUC-KR">
<title>Insert title here</title>
<%@ include file="header.jsp" %>
<%@ include file="mypageinclude.jsp" %>
<style>
      * {
    margin: 0;
    padding: 0;
}

.menu-container{
 margin: 30px;
 position: absolute;
top: 70%;
right: 50%;
 
 
}
.menu2 > .sub2,
.menu3 > .sub3{
  display: none;
    height: 120px;
    list-style: none;
    overflow: hidden;
}
.menu > .sub,
.menu7 > .sub7,
.menu8 > .sub8{
   display: none;
    height: 180px;
    list-style: none;
    overflow: hidden;

}
.menu5 > .sub5{
  display: none;
    height: 500px;
    list-style: none;
    overflow: hidden;
}
.menu4 > .sub4,
.menu6 > .sub6{
    display: none;
    height: 400px;
    list-style: none;
    overflow: hidden;
}

.menu > .sub li,
.menu2 > .sub2 li,
.menu3 > .sub3 li,
.menu4 > .sub4 li,
{
    border-top: 1px white solid;
}

.menu > .sub li > a,
.menu2 > .sub2 li > a,
.menu3 > .sub3 li > a,
.menu4 > .sub4 li > a,
 {
    text-decoration: none;
    color: black;
}

.menu > .sub.up,
.menu2 > .sub2.up,
.menu3 > .sub3.up,
.menu4 > .sub4.up,
{
    height: 0;
    animation-name: slide_up;
    animation-duration: 1s;
}

.menu > .sub.down,
.menu2 > .sub2.down,
.menu3 > .sub3.down,
.menu4 > .sub4.down,
{
    height: 120px;
    animation-name: slide_down;
    animation-duration: 1s;
}

@keyframes slide_up {
    0% {
        height: 120px;
    }

    100% {
        height: 0;
    }
}

@keyframes slide_down {
    0% {
        height: 0;
    }

    100% {
        height: 120px;
    }
}
</style>
</head>
<body>
<div id="app">

<div class="menu-container">
                      <div class="menu">
                            <a href="Javascript:;">회원정보 변경은 어떻게 하나요?</a>
                            <ul class="sub">
                                SMTOWN &STORE 메인 화면 상단 [MY PAGE] - [회원정보] - [회원정보 수정]을 클릭하면 가입 시 입력한 정보를 수정할 수 있습니다. 

							단, 성함과 본인인증한 휴대전화 번호는 직접 수정이 불가하오니 1:1문의 또는 CS CENTER(1661-6110)를 통해 신청해 주시기 바랍니다.
                             </ul>
                     </div>
                  
<div class="menu-container">
                     <div class="menu2">
                        <a href="Javascript:;">아이디/비밀번호를 잊어버렸어요</a>
                        <ul class="sub2">
                           가입하신 아이디 또는 비밀번호를 분실하신 경우 아래 경로를 통해 등록한 정보를 찾을 수 있습니다. 




- SMTOWN &STORE 메인 화면 상단 [Login]을 클릭 ▶ [아이디 찾기] / [비밀번호 찾기] 

※ [휴대폰인증(본인명의)]을 통해 아이디를 찾으실 경우 가입된 아이디 전체 확인이 가능합니다.



간편로그인을 통해 가입하신 경우 개인정보 보호를 위해 기호(@)가 포함된 암호화 계정으로 표시됩니다.  

이용하신 간편로그인 경로가 궁금하신 경우 아래 내용을 참고하시어 로그인 시도 바랍니다. 

                
                        </ul>
                 </div>
                 </div>
                 
                 <div class="menu-container">

                 <div class="menu3">
                    <a href="Javascript:;">회원 등급에 따른 혜택은 어떤게 있나요?</a>
                    <ul class="sub3">
                        SMTOWN &STORE 회원등급별 혜택 안내



SMTOWN &STORE에 가입한 모든 회원에게 특별한 혜택이 제공됩니다.

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

-등급별 쿠폰은 월 1회 발급되며 발급일로부터 30일간 사용 가능

-SMTOWN &STORE 온라인스토어에서만 사용 가능

-상품 구매 후 단순변심에 의한 주문 취소 및 상품의 교환/환불 시 사용한 쿠폰 재사용 불가

-무료배송 쿠폰은 국내 배송에서만 사용 가능(해외 배송 시 사용불가)
                    </ul>
             </div>
</div>
            

            </div>
</body>
</html>
<script>

let subToggle=true;

$(".menu").click(()=>{
if(subToggle){
  $(".sub").slideDown(500);
}else{
  $(".sub").slideUp(1000);
}
subToggle=!subToggle;
});

$(".menu2").click(()=>{
if(subToggle){
  $(".sub2").slideDown(500);
}else{
  $(".sub2").slideUp(1000);
}
subToggle=!subToggle;
});


$(".menu3").click(()=>{
if(subToggle){
  $(".sub3").slideDown(500);
}else{
  $(".sub3").slideUp(1000);
}
subToggle=!subToggle;
});

</script>