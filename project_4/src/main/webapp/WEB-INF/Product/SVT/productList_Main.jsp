<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
  <link href="../css/ProductPag.css" rel="stylesheet" type="text/css">
  <link href="../css/header.css" rel="stylesheet" type="text/css">
  <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
  <script src="../js/jquery.js"></script>  
 <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css" integrity="sha512-z3gLpd7yknf1YoNbCzqRKc4qyor8gaKU1qmn+CShxbuBusANI9QpRohGBreCFkKxLhei6S9CQXFEbbKuqLg0DA==" crossorigin="anonymous" referrerpolicy="no-referrer" />
  <script src="https://cdn.jsdelivr.net/npm/vue@2.6.14/dist/vue.js"></script>
  <!-- ����¡ �߰� 1 -->
  <script src="https://unpkg.com/vuejs-paginate@latest"></script>
  <script src="https://unpkg.com/vuejs-paginate@0.9.0"></script>
  <meta charset="EUC-KR">
  <title>��ǰ ������</title>
<style type="text/css">
	  .nonMember{
	  margin: 0px 10px;
	  }
	  #app{
	  	width: 1500px;
	  }
	  #container{
	  	width: 1500px;
	  
	  }
	  .login_loginout{  
	  	color : #8a8a8a;
	  	text-align: right;
	  }
	  #login{
	  margin-top :15px;
	
	  }
	  #header.fixed{
	  position: fixed; 
	  left: 50%;
	  width: 100%;
	  z-index: 1;
	  transform: translateX(-50%);
	  transition: top 1s ease;
	  background-color: rgba(255, 255, 255);
	  }

	#header{
		margin-bottom: 20px;
		width: 100%;
	}
	<!-- ����¡ �߰� 2 -->
	.pagination {
        margin:24px;
        display: inline-flex;
    }
    ul {
    }
	.pagination li {
	    min-width:32px;
	    padding:2px 6px;
	    text-align:center;
	    margin:0 3px;
	    border-radius: 6px;
	    border:1px solid #eee;
	    color:#666;
	    display : inline;
	}
	.pagination li:hover {
	    background: #E4DBD6;
	}
	.page-item a {
	    color:#666;
	    text-decoration: none;
	}
	.pagination li.active {
	    background-color : #E7AA8D;
	    color:#fff;
	}
	.pagination li.active a {
	    color:#fff;
	}
	.pImg{
		width:300px;
		height:400px;
	}
	.slide_wrapper_main{
		float: left;
		margin-left: 200px;
	}
	.body2{
		margin-top : 150px;
		clear: left;
		float: clear;
		width: 180px;
	}
	.productPosList{
		width: 1200px;
		float: left;
		position: relative;
		top : -400px;
		left: 350px;
		
	}
	.productList{
		width:300px;
		height : 500px;
		margin-bottom:50px;
		margin-left : 20px;
		float: left;
	}
	.pageingPos{
		clear: left;
		float: clear;
		position: relative;
		left: 640px;
		top : -350px;
	}
	.select{
		position : relative;
		top: 130px;
		left: 140px;
	}
  </style>
</head>
<body>

<div id="app">

   <div id="wrap">
        <div id="container">
        <div id="login">
        <div class="login_loginout"><span class="nonMember">�α���</span>  |  <span class="nonMember">ȸ������</span></div>
        <div class="login_loginout" v-if="false"> �α׾ƿ�</div>
        </div>
            <div id="header" >
            
            </div>

            <div class="slide_wrapper_main">
                <div class="slide_wrapper">
                    <ul class="slides">
                      <li ><img src="https://cdn.topstarnews.net/news/photo/first/201604/img_192402_1.jpg"></li>
                      <li ><img src="https://img1.daumcdn.net/thumb/R1280x0/?scode=mtistory2&fname=https%3A%2F%2Fblog.kakaocdn.net%2Fdn%2FyPLo3%2Fbtrz6qShOq3%2FIa3mcJQ7WPrIApAN3ZlH70%2Fimg.jpg"></li>
                      <li ><img src="https://cdn.eyesmag.com/content/uploads/sliderImages/2022/07/22/NEW-JEANS-01-94cfa2f0-0e0e-493a-a811-07d3db1fa6d5.jpg"></li>
                      <li ><img src="https://blog.kakaocdn.net/dn/SbnII/btqEMwrZGyP/qsc0F50OjuXal84GGGP1ek/img.png"></li>
                     </ul> 
                </div>
                
              <p class="controls">
                <a class="next_prev" href="Javascript:;"><i class="fa-solid fa-chevron-left fa-2xl prev"></i></a>
                  <button class="button1 button"></button>
                  <button class="button2 button"></button>
                  <button class="button3 button"></button>
                  <button class="button4 button"></button>
                <a class="next_prev" href="Javascript:;"><i class="fa-solid fa-chevron-right fa-2xl next"></i></a>
              </p>
            </div>
            
            
            <div class="body" style="margin-top: 80px;">
                <select class="select" v-model="selectedOption" @change="fnGetList">
                    <option selected>��ü</option>
                    <option value="nameList">��ǰ��</option>
                    <option value="minPrice">��������</option>
                    <option value="maxPrice">��������</option>
                </select>
                
                
                <div class="body2">

                    <div id="CategoryTitle" class="CategoryTitle"> <a href="Javascript:;" @click="fnReload">PRODUCT</a></div>
                      <div class="menu">
                            <a class="aTitle" href="Javascript:;" @click="fnGetList('A')">ALBUM</a>
                            <ul class="sub">
                            </ul>
                     </div>

                     <div class="menu2">
                        <a class="aTitle" href="Javascript:;" @click="fnGetList('M')">MERCH</a>
                        <ul class="sub2">
                        </ul>
                	 </div>

                 	<div class="menu3">
	                    <a class="aTitle" href="Javascript:;" @click="fnGetList('D')">DVD</a>
	                    <ul class="sub3">
                    	</ul>
             		</div>

			         <div class="menu4">
			            <a class="aTitle" href="Javascript:;" @click="fnGetList('P')">PHOTOBOOK</a>
			            <ul class="sub4">
			            </ul>
			   		  </div>
			
				     <div class="menu5">
				        <a class="aTitle" href="Javascript:;" @click="fnGetList('Mem')">MEMBERSHIP</a>
				        <ul class="sub5">
				        </ul>
				 	</div>
                </div>
					<div class="productPosList">
								<span @click="productView(item)" v-for="item in list" class="productList">
									<span><img :src = "item.path" class="pImg"></span>
									<div class="artistDIv">{{item.artist}}</div>
									<div>{{item.pName}}</div>
									<h5>\{{ formatPrice(item.price) }}</h5>
								</span>
					</div>
                <!-- ����¡ �߰� 3 -->
            </div>        
        </div>
    </div>
    
    		<div class="pageingPos">
				<template>
				  <paginate
				    :page-count="pageCount"
				    :page-range="3"
				    :margin-pages="2"
				    :click-handler="fnSearch"
				    :prev-text="'<'"
				    :next-text="'>'"
				    :container-class="'pagination'"
				    :page-class="'page-item'">
				  </paginate>
				</template>
			</div>
</div>
</body>
</html>
<script>
<!-- ����¡ �߰� 4 -->
Vue.component('paginate', VuejsPaginate)
var app = new Vue({
    el: '#app',
    data: {
    	  list: [],
          keyword: "",
          uId: "${sessionId}",
          artist: "SVT",
  		<!-- ����¡ �߰� 5 -->
		  selectPage: 1,
		  pageCount: 1,
		  cnt : 0,
		  selectedOption : "��ü",
		  ctg : ""
    },
    methods: {
    	fnGetList: function (ctg) {
            var self = this;
			<!-- ����¡ �߰� 6 -->
			var startNum = ((self.selectPage-1) * 12);
    		var lastNum = 12;
    		
    		if(ctg == 'A'){
    			self.ctg = "ALB";
    		}else if(ctg == 'M'){
    			self.ctg = "MER";
    		}else if(ctg == 'D'){
    			self.ctg = "DVD";
    		}else if(ctg == 'P'){
    			self.ctg = "PTB";
    		}else if(ctg == 'Mem'){
    			self.ctg = "MEM";
    		}
            var nparmap = {artist: self.artist, startNum : startNum, lastNum : lastNum, selectedOption : self.selectedOption, ctg : self.ctg};
            $.ajax({
                url: "producListMain.dox",
                dataType: "json",
                type: "POST",
                data: nparmap,
                success: function (data) {
                    self.list = data.list;
                	self.cnt = data.cnt;
	                self.pageCount = Math.ceil(self.cnt / 12);
                    console.log("data ==>", data);
                    console.log("list ==>", self.list);
                }
            });
        },	<!-- ����¡ �߰� 7-->
		fnSearch : function(pageNum){
			var self = this;
			self.selectPage = pageNum;
			var startNum = ((pageNum-1) * 12);
			var lastNum = 12;
			var nparmap = {artist: self.artist, startNum : startNum, lastNum : lastNum};
			$.ajax({
				url : "producListMain.dox",
				dataType : "json",
				type : "POST",
				data : nparmap,
				success : function(data) {
					self.list = data.list;
					self.cnt = data.cnt;
					self.pageCount = Math.ceil(self.cnt / 12);
				}
			});
		},
		fnReload : function(){
			location.reload();
		},
        productView : function(item){
        	var self = this;
        	$.pageChange("productView.do", {pNo : item.pNo});        	
        },
		formatPrice: function(price) {
            return price.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',');
        }
    },
    created: function() {
      var self = this;
      self.fnGetList();
      // Vue.js �ڵ� �ۼ� ����
    }
  });
var lnb = $("#header").offset().top;
$(window).scroll(function() {
    var window = $(this).scrollTop();

    if(lnb <= window) {
        $("#header").addClass("fixed");
        $("#header").css("top", "0"); // ��ũ�� ���� �� �ִϸ��̼� ȿ��
    } else {
        $("#header").removeClass("fixed");
        $("#header").css("top", "-100px"); // ��ũ�� �ø� �� �ִϸ��̼� ȿ��
    }
});

var lnb = $("#header").offset().top;
$(window).scroll(function() {
  	var window = $(this).scrollTop();

    if(lnb <= window) {
      $("#header").addClass("fixed");
    } else {
      $("#header").removeClass("fixed");
    }
})

var slides = document.querySelector('.slides'), 
    slide = document.querySelectorAll('.slides li'),  //��� �����̵� ���� 
    currentIdx = 0, //�����̵� �̵�
    slideCount = slide.length, //�����̵� �ټ�
    slideWidth = 1200, // �����̵� �ʺ�
    slideMargin = 0, // ����
    prevBtn = document.querySelector('.prev'), // �¿� ��ư
    nextBtn = document.querySelector('.next'); // �¿� ��ư
    

makeClone();

function makeClone(){
  for(var i = 0; i<slideCount; i++){
    // a.cloneNode() a��� ����  
    // a.cloneNode(true) a�� �ڽĿ�� ���� 
    var cloneSlide = slide[i].cloneNode(true);
    cloneSlide.classList.add('clone');
    //a.appendChild(b) a���ٰ� b�� �߰� 
    slides.appendChild(cloneSlide); // ul ���纻 �ڿ��� �߰�
  }

  for(var i = slideCount -1; i>=0; i--){
    //a.prepend(b) �տ� �߰�
    var cloneSlide = slide[i].cloneNode(true);
    cloneSlide.classList.add('clone');
    //a.prepend(b) a�տ��� �߰� 
    slides.prepend(cloneSlide); // ul ���纻 �ڿ��� �߰�      
  }

  updateWidth();
  setInitialpos();

  setTimeout(function(){
    slides.classList.add('animated');
  },100);  

}
function updateWidth(){
  var currentSlides = document.querySelectorAll('.slides li');
  var newSlideCount = currentSlides.length;

  var newWidth = (slideWidth + slideMargin) * newSlideCount - slideMargin + 'px';
  slides.style.width = newWidth;
}
function setInitialpos(){
  var initialTranslateValue = -(slideWidth + slideMargin) * slideCount; // SlideCount�� slideCount�� ����
  //slides {transform:translateX(-1000px);}
  slides.style.transform = 'translateX('+ initialTranslateValue +'px)';
}
nextBtn.addEventListener('click', function(){
  moveSlide(currentIdx + 1);

})

prevBtn.addEventListener('click', function(){
  moveSlide(currentIdx - 1);
})
function moveSlide(num){ // unm�� num���� ����
slides.style.left= -num * (slideWidth + slideMargin) +'px'; // sleft�� left�� ����
currentIdx = num;
console.log(currentIdx, slideCount);

if(currentIdx == slideCount || currentIdx == -slideCount){
  setTimeout(function(){
      slides.classList.remove('animated');
      slides.style.left = '0px'; // lift�� left�� ����
      currentIdx = 0;
  },500);
  
  setTimeout(function(){
      slides.classList.add('animated');
  },600);
}  
}
//clearInterval(timer);
var timer = undefined;

function autoSlide(){
if(timer == undefined){
  timer = setInterval(function(){
    moveSlide(currentIdx + 1 );
  },3000);
}
}
autoSlide();

function stopSlide(){
clearInterval(timer);   
timer = undefined;
console.log(timer);
}

slides.addEventListener('mouseenter', function(){
stopSlide();
});

slides.addEventListener('mouseleave', function(){
autoSlide();
});

const buttons = document.querySelectorAll('.controls button');

for (let i = 0; i < buttons.length; i++) {
  buttons[i].addEventListener('click', function() {
      moveSlide(i);
      updateButtonColor(i);
  });
}
//��ư ������ ������Ʈ�ϴ� �Լ��Դϴ�.
function updateButtonColor(selectedIndex) {
  // ��� ��ư ��Ҹ� �����մϴ�.
  const allButtons = document.querySelectorAll('.controls button');
  
  // ��� ��ư�� ��ȸ�ϸ鼭 ���õ� ��ư�� �ش��ϴ� ������ �����ϰ�, ������ ��ư�� ���� �������� �����մϴ�.
  for (let i = 0; i < allButtons.length; i++) {
      if (i === selectedIndex) {
          // ���õ� ��ư�� ������ �����մϴ�.
          allButtons[i].style.backgroundColor = '#3838388f';
      } else {
          // ���õ��� ���� ��ư�� ������ ���� �������� �����մϴ�.
          allButtons[i].style.backgroundColor = '#acacac8f';
      }
  }
}

function moveSlide(num) {
      slides.style.left = -num * (slideWidth + slideMargin) + 'px';
      currentIdx = num;

      if (currentIdx === slideCount || currentIdx === -slideCount) {
          setTimeout(function () {
              slides.classList.remove('animated');
              slides.style.left = '0px';
              currentIdx = 0;
          }, 500);

          setTimeout(function () {
              slides.classList.add('animated');
              updateButtonColor(currentIdx); // �߰�
          }, 600);
      } else {
          updateButtonColor(currentIdx); // �߰�
      }
  }


</script>
