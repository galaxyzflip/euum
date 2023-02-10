<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

<div class="container" style="margin:100px">

<!-- 	<form action="/goods/goodsRegisterPro" method="post" id="goodsForm" enctype="multipart/form-data"> -->
	<form action="/goods/goodsModifyPro" method="post" id="goodsForm" enctype="multipart/form-data">
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
			<span>상품 번호</span>
			<span>${goods.goodsNum}</span>
			<input type="hidden" name="goodsNum" value="${goods.goodsNum}">
			<input type="hidden" name="goodsStatus" value="${goods.goodsStatus}">
		</div>
		
		<div>	
			<span>제목</span>
			<input type="text" name="goodsName" value="${goods.goodsName}">
		</div>
		
		<div>
			<li><span>현재 등록된 이미지</span></li>
			<li>
				<c:choose>
					<c:when test="${goods.goodsImage1 eq null}">
						<img class="thumb" src="/resources/img/no_image.png">
					</c:when>
					<c:otherwise>
						<img class="thumb" src="/resources/img/${goods.goodsImageDate}s_${goods.goodsImage1}">
					</c:otherwise>
				</c:choose>
				<c:choose>
					<c:when test="${goods.goodsImage2 eq null}">
						<img class="thumb" src="/resources/img/no_image.png">
					</c:when>
					<c:otherwise>
						<img class="thumb" src="/resources/img/${goods.goodsImageDate}s_${goods.goodsImage2}">
					</c:otherwise>
				</c:choose>
				<c:choose>
					<c:when test="${goods.goodsImage3 eq null}">
						<img class="thumb" src="/resources/img/no_image.png">
					</c:when>
					<c:otherwise>
						<img class="thumb" src="/resources/img/${goods.goodsImageDate}s_${goods.goodsImage3}">
					</c:otherwise>
				</c:choose>
			</li>
		</div>
		<div>
			<li><span>변경할 대표이미지</span></li>
			<li>
				<input type="file" name="uploadFile">
				<input type="file" name="uploadFile">
				<input type="file" name="uploadFile">
			</li>
		</div>
		
		<div>
			<li><span>상세옵션</span></li>
			<div id="goodsUse_radio">
				<li><span>제작용도</span></li>
				<li>
					<input type="radio" name="goodsUse" id="commercial" value="상업용">
					<label for="commercial">상업용</label>
					<input type="radio" name="goodsUse" id="no_commercial" value="비상업용">
					<label for="no_commercial">비상업용</label>
					<input type="radio" name="goodsUse" id="all_for_use" value="상업용+비상업용">
					<label for="all_for_use">상업용+비상업용</label>
					<!-- checked="checked" 속성을 태그에 추가 -->
				</li>
			</div>
			<div>
				<span>제출파일 유형</span>
				<input type="text" name="goodsFormat" value="${goods.goodsFormat}">
			</div>
			<div>
				<span>기본 사이즈</span>
				<input type="text" name="goodsSize" value="${goods.goodsSize}">
			</div>
			<div>
				<span>작업 해상도</span>
				<input type="text" name="goodsResolution" value="${goods.goodsResolution}">
			</div>
			<div>
				<span>수정 횟수</span>
				<input type="text" name="goodsModifyCount" value="${goods.goodsModifyCount}"> 회
			</div>
			<div>
				<span style="padding-right:30px;">작업 소요기간</span>
				<span>주문 승인일로부터</span>
				<input type="text" name="goodsPeriod" value="${goods.goodsPeriod}"> 일
			</div>
		</div>
		
		<div>
			<!-- 추가옵션 입력칸 -->
<!-- 				<button type="button" id="opAdd_bt" onclick="return opAddList();">옵션추가</button> -->
			<button type="button" id="opAdd_bt">옵션추가</button>
			<!-- <button type="button" id="opDel_bt">삭제</button> -->
			<table style="width: 100%;">
				<!-- 개수 추가되는 부분 -->
				<tbody class="opBody" id="opBody">
				<c:choose>
					<c:when test="${fn:length(optionList) > 0}">
						<c:forEach items="${optionList}" var="row" varStatus="status">
							<tr class="opList_${status.count}" id="opList_${status.count}">
								<td>
									<input type="text" name="goodsOptNameArr" value="${row.goodsOptName}" style="width: 160px;">
									<input type="text" name="goodsOptContentArr" value="${row.goodsOptContent}" style="width: 500px">
									<input type="text" name="goodsOptPriceArr" value="${row.goodsOptPrice}" style="width: 160px;">
									<c:if test="${status.count ne 1}">
										<button type="button" id="opContentDel_bt" onclick="opContentDel(${status.count});">X</button>
									</c:if>
								</td>
							</tr>
						</c:forEach>
					</c:when>
				</c:choose>
				
				
<!-- 					<tr class="opList_1" id="opList_1"> -->
<!-- 						<td> -->
<!-- 							<input type="text" name="goodsOptions[0].goodsOptName" style="width: 160px;"> -->
<!-- 							<input type="text" name="goodsOptions[0].goodsOptContent" style="width: 500px"> -->
<!-- 							<input type="text" name="goodsOptions[0].goodsOptPrice" style="width: 160px;"> -->
<!-- 							<input type="text" name="goodsOptNameArr" style="width: 160px;"> -->
<!-- 							<input type="text" name="goodsOptContentArr" style="width: 500px"> -->
<!-- 							<input type="text" name="goodsOptPriceArr" style="width: 160px;"> -->
<!-- 						</td> -->
<!-- 					</tr> -->
				
				
				</tbody>
			</table>
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
$(document).ready(function() {
    let goodsUse = "<c:out value='${goods.goodsUse}'/>";
    let goodsUseInput;
    
    /* 상품 사용용도 초기화 */
    switch(goodsUse) {
		case '상업용':
			goodsUseInput = document.querySelector('input[id=commercial]');
			break;
		case '비상업용':
		    goodsUseInput = document.querySelector('input[id=no_commercial]');
			break;
		case '상업용+비상업용':
		    goodsUseInput = document.querySelector('input[id=all_for_use]');
			break;
		default:
			alert('이거뜨면먼가오류있음');
	}
	goodsUseInput.setAttribute('checked', true);
});


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
// 	let opNum = "<c:out value='${optionCount}'/>";
	let opNum = "<c:out value='${fn:length(optionList)}'/>"; 
	alert(opNum);
	
	/* 옵션 추가 */
	$('#opAdd_bt').on('click',function() {
		let newBox = "";
		let opBody = document.querySelector('.opBody');
		
		opNum++;
		
		newBox += '<tr class="opList_' + opNum + '" id="opList_' + opNum + '">';
		newBox += '<td>';
		newBox += '<input type="text" name="goodsOptNameArr" style="width: 160px;">';
		newBox += '<input type="text" name="goodsOptContentArr" style="width: 500px">';
		newBox += '<input type="text" name="goodsOptPriceArr" style="width: 160px;">';
		newBox += '<button type="button" id="opContentDel_bt" onclick="opContentDel(' + opNum + ');">X</button>';
		newBox += '</td></tr>';
	
		opBody.insertAdjacentHTML('beforeend', newBox);
		
		alert(opNum);
	})
});

function opContentDel(index) {
    var opList = document.getElementById("opList_" + index);
    opList.remove();
}
</script>

<style>
ul, ol, dl, li {
	list-style: none;
}
.thumb {
	width: 160px;
	height:120px; 
}
</style>