<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">

 <style type="text/css">
	.nickname{
  line-height:  127px;
  margin-left: 70px;
 } 
 .name{
   margin-left: 45px;
  font-size: 4em;
  font-weight: bold;
 }
  body{
     margin : 0px;
     padding : 0px;}
  #app {
  
    display: flex;
    justify-content: center;
    align-items: center;
    
  }
  #container {
    width: 1200px;
  #top {
 
  	position : absolute;
  	top: 30%;
right: 50%;
transform: translate(50%, -50%);
  	 background:rgb(225, 225, 236);
    width: 1200px;
    height: 400px;
    
  }}
  #body {
  margin-top : 40px;
    width: 1200px;
 
    justify-content: center;
    font-size: 1em;
    font-weight : bold;
    float:left;
  }
  #left {
    
    width: 250px;
    height: 800px;
  }
  #right {
   margin-left : 90px;
    width: 950px;
    height: 800px;
  }
  #profileImg{
     border-radius: 50%;
     background-color: purple;
     width: 200px;
     height: 200px;
     margin-left: 55px;
     margin-top : -15px;
  }
  .left{
  float: left;
  }
  .topImgBoxwid{
      width: 300px;
     height: 240px;
  }
  .topBoxwid{
      width: 200px;
     height: 250px;
  }
  .userName{
     height: 245px;
     
  }
  .a{
     height: 245px;
  }
  .topBox{
  width : 889px;
   height: 120px;
    float: left;
     display: flex;
  }
  .details{  
     margin: 0px 30px;
     width: 200px;
     text-align: center;
     font-size: 1.3em;
  }
 h1{
 margin-left: 30px;
 } 
  .categories{
    padding-bottom : 25px;
      widows : 200px;
     border-bottom:3px solid black;
     border-bottom-color: #a1a1a1da;
     margin-bottom: 40px;
  }
  .lowerBox{
    padding-bottom : 25px;
      width : 800px;        
     border-bottom:3px solid black;
     border-bottom-color: #a1a1a1da;
  }
 li {
 
  list-style-type: none;
  line-height: 55px;
}
a {
  text-decoration: none;
  color: black; 
}
.nodata{
 color: #888888;
 line-height: 200px;
 text-align: center;
}
.View{
height: 300px;
 margin-bottom: 150px;
}
  
  </style>
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
                         
                            <div>Order</div>
                            <div>2</div>
                            
                         </div>
                         
                         <div class="details" >
                         
                            <div>Refund</div>
                            <div>
                               <span>0/</span><span>0/</span><span>0</span>
                            </div>
                            
                         </div>
                         <div class="details" >
                            <div>포인트</div>
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
                                 <li>나의 쇼핑 정보 </li>
                                 <li>
                                    <ul>
                                       <li><a href="#">주문내역</a></li>
                                      
                                       <li><a href="#">관심상품</a></li>
                                    
                                       <li><a href="#">최근 본 상품</a></li>
                                       <hr>
                                       <li><a href="#">적립금</a></li>      
                                       <hr>                           
                                    </ul>   
                                 </li>  
                              </ul>
                              <ul style="padding: 0px;">
                                 <li>회원 정보</li>
                                 <li>
                                    <ul>
                                       <li><a href="#">회원 정보 수정</a></li>
                                       <li><a href="#">배송주소록</a></li>                           
                                    </ul>   
                                 </li>  
                              </ul>
                                    <ul style="padding: 0px;">
                                 <li>고객센터</li>
                                 <li>
                                    <ul>
                                       <li><a href="#">1:1 문의</a></li>
                                       <li><a href="#">공지사항</a></li>
                                       <li><a href="#">이용안내</a></li>
                                       <li><a href="faq.do">FAQ</a></li>                                 
                                    </ul>   
                                 </li>  
                              </ul>
                              
                                                               
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
    	info : [],
    	uId : "dcsdsd3",
    },
    methods: {
    	fnAdd : function(){
            var self = this;
            var nparmap = {uId : self.uId};
            $.ajax({
                url : "/mypag/Info.dox",
                dataType:"json",	
                type : "POST", 
                data : nparmap,
                success : function(data) { 
                	location.href = "list.do";
                }
            }); 
        }
    },
    created: function() {
      var self = this;
    }
});
</script>
