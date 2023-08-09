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
    <input disabled v-model="value">
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
      sName: '',
      sNo: '',
      sPhone: '',
      sBoss: '',
      sPart: '',
    },
    value: '',
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
          this.value = 'A';
          break;
        case '�ο�������':
          this.value = 'C';
          break;
        case '��۰�����':
          this.value = 'B';
          break;
        case '��ǰ������':
          this.value = 'D';
          break;
        case '�̻�':
          this.value = 'M';
          break;
        default:
          this.value = '';
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
      const nparmap = {
        sNo: self.info.sNo,
        sName: self.info.sName,
        sPhone: self.info.sPhone,
        sBoss: self.info.sBoss,
        sPart: self.info.sPart,
        sPosition: self.value,
      };

      $.ajax({
        url: "/staff/edit.dox",
        dataType: 'json',
        type: 'POST',
        data: nparmap,
        success(data) {
          alert(self.info.sName + '���� �����Ǿ����ϴ�.');
          location.href = 'main.do';
        },
      });
    },
  },
  created() {
    this.fnGetList();
  },
});
</script>
