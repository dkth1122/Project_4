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
                            <a href="Javascript:;">ȸ������ ������ ��� �ϳ���?</a>
                            <ul class="sub">
                                SMTOWN &STORE ���� ȭ�� ��� [MY PAGE] - [ȸ������] - [ȸ������ ����]�� Ŭ���ϸ� ���� �� �Է��� ������ ������ �� �ֽ��ϴ�. 

							��, ���԰� ���������� �޴���ȭ ��ȣ�� ���� ������ �Ұ��Ͽ��� 1:1���� �Ǵ� CS CENTER(1661-6110)�� ���� ��û�� �ֽñ� �ٶ��ϴ�.
                             </ul>
                     </div>
                  
<div class="menu-container">
                     <div class="menu2">
                        <a href="Javascript:;">���̵�/��й�ȣ�� �ؾ���Ⱦ��</a>
                        <ul class="sub2">
                           �����Ͻ� ���̵� �Ǵ� ��й�ȣ�� �н��Ͻ� ��� �Ʒ� ��θ� ���� ����� ������ ã�� �� �ֽ��ϴ�. 




- SMTOWN &STORE ���� ȭ�� ��� [Login]�� Ŭ�� �� [���̵� ã��] / [��й�ȣ ã��] 

�� [�޴�������(���θ���)]�� ���� ���̵� ã���� ��� ���Ե� ���̵� ��ü Ȯ���� �����մϴ�.



����α����� ���� �����Ͻ� ��� �������� ��ȣ�� ���� ��ȣ(@)�� ���Ե� ��ȣȭ �������� ǥ�õ˴ϴ�.  

�̿��Ͻ� ����α��� ��ΰ� �ñ��Ͻ� ��� �Ʒ� ������ �����Ͻþ� �α��� �õ� �ٶ��ϴ�. 

                
                        </ul>
                 </div>
                 </div>
                 
                 <div class="menu-container">

                 <div class="menu3">
                    <a href="Javascript:;">ȸ�� ��޿� ���� ������ ��� �ֳ���?</a>
                    <ul class="sub3">
                        SMTOWN &STORE ȸ����޺� ���� �ȳ�



SMTOWN &STORE�� ������ ��� ȸ������ Ư���� ������ �����˴ϴ�.

ȸ�� ���� �� �̿������ ���� ������, ���� ���� �����Ǹ� ȸ����޺� �����Ǵ� ������ ������ �����ϴ�.



PINK

-��� : �ֱ� 6���� �� ���űݾ� 50���� �̸�

-������ : ���űݾ��� 0.5%



PINK SILVER

-��� : �ֱ� 6���� �� ���űݾ� 50���� �̻� ~ 100���� �̸�

-������ : ���űݾ��� 0.7%

-���� : ������ ���� 1��



PINK GOLD

-��� : �ֱ� 6���� �� ���űݾ� 100���� �̻�

-������ : ���űݾ��� 1.0%

-���� : ������ ���� 2��



���������



-�ֱ� 6���� �� ���űݾ�(��ۺ�, ������, ���� ���� ������ ���� �ݾ�))�� ���� ȸ�� ��� ����

-2019�� 4�� 5�� SMTOWN &STORE �����Ϸκ��� �ſ� 5�� ���ο� ȸ����� ���� �� ��޺� ���� ����

-��ۿϷ� ���� 7�� �� ��޺� ������ ����

-��޺� ������ �� 1ȸ �߱޵Ǹ� �߱��Ϸκ��� 30�ϰ� ��� ����

-SMTOWN &STORE �¶��ν������� ��� ����

-��ǰ ���� �� �ܼ����ɿ� ���� �ֹ� ��� �� ��ǰ�� ��ȯ/ȯ�� �� ����� ���� ���� �Ұ�

-������ ������ ���� ��ۿ����� ��� ����(�ؿ� ��� �� ���Ұ�)
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