<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>

<div class="card shadow mb-4">
	<div class="card-header py-3">
		<h6 class="m-0 font-weight-bold text-primary">상품정보 확인</h6>
	</div>
	<div class="card-body">
		<div class="bd-example-snippet bd-code-snippet">
			<div class="bd-example">
				<form id="adminGoodsManagerForm" class="row g-3">
					<div class="row mb-2" style="margin-top: 16px;">
						<label for="inputGoodsCategory" class="col-sm-2 col-form-label">카테고리</label>
						<div class="col-sm-4">
							<input type="text" class="form-control" id="inputGoodsCategory" value="${goodsBean.goodsCategory}" readonly>
						</div>
					</div>
					<div class="row mb-2">
						<label for="inputGoodsUse" class="col-sm-2 col-form-label">제작용도</label>
						<div class="col-sm-4">
							<input type="text" class="form-control" id="inputGoodsUse" value="${goodsBean.goodsUse}" readonly>
						</div>
					</div>
					<div class="row mb-2">
						<label for="inputGoodsNum" class="col-sm-2 col-form-label">작품 번호</label>
						<div class="col-sm-4">
							<input type="text" class="form-control" name="goodsNum" id="inputGoodsNum" value="${goodsBean.goodsNum}" readonly>
						</div>
					</div>
					<div class="row mb-2">
						<label for="inputSellerNickname" class="col-sm-2 col-form-label">작가</label>
						<div class="col-sm-4">
							<input type="text" class="form-control" id="inputSellerNickname" value="${goodsBean.goodsSellerNickname}" readonly>
						</div>
					</div>
					<div class="row mb-2">
						<label for="inputGoodsName" class="col-sm-2 col-form-label">작품 이름</label>
						<div class="col-sm-9">
							<input type="text" class="form-control" id="inputGoodsName" value="${goodsBean.goodsName}" readonly>
						</div>
					</div>
					<div class="row mb-2" style="padding-bottom: 22px;">
						<label for="textGoodsContent" class="col-sm-2 col-form-label">상품 안내</label>
						<div class="col-sm-9">
							<div class="form-floating">
								<textarea class="form-control" id="textGoodsContent" style="height: 100px" readonly>${goodsBean.goodsContent}</textarea>
							</div>
						</div>
					</div>

					<div class="row mb-2">
						<label for="inputGoodsFormat" class="col-sm-2 col-form-label">제출 포맷</label>
						<div class="col-sm-4">
							<input type="text" class="form-control" id="inputGoodsFormat" value="${goodsBean.goodsFormat}" readonly>
						</div>
					</div>
					<div class="row mb-2">
						<label for="inputGoodsResolution" class="col-sm-2 col-form-label">해상도</label>
						<div class="col-sm-4">
							<input type="text" class="form-control" id="inputGoodsResolution" value="${goodsBean.goodsResolution}" readonly>
						</div>
					</div>
					<div class="row mb-2">
						<label for="inputGoodsSize" class="col-sm-2 col-form-label">기본 사이즈</label>
						<div class="col-sm-4">
							<input type="text" class="form-control" id="inputGoodsSize" value="${goodsBean.goodsSize}" readonly>
						</div>
					</div>
					<div class="row mb-2">
						<label for="inputGoodsModifyCount" class="col-sm-2 col-form-label">수정 횟수</label>
						<div class="col-sm-4">
							<input type="text" class="form-control" id="inputGoodsModifyCount" value="${goodsBean.goodsModifyCount}회" readonly>
						</div>
					</div>
					<div class="row mb-2" style="padding-bottom: 10px;">
						<label for="inputGoodsPeriod" class="col-sm-2 col-form-label">작업 기간</label>
						<div class="col-sm-4">
							<input type="text" class="form-control" id="inputGoodsPeriod" value="주문승인일로부터 ${goodsBean.goodsPeriod}일" readonly>
						</div>
					</div>

					<div class="row mb-2">
						<label for="imgs" class="col-sm-2 col-form-label">대표 이미지</label>
						<div>
							<img class="thumb" alt="1" src="${pageContext.request.contextPath}/resources/img/${goodsBean.goodsImageDate1}s_${goodsBean.goodsImage1}"> <img class="thumb" alt="2" src="${pageContext.request.contextPath}/resources/img/${goodsBean.goodsImageDate2}s_${goodsBean.goodsImage2}"> <img class="thumb" alt="3" src="${pageContext.request.contextPath}/resources/img/${goodsBean.goodsImageDate3}s_${goodsBean.goodsImage3}">
						</div>
					</div>

					<div class="col-sm-3" style="height: 24px;">
						<label for="inputOptName" class="form-label">추가옵션</label>
					</div>
					<div class="col-sm-5" style="height: 24px;">
						<label for="inputOptContent" class="form-label">옵션선택항목</label>
					</div>
					<div class="col-sm-2" style="height: 24px;">
						<label for="inputOptPrice" class="form-label">옵션가격</label>
					</div>

					<c:choose>
						<c:when test="${fn:length(optionList) > 0}">
							<c:forEach items="${optionList}" var="selectList" varStatus="status">
								<%-- 									<span class="option-name">${selectList[0].goodsOptName}</span> --%>
								<c:forEach items="${selectList}" var="row" varStatus="status">
									<div class="col-md-3">
										<input type="text" class="form-control" id="inputOptName" placeholder="" value="${row.goodsOptName}" style="margin-top: -8px;" readonly>
									</div>
									<div class="col-md-5">
										<input type="text" class="form-control" id="inputOptContent" placeholder="" value="${row.goodsOptContent}" style="margin-top: -8px;" readonly>
									</div>
									<div class="col-md-2">
										<input type="text" class="form-control" id="inputOptPrice" placeholder="" value="${row.goodsOptPrice}" style="margin-top: -8px;" readonly>
									</div>
								</c:forEach>
							</c:forEach>
						</c:when>
					</c:choose>

					<p></p>
					<div class="row mb-3">
						<label for="inputStatus" class="col-sm-3 col-form-label">상품상태 관리자 수정</label>
						<div class="col-md-5">
							<select class="form-select" name="goodsStatus" id="goodsStatus_select" aria-label="Default select example">
								<option value="승인대기">승인대기</option>
								<option value="승인완료">승인완료</option>
								<option value="거래중지">거래중지</option>
							</select>
						</div>
						<div class="col-md-3">
							<div class="col-sm-11">
<!-- 								<button type="submit" class="btn btn-primary">변경</button> -->
								<button type="button" id="modifyGoodsStatusBtn" class="btn btn-primary">변경</button>
								<button type="button" id="popupCloseBtn" class="btn btn-secondary">닫기</button>
							</div>
						</div>
					</div>
				</form>
			</div>
		</div>
	</div>
</div>

<script>
$(document).ready(function() {
    let goodsStatus = "<c:out value='${goodsBean.goodsStatus}'/>";
	
    /* goodsStatus 초기화 */
    $("#goodsStatus_select").val(goodsStatus).attr("selected", "selected");
});

$(function() {
    var modifyGoodsStatusBtn = $("#modifyGoodsStatusBtn");
    let goodsStatus = "<c:out value='${goodsBean.goodsStatus}'/>";
    let selectedOption = document.getElementById('goodsStatus_select');
    
    modifyGoodsStatusBtn.click(function() {
	    let goodsStatus_select = selectedOption.options[selectedOption.selectedIndex].text;
	    
	    if(goodsStatus === goodsStatus_select) {
			alert("기존과 동일한 상태로는 변경할 수 없습니다.");
			return false;
	    } else {
			const form = $("#adminGoodsManagerForm");
			form.attr("action", "/admin/goodsStatusModifyPro");
			form.attr("method", "post"); 
			form.submit();
			alert("'" + goodsStatus + "'" + "상태에서 " + "'" + goodsStatus_select + "'" + "상태로 변경되었습니다.");
	    }
    })
});


// X 버튼 클릭 종료
// $(window).bind("beforeunload", function(e) {
//     opener.parent.location.reload();
// });

// form이 submit시에 beforeunload를 비활성화
// $("#adminGoodsManagerForm").submit(function() {
// $(window).unbind('beforeunload');
// });


// 닫기 버튼 클릭 종료
$(function() {
    var popupCloseBtn = $("#popupCloseBtn");
	
    popupCloseBtn.click(function() {
		opener.parent.location.reload();
		window.close();
    })
});

</script>

<style>
.thumb {
	width: 212px;
	height: 159px;
}
</style>