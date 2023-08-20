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
    	color: white;
    	position: relative;
    	left: 650px;
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
    button:hover{
	    background: #5c3564;
    }
  </style>
</head>
<body>
<div id="app">
	<div class="eveFont">EVENT</div>
	<hr>
		<div class="eventButton1">
			<button>BTS</button>
			<button>TXT</button>
			<button>LE SSERAFIM</button>
			<button>SEVENTEEN</button>
			<button>fromis_9</button>
			<button>ENHYPEN</button>
			<button>ZICO</button>
			<button>BOYNEXTDOOR</button>
			<button>NewJeans</button>
		</div>
	<hr>
	<div id="wrapper">
	    <div class="card" v-for="(item, index) in list">
	      <figure>
	        <img :src="item.thumbnail">
	      </figure>
	      <p>{{item.aTitle}}</p>
	    </div>
	</div>
</div>
</body>
</html>
<script>
var app = new Vue({
	el : '#app',
	data : {
		list : []
	},// data
	methods : {
		fnGetList : function(){
            var self = this;
            var nparmap = {};
            $.ajax({
                url : "/event/list4.dox",
                dataType:"json",	
                type : "POST", 
                data : nparmap,
                success : function(data) { 
                	self.list = data.list;
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