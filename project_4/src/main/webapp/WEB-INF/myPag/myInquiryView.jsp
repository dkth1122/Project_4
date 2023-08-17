<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
 
  <script src="../js/jquery.js"></script>  
  <link href="../css/mypag.css" rel="stylesheet" type="text/css">
 <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css" integrity="sha512-z3gLpd7yknf1YoNbCzqRKc4qyor8gaKU1qmn+CShxbuBusANI9QpRohGBreCFkKxLhei6S9CQXFEbbKuqLg0DA==" crossorigin="anonymous" referrerpolicy="no-referrer" />
  <script src="https://cdn.jsdelivr.net/npm/vue@2.6.14/dist/vue.js"></script>
	<meta charset="EUC-KR">
	<title>����������</title>
</head>
<body>

<div id="app">

			  <div id="container">
			  
					    <div id="top">
					    
					    	<div style="height: 150px;"></div>
					    	
					    <div class="a">
					    	<div class="left topImgBoxwid">
					    	 	 <a href="#"><div id="profileImg"></div></a>
					    	</div >
					    	<div class="topBox">
					    	<span class="name">{{info.uName}}</span> <span class="nickname">{{info.uName2}}</span>
					    	</div>
					    	
					    	<div class="topBox">
					    	
					    		<div class="details" >
					    		
					    			<div>�ֹ�����</div>
					    			<div>{{order}}</div>
					    			
					    		</div>
					    		
					    		<div class="details" >
					    		
					    			<div>��ȯ/ȯ��</div>
					    			<div>
					    				<span>{{refund}} /</span><span> {{exchange}}</span>
					    			</div>
					    			
					    		</div>
					    		<div class="details" >
					    			<div>����Ʈ</div>
					    			<div>{{info.uPoint}} P</div>
					    		</div>
					    		<div class="details" >
					    			<div>Jelly</div>
					    			<div>0</div>
					    		</div>
					    	</div>
					    </div>
					    	
					    	 
					    </div>					    
					    <div id="body">
					    
							      <div id="left">
							      	<div class="categories"> MY PAGE</div>
							      	<div style="text-align: left;">
							      	<ul style="padding: 0px;">
							      		<li>���� ���� ���� </li>
								      	<li>
								      		<ul>
								      			<li><a href="#">�ֹ�����</a></li>
								      			<li><a href="#">���ɻ�ǰ</a></li>
								      			<li><a href="#">�ֱ� �� ��ǰ</a></li>
								      			<li><a href="#">������</a></li>							      		
								      		</ul>	
								      	</li>  
							      	</ul>
							      	<ul style="padding: 0px;">
							      		<li>ȸ�� ����</li>
								      	<li>
								      		<ul>
								      			<li><a @click="infoUpdate">ȸ�� ���� ����</a></li>
								      			<li><a @click="infoAddr">����ּҷ�</a></li>					      		
								      		</ul>	
								      	</li>  
							      	</ul>
							      	   	<ul style="padding: 0px;">
							      		<li>������</li>
								      	<li>
								      		<ul>
								      			<li><a href="#">1:1 ����</a></li>
								      			<li><a href="#">��������</a></li>
								      			<li><a href="#" @click="useGuide">�̿�ȳ�</a></li>
								      			<li><a href="#">FAQ</a></li>							      		
								      		</ul>	
								      	</li>  
							      	</ul>
							      	
							      									      	
							      	</div>
							      	 </div>
							      
					<div id="right">
					
							      <div class="View">
							    	  <div class="lowerBox"> 1:1���� </div>
							    	  	<div v-for="item in info">
								    	  		<div><h4>{{item.iQtitle}}</h4></div>
								    	  		<div>�ۼ���<span>{{item.iQtime}}</span>�亯����<span>{{item.state}}</span></div>
								    	  		<hr>
								    	  		<div><pre v-html="item.iQcontent"></pre></div>							    	  	
								    	  	<div v-if="item.iAcontent == null && iNo == item.iNo">
								    	  		<hr>
								    	  			<div>�����ð����� �亯�帮�ڽ��ϴ�. ��ø� ��ٷ� �ּ���!</div>
								    	  		<hr>
								    	  	</div>
								    	  	<div v-else>
								    	  		<hr>
								    	  		<div>�亯��¥ {{item.iAtime}}</div>
								    	  		<hr>
								    	  		<div>{{item.iAcontent}}</div>
								    	  	</div>
								    	  	<div>
								    	  		<img :src="item.path">
								    	  	</div>					
							    	  <div>
							    	  	<div><button @click="fnList">���</button></div>
							    	  </div>
							     </div> 
							     
							     
							</div>
					    
					    </div>
			    	</div>
			  </div>
  
</div>
</body>
</html>
<script type="text/javascript">
var app = new Vue({
    el: '#app',
    data: {
    	info : {},
    	orderCntList : [],
    	uId : "${sessionId}",
    	order  : "",
    	exchange : "",
    	refund : "",
    	list : [],
    	iNo : "${map.iNo}"
    },
    methods: {
    	fnGetList : function(){
            var self = this;
            var nparmap = {uId : self.uId, iNo : self.iNo};
            self.info.uId = self.uId;
            $.ajax({
                url : "/mypag/userInquiry.dox",
                dataType:"json",	
                type : "POST", 
                data : nparmap,
                success : function(data) { 
                	self.info = data.list; //�����
                	console.log(self.info);
                }
            }); 
        },
	    infoAddr : function(){
	    	var self = this;
	    	$.pageChange("infoAddr.do", {uId : self.uId});
	    },
	    infoUpdate : function(){
	    	var self = this;
	    	$.pageChange("infoUpdate.do", {uId : self.uId});
	    },
	    addBoard : function(){
            var self = this;
                $.pageChange("myAddInquiry.do", {uId : self.uId});
        },
        fnList : function(){
        	var self = this;
        	$.pageChange("myInquiry.do", {uId : self.uId});
        },
	    /* �̿�ȳ� */
	    useGuide : function(){
	    	var self = this;
	    	$.pageChange("useGuide.do", {uId : self.uId});
	    }
    },
    created: function() {
      var self = this;
      self.fnGetList();
    }
});
</script>
