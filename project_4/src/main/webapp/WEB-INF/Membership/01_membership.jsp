<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
 <script src="../js/jquery.js"></script>
<script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css" integrity="sha512-z3gLpd7yknf1YoNbCzqRKc4qyor8gaKU1qmn+CShxbuBusANI9QpRohGBreCFkKxLhei6S9CQXFEbbKuqLg0DA==" crossorigin="anonymous" referrerpolicy="no-referrer" />
<title>멤버십 확인 페이지</title>
<style>
	body{
		font-family: a타이틀고딕2;
		width : 1250px;
		margin : 10px auto;
	}
</style>
</head>
<body>
<div id="app">
    <button @click="fnMove">뒤로가기</button>
	   <div>
		    <h1>멤버쉽 확인</h1>
		    <form @submit.prevent="registerMembership">
			      <label for="userId">사용자 ID:</label>
			      <input value="uId" type="text" id="uId" name="uId" disabled="disabled"><br>
			      
		    </form>
	  </div>
</div>
</body>
</html>
<script>
var app = new Vue({
    el: '#app',
    data: {
        list: [],
        uId: "${sessionId}",
        purchaseDate: "",
    },// data
    methods: {
        fnGetList: function () {
            var self = this;
            var nparmap = { artist: self.artist };
            $.ajax({
                url: "list.dox",
                dataType: "json",
                type: "POST",
                data: nparmap,
                success: function (data) {
                    self.list = data.list;
                    self.list2 = data.list2;
                }
            });
        }, fnMove : function(){
        	location.href = "main.do"
        	
        },  registerMembership : function() {
        	var self = this;
            const expirationDate = new Date(self.purchaseDate);
            expirationDate.setFullYear(expirationDate.getFullYear() + 1);
            expirationDate.setHours(23, 59, 59, 0);
            
            const membershipData = {
              uId: self.uId,
              purchaseDate: self.purchaseDate,
              expirationDate: expirationDate.toISOString(),
            };
            
            try {
              const response = await fetch("/api/registerMembership", {
                method: "POST",
                headers: {
                  "Content-Type": "application/json",
                },
                body: JSON.stringify(membershipData),
              });
              
              if (response.ok) {
                alert("멤버쉽이 등록되었습니다.");
              } else {
                alert("멤버쉽 등록에 실패하였습니다.");
              }
            } catch (error) {
              console.error("Error:", error);
              alert("오류가 발생하였습니다.");
            }
          },
        }
    }, // methods
    created: function () {
        var self = this;
    }// created
});
</script>