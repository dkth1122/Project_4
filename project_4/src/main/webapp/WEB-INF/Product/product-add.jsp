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
	table{

		border : 1px solid black;
		border-collapse: collapse;
		text-align : center;
	}
	th, td {
		border : 1px solid black;
		padding : 5px 10px;
	}
	body {
		background-color: #eae2eb;
	}
</style>
</head>
<body>
<div id="app">

	<div><input type="text" placeholder="��ǰ �ڵ�" v-model="info.pNo"></div>
	<div><input type="text" placeholder="��ǰ �̸�" v-model="info.pName"></div>
	<div><input type="number" placeholder="����" v-model="info.price"><input type="number" placeholder="������" v-model="info.point" disabled></div>
	<div><input type="number" placeholder="���" v-model="info.stock"></div>
	<div>
		<select v-model="info.membership">
			<option value="N">��ü���Ű���</option>
			<option value="Y">���������</option>
		</select>
	</div>
	<div> ī�װ� : 
		<select v-model="info.category">
			<option value="ALB">�ٹ�</option>
			<option value="MER">��ġ</option>
			<option value="DVD">DVD</option>
			<option value="PTB">�����</option>
			<option value="MEM">�����</option>
		</select>
	</div>
	<div> ��ǰ �̹��� :<input type="file" id="file1" name="file1" accept="image/*" @change="setThumbnail"></div>
	<div> �ִ뱸�� ���� : 
		<select v-model="info.pLimit">
			<option value="10">10��</option>
			<option value="9">9��</option>
			<option value="8">8��</option>
			<option value="7">7��</option>
			<option value="6">6��</option>
			<option value="5">5��</option>
			<option value="4">4��</option>
			<option value="3">3��</option>
			<option value="2">2��</option>
			<option value="1">1��</option>
		</select>
	</div>
	
	<div>
	�� ������ : 
	<input type="file" id="file2" name="file2" accept="image/*" multiple>
<!-- 	<input type="file" id="file2" name="file2" accept="image/*" multiple>
	<input type="file" id="file2" name="file2" accept="image/*" multiple> -->


	</div>
	
	<div>
		��Ƽ��Ʈ : 
	<select v-model="info.artist">
		<option value="BTS">��ź�ҳ��</option>
		<option value="TXT">����ο�������Դ�</option>
		<option value="EHP">��������</option>
		<option value="SVT">����ƾ</option>
		<option value="FMN">���ι̽�����</option>
		<option value="LSF">��������</option>
		<option value="NJS">������</option>
		<option value="BND">���̳ؽ�Ʈ����</option>
		<option value="ZIC">����</option>
	</select>
	</div>
	<div><input type="text" placeholder="Ư���ڵ�" v-model="info.fYn"></div>
	
	<div><button @click="fnProductAdd">��ǰ �߰�</button></div>
 <div id="image_container"></div>
	
</div>
</body>
</html>
<script>
var app = new Vue({
	el : '#app',
	data : {
		info : {
			pNo : "",
			pName : "",
			price : "",
			point : "",
			stock : "",
			membership : "N",
			category : "ALB",
			artist : "BTS",
			fYn : "",
			pLimit : "1"
		}
	},// data
	methods : {
		fnProductAdd: function() {
			  var self = this;
			  var nparmap = self.info;
			  nparmap.point = parseFloat(nparmap.price) * 0.02;
			  nparmap.pNo = (nparmap.artist + nparmap.pNo + nparmap.category);
			  if(self.info.pNo.length != 10){
			        alert("��ǰ��ȣ�� Ȯ���Ͻÿ�");
			        return;
			    }
			  if(self.info.pName == "" || self.info.pName == undefined){
			        alert("��ǰ �̸��� �Է����ּ���");
			        return;
			    }
			  if(self.info.price == "" || self.info.price == undefined){
					alert("������ �Է����ּ���");
					self.info.price.focus();
					return;
				}
			  if(self.info.stock == "" || self.info.stock == undefined || self.info.stock == 0){
					alert("��� �Է����ּ���");
					return;
				}
			  if(self.info.membership == "" || self.info.membership == undefined){
					alert("����ʿ��θ� �������ּ���");
					return;
				}
			  if(self.info.category == "" || self.info.category == undefined){
					alert("ī�װ��� �������ּ���");
					return;
				}
			  if(self.info.artist == "" || self.info.artist == undefined){
					alert("��Ƽ��Ʈ�� �������ּ���");
					return;
				}
			  if(self.info.pLimit == "" || self.info.pLimit == undefined){
					alert("�ִ뱸�� ���� �������ּ���");
					return;
				} 
			  $.ajax({
			    url : "/product/add.dox",
			    dataType : "json",
			    type : "POST",
			    data : nparmap,
			    success : function(data) {
			    	 alert("��ǰ�� ��ϵǾ����ϴ�.");
			      var form = new FormData();			     
			      var form2 = new FormData();			     
			      
                  form.append("file1", $("#file1")[0].files[0]);
                  form.append("pNo", data.pNo);
                  self.upload(form);
                  
                  form2.append("pNo", data.pNo);
                  for(var i=0; i < $("#file2")[0].files.length; i++){
                	  form2.append("file2", $("#file2")[0].files[i]);
                      self.upload1(form2);
                  }
                  
              	/*   window.close(); // �˾�â �ݱ�*/
	        	 /*  window.opener.location.reload(); */ // �θ�â ���ΰ�ħ 
	        	  window.location.reload();
			    }
			  });
			},
			upload: function(form) {
	            var self = this;
	            $.ajax({
	                url: "/product/fileUploadimg.dox",
	                type: "POST",
	                processData: false,
	                contentType: false,
	                data: form,
	                success: function(response) {
	                }

	            });
	        },
	        upload1: function(form2) {
	            var self = this;
	            $.ajax({
	                url: "/product/insertProductDetailedImg.dox",
	                type: "POST",
	                processData: false,
	                contentType: false,
	                data: form2,
	                success: function(response) {
	                }

	            });
	        },
	        setThumbnail: function(event){
	            var reader = new FileReader();
	            var imageContainer = document.querySelector("div#image_container");
		
	            while (imageContainer.firstChild) {
	                imageContainer.removeChild(imageContainer.firstChild);
	            }
	            
	            reader.onload = function(event) {
	                var img = document.createElement("img");
	                img.setAttribute("src", event.target.result);
	                document.querySelector("div#image_container").appendChild(img);
	            };

	            
	            reader.readAsDataURL(event.target.files[0]);
	        }
	    
	}, // methods
	created : function() {
		var self = this;
	}// created
});
</script>