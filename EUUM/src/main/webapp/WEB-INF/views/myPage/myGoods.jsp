<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<script src="webjars/jquery/3.5.1/dist/jquery.min.js"></script>

<style>
li {
	list-style: none;
}

.boardBox{
	width:200px;
	height:270px;
}

.goodsalink{
	cursor:pointer;
	    vertical-align: top;
}

.goodsalink:hover .goodsoverlay, .goodsalink:hover .goodsBoxText{
	opacity: 1;
	font-weight:900;
}

.goodsoverlay{
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

.goodsoverlayList{
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


.imgbox{
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

.hidebtn{
	background:# ;
	opacity: 0;
}

.goodsBoxBtn{
	position: absolute;
}


.inBotText{
	font-size:13px;
	text-align:left;
	padding: 0 10px 0 10px ;
}

.inBotIcon{
	position: absolute;
    text-align: left;
    padding: 0 10px 5px 10px;
    left: 0;
    width: 100%;
    bottom: 0;
}


.statusIconbox{
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

</style>

<div>
	
	
	
	
	
	
	
	
	<div style="display:block;">
	<div>
	<div class="boardCon">
		
		<a class="goodsalink" onclick="location.href='/goods/goodsRegisterGuide'" style="display:inline-block; margin-right:20px;">
			<div class="boardBox" style="color:#555;">
				<div class="innerBox" style="border: #616161 2px dashed; height:100%;width: 100%;text-align: center; position: relative; ">
					<div class="goodsoverlay"></div>
					<div class="goodsBoxText" style="position: absolute; bottom: 47%; left: 42px; font-size: 13px; z-index:5;">
						<span style="color:#fb8500;">+</span> 새로운 상품 등록
					</div>
				</div>
			</div>
		</a>

		<c:choose>
				<c:when test="${fn:length(myGoodsMap.myGoodsList) > 0}">
					<c:forEach items="${myGoodsMap.myGoodsList}" var="row">
		
		<a class="goodsalink alinklist" style="display:inline-block; margin-right:20px;">
			<div class="boardBox" style="color:#555;">
				<div class="innerBox" style="border: #CCCCCC 2px solid; height:100%;width: 100%;text-align: center; position: relative; ">
					<div class="goodsoverlayList"></div>
					<div class="goodsBoxBtn" style="font-size: 13px; z-index:5;">
					<button class="hidebtn" onclick="modifyMyGoods('${row.goodsStatus}', ${status.index});">수정</button> 
					</div>
					<div class="imgbox"><img src="${row.goodsImage1}" class="imginner"  ></div>
					<div class="inBotText"><span style="text-align:right;">${row.goodsName}</span></div>
					<div class="inBotIcon">
						<div class="statusIconbox">승인완료</div>
						<span style="float:right;">${row.goodsPrice}</span>
					</div>
				</div>
			</div>
		</a>
		</c:forEach>
		</c:when>
		</c:choose>
		
		
		
		
		
	</div>
	




	
	<br>	
	<br>	
	<br>	
	<br>	
	<br>	
	<br>	
	<br>	
	<br>	
	<br>	
	<br>	
	<br>	
	<div>
		<!-- <a href="/goods/goodsRegisterGuide">작품 등록</a> -->
		<button type="button"
			onclick="location.href='/goods/goodsRegisterGuide'">작품 등록</button>
	</div>
	<br />

	<div class="myGoods">
		<div class="myGoodsList" style="padding-bottom: 20px">
			<li>[내 상품]</li>
			<c:choose>
				<c:when test="${fn:length(myGoodsMap.myGoodsList) > 0}">
					<c:forEach items="${myGoodsMap.myGoodsList}" var="row"
						varStatus="status">
						<div style="padding-bottom: 15px">
							<table style="border: solid 1px">
								<tr id="tr_${row.goodsNum}">
									<td class="myg_category">${row.goodsCategory}</td>
									<%-- <td class="myg_category">${row.goodsNum}</td> --%>
									<td><c:choose>
											<c:when test="${row.goodsImage1 eq null}">
												<img class="thumb" src="/resources/img/no_image.png">
											</c:when>
											<c:otherwise>
												<img class="thumb"
													src="/resources/img/${row.goodsImageDate1}s_${row.goodsImage1}">
											</c:otherwise>
										</c:choose> <c:choose>
											<c:when test="${row.goodsImage2 eq null}">
												<img class="thumb" src="/resources/img/no_image.png">
											</c:when>
											<c:otherwise>
												<img class="thumb"
													src="/resources/img/${row.goodsImageDate2}s_${row.goodsImage2}">
											</c:otherwise>
										</c:choose> <c:choose>
											<c:when test="${row.goodsImage3 == null}">
												<img class="thumb" src="/resources/img/no_image.png">
											</c:when>
											<c:otherwise>
												<img class="thumb"
													src="/resources/img/${row.goodsImageDate3}s_${row.goodsImage3}">
											</c:otherwise>
										</c:choose></td>
									<td class="myg_info">
										<li>${row.goodsName}/ ${row.goodsUse}</li>
										<li>${row.goodsSellerNickname}/ ${row.goodsPrice}</li>
									</td>
									<td class="myg_button"><input type="hidden"
										id="goodsNum_${status.index}" value="${row.goodsNum}" />
										<button type="button"
											onclick="modifyMyGoods('${row.goodsStatus}', ${status.index});">수정</button>
										<button type="button"
											onclick="deleteMyGoods('${row.goodsStatus}', ${status.index});">삭제</button>
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

		<div class="myUnapprovedGoodsList" style="padding-bottom: 20px">
			<li>[승인대기 중인 상품]</li>
			<c:choose>
				<c:when test="${fn:length(myGoodsMap.myUnapprovedGoodsList) > 0}">
					<c:forEach items="${myGoodsMap.myUnapprovedGoodsList}" var="row"
						varStatus="status">
						<div style="padding-bottom: 15px">
							<table style="border: solid 1px">
								<tr id="tr_unapproved_${row.goodsNum}">
									<td class="myg_category">${row.goodsCategory}</td>
									<%-- <td class="myg_category">${row.goodsNum}</td> --%>
									<td><c:choose>
											<c:when test="${row.goodsImage1 eq null}">
												<img class="thumb" src="/resources/img/no_image.png">
											</c:when>
											<c:otherwise>
												<img class="thumb"
													src="/resources/img/${row.goodsImageDate1}s_${row.goodsImage1}">
											</c:otherwise>
										</c:choose> <c:choose>
											<c:when test="${row.goodsImage2 eq null}">
												<img class="thumb" src="/resources/img/no_image.png">
											</c:when>
											<c:otherwise>
												<img class="thumb"
													src="/resources/img/${row.goodsImageDate2}s_${row.goodsImage2}">
											</c:otherwise>
										</c:choose> <c:choose>
											<c:when test="${row.goodsImage3 == null}">
												<img class="thumb" src="/resources/img/no_image.png">
											</c:when>
											<c:otherwise>
												<img class="thumb"
													src="/resources/img/${row.goodsImageDate3}s_${row.goodsImage3}">
											</c:otherwise>
										</c:choose></td>
									<td class="myg_info">
										<li>${row.goodsName}/ ${row.goodsUse}</li>
										<li>${row.goodsSellerNickname}/ ${row.goodsPrice}</li>
									</td>
									<td class="myg_button"><input type="hidden"
										id="goodsNum_${status.index}" value="${row.goodsNum}" />
										<button type="button"
											onclick="modifyMyGoods('${row.goodsStatus}', ${status.index});">수정</button>
										<button type="button"
											onclick="deleteMyGoods('${row.goodsStatus}', ${status.index});">삭제</button>
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

		<div class="myTempGoodsList" style="padding-bottom: 20px">
			<li>[임시 저장된 상품]</li>
			<c:choose>
				<c:when test="${fn:length(myGoodsMap.myTempGoodsList) > 0}">
					<c:forEach items="${myGoodsMap.myTempGoodsList}" var="row"
						varStatus="status">
						<div style="padding-bottom: 15px">
							<table style="border: solid 1px">
								<tr id="tr_temp_${row.goodsNum}">
									<td class="myg_category">${row.goodsCategory}</td>
									<%-- <td class="myg_category">${row.goodsNum}</td> --%>
									<td><c:choose>
											<c:when test="${row.goodsImage1 eq null}">
												<img class="thumb" src="/resources/img/no_image.png">
											</c:when>
											<c:otherwise>
												<img class="thumb"
													src="/resources/img/${row.goodsImageDate1}s_${row.goodsImage1}">
											</c:otherwise>
										</c:choose> <c:choose>
											<c:when test="${row.goodsImage2 eq null}">
												<img class="thumb" src="/resources/img/no_image.png">
											</c:when>
											<c:otherwise>
												<img class="thumb"
													src="/resources/img/${row.goodsImageDate2}s_${row.goodsImage2}">
											</c:otherwise>
										</c:choose> <c:choose>
											<c:when test="${row.goodsImage3 == null}">
												<img class="thumb" src="/resources/img/no_image.png">
											</c:when>
											<c:otherwise>
												<img class="thumb"
													src="/resources/img/${row.goodsImageDate3}s_${row.goodsImage3}">
											</c:otherwise>
										</c:choose></td>
									<td class="myg_info">
										<li>${row.goodsName}/ ${row.goodsUse}</li>
										<li>${row.goodsSellerNickname}/ ${row.goodsPrice}</li>
									</td>
									<td class="myg_button"><input type="hidden"
										id="goodsNum_${status.index}" name="goodsNum"
										value="${row.goodsNum}" />
										<button type="button"
											onclick="modifyMyGoods('${row.goodsStatus}', ${status.index});">수정</button>
										<button type="button"
											onclick="deleteMyGoods('${row.goodsStatus}', ${status.index});">삭제</button>
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
			<form id="modifyForm"></form>
		</div>
	</div>
	<br />

	<div>맵: ${myGoodsMap}</div>
	<br />
</div>

<script>
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



