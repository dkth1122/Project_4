<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="../js/jquery.js"></script>
<script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.js"></script>
<title>Insert title here</title>
</head>
<body>
	<div id="app">
	<h1>아티스트 게시판 메인 페이지지롱~</h1>
	   <button @click="fnMove('my')">마이페이지</button>
	<div>멤버십 테이블 조인해서 그 아티스트만 버튼 보이도록~!</div>
		<button @click="fnMove('b')">방탄소년단</button>
		<button @click="fnMove('t')">투모로우바이투게더</button>
		<button @click="fnMove('e')">엔하이픈</button>
		<button @click="fnMove('s')">세븐틴</button>
		<button @click="fnMove('f')">프로미스나인</button>
		<button @click="fnMove('l')">르세라핌</button>
		<button @click="fnMove('n')">뉴진스</button>
		<button @click="fnMove('d')">보이넥스트도어</button>
		<button @click="fnMove('z')">지코</button>
	</div>
</body>
</html>
<script>
	    var app = new Vue({
	        el: '#app',
	        data: {
	            list: [],
	        },// data
	        methods: {
	            fnGetList: function() {
	                var self = this;
	                var nparmap = {};
	                $.ajax({
	                    url: "list.dox",
	                    dataType: "json",
	                    type: "POST",
	                    data: nparmap,
	                    success: function (data) {
	                        self.list = data.list;
	                        console.log(data);
	                    }
	                });
	            }, fnMove : function(artist){
	            	
	            	if(artist == 'b'){
	            		location.href = 'bts.do'; 
	            	}
	            	else if(artist == 't'){
	            		location.href = 'txt.do'; 
	            	}
	            	else if(artist == 'e'){
	            		location.href = 'ehp.do'; 
	            	}
	            	else if(artist == 's'){
	            		location.href = 'svt.do'; 
	            	}
	            	else if(artist == 'f'){
	            		location.href = 'fmn.do'; 
	            	}
	            	else if(artist == 'l'){
	            		location.href = 'lsf.do'; 
	            	}
	            	else if(artist == 'n'){
	            		location.href = 'njs.do'; 
	            	}
	            	else if(artist == 'd'){
	            		location.href = 'bnd.do'; 
	            	}
	            	else if(artist == 'z'){
	            		location.href = 'zic.do'; 
	            	}
	            	else if(artist == 'my'){
	            		location.href = "myPage.do";
	            	}
	            }
	        }, // methods
	        created: function () {
	            var self = this;
	            self.fnGetList();
	        }// created
	    });
	</script>
