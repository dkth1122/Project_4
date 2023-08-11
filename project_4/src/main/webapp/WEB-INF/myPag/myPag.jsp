<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
  <script src="../js/jquery.js"></script>  
 <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css" integrity="sha512-z3gLpd7yknf1YoNbCzqRKc4qyor8gaKU1qmn+CShxbuBusANI9QpRohGBreCFkKxLhei6S9CQXFEbbKuqLg0DA==" crossorigin="anonymous" referrerpolicy="no-referrer" />
  <script src="https://cdn.jsdelivr.net/npm/vue@2.6.14/dist/vue.js"></script>
  <meta charset="EUC-KR">
  <title>마이 페이지</title>
  <style type="text/css">

  #container{
  	width: 1200px;
  }
  #top{
  	width: 1200px;
  	height: 500px;
  }
   #left{
     	width: 200px;
   float: left;
   }
   
   #right{
   width: 1000px;
   float: right;
   }
   
  </style>
</head>
<body>
	<div id="app">
	
		<div id="container">
		
				<div id="top">
	
					<div>사진</div>
					<div> 이름 : {{list.이름}}</div>
					<div> 주문내역 : {{list.주문내역}}</div>
					<div> 교환 반품 : {{list.교환/반품}}</div>
					<div> 포인트 : {{list.포인트}}</div>
					
	
				</div>
	<!-- ------------ -->
	
				<div id="left">
				
						마이페이지
				
				</div>
				
	<!-- ------------ -->
				<div id="right">
	
					<div>
						<div>최근 주문상품</div>
						
					</div>
	
					<div>
						<div>관심상품</div>
						
					</div>
	
					<div>
						<div>최근 본 상품</div>
						
					</div>
	
				</div>
		</div>
		
		
	</div>
</body>
</html>
<script type="text/javascript">
	var app = new Vue({
		el : '#app',
		data : {
			list : [],
			uId : "",
			cnt : "",

		},
		methods : {			
			

		},
		created : function() {
			var self = this;
			// Vue.js 코드 작성 가능
		}
	});
</script>
