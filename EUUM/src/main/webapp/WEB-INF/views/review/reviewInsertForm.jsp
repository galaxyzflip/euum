<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script>
$(document).ready(function(){
	
	$("#reviewSubmit").on("click",function(e){
	
		e.preventDefault();
		
		var title = $('#title').val();
		var content = $('#reviewContent').val();
		
		var star = $('input:radio[name=reviewStar]').is(":checked");
		
		alert(star);
		
		if(star != true){
			alert("별점을 등록 해 주세요!");
			
			return false;
		}
		
		if(title == "" || title == null){
			alert("제목을 입력해 주세요.");
			
			return false;
		}
		
		if(content == "" || content== null){
			alert("내용을 입력 해 주세요.");
			
			return false;
			
		}
		
		$('#myform').submit();
		
		
	});
});
</script>

<div class="mainBody" style="margin: 100px;">
	<div class="mainDiv">
<!-- 		<form action="/goods/goodsRegisterPro" method="post" id="goodsForm" enctype="multipart/form-data" onsubmit="return registerValidate()"> -->
		<!-- <form action="/goods/goodsRegisterPro" method="post" id="goodsForm" enctype="multipart/form-data"> -->
		<form id="myform" action="/review/insertPro" method="post" enctype="multipart/form-data">
			
			
			<input type="hidden" name="memberNum" value="${memberNum}">
			<input type="hidden" name="goodsNum" value="${goodsNum}">
			<input type="hidden" name="orderNum" value="${orderKeyNum}">	
			<input type="hidden" name="reviewWriter" value="${memberName}">
		
			<div class="div_register">
			<h1><strong>리뷰 등록</strong></h1>
			<hr style="border:solid 1px #FF6600;"><br/><br/>
				<table>
					<tr>
						<th>별점</th>
						<th>
						<fieldset>
							<span class="text-bold"></span>
							<input type="radio" name="reviewStar" value="5" id="rate1">
							<label for="rate1">★</label>
							<input type="radio" name="reviewStar" value="4" id="rate2">
							<label for="rate2">★</label>
							<input type="radio" name="reviewStar" value="3" id="rate3">
							<label for="rate3">★</label>
							<input type="radio" name="reviewStar" value="2" id="rate4">
							<label for="rate4">★</label>
							<input type="radio" name="reviewStar" value="1" id="rate5">
							<label for="rate5">★</label>
						</fieldset>	
						</th>	
						
					</tr>
					<tr>
						<th>제목</th>
						<td>
							<input type="text" name="reviewTitle" id="title" class="input_text_l" placeholder="특수문자, 이모티콘 등으로 제목을 강조하는 경우 예고 없이 삭제됩니다">
							<span class="span_validate" id="goodsNameMsg" aria-live="assertive"></span>
						</td>
					</tr>
				</table>
			</div>
			<div class="div_register">
				<table>
					<tr>
						<th>사진 등록</th>
						<td>
							<input type="file" name="uploadFile"/>
							<input type="file" name="uploadFile"/>
							<input type="file" name="uploadFile"/>
						</td>
					</tr>
				</table>
				<div class="caution" style="margin:10px 0 0 150px;">
					<span class="span_validate" style="margin-left: 0px;" id="uploadFileMsg" aria-live="assertive"></span>
				</div>
				<div class="caution" style="margin:10px 0 0 150px;">
				* 권장 사이즈 : 가로 세로 4 : 3 비율 <span class="lsp0">( 732px x 549px )</span> / 1개당 최대 용량 20MB <br>
				* 업로드 중 에러가 발행할 경우 이미지 사이즈를 줄여주세요.
				</div>
			</div>
			
			
			<div class="div_register">
				<table>
					<tr>
						<th>후기입력</th>
						<td>
							<textarea class="col-auto form-control" type="text" name="reviewContent" id="reviewContent"
									  placeholder="후기를 입력 해 주세요."></textarea>
						</td>
					</tr>
				</table>
				<div class="caution" style="margin:10px 0 0 150px;">
					<span class="span_validate" style="margin-left: 0px;" id="goodsContentMsg" aria-live="assertive"></span>
				</div>
			</div>
				
				<div>
<!-- 					<button type="submit" id="registerBtn" style="margin-top: 8px">등록</button> -->
					<button type="submit" id="reviewSubmit" style="margin-top: 8px">등록</button>
				</div>
			</div>

		</form>
	</div>
</div>










<style>
ul, ol, dl, li {
	list-style: none;
}
th {
	width: 150px;
}
table {
	border-collapse: separate;
	border-spacing: 0 5px;
}
/* tr { */
/* 	margin-bottom: 15px; */
/* } */
.mainDiv {
	width: 950px;
	margin: 130px auto 0 auto;
}
.input_text_l {
	width: 634px;
}

.input_text_s {
	width: 150px;
}

.input_text_ss {
	width: 70px;
}

.input_file {
	width: 250px;
}

.input_options {
	display: inline-block;
}

.label_radio {
	padding-right: 15px;
}

.td_s {
	width: 240px;
}

.div_register {
	padding-bottom: 30px;
}
.caution {
	font-size: 11px;
	color: #FF6600;
}
.span_validate {
	font-size: 12px;
	margin-left: 10px;
	color: red;
}

#myform fieldset{
   display: inline-block;
   direction: rtl;
   border:0;
}
#myform fieldset legend{
    text-align: right;
}
#myform input[type=radio]{
    display: none;
}
#myform label{
    font-size: 3em;
    color: transparent;
    text-shadow: 0 0 0 #f0f0f0;
}
#myform label:hover{
    text-shadow: 0 0 0 rgba(250, 208, 0, 0.99);
}
#myform label:hover ~ label{
    text-shadow: 0 0 0 rgba(250, 208, 0, 0.99);
}
#myform input[type=radio]:checked ~ label{
    text-shadow: 0 0 0 rgba(250, 208, 0, 0.99);
}
#reviewContents {
    width: 100%;
    height: 150px;
    padding: 10px;
    box-sizing: border-box;
    border: solid 1.5px #D3D3D3;
    border-radius: 5px;
    font-size: 16px;
    resize: none;
}

</style>