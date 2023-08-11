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

	<div><input type="text" placeholder="상품 코드" v-model="info.pNo"></div>
	<div><input type="text" placeholder="상품 이름" v-model="info.pName"></div>
	<div><input type="number" placeholder="가격" v-model="info.price"><input type="number" placeholder="적립금" v-model="info.point" disabled></div>
	<div><input type="number" placeholder="재고" v-model="info.stock"></div>
	<div>
		<select v-model="info.membership">
			<option value="N">전체구매가능</option>
			<option value="Y">멤버십전용</option>
		</select>
	</div>
	<div> 카테고리 : 
		<select v-model="info.category">
			<option value="ALB">앨범</option>
			<option value="MER">머치</option>
			<option value="DVD">DVD</option>
			<option value="PTB">포토북</option>
			<option value="MEM">멤버십</option>
		</select>
	</div>
	<div> 최대구매 갯수 : 
		<select v-model="info.pLimit">
			<option value="10">10개</option>
			<option value="9">9개</option>
			<option value="8">8개</option>
			<option value="7">7개</option>
			<option value="6">6개</option>
			<option value="5">5개</option>
			<option value="4">4개</option>
			<option value="3">3개</option>
			<option value="2">2개</option>
			<option value="1">1개</option>
		</select>
	</div>
	<div>
		아티스트 : 
	<select v-model="info.artist">
		<option value="BTS">방탄소년단</option>
		<option value="TXT">투모로우바이투게더</option>
		<option value="EHP">엔하이픈</option>
		<option value="SVT">세븐틴</option>
		<option value="FMN">프로미스나인</option>
		<option value="LSF">르세라핌</option>
		<option value="NJS">뉴진스</option>
		<option value="BND">보이넥스트도어</option>
		<option value="ZIC">지코</option>
	</select>
	</div>
	<div><input type="text" placeholder="특전코드" v-model="info.fYn"></div>
	
	<div><button @click="fnProductAdd">상품 추가</button></div>


	
</div>
</body>
</html>
<script>
var app = new Vue({
	el : '#app',
	data : {
		info : {
			pNo : "",
			pName : "",
			price : "",
			point : "",
			stock : "",
			membership : "",
			category : "",
			pLimit : "",
			artist : "",
			fYn : ""
		}
	},// data
	methods : {
		fnProductAdd: function() {
			  var self = this;
			  var nparmap = self.info;
			  // 가격의 2%를 계산해서 pNo에 담기
			  nparmap.point = parseFloat(nparmap.price) * 0.02; // parseFloat() 함수를 사용하여 문자열로 입력된 가격을 실수형으로 변환합니다.
			  nparmap.pNo = (nparmap.artist + nparmap.pNo + nparmap.category);
			  $.ajax({
			    url : "/product/add.dox",
			    dataType : "json",
			    type : "POST",
			    data : nparmap,
			    success : function(data) {
			      alert("상품이 등록되었습니다.");
			      location.href = "main.do";
			    }
			  });
			}    	
	}, // methods
	created : function() {
		var self = this;
	}// created
});
</script>