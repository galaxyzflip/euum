<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<script src="webjars/jquery/3.5.1/dist/jquery.min.js"></script>

<!DOCTYPE html>
<div class="guideBoxDiv">
	<ul class="title red">※ 작품 등록 전에 확인하세요.</ul>
	<ol>
		<img src="/resources/img/exclamation_mark.png"/>&nbsp;&nbsp;<font class="bold red"> AI가 제작한 제작물</font>은 등록 및 판매가 불가능하며, 타인에게 저작권이 있는 이미지는 저작권자의 허락 없이<br/>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;등록할 수 없습니다.<br/>
		<img src="/resources/img/exclamation_mark.png"/>&nbsp;&nbsp;이음은 회원 간의 <font class="bold red">직거래 및 직거래 유도 행위</font>를 금지하고 있습니다.<br/>
		<img src="/resources/img/exclamation_mark.png"/>&nbsp;&nbsp;<font class="bold red">결제 이전에 연락처</font>를 교환할 수 없고, 결제는 이음의 주문시스템 및 결제 계좌를 이용하셔야 합니다.<br/>
		<img src="/resources/img/exclamation_mark.png"/>&nbsp;&nbsp;규정을 2회 위반할 경우, <font class="bold red">회원 자격이 정지</font>됩니다.<br/>
		<img src="/resources/img/exclamation_mark.png"/>&nbsp;&nbsp;의뢰자와 작가의 <font class="bold">연락처는 결제가 확인되면 </font>주문내역에 공개되며 문의 및 답변으로 전달이 가능합니다.<br/>
		<img src="/resources/img/exclamation_mark.png"/>&nbsp;&nbsp;환불은 이음의 <font class="bold red">환불 규정</font>을 따라주셔야 합니다.
		<a href="" class="refundRule">[ 환불 규정 보기 ]</a><br/>
		<img src="/resources/img/exclamation_mark.png"/>&nbsp;&nbsp;미성년자는 법정대리인 동의 없이 거래를 진행할 수 없습니다.<br/>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;따라서, 미성년자의 경우 법정대리인의 허락을 받으신 후 이용하시기 바랍니다<br/>
		<br/>
		이음은 만 14세 이상의 회원들이 이용하는 사이트로서	하반신, 전신 노출 및 성기 노출, 노골적인 성행위 표현, 신체 훼손 이미지, 잔인한 살해 이미지,	기괴한 공포물, 
		심한 욕설 포함, 마약 사용 조장, 비윤리적, 비도덕적, 지나치게 선정적, 다수에게 불쾌감을 주는 이미지는 등록하실 수 없습니다.<br/>
	</ol>
</div>
<div class="checkBoxDiv">
	<ul>
		<input type="checkbox" name="agree1" id="agree1">
		<label for="agree1">본인은 만 14세 이상이며, 해당 내용을 위반시 이에 대한 책임을 지겠습니다.</label>
	</ul>
	<ul>
		<input type="checkbox" name="agree2" id="agree2">
		<label for="agree2">상기 내용에 동의하며, 이음의 환불 규정에 따를 것을 동의합니다.</label><br/>
	</ul>
</div>
<div class="buttonDiv">
<!-- 	<a href="goods/goodsRegisterForm">내용에 동의합니다.</a> -->
	<button type="button" id="agree_bt">내용에 동의합니다.</button>
</div>

<!-- 선민: 체크박스 유효성검사, 페이지 이동  -->
<script>
$(document).ready(function() {
	$("#agree_bt").click(function() {
		if ($("#agree1").is(":checked") == false) {
			alert("필수 동의 사항을 선택하세요.");
			return false;
		} else if ($("#agree2").is(":checked") == false) {
			alert("필수 동의 사항을 선택하세요.");
			return false;
			} else {
			location.href = "/goods/goodsRegisterForm";
		}
	});
});
</script>


<style>
div {
	display: block;
}

ol {
    display: block;
    list-style-type: decimal;
    margin-block-start: 1em;
    margin-block-end: 0px;
    margin-inline-start: 0px;
    margin-inline-end: 0px;
    padding-inline-start: 0px;
}

button {
	border: 1px solid;
}

.guideBoxDiv {
	border: 1px solid #dadada;
	padding: 54px 70px;
	width: 850px;
	margin: 130px auto 0 auto;
	box-sizing: border-box;
	font-size: 14px;
	line-height:10px;
}

a.refundRule:hover {
   text-decoration: underline;
}

.guideBoxDiv ol {
    line-height: 180%;
}

.checkBoxDiv {
	display: block;
	width: 494px; /* 글자 수랑 딱 맞게 */
	margin: 40px auto 0 auto;
	font-size: 14px;
	line-height:10px;
}

.checkBoxDiv ul {
/* 	position: absolute; */
	padding: 0 10px 10px 0;
}

.buttonDiv {
	display: flex;
	justify-content: center;
	margin: 40px auto auto auto;
	padding-bottom: 100px;
}

.title {
	text-align: center;
	font-size: 22px;
	font-weight: bold;
	padding-bottom: 30px;
}

.bold {
	font-weight: bold;
}

.red {
	color: #CE1212;
}

#agree_bt {
	width: 248px;
    height: 58px;
    line-height: 58px;
    background: #343434;
    color: #fff;
    text-align: center;
    cursor: pointer;
    margin: 0 auto;
    float: right;
}

</style>