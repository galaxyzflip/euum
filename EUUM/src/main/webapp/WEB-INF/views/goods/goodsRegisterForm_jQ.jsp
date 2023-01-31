<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

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
			<!-- 추가옵션 입력칸 -->
			<dl style="min-height: 146px; border: 1px solid #d3d3d3; border-top: 0; padding: 4px 8px 4px 0">
				<button type="button" id="opAdd_bt" onclick="return opAdd();">옵션추가</button>
				<button type="button" id="opDel_bt" onclick="return opDel();return false;">삭제</button>
				<table border="0" cellspacing="0" cellpadding="0" id="" style="width: 100%;">
					<colgroup>
						<col width="8%">
						<col width="16%">
						<col>
						<col width="10%">
					</colgroup>

					<!-- 개수 추가되는 부분 -->
					<tbody class="opBody" id="opBody">
						<tbody class="opList_1" id="opList_1" style="background-color: rgb(255, 255, 255); height: 36px;">
							<tr>
								<td>
									<input type="text" name="opName_1" value="" style="width: 160px;">
	<!-- 								<button type="button" id="opContentAdd_bt_1" onclick="opContentAdd(this.id);">세부항목추가</button> -->
<!-- 									<button type="button" id="opContentAdd_bt" name="1">세부항목추가</button> -->
									<button type="button" class="opContentAdd_bt" id="opContentAdd_bt" name="1">세부항목추가</button>
								</td>
							</tr>
							<tr class="opContList_1" id="opContList_1">
								<td>
									<input type="text" name="opContent_1" value="" style="width: 410px">
								</td>
								<td>
									<input type="text" name="opPrice_1" onkeyup="onlyNum(this);" onkeydown="onlyNum(this);" onfocus="this.select();" value="1" class="price" style="width: 160px;">
									<input type="hidden" name="opUid_1" value="">
								</td>
<!-- 								<td> -->
<!-- 									<button type="button" id="opContentDel_bt" onclick="opContentDel();">X</button> -->
<!-- 								</td> -->
							</tr>
						</tbody>
					</tbody>

					<tbody>
						<tr id="opListNo" align="center" style="display: none;">
							<td height="192" bgcolor="#ffffff" colspan="9"></td>
						</tr>
					</tbody>
				</table>
			</dl>
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

$(document).ready(function() {
	let opNum = 1;
	let opContNum = 1;
	
	/* 옵션 추가 */
	$('#opAdd_bt').on('click',function() {
		let newBox = "";
		let opBody = document.querySelector('.opBody');
		
		opNum++;
		
		newBox += '<tbody class="opList_' + opNum + '" id="opList_' + opNum + '" style="background-color: rgb(255, 255, 255); height: 36px;">';
		newBox += '<tr><td>';
		newBox += '<input type="text" name="opName_' + opNum + '" value="" style="width: 160px;">';
// 		newBox += '<button type="button" id="opContentAdd_bt" name="' + opNum + '">세부항목추가</button>';
		newBox += '<button type="button" class="opContentAdd_bt" name="' + opNum + '">세부항목추가</button>';
		newBox += '</td></tr>';
		newBox += '<tr class="opContList_1" id="opContList_1">';
		newBox += '<td>';
		newBox += '<input type="text" name="opContent_1" value="" style="width: 410px">';
		newBox += '</td><td>';
		newBox += '<input type="text" name="opPrice_1" onkeyup="onlyNum(this);" onkeydown="onlyNum(this);" onfocus="this.select();" value="1" class="price" style="width: 160px;">';
		newBox += '<input type="hidden" name="opUid_1" value="">';
		newBox += '</td></tr></tbody>';
	
// 		newBox += '</td>';
// 		newBox += '<tr class="opContList_1" id="opContList_1">';
// 		newBox += '<td>';
// 		newBox += '<input type="text" name="opContent_1" value="" style="width: 410px">';
// 		newBox += '</td><td>';
// 		newBox += '<input type="text" name="opPrice_1" onkeyup="onlyNum(this);" onkeydown="onlyNum(this);" onfocus="this.select();" value="1" class="price" style="width: 160px;">';
// 		newBox += '<input type="hidden" name="opUid_1" value="">';
// 		newBox += '</td>';
// 		newBox += '</tr></tr>';
		
		opBody.insertAdjacentHTML('beforeend', newBox);
	})
	
	/* 옵션 세부항목 추가 */
	$('.opContentAdd_bt').on('click', function() {
//     function opContentAdd(buttonId) {
	
    var opContIndex = $(this).attr("name");
    var opList = document.querySelector("#opList_" + opContIndex);
    
    alert(opContIndex);

		let newBox = "";
		var opContList = document.querySelector('.opContList_' + opContIndex); 
		opContNum++;
		
		opContentAdd(opContList, opContNum);
		
		newBox += '<tr class="opContList_' + opContNum + '" id="opContList_' + opContNum + '">';
		newBox += '<td>';
		newBox += '<input type="text" name="opContent_' + opContNum + '" value="" style="width: 410px">';
		newBox += '</td><td>';
		newBox += '<input type="text" name="opPrice_' + opContNum + '" onkeyup="onlyNum(this);" onkeydown="onlyNum(this);" onfocus="this.select();" value="' + opContNum + '" class="price" style="width: 160px;">';
		newBox += '<input type="hidden" name="opUid_' + opContNum + '" value="">';
		newBox += '</td><td>';
		newBox += '<button type="button" id="opContentDel_bt" onclick="opContentDel();">X</button>';
		newBox += '</td></tr>';	
		
// 		opContList.insertAdjacentHTML('afterend', newBox);
		opList.insertAdjacentHTML('beforeend', newBox);
// 	}
	})
});

function opContentAdd(opContList, opContNum) {
    alert(buttonId);
    var opList = document.querySelector("#opList_" + opContIndex);
    
    newBox += '<tr class="opContList_' + opContNum + '" id="opContList_' + opContNum + '">';
	newBox += '<td>';
	newBox += '<input type="text" name="opContent_' + opContNum + '" value="" style="width: 410px">';
	newBox += '</td><td>';
	newBox += '<input type="text" name="opPrice_' + opContNum + '" onkeyup="onlyNum(this);" onkeydown="onlyNum(this);" onfocus="this.select();" value="' + opContNum + '" class="price" style="width: 160px;">';
	newBox += '<input type="hidden" name="opUid_' + opContNum + '" value="">';
	newBox += '</td><td>';
	newBox += '<button type="button" id="opContentDel_bt" onclick="opContentDel();">X</button>';
	newBox += '</td></tr>';	
	
	opList.insertAdjacentHTML('beforeend', newBox);
}
</script>

<style>
ul, ol, dl, li {
	list-style: none;
}
</style>