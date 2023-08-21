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
    body {
      background-color:#F1E9F0;
      font-size:16px;
      width: 800px;
    }
    .eveFont {
    	font-size: 50px;
    	text-align: right;
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
    .inputPos1{
    	text-align: center;
    }
    div>input {
	width: 400px;
	height: 30px;
	margin-bottom: 10px;
	text-align: center;
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
	<br>
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
	
	<div class="inputPos1">
	<div v-if="info.cnt >= 1">
		<div v-if="ynApplyYn == 0">
			<div><input type="text" placeholder="�����ڸ�" v-model="eUname"></div>
			<div><input type="text" placeholder="����ó (-) ���� �Է�" v-model="eUphone"></div>
			<div>�������� ���� ����</div>
			<label><input type="radio" name="Yn" value="Y" v-model="eYn">������</label>
			<label><input type="radio" name="Yn" value="N" v-model="eYn">���Ǿ���</label>
			<div><button @click="fnApply(info)">�����ϱ�</button></div>
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
	
</div>
</body>
</body>
</html>
<script>
var app = new Vue({
	el : '#app',
	data : {
		evtNo : "${map.evtNo}",
		uId : "${map.uId}",
		info : {},
		ynApplyYn : 0,
		eUname : "",
		eUphone : "",
		eYn : ""
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
            var nparmap = {pNo : self.info.pNo, evtNo : self.evtNo, uId:self.uId, eUname : self.eUname, eUphone : self.eUphone, eYn : self.eYn };
            if(self.eUname == "" || self.eUname == undefined){
		        alert("�̸��� �Է����ּ���");
		        return;
		    }
            if(self.eUphone == "" || self.eUphone == undefined){
		        alert("����ó�� �Է����ּ���");
		        return;
		    }
            if(self.eYn == "" || self.eYn == undefined){
		        alert("�������� ���� ���� ���θ� üũ���ּ���, ���� ���� ������ �̺�Ʈ ��÷ �Ұ�");
		        return;
		    }
            
            if(!confirm("���� �����ϰڽ��ϱ�? ���� �� ���� ���� �Ұ��մϴ�.")){
                return;
            }
            $.ajax({
            	url : "/event/evtApply.dox",
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