<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<script src="webjars/jquery/3.5.1/dist/jquery.min.js"></script>

<div style="margin: 100px">
	<div>
		<h2>내 작품 관리</h2>
	</div><br/>
	<div>
		<!-- <a href="/goods/goodsRegisterGuide">작품 등록</a> -->
		<button type="button" onclick="location.href='/goods/goodsRegisterGuide'">작품 등록</button>
	</div><br/>

	<div class="myGoodsList">
		<li>[내 상품]</li>
		<c:choose>
			<c:when test="${fn:length(myGoodsMap.myGoodsList) > 0}">
				<c:forEach items="${myGoodsMap.myGoodsList}" var="row" varStatus="status">
					<div style="padding-bottom: 15px">
						<table style="border: solid 1px">
							<tr>
								<%-- <td class="myg_category">${row.goodsCategory}</td> --%>
								<td class="myg_category">${row.goodsNum}</td>
								<td>
									<img class="thumb" src="/resources/img/${row.goodsImageDate}s_${row.goodsImage1}">
									<img class="thumb" src="/resources/img/${row.goodsImageDate}s_${row.goodsImage2}">
									<img class="thumb" src="/resources/img/${row.goodsImageDate}s_${row.goodsImage3}">
								</td>
								<td class="myg_info">
									<li>${row.goodsName} / ${row.goodsUse}</li>
									<li>${row.goodsSellerNickname} / ${row.goodsPrice}</li>
								</td>
								<td class="myg_button">
									<input type="hidden" id="goodsNum_${status.index}" value="${row.goodsNum}"/>
									<button type="button" onclick="">수정</button>
									<button type="button" onclick="deleteMyGoods('${row.goodsStatus}', ${status.index});">삭제</button>
								</td>
							</tr>
						</table>
					</div>
				</c:forEach>
			</c:when>
			<c:otherwise>
				판매중인 내 상품이 없습니다.
			</c:otherwise>
		</c:choose>
	</div>
	<br/>

	<div class="myUnapprovedGoodsList">
		<li>[승인대기 중인 상품]</li>
		<c:choose>
			<c:when test="${fn:length(myGoodsMap.myUnapprovedGoodsList) > 0}">
				<c:forEach items="${myGoodsMap.myUnapprovedGoodsList}" var="row" varStatus="status">
					<div style="padding-bottom: 15px">
						<table style="border: solid 1px">
							<tr>
								<%-- <td class="myg_category">${row.goodsCategory}</td> --%>
								<td class="myg_category">${row.goodsNum}</td>
								<td>
									<img class="thumb" src="/resources/img/${row.goodsImageDate}s_${row.goodsImage1}">
									<img class="thumb" src="/resources/img/${row.goodsImageDate}s_${row.goodsImage2}">
									<img class="thumb" src="/resources/img/${row.goodsImageDate}s_${row.goodsImage3}">
								</td>
								<td class="myg_info">
									<li>${row.goodsName} / ${row.goodsUse}</li>
									<li>${row.goodsSellerNickname} / ${row.goodsPrice}</li>
								</td>
								<td class="myg_button">
									<input type="hidden" id="goodsNum_${status.index}" value="${row.goodsNum}"/>
									<button type="button" onclick="">수정</button>
									<button type="button" onclick="deleteMyGoods('${row.goodsStatus}', ${status.index});">삭제</button>
								</td>
							</tr>
						</table>
					</div>
				</c:forEach>
			</c:when>
			<c:otherwise>
				<span>승인 대기중인 상품이 없습니다.</span>
			</c:otherwise>
		</c:choose>
	</div>
	<br/>

	<div class="myTempGoodsList">
		<li>[임시 저장된 상품]</li>	
		<c:choose>
			<c:when test="${fn:length(myGoodsMap.myTempGoodsList) > 0}">
				<c:forEach items="${myGoodsMap.myTempGoodsList}" var="row" varStatus="status">
					<div style="padding-bottom: 15px">
						<table style="border: solid 1px">
							<tr>
								<%-- <td class="myg_category">${row.goodsCategory}</td> --%>
								<td class="myg_category">${row.goodsNum}</td>
								<td>
									<img class="thumb" src="/resources/img/${row.goodsImageDate}s_${row.goodsImage1}">
									<img class="thumb" src="/resources/img/${row.goodsImageDate}s_${row.goodsImage2}">
									<img class="thumb" src="/resources/img/${row.goodsImageDate}s_${row.goodsImage3}">
								</td>
								<td class="myg_info">
									<li>${row.goodsName} / ${row.goodsUse}</li>
									<li>${row.goodsSellerNickname} / ${row.goodsPrice}</li>
								</td>
								<td class="myg_button">
									<input type="hidden" id="goodsNum_${status.index}" name="goodsNum" value="${row.goodsNum}"/>
									<button type="button" id="modifyMyGoodsBtn" onclick="">수정</button>
									<button type="button" id="deleteMyGoodsBtn" onclick="deleteMyGoods('${row.goodsStatus}', ${status.index});">삭제</button>
								</td>
							</tr>
						</table>
					</div>
				</c:forEach>
			</c:when>
			<c:otherwise>
				<span>임시 저장된 상품이 없습니다.</span>
			</c:otherwise>
		</c:choose>
	</div>
	<br/>
	<br/>
	
	<div>맵: ${myGoodsMap}</div><br/>
</div>

<script>
function deleteMyGoods(status, index) {
    let formData = new FormData(); // 가상의 <form>태그 객체를 생성
    let goodsNum;
    
	switch(status) {
		case '승인완료':
			alert('승인완료');
			goodsNum = document.querySelector('div.myGoodsList input[id=goodsNum_' + index + ']').value;
			alert(goodsNum);
			break;
		case '승인대기':
			alert('승인대기');
			goodsNum = document.querySelector('div.myUnapprovedGoodsList input[id=goodsNum_' + index + ']').value;
			alert(goodsNum);
			break;
		case '임시저장':
			alert('임시저장');
			goodsNum = document.querySelector('div.myTempGoodsList input[id=goodsNum_' + index + ']').value;
			alert(goodsNum);
			break;
		default:
			alert('이거뜨면먼가오류있음');
	}

	// 1. 가상의 <form>태그에 data를 넣는 과정
	formData.append("goodsNum", goodsNum);
		
	// 2. Ajax로 전송 시 약간의 옵션이 붙는 과정
	$.ajax({
		url: '/~~~',
		processData: false,
		contentType: false,
		data: formData,
		type: 'POST',
		
		dataType: 'json', // Ajax를 호출했을 때의 결과타입 = dataType
		
		success: function(result) {
		    alert("업로드 됨");
		}
	}); // $.ajax
}
</script>

<style>
li {
	list-style: none;
}
.thumb {
	width: 160px;
	height:120px; 
}
.small {
	width: 100px;
	height:75px; 
}
.myg_category {
	width: 100px;
}
.myg_info {
	padding-left: 20px;
	width: 400px;
}
.myg_button {
	padding-left: 20px;
	width: 160px;
}
</style>

