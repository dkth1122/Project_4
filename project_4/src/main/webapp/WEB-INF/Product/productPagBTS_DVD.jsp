<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
  <link href="../css/ProductPag.css" rel="stylesheet" type="text/css">
  <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
  <script src="../js/jquery.js"></script>  
 <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css" integrity="sha512-z3gLpd7yknf1YoNbCzqRKc4qyor8gaKU1qmn+CShxbuBusANI9QpRohGBreCFkKxLhei6S9CQXFEbbKuqLg0DA==" crossorigin="anonymous" referrerpolicy="no-referrer" />
  <script src="https://cdn.jsdelivr.net/npm/vue@2.6.14/dist/vue.js"></script>
  <meta charset="EUC-KR">
  <title>BTS DVD PAGE</title>
<style type="text/css">
.productImg{

	height:  250px;
}
.box_img{
	max-width : 300px;
	max-height: 100%;
	}
.pname{
	
	margin-left: 20px;
}
#pname{
padding-top : 20px;
height : 90px;
line-height : 30px;
}
.price{
padding-right :30px;
	text-align: right;
}

</style>
</head>
<body>

<div id="app">
   <div id="wrap">
        <div id="container">
            <div id="header" >
             
                
            </div>

            <div class="slide_wrapper_main">
                <div class="slide_wrapper">
                    <ul class="slides">
                      <li ><img src="https://blog.kakaocdn.net/dn/BAiIZ/btrHwluAwlT/1Y7iw7Y3pvF2VWgWL8Vvu1/img.jpg"></li>
                      <li ><img src="https://i.ytimg.com/vi/AKHJMLeZ4N8/maxresdefault.jpg"></li>
                      <li ><img src="https://cdn.topstarnews.net/news/photo/202111/14647891_721352_4352.jpg"></li>
                      <li ><img src="https://i.pinimg.com/originals/3d/04/83/3d0483a943e61b82fb4740601bbebd8c.jpg"></li>
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
                <select class="select" v-model="selectedSort" @change="sortList">
                    <option value="">최신순</option>
                    <option>상품명</option>
                    <option value="lowToHigh">낮은가격</option>
  					<option value="highToLow">높은가격</option>
                </select>
                
                <div class="body2" style=" width: 198px; height: 600px;" >

                    <div id="CategoryTitle" class="CategoryTitle"> BTS </div>
                  
                  
                      <div class="menu">
                            <a class="aTitle" href="Javascript:;">MUSIC</a>
                            <ul class="sub">
                                <li><a href="Javascript:;">CD</a></li>
                                <li><a href="Javascript:;">DVD</a></li>
                                <li><a href="Javascript:;">etc.</a></li>
                            </ul>
                     </div>

                     <div class="menu2">
                        <a class="aTitle" href="Javascript:;">PHOTO</a>
                        <ul class="sub2">
                            <li><a href="Javascript:;">Printed</a></li>
                            <li><a href="Javascript:;">Photo Book</a></li>
                        </ul>
                 </div>

                 <div class="menu3">
                    <a class="aTitle" href="Javascript:;">CONCERT</a>
                    <ul class="sub3">
                        <li><a href="Javascript:;">Offcial Fanlight</a></li>
                        <li><a href="Javascript:;">Conert Gods</a></li>
                    </ul>
             </div>

             <div class="menu4">
                <a class="aTitle" href="Javascript:;">LIVING</a>
                <ul class="sub4">
                    <li><a href="Javascript:;">Home</a></li>
                    <li><a href="Javascript:;">Kitchen</a></li>
                    <li><a href="Javascript:;">F & B</a></li>
                    <li><a href="Javascript:;">Tech</a></li>
                    <li><a href="Javascript:;">Book</a></li>
                    <li><a href="Javascript:;">Pet</a></li>
                </ul>
         </div>
          

         <div class="menu5">
            <a class="aTitle" href="Javascript:;">BEAUTY</a>
            <ul class="sub5">
                <li><a href="Javascript:;">Skin Care</a></li>
                <li><a href="Javascript:;">Make UP</a></li>
                <li><a href="Javascript:;">Cleansing</a></li>
                <li><a href="Javascript:;">Body & Hair</a></li>
                <li><a href="Javascript:;">Pack & masks</a></li>
                <li><a href="Javascript:;">Perfume</a></li>
                <li><a href="Javascript:;">Tool</a></li>
                <li><a href="Javascript:;">Men's</a></li>
            </ul>
     </div>

     <div class="menu6">
        <a class="aTitle" href="Javascript:;">STATIONERY</a>
        <ul class="sub6">
            <li><a href="Javascript:;">Note</a></li>
            <li><a href="Javascript:;">Office</a></li>
            <li><a href="Javascript:;">Pen</a></li>
            <li><a href="Javascript:;">Deco</a></li>
            <li><a href="Javascript:;">Binder</a></li>
            <li><a href="Javascript:;">Toy</a></li>
        </ul>
 </div>

            <div class="menu7">
                <a class="aTitle" href="Javascript:;">FASHION</a>
                <ul class="sub7">
                    <li><a href="Javascript:;">Clothing</a></li>
                    <li><a href="Javascript:;">Acc</a></li>
                    <li><a href="Javascript:;">jewelry</a></li>
                </ul>
            </div>

            <div class="menu8">
            <a class="aTitle" href="Javascript:;">CUSTOMIZING</a>
            <ul class="sub8">
                <li><a href="Javascript:;">Phone Case</a></li>
                <li><a href="Javascript:;">Fashion</a></li>
                <li><a href="Javascript:;">Acc</a></li>
            </ul>
            </div>

                  
                    
                </div>

                <div class="body2 " style=" width: 1000px; height: 2000px;">

                   <div v-for="item in list">
                   	 	<div class="magin body2" style="width: 300px; height: 400px;  ">
                        	<div class="productImg">                        	 
                        	<img id="dynamic_img" class="box_img" > 
                        	</div>
                        	<div id="pname" class="pname">{{item.pName}}</div>
                        	<div class="price">\ {{item.price}}</div>
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
    	list : [],
    	category : "DVD",
    	artist : "BTS",
    	selectedSort: "", 
    	
    },
    methods: {
    	
    	fnGetList : function(){
            var self = this;
            var nparmap = {}
            console.log("Dfd");
            $.ajax({
                url : "/mypag/selectVProductList.dox",
                dataType:"json",	
                type : "POST", 
                data : nparmap,
                success : function(data) {    
                	self.list = data.list;                	
                	 
                	
                }
            }); 
           		 
           	 	
        }, // "상품명" 옵션 선택 시 알파벳 A부터 시작되는 순으로 정렬
        sortByName: function() {
            this.list.sort((a, b) => a.pName.localeCompare(b.pName));
        },
        sortLowToHigh: function() {
            this.list.sort((a, b) => a.price - b.price);
        },

        // 높은 가격 순으로 상품을 정렬하는 메서드
        sortHighToLow: function() {
            this.list.sort((a, b) => b.price - a.price);
        },

        // 선택된 정렬 옵션에 따라 정렬하는 메서드
        sortList: function() {
            if (this.selectedSort === "") {
                // "최신순" 옵션 선택 시, 초기 리스트 순서로 정렬
                this.fnGetList();
            } else if (this.selectedSort === "상품명") {
                this.sortByName();
            } else if (this.selectedSort === "lowToHigh") {
                this.sortLowToHigh();
            } else if (this.selectedSort === "highToLow") {
                this.sortHighToLow();
            }
        },
        
        
    },
    created: function() {
      var self = this;
     self.fnGetList();
      // Vue.js 코드 작성 가능
    }
  });


let subToggle=true;

$(".menu").click(()=>{
if(subToggle){
  $(".sub").slideDown(500);
}else{
  $(".sub").slideUp(1000);
}
subToggle=!subToggle;
});

$(".menu2").click(()=>{
if(subToggle){
  $(".sub2").slideDown(500);
}else{
  $(".sub2").slideUp(1000);
}
subToggle=!subToggle;
});


$(".menu3").click(()=>{
if(subToggle){
  $(".sub3").slideDown(500);
}else{
  $(".sub3").slideUp(1000);
}
subToggle=!subToggle;
});

$(".menu4").click(()=>{
if(subToggle){
  $(".sub4").slideDown(500);
}else{
  $(".sub4").slideUp(1000);
}
subToggle=!subToggle;
});



$(".menu5").click(()=>{
if(subToggle){
  $(".sub5").slideDown(500);
}else{
  $(".sub5").slideUp(1000);
}
subToggle=!subToggle;
});

$(".menu6").click(()=>{
if(subToggle){
  $(".sub6").slideDown(500);
}else{
  $(".sub6").slideUp(1000);
}
subToggle=!subToggle;
});


$(".menu7").click(()=>{
if(subToggle){
  $(".sub7").slideDown(500);
}else{
  $(".sub7").slideUp(1000);
}
subToggle=!subToggle;
});

$(".menu8").click(()=>{
if(subToggle){
  $(".sub8").slideDown(500);
}else{
  $(".sub8").slideUp(1000);
}
subToggle=!subToggle;
});

var slides = document.querySelector('.slides'), 
    slide = document.querySelectorAll('.slides li'),  //모든 슬라이드 선택 
    currentIdx = 0, //슬라이드 이동
    slideCount = slide.length, //슬라이드 겟수
    slideWidth = 1200, // 슬라이드 너비
    slideMargin = 0, // 마진
    prevBtn = document.querySelector('.prev'), // 좌우 버튼
    nextBtn = document.querySelector('.next'); // 좌우 버튼
    

makeClone();

function makeClone(){
  for(var i = 0; i<slideCount; i++){
    // a.cloneNode() a요소 복사  
    // a.cloneNode(true) a의 자식요소 복사 
    var cloneSlide = slide[i].cloneNode(true);
    cloneSlide.classList.add('clone');
    //a.appendChild(b) a에다가 b를 추가 
    slides.appendChild(cloneSlide); // ul 복사본 뒤에다 추가
  }

  for(var i = slideCount -1; i>=0; i--){
    //a.prepend(b) 앞에 추가
    var cloneSlide = slide[i].cloneNode(true);
    cloneSlide.classList.add('clone');
    //a.prepend(b) a앞에다 추가 
    slides.prepend(cloneSlide); // ul 복사본 뒤에다 추가      
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
  var initialTranslateValue = -(slideWidth + slideMargin) * slideCount; // SlideCount를 slideCount로 수정
  //slides {transform:translateX(-1000px);}
  slides.style.transform = 'translateX('+ initialTranslateValue +'px)';
}
nextBtn.addEventListener('click', function(){
  moveSlide(currentIdx + 1);

})

prevBtn.addEventListener('click', function(){
  moveSlide(currentIdx - 1);
})
function moveSlide(num){ // unm을 num으로 수정
slides.style.left= -num * (slideWidth + slideMargin) +'px'; // sleft를 left로 수정
currentIdx = num;
console.log(currentIdx, slideCount);

if(currentIdx == slideCount || currentIdx == -slideCount){
  setTimeout(function(){
      slides.classList.remove('animated');
      slides.style.left = '0px'; // lift를 left로 수정
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
//버튼 색상을 업데이트하는 함수입니다.
function updateButtonColor(selectedIndex) {
  // 모든 버튼 요소를 선택합니다.
  const allButtons = document.querySelectorAll('.controls button');
  
  // 모든 버튼을 순회하면서 선택된 버튼에 해당하는 색상을 변경하고, 나머지 버튼은 원래 색상으로 변경합니다.
  for (let i = 0; i < allButtons.length; i++) {
      if (i === selectedIndex) {
          // 선택된 버튼의 색상을 변경합니다.
          allButtons[i].style.backgroundColor = '#3838388f';
      } else {
          // 선택되지 않은 버튼의 색상을 원래 색상으로 변경합니다.
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
              updateButtonColor(currentIdx); // 추가
          }, 600);
      } else {
          updateButtonColor(currentIdx); // 추가
      }
  }


</script>
