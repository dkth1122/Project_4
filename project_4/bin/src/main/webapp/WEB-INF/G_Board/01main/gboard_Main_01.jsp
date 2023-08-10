<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<script src="../js/jquery.js"></script>
<script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.js"></script>
<title>Insert title here</title>
</head>
<body>
	<div id="app">
	<h1>��Ƽ��Ʈ �Խ��� ���� ����������~</h1>
	<div>����� ���̺� �����ؼ� �� ��Ƽ��Ʈ�� ��ư ���̵���~!</div>
		<button @click="fnMove('b')">��ź�ҳ��</button>
		<button @click="fnMove('t')">����ο�������Դ�</button>
		<button @click="fnMove('e')">��������</button>
		<button @click="fnMove('s')">����ƾ</button>
		<button @click="fnMove('p')">���ι̽�����</button>
		<button @click="fnMove('l')">��������</button>
		<button @click="fnMove('n')">������</button>
		<button @click="fnMove('d')">���̳ؽ�Ʈ����</button>
		<button @click="fnMove('j')">����</button>
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
	            		location.href = 'tbt.do'; 
	            	}
	            	else if(artist == 'e'){
	            		location.href = 'ehp.do'; 
	            	}
	            	else if(artist == 's'){
	            		location.href = 'svt.do'; 
	            	}
	            	else if(artist == 'p'){
	            		location.href = 'pm9.do'; 
	            	}
	            	else if(artist == 'l'){
	            		location.href = 'lsp.do'; 
	            	}
	            	else if(artist == 'n'){
	            		location.href = 'njs.do'; 
	            	}
	            	else if(artist == 'd'){
	            		location.href = 'bnd.do'; 
	            	}
	            	else if(artist == 'j'){
	            		location.href = 'jico.do'; 
	            	}
	            	
	            }
	        }, // methods
	        created: function () {
	            var self = this;
	            self.fnGetList();
	        }// created
	    });
	</script>
