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
  <div>이름 : <input v-model="info.sName"></div>
  <div>사번 : <input v-model="info.sNo" disabled="disabled"></div>
  <div>직통번호 : <input v-model="info.sPhone"></div>
  <div>부서 :
    <select v-model="info.sPart">
      <option value="">부서 선택</option>
      <option value="고객관리팀">고객관리팀</option>
      <option value="민원관리팀">민원관리팀</option>
      <option value="배송관리팀">배송관리팀</option>
      <option value="상품관리팀">상품관리팀</option>
      <option value="이사">이사</option>
    </select>
    <input disabled v-model="value">
  </div>
  <div>상사 : <input v-model="info.sBoss"></div>
  <button @click="fnEdit()">수정하기</button>
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
        case '고객관리팀':
          this.value = 'A';
          break;
        case '민원관리팀':
          this.value = 'C';
          break;
        case '배송관리팀':
          this.value = 'B';
          break;
        case '상품관리팀':
          this.value = 'D';
          break;
        case '이사':
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
          alert(self.info.sName + '님이 수정되었습니다.');
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
