<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<script src="../js/jquery.js"></script>
<link href="../css/mypage.css" rel="stylesheet" type="text/css">
<link href="../css/mypag.css" rel="stylesheet" type="text/css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css"
	integrity="sha512-z3gLpd7yknf1YoNbCzqRKc4qyor8gaKU1qmn+CShxbuBusANI9QpRohGBreCFkKxLhei6S9CQXFEbbKuqLg0DA=="
	crossorigin="anonymous" referrerpolicy="no-referrer" />

<script src="https://cdn.jsdelivr.net/npm/vue@2.6.14/dist/vue.js"></script>
<meta charset="EUC-KR">
<style type="text/css">
.swiper-container {
	height:420px;
	border:5px solid silver;
	border-radius:7px;
	box-shadow:0 0 20px #ccc inset;
}
.swiper-slide {
	text-align:center;
	display:flex; /* ������ �߾����� �ϱ����� flex ��� */
	align-items:center; /* ���Ʒ� ���� �߾����� */
	justify-content:center; /* �¿� ���� �߾����� */
}
.swiper-slide img {
	box-shadow:0 0 5px #555;
	max-width:100%; /* �̹��� �ִ�ʺ� ����, �����̵忡 �̹����� �������� �������� �ʿ� */
	/* �� �������� �ʿ��ؼ� �����߽��ϴ�. ��Ȳ������ �ٸ� �� �ֽ��ϴ�. */
}
.b{ 

	height: 350px;
	display: flex;
	width: 1200px;	
}
.c{

	width: 250px;
	height: 350px;
	margin-right: 63px;
}
.justimg{
	width: 250px;
	height: 200px;
}
.justBox{
 	width: max-content;
 	word-break: break-all;
	max-width: 170px;
	display: inline-block;
	font-size: 0.7em;
	margin-bottom: 10px;
	line-height: 20px;
	
}
.justpay, .justBox {
	padding-left: 10px;
}
</style>

</head>
<body>

	<div id="app">

			<div id="container">
				<div id="top">
					<div id="topbody">
						<div style="height: 150px;"></div>

						<div class="a">
							<div class="left topImgBoxwid">
								<a href="/mypag/main.do"><div id="profileImg"></div></a>
							</div>
							<div class="topBox">
								<span class="name">{{info.uName}}</span> <span class="nickname">{{info.uName2}}</span>
							</div>

							<div class="topBox">

								<div class="details">

									<div>Order</div>
			                        <label><a href="/mypag/myPagOrderdetails.do">                            
			                        <div v-if="order != 0">{{order}}</div>
			                        <div v-else>0</div>
                          			</a></label>

								</div>

								<div class="details">

									<div>��ȯ/ȯ��</div>
									<div>
										<span v-if="refund != 0">{{refund}} /</span>
										<span v-else>0 /</span>
										
										<span v-if="exchange != 0"> {{exchange}}</span>
										<span v-else>0</span>
									</div>

								</div>
								<div class="details">
									<div>����Ʈ</div>
									<div>{{info.uPoint}} P</div>
								</div>
								<div class="details">
									<div>Jelly</div>
									<div>0</div>
								</div>
							</div>
						</div>


					</div>
				</div>


				<div id="body">

					<div id="left">
						<div class="categories">MY PAGE</div>
						<div style="text-align: left;">
							<ul style="padding: 0px;">
                                 <li class="ulh1">���� ���� ���� </li>
                                 <li>
                                    <ul>
                                       <li><a href="/mypag/myPagOrderdetails.do">�ֹ�����</a></li>
                                       <li><a href="/mypag/myPageInterest.do  ">��ٱ���</a></li>
                                       <li><a href="/mypag/myInformation.do">�� ���</a></li>
                                       <li><a href="/mypag/mypageReserves.do">����Ʈ</a></li>                                 
                                    </ul>   
                                 </li>  
                              </ul>
                              <ul style="padding: 0px;">
                                 <li class="ulh1">ȸ�� ����</li>
                                 <li>
                                    <ul>
                                       <li><a href="/mypag/infoUpdate.do">ȸ�� ���� ����</a></li>
                                       <li><a href="/mypag/addAddr.do">����ּҷ�</a></li>                           
                                    </ul>   
                                 </li>  
                              </ul>
                               <ul style="padding: 0px;">
                                 <li class="ulh1">������</li>
                                 <li>
                                    <ul>
                                       <li><a href="/mypag/myAddInquiry.do">1:1 ����</a></li>
                                       <li><a href="/mypag/noticeList.do">��������</a></li>
                                       <li><a href="/mypag/useGuide.do">�̿�ȳ�</a></li>
                                       <li><a href="/mypag/faq.do">FAQ</a></li>                                 
                                    </ul>   
                                 </li>  
                              </ul>


						</div>
					</div>

					<div id="right">

						<div class="View">
							<div class="lowerBox">�ֱ� �ֹ���ǰ</div>
								<div class="slide_wrapper_main">
						                <div class="slide_wrapper">
						                    <ul class="slides" >
						                      <li v-for="(item, index) in 12">
						                      	<div class="c">
													<div ><img class="justimg" src="https://cdn-contents.weverseshop.io/public/shop/6df06f3bee8cfbe8aba44a9ae0cce338.png?q=95&w=720"></div>
													<div class="justBox">V (BTS) 'Layover' (Set) + 'Layover' (Weverse Albums ver.) Set</div>
													<div class="justpay">\ 13000</div>
												</div>	
											  </li> 
											</ul>
						                </div>
						  			  <p class="controls">
						                <a class="next_prev" href="Javascript:;"><i class="fa-solid fa-chevron-left  prev"></i></a>
						                  <button v-for="(item, index) in 12 " class="button+index button"></button>

						                  <a class="next_prev" href="Javascript:;"><i class="fa-solid fa-chevron-right  next"></i></a>
						              </p>
						            </div>
							
							<div v-if="false">
							<div class="nodata">������ �����ϴ�</div>							 
							</div>
							
						</div>

						<div class="View">
							<div class="lowerBox">��ٱ���</div>
						<div class="slide_wrapper_main2">
							    <div class="slide_wrapper2">
							        <ul class="slides2">
							            <li v-for="(item, index) in 12">
							                <div class="c">
							                    <div><img class="justimg" src="https://cdn-contents.weverseshop.io/public/shop/6df06f3bee8cfbe8aba44a9ae0cce338.png?q=95&w=720"></div>
							                    <div class="justBox">V (BTS) 'Layover' (Set) + 'Layover' (Weverse Albums ver.) Set</div>
							                    <div class="justpay">\ 13000</div>
							                </div>
							            </li>
							        </ul>
							    </div>
							    <p class="controls2">
							        <a class="next_prev" href="Javascript:;"><i class="fa-solid fa-chevron-left  prev2"></i></a>
							        <button v-for="(item, index) in 12" class="button+index button"></button>
							        <a class="next_prev" href="Javascript:;"><i class="fa-solid fa-chevron-right  next2"></i></a>
							    </p>
							</div>

							
							<div v-if="false">
							<div class="nodata">������ �����ϴ�</div>
							</div>
							
						</div>

						<div class="View">
							<div class="lowerBox">����</div>
						<div class="swiper-container">
							<div class="swiper-wrapper">
								<div class="swiper-slide"><img src="https://cdn-contents.weverseshop.io/public/shop/6df06f3bee8cfbe8aba44a9ae0cce338.png?q=95&w=720"></div>
								<div class="swiper-slide"><img src="https://cdn-contents.weverseshop.io/public/shop/6df06f3bee8cfbe8aba44a9ae0cce338.png?q=95&w=720"></div>
								<div class="swiper-slide"><img src="https://cdn-contents.weverseshop.io/public/shop/6df06f3bee8cfbe8aba44a9ae0cce338.png?q=95&w=720"></div>
								<div class="swiper-slide"><img src="https://cdn-contents.weverseshop.io/public/shop/6df06f3bee8cfbe8aba44a9ae0cce338.png?q=95&w=720"></div>
								<div class="swiper-slide"><img src="https://cdn-contents.weverseshop.io/public/shop/6df06f3bee8cfbe8aba44a9ae0cce338.png?q=95&w=720"></div>
								<div class="swiper-slide"><img src="https://cdn-contents.weverseshop.io/public/shop/6df06f3bee8cfbe8aba44a9ae0cce338.png?q=95&w=720"></div>
								<div class="swiper-slide"><img src="https://cdn-contents.weverseshop.io/public/shop/6df06f3bee8cfbe8aba44a9ae0cce338.png?q=95&w=720"></div>
								<div class="swiper-slide"><img src="https://cdn-contents.weverseshop.io/public/shop/6df06f3bee8cfbe8aba44a9ae0cce338.png?q=95&w=720"></div>
								<div class="swiper-slide"><img src="https://cdn-contents.weverseshop.io/public/shop/6df06f3bee8cfbe8aba44a9ae0cce338.png?q=95&w=720"></div>
								<div class="swiper-slide"><img src="https://cdn-contents.weverseshop.io/public/shop/6df06f3bee8cfbe8aba44a9ae0cce338.png?q=95&w=720"></div>
								<div class="swiper-slide"><img src="https://cdn-contents.weverseshop.io/public/shop/6df06f3bee8cfbe8aba44a9ae0cce338.png?q=95&w=720"></div>
								<div class="swiper-slide"><img src="https://cdn-contents.weverseshop.io/public/shop/6df06f3bee8cfbe8aba44a9ae0cce338.png?q=95&w=720"></div>
								<div class="swiper-slide"><img src="https://cdn-contents.weverseshop.io/public/shop/6df06f3bee8cfbe8aba44a9ae0cce338.png?q=95&w=720"></div>
								<div class="swiper-slide"><img src="https://cdn-contents.weverseshop.io/public/shop/6df06f3bee8cfbe8aba44a9ae0cce338.png?q=95&w=720"></div>
								<div class="swiper-slide"><img src="https://cdn-contents.weverseshop.io/public/shop/6df06f3bee8cfbe8aba44a9ae0cce338.png?q=95&w=720"></div>
								<div class="swiper-slide" style="font-size:50pt;">- �� -</div>
							</div>
						
							<!-- �׺���̼� -->
							<div class="swiper-button-next"></div><!-- ���� ��ư (�����ʿ� �ִ� ��ư) -->
							<div class="swiper-button-prev"></div><!-- ���� ��ư -->
						
							<!-- ����¡ -->
							<div class="swiper-pagination"></div>
						</div>

							<div v-if="false">
							<div class="nodata">������ �����ϴ�</div>
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
		el : '#app',
		data : {
			info : [],
			orderCntList : [],
			uId : "${sessionId}",
			order : "",
			exchange : "",
			refund : "",
			list : []
		},
		methods : {
			fnGetList : function() { // ����� ���� �ҷ����� �̸� , ���� (�г���)
				var self = this;
				var nparmap = {uId : self.uId};				
				$.ajax({
					url : "/user2.dox",
					dataType : "json",
					type : "POST",
					data : nparmap,
					success : function(data) {						
						self.info = data.findPw;
					}
				});
			},
			fnCntList : function() {
				var self = this;
				var nparmap = {uId : self.uId};
				console.log(nparmap);
				$.ajax({
					url : "/mypag/listExchange.dox",
					dataType : "json",
					type : "POST",
					data : nparmap,
					success : function(data) {
						console.log(data);
						var listCnt = data.list;
						for (var i = 0; i < listCnt.length; i++) {
							if (listCnt[i].exchange == "N") {
								self.order = listCnt[i].orderCnt;
								console.log(self.order);
							} else if (listCnt[i].exchange == "E") {
								self.exchange = listCnt[i].orderCnt;
							} else {
								self.refund = listCnt[i].orderCnt;
							}
						}

					}
				});
			},
		
		
		


		},
		created : function() {
			var self = this;
			self.fnGetList();
			self.fnCntList();
		}
	});
	

  	var slides = document.querySelector('.slides'), 
    slide = document.querySelectorAll('.slides li'),  //��� �����̵� ���� 
    currentIdx = 0, //�����̵� �̵�
    slideCount = slide.length, //�����̵� �ټ�
    slideWidth = 250, // �����̵� �ʺ�
    slideMargin = 65, // ����
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
  },5000);
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
  
  /*  */
  var slides1 = document.querySelector('.slides1'),
    slide1 = document.querySelectorAll('.slides1 li'), // ����
    currentIdx1 = 0,
    slideCount1 = slide1.length, // ����
    slideWidth1 = 250,
    slideMargin1 = 65,
    prevBtn1 = document.querySelector('.prev1'), // ����
    nextBtn1 = document.querySelector('.next1'); // ����

makeClone1();

function makeClone1() {
    for (var i = 0; i < slideCount1; i++) { // ����
        var cloneSlide = slide1[i].cloneNode(true); // ����
        cloneSlide.classList.add('clone');
        slides1.appendChild(cloneSlide);
    }

    for (var i = slideCount1 - 1; i >= 0; i--) { // ����
        var cloneSlide = slide1[i].cloneNode(true); // ����
        cloneSlide.classList.add('clone');
        slides1.prepend(cloneSlide);
    }

    updateWidth1();
    setInitialpos1();

    setTimeout(function () {
        slides1.classList.add('animated');
    }, 100);
}

function updateWidth1() {
    var currentSlides = document.querySelectorAll('.slides1 li'); // ����
    var newSlideCount = currentSlides.length;

    var newWidth = (slideWidth1 + slideMargin1) * newSlideCount - slideMargin1 + 'px';
    slides1.style.width = newWidth;
}

function setInitialpos1() {
    var initialTranslateValue = -(slideWidth1 + slideMargin1) * slideCount1; // ����
    slides1.style.transform = 'translateX(' + initialTranslateValue + 'px)';
}

nextBtn1.addEventListener('click', function () { // ����
    moveSlide1(currentIdx1 + 1);
    updateButtonColor1(currentIdx1 + 1);
});

prevBtn1.addEventListener('click', function () { // ����
    moveSlide1(currentIdx1 - 1);
    updateButtonColor1(currentIdx1 - 1);
});

function moveSlide1(num) { // ����
    slides1.style.left = -num * (slideWidth1 + slideMargin1) + 'px';
    currentIdx1 = num;

    if (currentIdx1 === slideCount1 || currentIdx1 === -slideCount1) { // ����
        setTimeout(function () {
            slides1.classList.remove('animated');
            slides1.style.left = '0px';
            currentIdx1 = 0;
        }, 500);

        setTimeout(function () {
            slides1.classList.add('animated');
            updateButtonColor1(currentIdx1);
        }, 600);
    } else {
        updateButtonColor1(currentIdx1);
    }
}

var timer1 = undefined;

function autoSlide1() {
    if (timer1 == undefined) {
        timer1 = setInterval(function () {
            moveSlide1(currentIdx1 + 1);
        }, 5000);
    }
}

autoSlide1();

function stopSlide1() {
    clearInterval(timer1);
    timer1 = undefined;
}

slides1.addEventListener('mouseenter', function () {
    stopSlide1();
});

slides1.addEventListener('mouseleave', function () {
    autoSlide1();
});

const buttons1 = document.querySelectorAll('.controls1 button'); // ����

for (let i = 0; i < buttons1.length; i++) {
    buttons1[i].addEventListener('click', function () {
        moveSlide1(i);
        updateButtonColor1(i);
    });
}

function updateButtonColor1(selectedIndex) { // �߰�
    const allButtons = document.querySelectorAll('.controls1 button');

    for (let i = 0; i < allButtons.length; i++) {
        if (i === selectedIndex) {
            allButtons[i].style.backgroundColor = '#3838388f';
        } else {
            allButtons[i].style.backgroundColor = '#acacac8f';
        }
    }
}
const prevButton1 = document.querySelector('.prev1');
const nextButton1 = document.querySelector('.next1');
const slideWrapper1 = document.querySelector('.slide_wrapper1');

prevButton1.addEventListener('click', function () {
    moveSlide1(currentIdx1 + 1); // ����
    updateButtonColor1(currentIdx1 + 1); // ����
});

nextButton1.addEventListener('click', function () {
    moveSlide1(currentIdx1 - 1); // ����
    updateButtonColor1(currentIdx1 - 1); // ����
});

/*  */
var slides2 = document.querySelector('.slides2'), // ����
    slide2 = document.querySelectorAll('.slides2 li'), // ����
    currentIdx2 = 0,
    slideCount2 = slide2.length, // ����
    slideWidth2 = 250,
    slideMargin2 = 65,
    prevBtn2 = document.querySelector('.prev2'), // ����
    nextBtn2 = document.querySelector('.next2'); // ����

makeClone2();

function makeClone2() {
    for (var i = 0; i < slideCount2; i++) { // ����
        var cloneSlide = slide2[i].cloneNode(true); // ����
        cloneSlide.classList.add('clone');
        slides2.appendChild(cloneSlide);
    }

    for (var i = slideCount2 - 1; i >= 0; i--) { // ����
        var cloneSlide = slide2[i].cloneNode(true); // ����
        cloneSlide.classList.add('clone');
        slides2.prepend(cloneSlide);
    }

    updateWidth2();
    setInitialpos2();

    setTimeout(function () {
        slides2.classList.add('animated');
    }, 100);
}

function updateWidth2() {
    var currentSlides = document.querySelectorAll('.slides2 li'); // ����
    var newSlideCount = currentSlides.length;

    var newWidth = (slideWidth2 + slideMargin2) * newSlideCount - slideMargin2 + 'px';
    slides2.style.width = newWidth;
}

function setInitialpos2() {
    var initialTranslateValue = -(slideWidth2 + slideMargin2) * slideCount2; // ����
    slides2.style.transform = 'translateX(' + initialTranslateValue + 'px)';
}

nextBtn2.addEventListener('click', function () { // ����
    moveSlide2(currentIdx2 + 1);
    updateButtonColor2(currentIdx2 + 1);
});

prevBtn2.addEventListener('click', function () { // ����
    moveSlide2(currentIdx2 - 1);
    updateButtonColor2(currentIdx2 - 1);
});

function moveSlide2(num) { // ����
    slides2.style.left = -num * (slideWidth2 + slideMargin2) + 'px';
    currentIdx2 = num;

    if (currentIdx2 === slideCount2 || currentIdx2 === -slideCount2) { // ����
        setTimeout(function () {
            slides2.classList.remove('animated');
            slides2.style.left = '0px';
            currentIdx2 = 0;
        }, 500);

        setTimeout(function () {
            slides2.classList.add('animated');
            updateButtonColor2(currentIdx2);
        }, 600);
    } else {
        updateButtonColor2(currentIdx2);
    }
}

var timer2 = undefined;

function autoSlide2() {
    if (timer2 == undefined) {
        timer2 = setInterval(function () {
            moveSlide2(currentIdx2 + 1);
        }, 5000);
    }
}

autoSlide2();

function stopSlide2() {
    clearInterval(timer2);
    timer2 = undefined;
}

slides2.addEventListener('mouseenter', function () {
    stopSlide2();
});

slides2.addEventListener('mouseleave', function () {
    autoSlide2();
});

const buttons2 = document.querySelectorAll('.controls2 button'); // ����

for (let i = 0; i < buttons2.length; i++) {
    buttons2[i].addEventListener('click', function () {
        moveSlide2(i);
        updateButtonColor2(i);
    });
}

function updateButtonColor2(selectedIndex) { // ����
    const allButtons = document.querySelectorAll('.controls2 button');

    for (let i = 0; i < allButtons.length; i++) {
        if (i === selectedIndex) {
            allButtons[i].style.backgroundColor = '#3838388f';
        } else {
            allButtons[i].style.backgroundColor = '#acacac8f';
        }
    }
}



</script>
