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
    .eveTitleFont {
    	font-size: 25px;
    	font: bold;
    }
  </style>
</head>
<body>
<div id="app">

	<div onclick="history.back();"><a href="javascript:;">�� �ǵ��ư���</a></div>
	
	
	<div class="eveFont">����</div>
	<hr>
	
	<div class="eveTitleFont">[�̺�Ʈ ������]</div>
	<div>������ �� �����Ͻ� ������ <span style="color: red">���� �Ϸ� �� ������ �Ұ��Ͽ���</span> ���� ��, ��Ȯ�� �����ۼ��� �������ֽñ� �ٶ��ϴ�. ������ �߸� �����Ͽ� �߻��� �������� �������� �ʽ��ϴ�.</div>
	<div class="eveTitleFont">[���� �� ���ǻ���]</div>
	<div>1. �̺�Ʈ ����� ���� �Ⱓ �� �ٹ� ���� �� ���� �Ϸ� �ð��� �������� ó���˴ϴ�.</div>
	<div>2. ��÷�� ��ǥ �� �һ���ȸ ������ ���� �� ������ �ʼ������� �������� ó���˴ϴ�.</div>
	<div>3. �ܱ����� ��� �̺�Ʈ�� �����Ͻ� ���� �̸��� �ź��� �� ���� �̸��� �����ؾ� �ϸ�, �ش� �̸� �������θ� ���� �����մϴ�. (�ѱ� �̸����� ���� �Ұ�)</div>
	<div>4. ���� �Ⱓ �� �ٹ��� �����Ͽ� �̺�Ʈ�� ������ ���� �ֹ��� ����� ���, ��÷ ��󿡼� ���ܵ˴ϴ�.</div>
	<div>5. �̺�Ʈ ���� �� ��÷���� ���� ���, �����Ͻ� �ٹ��� ��ǰ�Ͻ� �� �����ϴ�.</div>
	<div>6. �� �̺�Ʈ�� ��÷�� ���θ� ���� �����մϴ�.</div>
	<div>7. �� �̺�Ʈ ��÷���� �븮���� �� Ÿ�ο��� �絵, �ŸŰ� �Ұ��մϴ�. (���� �� ���� �Ұ�)</div>
	<div>8. �� �̺�Ʈ ���� �� ���� Ȯ���� ���� �ź����� �ݵ�� �����ϼž� �մϴ�. ������ �� ������ ���� �Ұ��մϴ�.</div>
	<div>9. 2�� �̻� ��ȭ ������ ���� ���� ���, ���� ��÷�ڰ� ���� ����Ǹ�, ���� ��÷���� �̺�Ʈ ���� ���� �� �� �� ������ �帱 �����Դϴ�. �ٽ� ������ ���� ���� ��쿡�� ���� �ǻ簡 ���� ������ �Ǵ��Ͽ� �翬���� �帮�� �ʽ��ϴ�.</div>
	<div>10. �̺�Ʈ ���� �� ��Ƽ��Ʈ ��ȣ�� ���� � ����ڰ� �����ϸ�, ��� ������ ��ȭ�˴ϴ�. ������ȭ ������ �������ϴٰ� �Ǵܵ� ���, �̺�Ʈ�� ���� ����� �� �ֽ��ϴ�.</div>
	<hr>
	
	<div v-if="info.cnt >= 1">
		<div v-if="ynApplyYn == 0">
			<div><input type="text" placeholder="�����ڸ�" v-model="eUname"></div>
			<div><input type="text" placeholder="����ó" v-model="eUphone"></div>
			<div>�������� ���� ����</div>
			<div v-model="eYn">
			<label><input type="radio" name="Yn" value="Y">������</label>
			<label><input type="radio" name="Yn" value="N">���Ǿ���</label>
			</div>
			<div><button @clic="fnApply(info)">�����ϱ�</button></div>
		</div>
		<div v-else>
			<div>�ش� �̺�Ʈ�� �̹� ����Ǿ����ϴ�.</div>
			<div>1ȸ ���� �� �ٹ� ���Խ� �ڵ�����ǿ���, �����Ͻñ� �ٶ��ϴ�.</div>
		</div>
	</div>
	<div v-else>
		<div>�ش� �������� ������ ��ǰ�� Ȯ�� ���� �ʽ��ϴ�</div>
	</div>
	
</div>
</body>
</body>
</html>
<script>
var app = new Vue({
	el : '#app',
	data : {
		info : {
		evtNo : "${map.evtNo}",
		uId : "${map.uId}",
		eUname : "",
		eUphone : "",
		eYn : ""
			
		},
		ynApplyYn : 0
	},// data
	methods : {
		fnGetList : function(){
            var self = this;
            var nparmap = {evtNo : self.evtNo, uId : self.uId};
            $.ajax({
            	url : "/event/evtApplyYn.dox",
                dataType:"json",
                type : "POST", 
                data : nparmap,
                success : function(data) { 
                	self.info = data.info;
                	self.ynApplyYn = data.ynApplyYn;
                	console.log(data);
                }
            }); 
        },
        fnApply : function(info){
            var self = this;
            var nparmap = self.info;
            if(!confirm("���� �����ϰڽ��ϱ�? ���� �� ���� ���� �Ұ��մϴ�.")){
                return;
            }
            $.ajax({
            	url : "/event/demo.dox",
                dataType:"json",
                type : "POST", 
                data : nparmap,
                success : function(data) { 
                	alert("�������� �Ǿ����ϴ�.");
                	self.fnGetList();
                }
            }); 
        }
	}, // methods
	created : function() {
		var self = this;
		self.fnGetList(); 
	}// created
});
</script>