<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="../js/jquery.js"></script>
<script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.js"></script>
<title>Membership Main</title>
<style>
	ul, li{
		text-decoration: none;
		list-style: none;
	}
</style>
</head>
<body>
	<div id="app">
	<h1>아티스트 게시판 메인 페이지지롱~</h1>
	   <button @click="fnMove('my')">마이페이지</button>
		<ul>
            <li v-for="item in list">
                <button @click="fnMove(item.artist)" v-if="item.artist == 'BTS'">방탄소년단</button>
                <button @click="fnMove(item.artist)" v-if="item.artist == 'TXT'">투모로우바이투게더</button>
                <button @click="fnMove(item.artist)" v-if="item.artist == 'EHP'">엔하이픈</button>
                <button @click="fnMove(item.artist)" v-if="item.artist == 'SVT'">세븐틴</button>
                <button @click="fnMove(item.artist)" v-if="item.artist == 'FMN'">프로미스나인</button>
                <button @click="fnMove(item.artist)" v-if="item.artist == 'LSF'">르세라핌</button>
                <button @click="fnMove(item.artist)" v-if="item.artist == 'NJS'">뉴진스</button>
                <button @click="fnMove(item.artist)" v-if="item.artist == 'BND'">보이넥스트도어</button>
                <button @click="fnMove(item.artist)" v-if="item.artist == 'ZIC'">지코</button>
            </li>
        </ul>
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
