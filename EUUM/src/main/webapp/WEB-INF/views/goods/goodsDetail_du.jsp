<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<script src="webjars/jquery/3.5.1/dist/jquery.min.js"></script>

<div class="mainDiv">
	<div class="topDiv">
		<div class="topUse">${detail.goodsUse}</div>
		<div class="topCategory">${detail.goodsCategory} / 작품번호: ${detail.goodsNum}</div>
		<div class="topSubject"><b>${detail.goodsName}</b></div>
	</div>
	<div class="middleDiv">
		<div class="middleLeftDiv">
			<div>
				<img src="${pageContext.request.contextPath}/resources/img/ex_nongdamgom.png" style="width: 625px;" />
			</div>
			<div>
				<img src="${pageContext.request.contextPath}/resources/img/ex_nongdamgom.png" style="width: 625px;" />
			</div>
			<div>
				<img src="${pageContext.request.contextPath}/resources/img/ex_nongdamgom.png" style="width: 625px;" />
			</div>
		</div>
		<div class="middleRightDiv">
			<!-- 작가프로필 -->
			<div style="height: 450px; border: 1px solid black;">
<!-- 			<div style="height: 450px;"> -->
				<span>작가프로필</span>
			</div>
			<!-- 상세옵션 (고정 개수) -->
			<div style="height: 280px; border: 1px solid black;">
<!-- 			<div style="height: 280px;"> -->
				<span>상세옵션<span>
				<dl>
					<dt>제출 파일 유형</dt>
					<dd>${detail.goodsFormat}</dd>
				</dl>
				<dl>
					<dt>해상도</dt>
					<dd>${detail.goodsResolution}</dd>
				</dl>
				<dl>
					<dt>기본 사이즈</dt>
					<dd>${detail.goodsSize}</dd>
				</dl>
				<dl>
					<dt>수정 횟수</dt>
					<dd>${detail.goodsModifyCount}</dd>
				</dl>
				<dl>
					<dt>작업 기간</dt>
					<dd>${detail.goodsPeriod}</dd>
				</dl>
			</div>
			<!-- 추가옵션 (유동 개수) -->
			<div style="display: inline-block; width:350px; border: 1px solid black;">
<!-- 			<div style="display: inline-block; width:350px;"> -->
				<span>추가옵션</span>
				<ul>
					<c:choose>
						<c:when test="${fn:length(optionList) > 0}">
							<c:forEach items="${optionList}" var="selectList" varStatus="status">
								<ul class="option_info">
									<span>${selectList[0].goodsOptName}</span>
									<select id="select_option" class="select_option" onChange="setTotalInfo();">
										<option value="0">선택하세요</option>
										<c:forEach items="${selectList}" var="row" varStatus="status">
											<option value="${row.goodsOptPrice}">
												${row.goodsOptContent} (<fmt:formatNumber value="${row.goodsOptPrice}" groupingUsed="true" />)
											</option>
										</c:forEach>
									</select>
								</ul>
							</c:forEach>
						</c:when>
					</c:choose>
				</ul>
			</div>
			<!-- 주문 -->
			<div style="display: inline-block; width:350px; height:200px; border: 1px solid black;">
<!-- 			<div style="display: inline-block; width:350px;"> -->
				<span>결제 금액</span><br/>
				<strong><span class="total_price">0</span> 원</strong>
				<button type="button">주문 하기</button>
			</div>
		</div>
	</div>
	<!-- 상품 상세안내 -->
	<div class="bottomDiv">
		<div class="content">
			<span>상세 안내</span>
			<div>${detail.goodsContent}</div>
		</div>
		
	</div>
		<!-- 테스트로 만들어본 input type file -->
		<div class="grid-wrapper">
			<input type="file">
			<input type="file">
			<input type="file">
		</div>
</div>

<script>
// 선민: 추가옵션에 따른 최종금액 계산
function setTotalInfo() {
	
	let totalPrice = 0;
	
	$(".option_info").each(function(index, element) {
	    let optionPrice = $(element).find(".select_option").val();
	    alert(optionPrice);
	    
		// 총 가격
		totalPrice += parseInt(optionPrice);
	});
	
	// 최종 합계 금액
	$(".total_price").text(totalPrice.toLocaleString());		
}
</script>

<style>
div {
	display: block;
}

ul {
	list-style: none;
}

.mainDiv {
/* 	background-color: #d3d3d3; */
	position: relative;
	width: 100%;
	margin: 0 auto;
	max-width: 1000px;
	min-height: 1000px;
}

.topDiv {
	height: 60px;
	margin: 120px 0px 30px;
}

.topUse {
	display: inline;
	margin: 0px 10px 0px 0px;
}

.topCategory {
	display: inline;
}

.topSubject {
	font-size: 4;
	margin: 10px 0px 10px 0px;
}

.middleDiv {
	max-width: 1080px;
	margin: 0 auto;
	display: flex;
	justify-content: center;
}

.middleLeftDiv {
	display: inline-block;
	width: 65%;
 	border: 1px solid black; 
}

.middleRightDiv {
	display: inline-block;
	width: 35%;
	text-align: center;
}

.bottomDiv {
	display: inline-block;
	border: 1px solid black; 
	position: relative;
	width: 100%;
	margin: 0 auto;
	max-width: 1000px;
	min-height: 300px;
}

.grid-wrapper {
	display: flex;
	justify-content: space-between;
}

.content {
	display: block;
	text-align: center;
	margin: 60px 0px 40px 0px
}





/* 자동 들여쓰기를 없애기 */
dd {
	margin: 0;
}

/* 제목부분을 왼쪽정렬하고, 오른쪽 패딩 여유분만들기 */
dt {
	float: left;
	padding-right: 10px;
}
</style>