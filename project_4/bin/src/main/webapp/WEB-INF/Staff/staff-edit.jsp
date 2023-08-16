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
</style>
</head>
<body>
<div id="app">
  <div>�̸� : <input v-model="info.sName"></div>
  <div>��� : <input v-model="info.sNo" disabled="disabled"></div>
  <div>�����ȣ : <input v-model="info.sPhone"></div>
  <div>�μ� :
    <select v-model="info.sPart">
      <option value="">�μ� ����</option>
      <option value="��������">��������</option>
      <option value="�ο�������">�ο�������</option>
      <option value="��۰�����">��۰�����</option>
      <option value="��ǰ������">��ǰ������</option>
      <option value="�̻�">�̻�</option>
    </select>
    <input disabled v-model="info.value">
  </div>
  <div>��� : <input v-model="info.sBoss"></div>
  <button @click="fnEdit()">�����ϱ�</button>
</div>

<script>
var app = new Vue({
  el: '#app',
  data: {
    ssisonsNo: "${map.sNo}",
    info: {
      sName: "",
      sNo: "",
      sPhone: "",
      sBoss: "",
      sPart: "",
      sPosition: "",
      value : ""
    },
  },
  computed: {
    valueDisabled() {
      return true;
    },
  },
  watch: {
    'info.sPart'(newVal) {
      switch (newVal) {
        case '��������':
          this.info.value = 'A';
          break;
        case '�ο�������':
          this.info.value = 'C';
          break;
        case '��۰�����':
          this.info.value = 'B';
          break;
        case '��ǰ������':
          this.info.value = 'D';
          break;
        case '�̻�':
          this.info.value = 'M';
          break;
        default:
          this.info.value = '';
          break;
      }
    },
  },
  methods: {
    fnGetList() {
      const self = this;
      const param = {ssisonsNo: self.ssisonsNo};
      $.ajax({
        url: '/staff/infoView.dox',
        dataType: 'json',
        type: 'POST',
        data: param,
        success(data) {
          self.info = data.info;
        },
      });
    },
    fnEdit() {
      const self = this;
      const nparmap = self.info;
      $.ajax({
        url: "/staff/edit.dox",
        dataType: 'json',
        type: 'POST',
        data: nparmap,
        success(data) {
          alert(self.info.sName + '���� �����Ǿ����ϴ�.');
          window.close(); // �˾�â �ݱ�
     	  window.opener.location.reload(); // �θ�â ���ΰ�ħ
        },
      });
    },
  },
  created() {
    this.fnGetList();
  },
});
</script>
