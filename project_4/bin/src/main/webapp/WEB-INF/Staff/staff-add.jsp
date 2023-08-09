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
</style>
</head>
<body>
<div id="app">

	<div><input placeholder="이름" v-model="sName"></div>
	<div><input placeholder="사번" v-model="sNo"></div>
	<div><input placeholder="직통번호" v-model="sPhone"></div>
	<div><select v-model="selectItem">
		<option value="고객관리팀">고객관리팀</option>
		<option value="민원관리팀">민원관리팀</option>
		<option value="배송관리팀">배송관리팀</option>
		<option value="상품관리팀">상품관리팀</option>
		<option value="이사">이사</option>
	</select>
	   <input :disabled="valueDisabled" v-model="value">
	</div>
	<div><input placeholder="상사" v-model="sBoss"></div>
	
	<button @click="fnAdd()">등록</button>
	

</div>
</body>
</html>
<script>
var app = new Vue({
	el : '#app',
	data : {
		sName : "",
		sNo : "",
		sPhone : "",
		sBoss : "",
		selectItem : "",
		value : ""
	},
	  computed: {
		    valueDisabled: function () {
		      return true;
		    },
		  },
		  watch: {
		    selectItem: function () {
		      switch (this.selectItem) {
		        case "고객관리팀":
		          this.value = "A";
		          break;
		        case "민원관리팀":
		          this.value = "C";
		          break;
		        case "배송관리팀":
		          this.value = "B";
		          break;
		        case "상품관리팀":
		          this.value = "D";
		          break;
		        case "이사":
		          this.value = "M";
		          break;
		        default:
		          this.value = "";
		          break;
		      }
		    },
		  },
	methods : {
		fnAdd : function(){
            var self = this;
            var nparmap = {sName : self.sName, sNo : self.sNo, sPhone : self.sPhone, sBoss : self.sBoss, sPart : self.selectItem, sPosition : self.value};
            $.ajax({
                url : "/staff/add.dox",
                dataType:"json",	
                type : "POST", 
                data : nparmap,
                success : function(data) {
                	alert(self.sName + "님이 등록되었습니다.");
                	location.href="main.do";
                }
            }); 
        }
	}, // methods
	created : function() {
		var self = this;
	}// created
});
</script>