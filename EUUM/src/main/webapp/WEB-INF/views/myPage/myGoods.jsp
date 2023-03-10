<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

<div class="boardCon">

	<div class="myGoods">
		<div class="myGoodsList">
			<a class="goodsalink" onclick="location.href='/goods/goodsRegisterGuide'" style="display: inline-block; margin-right: 20px;">
				<div class="boardBox" style="color: #555;">
					<div class="innerBox" style="border: #616161 2px dashed; height: 100%; width: 100%; text-align: center; position: relative;">
						<div class="goodsoverlay"></div>
						<div class="goodsBoxText" style="position: absolute; bottom: 47%; left: 42px; font-size: 13px; z-index: 5;">
							<span style="color: #fb8500;">+</span>
							새로운 상품 등록
						</div>
					</div>
				</div>
			</a>
			<c:choose>
				<c:when test="${fn:length(myGoodsMap.myGoodsList) > 0}">
					<c:forEach items="${myGoodsMap.myGoodsList}" var="row" varStatus="status">
		
						<a class="goodsalink alinklist" style="display: inline-block; margin-right: 20px;">
							<div class="boardBox" style="color: #555;">
								<div class="innerBox" style="border: #CCCCCC 2px solid; height: 100%; width: 100%; text-align: center; position: relative;">
									<div class="goodsoverlayList"></div>
									<div class="goodsBoxBtn" style="font-size: 13px; z-index: 5;">
										<button type="button" class="hidebtn" onclick="modifyMyGoods('${row.goodsStatus}', ${status.index});">상품 수정</button>
										<button type="button" class="hidebtn" onclick="deleteMyGoods('${row.goodsStatus}', ${status.index}, ${status.first}, ${status.last});">삭제</button>
										<input type="hidden" id="goodsNum_${status.index}" value="${row.goodsNum}" />
									</div>
									<div class="imgbox">
										<img src="${pageContext.request.contextPath}/resources/img/${row.goodsImageDate1}s_${row.goodsImage1}" class="imginner">
									</div>
									<div class="inBotText">
										<span style="text-align: right;">${row.goodsName}</span>
									</div>
									<div class="inBotIcon">
										<div class="statusIconbox">승인완료</div>
										<span style="float: right;">${row.goodsPrice}</span>
									</div>
								</div>
							</div>
						</a>
					</c:forEach>
				</c:when>
				<c:otherwise>
					<span>판매중인 내 상품이 없습니다.</span>
				</c:otherwise>
			</c:choose>
		</div>
		<div id="goodsPaging1" class="pagingDiv">
			<div class='pull-right'>
				<ul class="pagination">
		
					<c:if test="${pagingMap.pageMakerGoods.prev1}">
						<li class="page-item"><a class="page-link page1" href="${pagingMap.pageMakerGoods.startPage1 -1}" tabindex="-1">Previous</a></li>
					</c:if>
		
					<c:forEach var="num" begin="${pagingMap.pageMakerGoods.startPage1}" end="${pagingMap.pageMakerGoods.endPage1}">
						<li class="page-item ${pagingMap.pageMakerGoods.cri.pageNum1 == num ? "active":""} "><a class="page-link page1" href="${num}">${num}</a></li>
					</c:forEach>
		
					<c:if test="${pagingMap.pageMakerGoods.next1}">
						<li class="page-item"><a class="page-link page1" href="${pagingMap.pageMakerGoods.endPage1 +1}" tabindex="-1">Next</a></li>
					</c:if>
		
				</ul>
			</div>
		</div>
		
		
		<div class="myUnapprovedGoodsList">
			<c:choose>
				<c:when test="${fn:length(myGoodsMap.myUnapprovedGoodsList) > 0}">
					<c:forEach items="${myGoodsMap.myUnapprovedGoodsList}" var="row" varStatus="status">
		
						<a class="goodsalink alinklist" style="display: inline-block; margin-right: 20px;">
							<div class="boardBox" style="color: #555;">
								<div class="innerBox" style="border: #CCCCCC 2px solid; height: 100%; width: 100%; text-align: center; position: relative;">
									<div class="goodsoverlayList"></div>
									<div class="goodsBoxBtn" style="font-size: 13px; z-index: 5;">
										<button type="button" class="hidebtn" onclick="modifyMyGoods('${row.goodsStatus}', ${status.index});">상품 수정</button>
										<button type="button" class="hidebtn" onclick="deleteMyGoods('${row.goodsStatus}', ${status.index}, ${status.first}, ${status.last});">삭제</button>
										<input type="hidden" id="goodsNum_${status.index}" value="${row.goodsNum}" />
									</div>
									<div class="imgbox">
										<img src="${pageContext.request.contextPath}/resources/img/${row.goodsImageDate1}s_${row.goodsImage1}" class="imginner">
									</div>
									<div class="inBotText">
										<span style="text-align: right;">${row.goodsName}</span>
									</div>
									<div class="inBotIcon">
										<div class="statusIconbox">승인대기</div>
										<span style="float: right;">${row.goodsPrice}</span>
									</div>
								</div>
							</div>
						</a>
					</c:forEach>
				</c:when>
				<c:otherwise>
					<span>승인 대기중인 상품이 없습니다.</span>
				</c:otherwise>
			</c:choose>
		</div>
		<div id="goodsPaging2" class="pagingDiv">
			<div class='pull-right'>
				<ul class="pagination">
	
					<c:if test="${pagingMap.pageMakerUnapprovedGoods.prev2}">
						<li class="page-item"><a class="page-link page2" href="${pagingMap.pageMakerUnapprovedGoods.startPage2 -1}" tabindex="-1">Previous</a></li>
					</c:if>
	
					<c:forEach var="num" begin="${pagingMap.pageMakerUnapprovedGoods.startPage2}" end="${pagingMap.pageMakerUnapprovedGoods.endPage2}">
						<li class="page-item ${pagingMap.pageMakerUnapprovedGoods.cri.pageNum2 == num ? "active":""} "><a class="page-link page2" href="${num}">${num}</a></li>
					</c:forEach>
	
					<c:if test="${pagingMap.pageMakerUnapprovedGoods.next2}">
						<li class="page-item"><a class="page-link page2" href="${pagingMap.pageMakerUnapprovedGoods.endPage2 +1}" tabindex="-1">Next</a></li>
					</c:if>
	
				</ul>
			</div>
		</div>
		
		
		<div class="myTempGoodsList"	>
			<c:choose>
				<c:when test="${fn:length(myGoodsMap.myTempGoodsList) > 0}">
					<c:forEach items="${myGoodsMap.myTempGoodsList}" var="row" varStatus="status">
		
						<a class="goodsalink alinklist" style="display: inline-block; margin-right: 20px;">
							<div class="boardBox" style="color: #555;">
								<div class="innerBox" style="border: #CCCCCC 2px solid; height: 100%; width: 100%; text-align: center; position: relative;">
									<div class="goodsoverlayList"></div>
									<div class="goodsBoxBtn" style="font-size: 13px; z-index: 5;">
										<button type="button" class="hidebtn" onclick="modifyMyGoods('${row.goodsStatus}', ${status.index});">상품 수정</button>
										<button type="button" class="hidebtn" onclick="deleteMyGoods('${row.goodsStatus}', ${status.index}, ${status.first}, ${status.last});">삭제</button>
										<input type="hidden" id="goodsNum_${status.index}" value="${row.goodsNum}" />
									</div>
									<div class="imgbox">
										<img src="${pageContext.request.contextPath}/resources/img/${row.goodsImageDate1}s_${row.goodsImage1}" class="imginner">
									</div>
									<div class="inBotText">
										<span style="text-align: right;">${row.goodsName}</span>
									</div>
									<div class="inBotIcon">
										<div class="statusIconbox">임시저장</div>
										<span style="float: right;">${row.goodsPrice}</span>
									</div>
								</div>
							</div>
						</a>
					</c:forEach>
				</c:when>
				<c:otherwise>
					<span>임시저장된 상품이 없습니다.</span>
				</c:otherwise>
			</c:choose>
		</div>
		<div id="goodsPaging3" class="pagingDiv">
			<div class='pull-right'>
				<ul class="pagination">
	
					<c:if test="${pagingMap.pageMakerTempGoods.prev3}">
						<li class="page-item"><a class="page-link page3" href="${pagingMap.pageMakerTempGoods.startPage3 -1}" tabindex="-1">Previous</a></li>
					</c:if>
	
					<c:forEach var="num" begin="${pagingMap.pageMakerTempGoods.startPage3}" end="${pagingMap.pageMakerTempGoods.endPage3}">
						<li class="page-item ${pagingMap.pageMakerTempGoods.cri.pageNum3 == num ? "active":""} "><a class="page-link page3" href="${num}">${num}</a></li>
					</c:forEach>
	
					<c:if test="${pagingMap.pageMakerTempGoods.next3}">
						<li class="page-item"><a class="page-link page3" href="${pagingMap.pageMakerTempGoods.endPage3 +1}" tabindex="-1">Next</a></li>
					</c:if>
	
				</ul>
			</div>
		</div>
		<!-- 선민: 수정을 위한 폼 -->
		<form id="modifyForm">
			<input type="hidden" id="input_goodsNum" value="" />
		</form>
	
		<!-- 선민: 페이징을 위한 폼 -->
		<!-- <form id="actionForm" action="/myPage/myGoods" method='get'> -->
		<form id="actionForm" action="/myPage/myGoods" method='post'>
			<input type='hidden' name='pageNum1' value='${pagingMap.pageMakerGoods.cri.pageNum1}'>
			<input type='hidden' name='amount1' value='${pagingMap.pageMakerGoods.cri.amount1}'>
			<input type='hidden' name='pageNum2' value='${pagingMap.pageMakerUnapprovedGoods.cri.pageNum2}'>
			<input type='hidden' name='amount2' value='${pagingMap.pageMakerUnapprovedGoods.cri.amount2}'>
			<input type='hidden' name='pageNum3' value='${pagingMap.pageMakerTempGoods.cri.pageNum3}'>
			<input type='hidden' name='amount3' value='${pagingMap.pageMakerTempGoods.cri.amount3}'>
		</form>
	


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
	});
	
	$(".page3").on("click", function(e) {
		e.preventDefault();
		var targetPage = $(this).attr("href");
	    actionForm.find("input[name='pageNum3']").val(targetPage);
	    actionForm.submit();
	});
})		


function modifyMyGoods(status, index) {
    console.log(status);
    console.log(index);
    
    
    let formData = new FormData(); // 가상의 <form>태그 객체를 생성
    let goodsNum;
    
    if(!confirm("상품 정보를 수정하시겠습니까?")) { return false; }
    else {}
    
	switch(status) {
		case '승인완료':
			goodsNum = document.querySelector('div.myGoodsList input[id=goodsNum_' + index + ']').value;
			console.log("스위치문 goodsNum: " + goodsNum);
			break;
		case '승인대기':
			goodsNum = document.querySelector('div.myUnapprovedGoodsList input[id=goodsNum_' + index + ']').value;
			console.log("스위치문 goodsNum: " + goodsNum);
			break;
		case '임시저장':
			goodsNum = document.querySelector('div.myTempGoodsList input[id=goodsNum_' + index + ']').value;
			console.log("스위치문 goodsNum: " + goodsNum);
			break;
		default:
			alert('이거뜨면먼가오류있음');
	}
	
	console.log("수정 goodsNum: " + goodsNum);

	// 1. 가상의 <form>태그에 전송할 data를 담기
	var form = document.getElementById("modifyForm");
	form.setAttribute("charset", "UTF-8");
	form.setAttribute("method", "Post");  //Post 방식
	form.setAttribute("action", "/goods/goodsModifyForm"); //요청 보낼 주소
	
	var input = document.createElement('input'); 
	input.type = 'hidden';
	input.name = 'goodsNum';
	input.value = goodsNum;
	form.append(input);

// 	$('#input_goodsNum').val(goodsNum);
	
	form.submit();
}

function deleteMyGoods(status, index, first, last) {
    let formData = new FormData(); // 가상의 <form>태그 객체를 생성
    let goodsNum;
    
    let pageNum1;
    let amount1;
    let pageNum2;
    let amount2;
    let pageNum3;
    let amount3;
    
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
	
	console.log("ㅇㅇㅇgoodsNum: " + goodsNum);
	
	pageNum1 = document.querySelector('input[name=pageNum1]').value;
	amount1 = document.querySelector('input[name=amount1]').value;
	pageNum2 = document.querySelector('input[name=pageNum2]').value;
	amount2 = document.querySelector('input[name=amount2]').value;
	pageNum3 = document.querySelector('input[name=pageNum3]').value;
	amount3 = document.querySelector('input[name=amount3]').value;
	
	if(first == true && last == true) {
	    switch(status) {
		case '승인완료':
		    pageNum1 = document.querySelector('input[name=pageNum1]').value;
			amount1 = document.querySelector('input[name=amount1]').value;
			pageNum1--;
			if(pageNum1 == 0) {
				pageNum1 = 1;
			}
			break;
		case '승인대기':
		    pageNum2 = document.querySelector('input[name=pageNum2]').value;
			amount2 = document.querySelector('input[name=amount2]').value;
			pageNum2--;
			if(pageNum2 == 0) {
			    pageNum2 = 1;
			} 
			break;
		case '임시저장':
		    pageNum3 = document.querySelector('input[name=pageNum3]').value;
			amount3 = document.querySelector('input[name=amount3]').value;
			pageNum3--;
			if(pageNum3 == 0) {
			    pageNum3 = 1;
			}
			break;
	    }
	}

	// 1. 가상의 <form>태그에 전송할 data를 담기
	formData.append("goodsNum", goodsNum);
	
	formData.append("pageNum1", pageNum1);
	formData.append("amount1", amount1);
	formData.append("pageNum2", pageNum2);
	formData.append("amount2", amount2);
	formData.append("pageNum3", pageNum3);
	formData.append("amount3", amount3);
		
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
	
// 	document.getElementById(tr).remove();
}
</script>



		<style>
li {
	list-style: none;
}

.boardBox {
	width: 200px;
	height: 270px;
}

.goodsalink {
	cursor: pointer;
	vertical-align: top;
}

.goodsalink:hover .goodsoverlay, .goodsalink:hover .goodsBoxText {
	opacity: 1;
	font-weight: 900;
}

.goodsoverlay {
	width: 100%;
	height: 100%;
	background: #8e8e8e;
	z-index: 4;
	opacity: 0;
	transition: opacity .2s linear;
	position: absolute;
	bottom: 0;
	left: 0;
}

.goodsoverlayList {
	width: 100%;
	height: 100%;
	background: #8e8e8e;
	z-index: 4;
	opacity: 0;
	transition: opacity .2s linear;
	position: absolute;
	bottom: 0;
	left: 0;
}

.imgbox {
	vertical-align: top;
	position: relative;
	width: 196px;
	height: 200px;
	overflow: hidden;
}

.imginner {
	position: absolute;
	top: 0;
	right: 0;
	height: 300px;
}

.hidebtn {
	background: #fb8500;
	opacity: 0;
	z-index: 6;
}

.goodsBoxBtn {
	position: absolute;
}

.inBotText {
	font-size: 13px;
	text-align: left;
	padding: 0 10px 0 10px;
}

.inBotIcon {
	position: absolute;
	text-align: left;
	padding: 0 10px 5px 10px;
	left: 0;
	width: 100%;
	bottom: 0;
}

.statusIconbox {
	text-align: center;
	display: inline-block;
	border: #fb8500 solid 1px;
	border-radius: 5px;
	font-size: 10px;
	vertical-align: bottom;
	color: #fb8500;
	margin-top: 5px;
	padding: 0 4px 0 4px;
}
.alinklist:hover .hidebtn{
   opacity: 1;
}

.hidebtn{
   background:#fb8500 ;
   opacity: 0;
   z-index:6;
   transition: opacity .2s linear;
}
</style>
	</div><!-- myGoodsAjax.jsp에서도 페이징을 유지하기 위해 <div class="myGoods">태그를 최하단에서 닫음 -->
</div>
