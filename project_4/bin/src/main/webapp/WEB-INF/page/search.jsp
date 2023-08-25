<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%@ include file="header.jsp" %>
<style>
	th, td {
		padding : 0px 10px;
	}
</style>
<body>
	<div id="app">
	
	</div>
</body>
</html>
<script type="text/javascript">
var app = new Vue({ 
    el: '#app',
    data : {
		list : [],
		heightFlg : true,
		p_name : "",
		search : "",
		selectItem : ""
    }   
    , methods: {
    	fnGetList : function(){
            var self = this;
            var nparmap = {keyword : self.search, dept : self.selectItem};
            $.ajax({
                url : "list.dox",
                dataType:"json",	
                type : "POST", 
                data : nparmap,
                success : function(data) { 
                	self.test = data.name;
                	self.result = data.result;
	                self.list = data.list;
	                console.log(self.list);
                }
            }); 
        }
    	, fnSelect : function(index){
    		var self = this;
    		self.list[index].p_name[] = "��������";
    	}
    }   /* methods �� */
    , created: function () {
    	var self = this;
    	self.fnGetList();
	}
});
</script>
��



