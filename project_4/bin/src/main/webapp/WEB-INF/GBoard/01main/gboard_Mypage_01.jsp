<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<script src="../js/jquery.js"></script>
<script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.js"></script>
<title>myPage</title>
</head>
<body>
	<div id="app">
	<h1>마이페이지지롱~</h1>
	<div>내 프로필 정보 헤더</div>
	
	<div>메뉴
	<button>내가 쓴 피드</button>
	<button>내가 쓴 댓글</button>
	<button>좋아요한 피드/댓글</button>
	</div>
	<div>결과창 
	
	
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
	                    url: "",
	                    dataType: "json",
	                    type: "POST",
	                    data: nparmap,
	                    success: function (data) {
	                        self.list = data.list;
	                        console.log(data);
	                    }
	                });
	            }, fnMove : function(){
	            	
	            }
	        }, // methods
	        created: function () {
	            var self = this;
	        }// created
	    });
	</script>
