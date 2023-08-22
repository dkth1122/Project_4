<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<script src="../js/jquery.js"></script>  
<script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.js"></script>
  <!-- 1. vue2editor ������ cdn -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/vue/2.5.3/vue.min.js"></script>
<script src="https://unpkg.com/vue2-editor@2.3.11/dist/index.js"></script>
  <link href="../css/mypag.css" rel="stylesheet" type="text/css">
 <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css" integrity="sha512-z3gLpd7yknf1YoNbCzqRKc4qyor8gaKU1qmn+CShxbuBusANI9QpRohGBreCFkKxLhei6S9CQXFEbbKuqLg0DA==" crossorigin="anonymous" referrerpolicy="no-referrer" />
  <script src="https://cdn.jsdelivr.net/npm/vue@2.6.14/dist/vue.js"></script>
 <meta charset="EUC-KR">

<style>
	#iQtext{
		 min-height : 600px;
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
					    	 	 <div id="profileImg"></div>
					    	</div >
					    	<div class="topBox">
					    	<span class="name">{{info.uName}}</span> <span class="nickname">{{info.uName2}}</span>
					    	</div>
					    	
					    	<div class="topBox">
					    	
					    		<div class="details" >
					    		
							    	<div>Order</div>
			                        <label><a href="/mypag/myPagOrderdetails.do">                            
			                        <div>{{order}}</div>
                          			</a></label>
					    			
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
		                                       <li><a href="/mypag/infoAddr.do">����ּҷ�</a></li>                           
		                                    </ul>   
		                                 </li>  
		                              </ul>
		                               <ul style="padding: 0px;">
		                                 <li class="ulh1">������</li>
		                                 <li>
		                                    <ul>
		                                       <li><a href="/mypag/myInquiry.do">1:1 ����</a></li>
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
							    	  <div class="lowerBox"> 1:1���� </div>
							    	  <div>��������
							    	  		<select v-model="info.category">
							    	  			<option value="��ǰ����">��ǰ����</option>
							    	  			<option value="����/����">����/����</option>
							    	  			<option value="���/ȯ��">���/ȯ��</option>
							    	  			<option value="��۹���">��۹���</option>
							    	  			<option value="�ҷ�����">�ҷ�����</option>
							    	  			<option value="��Ÿ����">��Ÿ����</option>
							    	  		</select>
							    	  </div>
							    	  <div>�������� <input v-model="info.iQtitle"></div>
							    	  <div><span>����
							    	  <!-- 2. ȭ�� ������ �߰� -->
							    	  		<vue-editor id="iQtext" v-model="info.iQcontent" placeholder="1. �ֹ���ȣ

2. ���ǻ�ǰ
- ��ǰ�� : (��ǰ �޸鿡 ����� �ѱ� �Ǵ� ������ ��ǰ��)
- ���ڵ� : (��ǰ �޸鿡 ����� 880���� ���۵Ǵ� 13�ڸ��� ����)
- ���� :

3. ���� ����
��- ��Ȯ�� ����ǰ ������ �� ��û������ �������ּž� ���� ������ �����մϴ�.
( ����. ����ī�� ���� 1�� ������ 2�� )


�� ���ǻ���
1) ���� ��ǰ �Ǵ� ����ǰ�� ��� ��ȯ ���� �� ��ȯǰ�� �������� �߼� �˴ϴ�.
2) ��ǰ �ҷ� �� ���۵� �ϴ� ���, ���� �Ǵ� ������ ÷�� ��Ź�帳�ϴ�.
3) ���� ÷�� �� �Ʒ� ������ ��ǰ�� �ҷ����� Ȯ���ϱ� ������ �����Ͻþ� ÷�� �ٶ��ϴ�.
��- �� �ݻ簡 ���� ����, Ư�� �κи� Ȯ���ؼ� �Կ��� ����, ������ ĸ�ĺ�
��- ��Ű�� ���� �Ǵ� ���������� PVC �Ŀ�ġ�� �������� ���� ����
4) ��ǰ ���� �� �߻��� �ҷ� �Ǵ� �������� Ȯ���ϱ� ���� ���� ���� �Կ��� ���� �帳�ϴ�.
5) ÷�������� ���� �� �ִ� 10MB�� �뷮 ������ ������ �뷮�� �ʰ��� ��� �Ʒ� �ּҷ� ���� �߼� �� �Խñ� ��� �ٶ��ϴ�.
��- CSCENTER@SMTOWN.COM
��- ������: �ֹ���ȣ/�ֹ��ڸ� �ҷ�CS Ȯ�ο�û (����) 20230101-0000000/ȫ�浿 �ҷ�CS Ȯ�ο�û">							    	  		
							    	  		</vue-editor> 							    	  		
							    	  		</span></div>							    	
							    	  	<div>
							    	  	<button @click="fnBack">���</button>
							    	  	<button @click="addBoard">���</button>
							    	  	</div>
							    	  	
							    	  	
							    	  	<div>
							    	  		<div><span>÷������ 1 <input type="file" id="file1" name="file1"></span></div>							    	  								    	  
							    	  	</div>
							     </div> 
							     
							     
					</div>
					    
					    </div>
			    
			  </div>
  
</div>
</body>
</html>
<script type="text/javascript">
//3. �信 vue2editor �߰�
console.log(Vue);
Vue.use(Vue2Editor);
const VueEditor = Vue2Editor.VueEditor;

var app = new Vue({	
    el: '#app',
    data: {
    	info : {
    		iQtitle : "",
    		uId : "",
    		iQtime : "",
    		category : "��ǰ����"
    		
    	},
    	orderCntList : [],
    	uId : "${sessionId}",
    	order  : "",
    	exchange : "",
    	refund : "",
    	list : []
    },
    components: {VueEditor},
    methods: {
    	fnGetList : function(){
            var self = this;
            var nparmap = {uId : self.uId};
            self.info.uId = self.uId;
            $.ajax({
                url : "/mypag/userInquiry.dox",
                dataType:"json",	
                type : "POST", 
                data : nparmap,
                success : function(data) { 
                	
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
	    fnBack : function(){
	    	var self = this;
	    	$.pageChange("myInquiry.do", {uId : self.uId});
	    },
	    addBoard : function(){
            var self = this;
            var nparmap = self.info;
            console.log(self.info);
            $.ajax({
                url : "/mypag/myPageAddInquiry.dox",
                dataType:"json",	
                type : "POST", 
                data : nparmap,
                success : function(data) { 
                	
                	alert("���Ǳ��� ������ �Ǿ����ϴ�.");
                	$.pageChange("myInquiry.do", {uId : self.uId});
                	                	
                	var form = new FormData();
	       	        form.append( "file1",  $("#file1")[0].files[0] );
	       	     	form.append( "iNo",  data.iNo); // pk
	           		self.upload(form); 
	       	     	
                }
            }); 
        },
     // ���� ���ε�
	    upload : function(form){
	    	var self = this;
	         $.ajax({
	             url : "/mypag/fileUpload2.dox"
	           , type : "POST"
	           , processData : false
	           , contentType : false
	           , data : form
	           , success:function(response) { 
	           }
	       });
		},
        myInquiry : function(){
       	    	var self = this;
       	    	$.pageChange("myInquiry.do", {uId : self.uId});
       	},
	    /* �̿�ȳ� */
	    useGuide : function(){
	    	var self = this;
	    	$.pageChange("useGuide.do", {uId : self.uId});
	    },
	    /* �������� */
	    noticeList : function(){
	    	var self = this;
	    	$.pageChange("noticeList.do", {uId : self.uId});
	    },
	    faq : function(){
	    	var self = this;
	    	$.pageChange("faq.do", {uId : self.uId});
	    }
    },
    created: function() {
      var self = this;
      self.fnGetList();
    }
});
</script>
