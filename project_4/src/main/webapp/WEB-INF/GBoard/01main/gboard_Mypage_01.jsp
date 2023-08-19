<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<script src="../js/jquery.js"></script>
<script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.js"></script>

<style>
	table, td,tr, th {
		border : 1px solid tomato ;
		border-collapse: collapse;
	}
	.header{
		border:1px solid tomato;
	}
	.profile-image {
	    width: 50px; /* ���ϴ� �̹��� ũ�� ���� */
	    height: 50px;
	    border : 1px solid tomato;
	    border-radius: 50%; /* 50%�� �����Ͽ� ���׶�� ������� �ڸ� */
	    object-fit: cover; /* �̹����� ȭ�鿡 �°� �����Ͽ� �߸� �κ��� �� ���̵��� �� */
}
</style>
<title>myPage</title>
</head>
<body>
	<div id="app">
	 <button @click="fnMove">�ڷΰ���</button>
	<h1>��������������~</h1>
	<div class="header">
		<h2>{{uId}}</h2>
	</div>
	
	<div><h1>����� ���� - ���� ����</h1>
		<table>
			<tr>
				<th>���� ����</th>
				<th>��Ƽ��Ʈ</th>
				<th>���� ������</th>
				<th>���� ������</th>
			</tr>
			<tr v-for = "item in mlist" >
					<td>{{item.mStatus}}</td>
					<td>{{item.artist}}</td>
					<td>{{item.mRegDate}}</td>
					<td>{{item.mExpDate}}</td>
			</tr>
		</table>
	</div>

<div>
	<h1>���� ��� �� ������ ����</h1>
		<table>
			<tr>
				<th>��ȣ</th>
				<th>��Ƽ��Ʈ</th>
				<th>�г���</th>
				<th>�̹���</th>
				<th>�̹��� ����</th>
				<th>�Ϸ�</th>
				<th>�̹��� ����...</th>
			</tr>
			<tr v-for = "(pitem, index) in plist" >
					<td>{{pitem.gpNo}}</td>
					<td>{{pitem.artist}}</td>
					<td>
						<input v-model="pitem.nickName" placeholder="������ �г��� �Է�">
        			</td>
					<td><img :src="pitem.gpPath" class="profile-image"></td>
					
        			<td>
        				<div>�̹���</div>
						<input type="file" :id="'index'+index"  :name="'index'+index" accept=".gif, .jpg, .png" @change="handleFileChange" >
        			</td>
        			<td>	
        				<button @click="fnProfile(pitem, index)">���</button>
        			</td>
        			<td><button @click="fnImgRemove(pitem.gpNo)">�̹��� ���� ��ư</button></td>
        			
			</tr>
		</table>
</div>
	
	<div><h1>���� �� �ǵ� ==> ������ ������ ���̺� ���</h1>
		<table>
			<tr>
				<th>��Ƽ��Ʈ</th>
				<th>�ۼ���</th>
				<th>�ǵ� ����</th>
				<th>���ƿ� ��</th>
			</tr>
			<tr v-for = "item in list"  @click="fnCheck(item.gNo)">
					<td>{{item.artist}}</td>
					<td>{{item.gDate}}</td>
					<td>{{item.gContent}}</td>
					<td>{{item.gLike}}</td>
			</tr>
		</table>
	</div>
	
	<div><h1>���� �� ���</h1>
		<table>
			<tr>
				<th>��Ƽ��Ʈ</th>
				<th>�ۼ���</th>
				<th>��� ����</th>
				<th>���ƿ� ��</th>
			</tr>
			<tr v-for ="item in list2"  @click="fnCheck(item.gNo)">
					<td>{{item.artist}}</td>
					<td>{{item.gcDate}}</td>
					<td>{{item.gcContent}}</td>
					<td>{{item.gcLike}}</td>
			</tr>
		</table>
	</div>
		
	<div><h1>���� �� ����</h1>
		<table >
			<tr>
				<th>��Ƽ��Ʈ</th>
				<th>�ۼ���</th>
				<th>��� ����</th>
				<th>���ƿ� ��</th>
			</tr>
			<tr v-for = "item in list3"  @click="fnCheck(item.gNo)">
					<td>{{item.artist}}</td>
					<td>{{item.gcDate}}</td>
					<td>{{item.gcContent}}</td>
					<td>{{item.gcLike}}</td>
			</tr>
		</table>
	</div>
	
	</div>
</body>
</html>
<script>
	    var app = new Vue({
	        el: '#app',
	        data: {
	            list: [],
	            list2: [],
	            list3: [],
				plist: [],	            
				mlist: [],	            
	            uId: "${sessionId}",
	            artist : ""
	        },// data
	        methods: {
	            fnGetList: function() {
	                var self = this;
	                var nparmap = {uId : self.uId};
	                $.ajax({
	                    url: "myPageList.dox",
	                    dataType: "json",
	                    type: "POST",
	                    data: nparmap,
	                    success: function (data) {
	                        self.list = data.list;
	                        self.list2 = data.list2;
	                        self.list3 = data.list3;
	                        self.plist = data.plist;
	                        self.mlist = data.mlist;
	                        console.log("plist==>", data);
	                    }
	                });
	            }, fnMove : function(){
	            	window.history.back();
	            	
	            }, fnProfile: function(pitem, index) {
	            	  var self = this;
						console.log("pitem==>", pitem);
						console.log("index==>", index);
						console.log("nickName==>", pitem.nickName);
						
	            	    if (!confirm("����ұ��?")) {
	            	        return;
	            	    }
	            	    var nparmap = {nickName : pitem.nickName, artist: pitem.artist, uId : self.uId, gpNo : pitem.gpNo };
	            	    
	            	    $.ajax({
	            	        url: "updateProfileNickName.dox",
		                    dataType: "json",
		                    type: "POST",
	            	        data: nparmap,
		                    success: function (data) {
		                    	 alert("��ϵǾ����.");
		                        self.fnGetList();
		                        
 		     	           		var form = new FormData();
			            	    form.append("nickName", pitem.nickName);
			            	    form.append("gpNo", pitem.gpNo);
			            	    form.append("artist", pitem.artist);
			            	    form.append("uId", self.uId); 
				       	        form.append( "index",  $("#index"+index)[0].files[0] );
		    	           		self.upload(form); 
		                    }
	            	    });
	            },
	         // ���� ���ε�
	    	     upload : function(form){
	    	    	var self = this;
	    	         $.ajax({
	    	             url : "updateProfileImg.dox"
	    	           , type : "POST"
	    	           , processData : false
	    	           , contentType : false
	    	           , data : form
	    	           , success:function(response) { 
	    	        	   location.reload();
	    	           }
	    	       });
	    		},  fnCheck: function(gNo){
	                var self = this;
	                var option = "width=500,height=500,top=100,left";
	                var url = "view.do?gNo=" + gNo + "&uId=" + self.uId;
	                window.open(url, "gNo", option);
	                
	    		},fnMove: function () {
		            window.history.back();
		            
		       }, fnImgRemove : function(gpNo){
	                var self = this;
	                var nparmap = {gpNo : gpNo};
	                
	                if(!confirm("���� �Ͻðڽ��ϱ�?")){
	                	return;
	                }
	                $.ajax({
	                    url: "ImgRemove.dox",
	                    dataType: "json",
	                    type: "POST",
	                    data: nparmap,
	                    success: function (data) {
	                    	alert("�̹��� ���� �Ϸ�");
	                    }
	                });
		       }, handleFileChange: function(event) {
		              var self = this;
		              var file = event.target.files[0];
		              
		              if (file) {
		                  var ext = file.name.split('.').pop().toLowerCase(); // ���� Ȯ���� ����

		                  if (['gif', 'jpg', 'jpeg', 'png'].indexOf(ext) === -1) {
		                      alert('�̹��� ������ gif, jpg, png Ȯ���ڸ� ���˴ϴ�.');
		                      // ���� ������ ����ϵ��� ó�� (������ ������ �ʱ�ȭ)
		                      event.target.value = '';
		                  }
		              }
		          }
	        }, // methods
	        created: function () {
	            var self = this;
	            self.fnGetList();
	        }// created
	    });
	</script>
