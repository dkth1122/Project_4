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
    * {
      box-sizing: border-box;
    }
    body {
      background-color:#F1E9F0;
      font-size:16px;
      width: 800px;
    }
    #wrapper{
      display: grid;
      grid-template-columns: repeat(auto-fit, minmax(200px, 1fr));
      grid-gap: 16px;
    }
    .card {
      background-color:#fff;
      box-shadow:0px 1px 5px #222;
    }
    .card > header {
      font-size:1.5rem;
      padding:0.5rem;
    }
    .card > p {
      padding:0.5rem;
      line-height:1.6em;
    }
    img {
      width:100%;
      height: 70%;
    }
    .eveFont {
    	font-size: 50px;
    	text-align: right;
    }
    .eventButton1{
    	margin-left: 30px;
    }
    .eventButton1 > button{
	    margin-left: 5px;
	    height: 30px;
	    border-radius: 10px;
	    border: none;
	    background: purple;
	    color: white;
    }
    button{
    	 margin-left: 5px;
	    height: 30px;
	    border-radius: 10px;
	    border: none;
	    background: purple;
	    color: white;
    }
    button:hover{
	    background: #5c3564;
    }
  </style>
</head>
<body>
<div id="app">

	<div onclick="history.back();"><a href="javascript:;">← 되돌아가기</a></div>
	
	
	<hr>
	이벤트
	<hr>
	<div>[이벤트 응모방법]</div>
	<div>※응모 시 제출하신 정보는 제출 완료 후 수정이 불가하오니 제출 시, 정확한 정보작성에 유의해주시기 바랍니다. 정보를 잘못 기재하여 발생한 불이익은 보상하지 않습니다.</div>
	<div>[응모 시 유의사항]</div>
	<div>이벤트 응모는 응모 기간 내 앨범 구매 및 응모 완료 시간을 기준으로 처리됩니다.</div>
	<div>당첨자 발표 및 팬사인회 참여는 응모 시 기재한 필수정보를 기준으로 처리됩니다.</div>
	<div>외국인의 경우 이벤트에 응모하신 영문 이름이 신분증 상 영문 이름과 동일해야 하며, 해당 이름 기준으로만 응모 가능합니다. (한글 이름으로 응모 불가)</div>
	<div>응모 기간 내 앨범을 구매하여 이벤트에 응모한 이후 주문을 취소할 경우, 당첨 대상에서 제외됩니다.</div>
	<div>이벤트 응모 후 당첨되지 않은 경우, 구매하신 앨범은 반품하실 수 없습니다.</div>
	<div>본 이벤트는 당첨자 본인만 참석 가능합니다.</div>
	<div>본 이벤트 당첨권은 대리수령 및 타인에게 양도, 매매가 불가합니다. (적발 시 참여 불가)</div>
	<div>본 이벤트 참여 시 본인 확인을 위한 신분증을 반드시 지참하셔야 합니다. 미지참 시 참여가 절대 불가합니다.</div>
	<div>2번 이상 통화 연결이 되지 않을 경우, 다음 당첨자가 먼저 진행되며, 다음 당첨자의 이벤트 진행 이후 한 번 더 연락을 드릴 예정입니다. 다시 연락이 되지 않을 경우에는 참여 의사가 없는 것으로 판단하여 재연락을 드리지 않습니다.</div>
	<div>이벤트 진행 시 아티스트 보호를 위해 운영 담당자가 참관하며, 모든 영상은 녹화됩니다. 영상통화 내용이 부적절하다고 판단될 경우, 이벤트가 강제 종료될 수 있습니다.</div>
	<hr>
	
	<div v-if="info.cnt <= 1">
	<div><input type="text" placeholder="응모자명"></div>
	<div><input type="text" placeholder="연락처"></div>
	<div>개인정보 수집 동의</div>
	<label><input type="radio" name="Yn">동의함</label>
	<label><input type="radio" name="Yn">동의안함</label>
	<button>응모하기</button>
	</div>
	<div v-else>
	<div>해당 계정으로 구매한 상품이 확인 되지 않습니다</div>
	</div>
	
</div>
</body>
</body>
</html>
<script>
var app = new Vue({
	el : '#app',
	data : {
		info : {},
		evtNo : "${map.evtNo}",
		uId : "${map.uId}"
	},// data
	methods : {
		fnGetList : function(){
            var self = this;
            var nparmap = {evtNo : self.evtNo, uId : self.uId};
            $.ajax({
            	url : "/aboard/info.dox",
                dataType:"json",
                type : "POST", 
                data : nparmap,
                success : function(data) { 
                	self.info = data.info;
                }
            }); 
        }
	}, // methods
	created : function() {
		var self = this;
	}// created
});
</script>