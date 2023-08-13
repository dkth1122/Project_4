<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<script src="../js/jquery.js"></script>
<script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.js"></script>
<meta charset="EUC-KR">
<title>Insert title here</title>
<style>
	table{
		border : 1px solid black;
		border-collapse: collapse;
		text-align : center;
	}
	th, td {
		border : 1px solid black;
		padding : 5px 10px;
	}
</style>
</head>
<body>
<div id="app">
	<div>
	<h2>고객 정보</h2>

	<table>
		<tr>
			<th>아이디</th>
			<th>비밀번호초기화</th>
			<th>비밀번호오류횟수</th>
			<th>이름</th>
			<th>닉네임</th>
			<th>전화번호</th>
			<th>이메일</th>

		</tr>
		<tr>
			<td>{{info.uId}}</td>
			<td><button @click="fnPwReset">비밀번호 초기화</button></td>
			<td v-if="info.uCnt >= 5"><button @click="fnCntReset">오류초기화</button></td>
			<td v-else></td>
			<td>{{info.uName}}</td>
			<td>{{info.uName2}}</td>
			<td>{{info.uPhone}}</td>
			<td>{{info.uEmail}}</td>

		</tr>
	</table>
	</div>
	
	<div>
	<h2>정지</h2>
	<div v-if="info.bYn =='Y'">
	<table>
	<tr>
		<th>정지사유</th>
		<th>정지날짜</th>
	</tr>
	<tr>
		<td>{{info.bReasons}}</td>
		<td>{{info.bDate}}</td>
	</tr>
	</table>
	<button @click="fnUserBanDel">정지 해제</button>
	</div>
	<div v-else><button @click="fnUserBan">정지</button></div>
	</div>
	
	<div>
	<h2>포인트</h2>
	<div>고객 잔여 포인트 : {{info.uPoint}}</div>
	<div><button @click="fnPointAdd">추가</button></div>
	</div>
	
	<div>
	<h2>1:1문의 확인</h2>
	</div>
	
	<div>
	<h2>주문내역 확인</h2>
	</div>
	
	<div>
	<h2>이벤트 응모 내역 확인</h2>
	</div>
	
	<div>
	<h2>배송 정보 확인</h2>
	</div>
	
	
	<div><button @click="fnBack">되돌아가기</button></div>
</div>
</body>
</html>
<script>
var app = new Vue({
	el : '#app',
	data : {
		info : {},
		uId : "${map.uId}",
		uResetPw : ""
	},// data
	methods : {
		fnGetList : function(){
            var self = this;
            var nparmap = {uId : self.uId};
            $.ajax({
                url : "/user2/view.dox",
                dataType:"json",	
                type : "POST", 
                data : nparmap,
                success : function(data) { 
                	self.info = data.info;
                }
            }); 
        },
        fnCntReset : function(){
            var self = this;
            var nparmap = {uId : self.uId};
            $.ajax({
                url : "/user2/cntReset.dox",
                dataType:"json",	
                type : "POST", 
                data : nparmap,
                success : function(data) { 
                	alert("초기화되었습니다.");
                	self.fnGetList();
                }
            }); 
        },
        fnBack : function(){
            location.href = 'list.do';
         },
        fnPwReset : function(){
            var self = this;
            var nparmap = {uId : self.uId , uResetPw : self.info.uPhone};
            if(!confirm("정말 변경하시겠습니까?")){
                return;
            }
            $.ajax({
                url : "/user2/userPwReset.dox",
                dataType:"json",	
                type : "POST", 
                data : nparmap,
                success : function(data) { 
                	alert("전화번호 끝 4자리로 변경되었습니다.");
                	self.fnGetList();
                }
            }); 
        },
        fnPointAdd: function(){
            var self = this;
            var pointAdd = prompt("얼마를 추가할까요? 차감시에는 - 붙이기");
            var nparmap = {uId : self.uId , pointAdd};
            $.ajax({
                url : "/user2/pointAdd.dox",
                dataType : "json", 
                type : "POST", 
                data : nparmap,
                success : function(data) { 
                    alert("포인트가 추가되었습니다.");
                    self.fnGetList();
                }
            }); 
        },
        fnUserBan : function(){
            var self = this;
            var bReasons = prompt("정지 사유를 입력해주세요!");
            var nparmap = {uId : self.uId , bReasons};
            $.ajax({
                url : "/user2/userBan.dox",
                dataType : "json", 
                type : "POST", 
                data : nparmap,
                success : function(data) { 
                    alert("정지되었습니다.");
                    self.fnGetList();
                }
            }); 
        },
        fnUserBanDel : function(){
            var self = this;
            if(!confirm("정지를 해제하겠습니까?")){
                return;
            }
            var nparmap = {uId : self.uId};
            $.ajax({
                url : "/user2/userBanDel.dox",
                dataType : "json", 
                type : "POST", 
                data : nparmap,
                success : function(data) { 
                    alert("해제되었습니다.");
                    self.fnGetList();
                }
            }); 
        }
	}, // methods
	created : function() {
		var self = this;
		self.fnGetList();
	}// created
});
</script>