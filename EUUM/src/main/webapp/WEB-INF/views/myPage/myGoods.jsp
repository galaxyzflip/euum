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

	<div class="myGoods">
		<div class="myGoodsList" style="padding-bottom:20px">
			<li>[내 상품]</li>
			<c:choose>
				<c:when test="${fn:length(myGoodsMap.myGoodsList) > 0}">
					<c:forEach items="${myGoodsMap.myGoodsList}" var="row" varStatus="status">
						<div style="padding-bottom: 15px">
							<table style="border: solid 1px">
								<tr id="tr_${row.goodsNum}">
									<td class="myg_category">${row.goodsCategory}</td>
									<%-- <td class="myg_category">${row.goodsNum}</td> --%>
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
	
		<div class="myUnapprovedGoodsList" style="padding-bottom:20px">
			<li>[승인대기 중인 상품]</li>
			<c:choose>
				<c:when test="${fn:length(myGoodsMap.myUnapprovedGoodsList) > 0}">
					<c:forEach items="${myGoodsMap.myUnapprovedGoodsList}" var="row" varStatus="status">
						<div style="padding-bottom: 15px">
							<table style="border: solid 1px">
								<tr id="tr_unapproved_${row.goodsNum}">
									<td class="myg_category">${row.goodsCategory}</td>
									<%-- <td class="myg_category">${row.goodsNum}</td> --%>
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
	
		<div class="myTempGoodsList" style="padding-bottom:20px">
			<li>[임시 저장된 상품]</li>	
			<c:choose>
				<c:when test="${fn:length(myGoodsMap.myTempGoodsList) > 0}">
					<c:forEach items="${myGoodsMap.myTempGoodsList}" var="row" varStatus="status">
						<div style="padding-bottom: 15px">
							<table style="border: solid 1px">
								<tr id="tr_temp_${row.goodsNum}">
									<td class="myg_category">${row.goodsCategory}</td>
									<%-- <td class="myg_category">${row.goodsNum}</td> --%>
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
	</div>
	<br/>
	
	<div>맵: ${myGoodsMap}</div><br/>
</div>

<script>
function deleteMyGoods(status, index) {
    let formData = new FormData(); // 가상의 <form>태그 객체를 생성
    let goodsNum;
    
    if(!confirm("정말 삭제하시겠습니까?")) { return false; }
    else {}
    
	switch(status) {
		case '승인완료':
			goodsNum = document.querySelector('div.myGoodsList input[id=goodsNum_' + index + ']').value;
			break;
		case '승인대기':
			goodsNum = document.querySelector('div.myUnapprovedGoodsList input[id=goodsNum_' + index + ']').value;
			break;
		case '임시저장':
			goodsNum = document.querySelector('div.myTempGoodsList input[id=goodsNum_' + index + ']').value;
			break;
		default:
			alert('이거뜨면먼가오류있음');
	}

	// 1. 가상의 <form>태그에 전송할 data를 담기
	formData.append("goodsNum", goodsNum);
		
	// 2-1. 약간의 옵션을 설정하고 Ajax로 전송 후 html 코드를 remove()
// 	$.ajax({
// 		url: '/goods/goodsDeletePro',
// 		processData: false,
// 		contentType: false,
// 		data: formData,
// 		type: 'POST',
		
// 		success: function(result) { alert("상품이 정상적으로 삭제되었습니다."); }	
// 	}); // $.ajax
	
	// 2-2. 약간의 옵션을 설정하고 Ajax로 전송 후 새 DB 데이터를 result로 받아오기
	$.ajax({
		url: '/goods/goodsDeletePro',
		processData: false,
		contentType: false,
		data: formData,
		type: 'POST',
		
		success: function(result) { 
		    alert("상품이 정상적으로 삭제되었습니다.");
		    var html = jQuery('<div>').html(result);
			var contents = html.find("div.myGoods").html();
			$(".myGoods").html(contents);
		}	
	}); // $.ajax
	
	
	// 3. 삭제결과를 화면에 반영하기 위해 html 코드를 remove() (2-1 이후에 사용)
// 	let tr;
	
// 	switch(status) {
// 	case '승인완료':
// 		// $('#tr_'+goodsNum).remove();
// 	    tr = 'tr_' + goodsNum;
// 		break;
// 	case '승인대기':
// 	    tr = 'tr_unapproved_' + goodsNum;
// 		break;
// 	case '임시저장':
// 	    tr = 'tr_temp_' + goodsNum;
// 		break;
// 	default:
// 		alert('이거뜨면먼가오류있음');
// 	}
	
	document.getElementById(tr).remove();
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

