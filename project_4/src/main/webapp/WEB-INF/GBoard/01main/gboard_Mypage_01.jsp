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
	<h1>��������������~</h1>
	<div>�� ������ ���� ���</div>
	
	<div>�޴�
	<button>���� �� �ǵ�</button>
	<button>���� �� ���</button>
	<button>���ƿ��� �ǵ�/���</button>
	</div>
	<div>���â 
	
	
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
