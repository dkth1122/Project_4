<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
 <script src="../js/jquery.js"></script>
<script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css" integrity="sha512-z3gLpd7yknf1YoNbCzqRKc4qyor8gaKU1qmn+CShxbuBusANI9QpRohGBreCFkKxLhei6S9CQXFEbbKuqLg0DA==" crossorigin="anonymous" referrerpolicy="no-referrer" />
<title>����� �Խ���</title>
<style>
</style>
</head>
<body>
<div id="app">
    <template>
      <div class="report-modal">
	      <h2>�Խù� �Ű�</h2>
	      <label>�Ű� ���� ����:</label>
	      <select v-model="selectedReason">
	        <option value="">�Ű� ���� ����</option>
	        <option value="A">�弳 �� ������</option>
	        <option value="B">�������� ������</option>
	        <option value="C">���� �� ����</option>
	        <option value="D">�ҹ� ������</option>
	        <option value="E">��Ÿ</option>
	      </select>
	      <input type="text" v-if="selectedReason === 'E'" v-model="otherReason" placeholder="��Ÿ �Ű� ���� �Է�">
	      <label>�߰� ����:</label>
	      <textarea v-model="reportDescription"></textarea>
	      <button @click="submitReport">�Ű��ϱ�</button>
    </div>
    </template>

</div>
</body>
</html>
<script>
var app = new Vue({
    el: '#app',
    data: {
        gNo: "${map.gNo}",
        uId: "${map.uId}",
        selectedReason: "",
        otherReason: "",
        reportDescription: "",
    },// data
    methods: {
        reportPost() {
        	var self = this;
        	self.selectedReason = ""; // �ʱ�ȭ
        	self.otherReason = ""; // �ʱ�ȭ
        	self.reportDescription = ""; // �ʱ�ȭ
        	self.showReportModal = true;
          },
          submitReport() {
        	 var self = this;
            if (!self.selectedReason) {
              alert("�Ű� ������ �������ּ���.");
              return;
            }
            // �Ű� �����͸� ������ �����ϴ� ���� �߰�
            var reportData = {
              gNo: self.gNo,
              reason: self.selectedReason,
              otherReason: self.otherReason,
              description: self.reportDescription,
              uId : self.uId
            };

            $.ajax({
              url: "report.dox", // �Ű� �����͸� ó���� ���� API �ּ�
              dataType: "json",
              type: "POST",
              data: reportData,
              success: function (data) {
                alert("�Ű� �����Ǿ����ϴ�. �����մϴ�.");
                window.opener.location.reload();
                window.close();
              }
            });
          }
        
    }, // methods
    created: function () {
    }// created
});
</script>