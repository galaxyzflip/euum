<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<script src="webjars/jquery/3.5.1/dist/jquery.min.js"></script>

<div class="container" style="margin:100px">

	<form action="/goods/goodsRegisterPro" method="post" id="goodsForm" enctype="multipart/form-data">
		<div>
			<span>카테고리</span>
			<select name="goodsCategory">
				<option value="">선택하세요</option>
				<option value="캐릭터 일러스트">캐릭터 일러스트</option>
				<option value="일러스트">일러스트</option>
				<option value="디자인">디자인</option>
				<option value="3D 모델링">3D 모델링</option>
				<option value="웹툰 · 만화">웹툰 · 만화</option>
			</select>
		</div> 
		
		<div>	
			<span>제목</span>
			<input type="text" name="goodsName">
		</div>
		
		<div>
			<li><span>대표이미지</span></li>
			<li>
				<input type="file" name="uploadFile">
				<input type="file" name="uploadFile">
				<input type="file" name="uploadFile">
			</li>
		</div>
		
		<div>
			<li><span>상세옵션</span></li>
			<div>
				<li><span>제작용도</span></li>
				<li>
					<input type="radio" name="goodsUse" id="commercial" value="상업용">
					<label for="commercial">상업용</label>
					<input type="radio" name="goodsUse" id="no_commercial" value="비상업용">
					<label for="no_commercial">비상업용</label>
					<input type="radio" name="goodsUse" id="all_for_use" value="상업용+비상업용">
					<label for="all_for_use">상업용+비상업용</label>
				</li>
			</div>
			<div>
				<span>제출파일 유형</span>
				<input type="text" name="goodsFormat">
			</div>
			<div>
				<span>기본 사이즈</span>
				<input type="text" name="goodsSize">
			</div>
			<div>
				<span>작업 해상도</span>
				<input type="text" name="goodsResolution">
			</div>
			<div>
				<span>수정 횟수</span>
				<input type="text" name="goodsModifyCount"> 회
			</div>
			<div>
				<span>작업 소요기간</span>
				<select name="goodsPeriodOption">
					<option value="">선택하세요</option>
					<option value="결제일로부터">결제일로부터</option>
					<option value="시작일로부터">시작일로부터</option>
				</select>
				<input type="text" name="goodsPeriod"> 일
			</div>
		</div>
		
		<div>
			--- 추가옵션부분 ---
		</div>
	
		<div>
			환불정책
			<input type="" name="">
		</div>
		<div>
			<li><span>상세안내</span></li>
			<textarea name="goodsContent" cols="30" rows="5"></textarea>
		</div>
		
		<div style="position: fixed; bottom: 100px; right: 0; z-index: 10">
<!-- 			<div>임시 저장</div> -->
<!-- 			<div class="btn1" onclick="return checkForm();" style="margin-top: 8px">등 록</div> -->
			<div>
				<button type="button" id="registerTempBtn">임시 저장</button>
			</div>
			<div>
				<button type="submit" id="registerBtn" style="margin-top: 8px">등 록</button>
			</div>
		</div>
	</form>
</div>







<script>
$(function() {
    var registerTempBtn = $("#registerTempBtn");
	
    registerTempBtn.click(function() {
		const form = $("#goodsForm");
		form.attr("action", "/goods/goodsRegisterTempPro");
		form.attr("method", "post");
		form.submit();
    })
});
</script>

<style>
ul, ol, dl, li {
	list-style: none;
}
</style>