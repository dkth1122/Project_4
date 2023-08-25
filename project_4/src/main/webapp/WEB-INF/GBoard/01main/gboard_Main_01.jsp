<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="../js/jquery.js"></script>
<script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.js"></script>
<title>Membership Main</title>
<%@ include file="../../Product/sexyheader.jsp" %>
 <%-- <%@ include file="/footer.jsp" %> --%>
<style>
	ul, li{
		text-decoration: none;
		list-style: none;
	}
	.container{
		padding-top:130px;
	}
	.imgBox {
    width: 100%; /* 박스가 전체 너비를 차지하도록 설정 */
    max-height: 400px; /* 높이를 최대 200px로 제한 */
    overflow: hidden; /* 최대 높이 이상의 부분은 가려줌 */
    background-color : black;
    text-align:center;
}

.imgBox img {
	margin : 0px auto;
      width: 531px;
    aspect-ratio: auto 531 / 299;
    height: 299px;
    text-align:center;
}
.artistArea{
	padding : 80px;
}
.artistArea2{
	margin : 0px 300px;
}
</style>
</head>
<body>
	<div id="app">
		<div class="container">
			<div class="imgBox">
				<img src="https://cdn-v2pstatic.weverse.io/wev_web_fe/assets/web/home_banner_slogan.gif"/>
			</div>
			<div class="artistArea">
				<div class="artistArea2">
					<h2>관심있는 아티스트를 만나보세요!</h2>
				</div>				
			</div>
			
			   <button @click="fnMove('my')">마이페이지</button>
				<ul>
		            <li v-for="item in list">
		                <button @click="fnMove(item.artist)" >방탄소년단</button>
		                <button @click="fnMove(item.artist)" >투모로우바이투게더</button>
		                <button @click="fnMove(item.artist)" >엔하이픈</button>
		                <button @click="fnMove(item.artist)" >세븐틴</button>
		                <button @click="fnMove(item.artist)" >프로미스나인</button>
		                <button @click="fnMove(item.artist)" >르세라핌</button>
		                <button @click="fnMove(item.artist)" >뉴진스</button>
		                <button @click="fnMove(item.artist)" >보이넥스트도어</button>
		                <button @click="fnMove(item.artist)">지코</button>
		            </li>
		        </ul>
		     </div>
	</div>
</body>
</html>
<script>
	    var app = new Vue({
	        el: '#app',
	        data: {
	            list: [],
	            uId : "${sessionId}"
	        },// data
	        methods: {
	            fnGetList: function() {
	                var self = this;
	                var nparmap = {uId : self.uId};
	                $.ajax({
	                    url: "/gboard/membershipCheck.dox",
	                    dataType: "json",
	                    type: "POST",
	                    data: nparmap,
	                    success: function (data) {
	                        self.list = data.list;
	                        console.log(self.list);
	                    }
	                });
	            }, fnMove : function(artist){
	                if (artist === 'my') {
	                    location.href = "myPage.do";
	                } else {
	                    location.href = artist.toLowerCase() + '.do'; // 예: bts.do, txt.do 등
	                }
	            }
	        }, // methods
	        created: function () {
	            var self = this;
	            self.fnGetList();
	        }// created
	    });
	</script>
