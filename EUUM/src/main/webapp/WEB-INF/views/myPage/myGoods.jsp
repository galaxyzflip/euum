<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

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
									<td class="myg_sts">${row.goodsStatus}</td>
									<%-- <td class="myg_category">${row.goodsNum}</td> --%>
									<td>
										<c:choose>
											<c:when test="${row.goodsImage1 eq null}">
												<img class="thumb" src="/resources/img/no_image.png">
											</c:when>
											<c:otherwise>
												<img class="thumb" src="/resources/img/${row.goodsImageDate1}s_${row.goodsImage1}">
											</c:otherwise>
										</c:choose>
										<c:choose>
											<c:when test="${row.goodsImage2 eq null}">
												<img class="thumb" src="/resources/img/no_image.png">
											</c:when>
											<c:otherwise>
												<img class="thumb" src="/resources/img/${row.goodsImageDate2}s_${row.goodsImage2}">
											</c:otherwise>
										</c:choose>
										<c:choose>
											<c:when test="${row.goodsImage3 == null}">
												<img class="thumb" src="/resources/img/no_image.png">
											</c:when>
											<c:otherwise>
												<img class="thumb" src="/resources/img/${row.goodsImageDate3}s_${row.goodsImage3}">
											</c:otherwise>
										</c:choose>
									</td>
									<td class="myg_info">
										<li>${row.goodsName} / ${row.goodsUse}</li>
										<li>${row.goodsSellerNickname} / ${row.goodsPrice}</li>
									</td>
									<td class="myg_button">
										<input type="hidden" id="goodsNum_${status.index}" value="${row.goodsNum}"/>
										<button type="button" onclick="modifyMyGoods('${row.goodsStatus}', ${status.index});">수정</button>
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
			<div id="goodsPaging1">
				<div class='pull-right'>
					<ul class="pagination">
	
						<c:if test="${pagingMap.pageMakerGoods.prev1}">
							<li class="page-item"><a class="page-link page1" href="${pagingMap.pageMakerGoods.startPage1 -1}" tabindex="-1">Previous</a></li>
						</c:if>
	
							<c:forEach var="num" begin="${pagingMap.pageMakerGoods.startPage1}" end="${pagingMap.pageMakerGoods.endPage1}">
								<li class="page-item ${pagingMap.pageMakerGoods.cri.pageNum1 == num ? "active":""} ">
									<a class="page-link page1" href="${num}">${num}</a>
								</li>
							</c:forEach>
	
						<c:if test="${pagingMap.pageMakerGoods.next1}">
							<li class="page-item"><a class="page-link page1" href="${pagingMap.pageMakerGoods.endPage1 +1}" tabindex="-1">Next</a></li>
						</c:if>
	
					</ul>
				</div>
			</div>
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
										<c:choose>
											<c:when test="${row.goodsImage1 eq null}">
												<img class="thumb" src="/resources/img/no_image.png">
											</c:when>
											<c:otherwise>
												<img class="thumb" src="/resources/img/${row.goodsImageDate1}s_${row.goodsImage1}">
											</c:otherwise>
										</c:choose>
										<c:choose>
											<c:when test="${row.goodsImage2 eq null}">
												<img class="thumb" src="/resources/img/no_image.png">
											</c:when>
											<c:otherwise>
												<img class="thumb" src="/resources/img/${row.goodsImageDate2}s_${row.goodsImage2}">
											</c:otherwise>
										</c:choose>
										<c:choose>
											<c:when test="${row.goodsImage3 == null}">
												<img class="thumb" src="/resources/img/no_image.png">
											</c:when>
											<c:otherwise>
												<img class="thumb" src="/resources/img/${row.goodsImageDate3}s_${row.goodsImage3}">
											</c:otherwise>
										</c:choose>
									</td>
									<td class="myg_info">
										<li>${row.goodsName} / ${row.goodsUse}</li>
										<li>${row.goodsSellerNickname} / ${row.goodsPrice}</li>
									</td>
									<td class="myg_button">
										<input type="hidden" id="goodsNum_${status.index}" value="${row.goodsNum}"/>
										<button type="button" onclick="modifyMyGoods('${row.goodsStatus}', ${status.index});">수정</button>
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
			<div id="goodsPaging2">
				<div class='pull-right'>
					<ul class="pagination">
	
						<c:if test="${pagingMap.pageMakerUnapprovedGoods.prev2}">
							<li class="page-item"><a class="page-link page2" href="${pagingMap.pageMakerUnapprovedGoods.startPage2 -1}" tabindex="-1">Previous</a></li>
						</c:if>
	
							<c:forEach var="num" begin="${pagingMap.pageMakerUnapprovedGoods.startPage2}" end="${pagingMap.pageMakerUnapprovedGoods.endPage2}">
								<li class="page-item ${pagingMap.pageMakerUnapprovedGoods.cri.pageNum2 == num ? "active":""} ">
									<a class="page-link page2" href="${num}">${num}</a>
								</li>
							</c:forEach>
	
						<c:if test="${pagingMap.pageMakerUnapprovedGoods.next2}">
							<li class="page-item"><a class="page-link page2" href="${pagingMap.pageMakerUnapprovedGoods.endPage2 +1}" tabindex="-1">Next</a></li>
						</c:if>
	
					</ul>
				</div>
			</div>
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
										<c:choose>
											<c:when test="${row.goodsImage1 eq null}">
												<img class="thumb" src="/resources/img/no_image.png">
											</c:when>
											<c:otherwise>
												<img class="thumb" src="/resources/img/${row.goodsImageDate1}s_${row.goodsImage1}">
											</c:otherwise>
										</c:choose>
										<c:choose>
											<c:when test="${row.goodsImage2 eq null}">
												<img class="thumb" src="/resources/img/no_image.png">
											</c:when>
											<c:otherwise>
												<img class="thumb" src="/resources/img/${row.goodsImageDate2}s_${row.goodsImage2}">
											</c:otherwise>
										</c:choose>
										<c:choose>
											<c:when test="${row.goodsImage3 == null}">
												<img class="thumb" src="/resources/img/no_image.png">
											</c:when>
											<c:otherwise>
												<img class="thumb" src="/resources/img/${row.goodsImageDate3}s_${row.goodsImage3}">
											</c:otherwise>
										</c:choose>
									</td>
									<td class="myg_info">
										<li>${row.goodsName} / ${row.goodsUse}</li>
										<li>${row.goodsSellerNickname} / ${row.goodsPrice}</li>
									</td>
									<td class="myg_button">
										<input type="hidden" id="goodsNum_${status.index}" name="goodsNum" value="${row.goodsNum}"/>
										<button type="button" onclick="modifyMyGoods('${row.goodsStatus}', ${status.index});">수정</button>
										<button type="button" onclick="deleteMyGoods('${row.goodsStatus}', ${status.index});">삭제</button>
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
			<div id="goodsPaging1">
				<div class='pull-right'>
					<ul class="pagination">
	
						<c:if test="${pagingMap.pageMakerTempGoods.prev3}">
							<li class="page-item"><a class="page-link page3" href="${pagingMap.pageMakerTempGoods.startPage3 -1}" tabindex="-1">Previous</a></li>
						</c:if>
							
							<c:forEach var="num" begin="${pagingMap.pageMakerTempGoods.startPage3}" end="${pagingMap.pageMakerTempGoods.endPage3}">
								<li class="page-item ${pagingMap.pageMakerTempGoods.cri.pageNum3 == num ? "active":""} ">
									<a class="page-link page3" href="${num}">${num}</a>
								</li>
							</c:forEach>
						
						<c:if test="${pagingMap.pageMakerTempGoods.next3}">
							<li class="page-item"><a class="page-link page3" href="${pagingMap.pageMakerTempGoods.endPage3 +1}" tabindex="-1">Next</a></li>
						</c:if>
	
					</ul>
				</div>
			</div>
		</div>
		
		<!-- 선민: 수정을 위한 폼 -->
		<form id="modifyForm"></form>
		
		<!-- 선민: 페이징을 위한 폼 -->
<!-- 		<form id="actionForm" action="/myPage/myGoods" method='get'> -->
		<form id="actionForm" action="/myPage/myGoods" method='post'>
			<input type='hidden' name='pageNum1' value='${pagingMap.pageMakerGoods.cri.pageNum1}'>
			<input type='hidden' name='amount1' value='${pagingMap.pageMakerGoods.cri.amount1}'>
			<input type='hidden' name='pageNum2' value='${pagingMap.pageMakerUnapprovedGoods.cri.pageNum2}'>
			<input type='hidden' name='amount2' value='${pagingMap.pageMakerUnapprovedGoods.cri.amount2}'>
			<input type='hidden' name='pageNum3' value='${pagingMap.pageMakerTempGoods.cri.pageNum3}'>
			<input type='hidden' name='amount3' value='${pagingMap.pageMakerTempGoods.cri.amount3}'>
		</form>
<!-- 		<form id="actionForm2" name="actionForm2"> -->
<%-- 			<input type='hidden' name='pageNum1' value='${pagingMap.pageMakerGoods.cri.pageNum1}'> --%>
<%-- 			<input type='hidden' name='amount1' value='${pagingMap.pageMakerGoods.cri.amount1}'> --%>
<%-- 			<input type='hidden' name='pageNum2' value='${pagingMap.pageMakerUnapprovedGoods.cri.pageNum2}'> --%>
<%-- 			<input type='hidden' name='amount2' value='${pagingMap.pageMakerUnapprovedGoods.cri.amount2}'> --%>
<%-- 			<input type='hidden' name='pageNum3' value='${pagingMap.pageMakerTempGoods.cri.pageNum3}'> --%>
<%-- 			<input type='hidden' name='amount3' value='${pagingMap.pageMakerTempGoods.cri.amount3}'> --%>
<!-- 		</form> -->
		
	</div>
	<br/>
	
<%-- 	<div>맵: ${myGoodsMap}</div><br/> --%>
	<div>맵: ${pagingMap}</div><br/>
	
	<div>
<%-- 		<li>승인완료 pageNum: ${pagingMap.pageMakerGoods.cri.pageNum1}</li> --%>
<%-- 		<li>승인완료 amount: ${pagingMap.pageMakerGoods.cri.amount1}</li> --%>
		<li>승인완료 startPage: ${pagingMap.pageMakerGoods.startPage1}</li>
		<li>승인완료 endPage: ${pagingMap.pageMakerGoods.endPage1}</li>
		<li>--------------------------------</li>
		<li>승인대기 startPage: ${pagingMap.pageMakerUnapprovedGoods.startPage2}</li>
		<li>승인대기 endPage: ${pagingMap.pageMakerUnapprovedGoods.endPage2}</li>
		<li>--------------------------------</li>
		<li>임시저장 startPage: ${pagingMap.pageMakerTempGoods.startPage3}</li>
		<li>임시저장 endPage: ${pagingMap.pageMakerTempGoods.endPage3}</li>
	</div><br/>
</div>


<script>
// 상품페이징
$(document).ready(function(){
	var actionForm = $("#actionForm");

	$(".page1").on("click", function(e) {
		e.preventDefault();
		var targetPage = $(this).attr("href");
	    actionForm.find("input[name='pageNum1']").val(targetPage);
	    actionForm.submit();
	});
	
	$(".page2").on("click", function(e) {
		e.preventDefault();
		var targetPage = $(this).attr("href");
	    actionForm.find("input[name='pageNum2']").val(targetPage);
	    actionForm.submit();

// 		var queryString = $("form[id=actionForm]").serialize();
		
// 		$.ajax({
// 			url: '/myPage/myGoods',
// 			processData: false,
// 			contentType: false,
// 			data: queryString,  
// 			type: 'POST',
			
// 			error: function(error){
// 				alert("실패");
// 			},
// 			success: function(result) { 
// 			    alert("성공");
// 			}	
// 		}); // $.ajax
	});
	
	$(".page3").on("click", function(e) {
		e.preventDefault();
		var targetPage = $(this).attr("href");
	    actionForm.find("input[name='pageNum3']").val(targetPage);
	    actionForm.submit();
	});
})		


function modifyMyGoods(status, index) {
    let formData = new FormData(); // 가상의 <form>태그 객체를 생성
    let goodsNum;
    
    if(!confirm("상품 정보를 수정하시겠습니까?")) { return false; }
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
	var form = document.getElementById("modifyForm");
	form.setAttribute("charset", "UTF-8");
	form.setAttribute("method", "Post");  //Post 방식
	form.setAttribute("action", "/goods/goodsModifyForm"); //요청 보낼 주소
	
	var input   = document.createElement('input'); 
	input.type   = 'hidden';
	input.name  = 'goodsNum';
	input.value  = goodsNum;
	form.appendChild(input);
	
	form.submit();
}

function deleteMyGoods(status, index) {
    let formData = new FormData(); // 가상의 <form>태그 객체를 생성
    let goodsNum;
    
    alert(status);
    
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

