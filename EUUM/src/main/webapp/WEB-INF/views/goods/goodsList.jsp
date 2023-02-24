<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
<head>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<link href="/resources/assets/css/goods.css" rel="stylesheet">
<meta charset="UTF-8">


</head>

<body>
	<br>
	<br>
	<br>
	<br>
	<br>
	<div class="container">

		<div class="main">
			<div class="sub_menu_back">
				<ul class="head_title">
					<span> <a href="/goods/goodsList">작품 리스트</a>
					</span>
					<span class="head_title_s">커미션은 상업적인 용도로 사용할 수 없습니다</span>
				</ul>
				<br> <br> <br>

				<!--상품 카테고리 -->
				<!--  <ul id="sub_menu"> -->
				<div class="sub_menu">
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					<button type="button" class="btn btn-outline-dark"
						onclick="location.href='/goods/goodsList?goodsCategory=0&pageNum=1'">&nbsp;전체목록보기&nbsp;</button>
					&nbsp;&nbsp;
					<button type="button" class="btn btn-outline-dark"
						onclick="location.href='/goods/goodsList?goodsCategory=1&pageNum=1'">&nbsp;캐릭터
						일러스트&nbsp;</button>
					&nbsp;&nbsp;
					<button type="button" class="btn btn-outline-dark"
						onclick="location.href='/goods/goodsList?goodsCategory=2&pageNum=1'">&nbsp;&nbsp;일러스트&nbsp;&nbsp;</button>
					&nbsp;&nbsp;
					<button type="button" class="btn btn-outline-dark"
						onclick="location.href='/goods/goodsList?goodsCategory=3&pageNum=1'">&nbsp;3D
						모델링&nbsp;</button>
					&nbsp;&nbsp;
					<button type="button" class="btn btn-outline-dark"
						onclick="location.href='/goods/goodsList?goodsCategory=4&pageNum=1'">&nbsp;&nbsp;&nbsp;&nbsp;디자인&nbsp;&nbsp;&nbsp;&nbsp;</button>
					&nbsp;&nbsp;
					<button type="button" class="btn btn-outline-dark"
						onclick="location.href='/goods/goodsList?goodsCategory=5&pageNum=1'">&nbsp;웹툰
						· 만화&nbsp;</button>
				</div>
			</div>
			<br>
		</div>


		<div class="clear 5px;"></div>
		<br> <br>

		<div>
			<div class="row gy-5">
				<div class="col">
					<div style="float: left; font-size: 14.5px;">
						<div id="searchBox">

							<form id='actionForm' action="/goods/goodsList" method='get'>
								<input type='hidden' name='pageNum'
									value='${pageMaker.cri.pageNum}'> <input type='hidden'
									name='amount' value='${pageMaker.cri.amount}'> <input
									type="hidden" name="sortCom" value="${pageMaker.cri.sortCom }">
								<input type="hidden" name="goodsCategory"
									value="${pageMaker.cri.goodsCategory}">
								&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <select name="type"
									value="${pageMaker.cri.type }">
									<option value="GOODS_NAME">상품 이름</option>
									<option value="GOODS_SELLER_NICKNAME">작가 이름</option>
								</select> <span> <input type="text" name="keyword"
									id="searchKeyword"
									value='<c:out value="${ pageMaker.cri.keyword }"/>'
									style="width: 200px; height: 32px; display: inline-block;">
								</span> <span>
									<button type="submit" style="height: 32px; width: 80px;">검색</button>
								</span>
							</form>
						</div>

						<!--    정 렬 옵 션   -->
						<div class="goodsSort">
							<form method="post" action="/goods/goodsSort" name="sortCom">

								&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <select id="sortCom"
									name="sortCom">
									<option value="">검색 내 정렬</option>
									<option value="1"
										${pageMaker.cri.sortCom eq "1" ? 'selected' : ''}>최신순</option>
									<option value="2"
										${pageMaker.cri.sortCom eq "2" ? 'selected' : ''}>상업용</option>
									<option value="3"
										${pageMaker.cri.sortCom eq "3" ? 'selected' : ''}>비상업용</option>
									<option value="4"
										${pageMaker.cri.sortCom eq "4" ? 'selected' : ''}>상업용+비상업용</option>
								</select>
							</form>
						</div>
					</div>
				</div>
			</div>
			<br> <br> <br> <br>

			<div>
				<c:if test="${loginSeller ne null}">
					<div style="float: right; font-size: 15px;">
						<div class="sBtn1" style="height: 43px; line-height: 43px;"
							onclick="location.href='/myPage/myGoods'">작품 등록 / 수정</div>
					</div>
				</c:if>



				<c:choose>
					<c:when test="${fn:length(goodsList) > 0}">

						<c:forEach items="${goodsList}" var="row" varStatus="status">
							<div class="myGoodsDiv">
								<table>
									<tr id="tr_${row.goodsNum}">
										<%-- 									<td class="myg_category">${row.goodsCategory}</td> --%>
										<%-- <td class="myg_num">${row.goodsNum}</td> --%>
										<td><a href="/goods/goodsDetail?goodsNum=${row.goodsNum}">
												<c:choose>
													<c:when test="${row.goodsImage1 eq null}">
														<img class="thumb"
															src="${pageContext.request.contextPath}/resources/img/no_image.png">
													</c:when>
													<c:otherwise>
														<img class="thumb"
															src="${pageContext.request.contextPath}/resources/img/${row.goodsImageDate1}s_${row.goodsImage1}">
													</c:otherwise>
												</c:choose> <c:choose>
													<c:when test="${row.goodsImage2 eq null}">
														<img class="thumb"
															src="${pageContext.request.contextPath}/resources/img/no_image.png">
													</c:when>
													<c:otherwise>
														<img class="thumb"
															src="${pageContext.request.contextPath}/resources/img/${row.goodsImageDate2}s_${row.goodsImage2}">
													</c:otherwise>
												</c:choose> <c:choose>
													<c:when test="${row.goodsImage3 == null}">
														<img class="thumb"
															src="${pageContext.request.contextPath}/resources/img/no_image.png">
													</c:when>
													<c:otherwise>
														<img class="thumb"
															src="${pageContext.request.contextPath}/resources/img/${row.goodsImageDate3}s_${row.goodsImage3}">
													</c:otherwise>
												</c:choose>
										</a></td>
										<td class="myg_info">
											<li class="myGoodsLi myGoodsText">[${row.goodsCategory}]&nbsp;&nbsp;${row.goodsUse}</li>
											<li class="myGoodsLi myGoodsName"><a
												href="/goods/goodsDetail?goodsNum=${row.goodsNum}">
													${row.goodsName} </a></li>
											<li class="myGoodsLi myGoodsText">작가
												${row.goodsSellerNickname}&nbsp;&nbsp;/&nbsp;&nbsp;기본가: <fmt:formatNumber
													value="${row.goodsPrice}" pattern="#,###,###" />원
											</li>
											<li><a id="heart${row.goodsNum}"
												onclick="checkCart(${row.goodsNum});"> <c:choose>
														<c:when test="${row.goodsCart == '0'}">
															<img id="wish${row.goodsNum}" class="hearticon"
																src="/resources/img/icon/empty_heart_icon.png" />
														</c:when>
														<c:otherwise>
															<img id="wish${row.goodsNum}" class="hearticon"
																src="/resources/img/icon/heart_icon.png" />
														</c:otherwise>
													</c:choose>
											</a>${row.goodsCart}</li>
										</td>
									</tr>
								</table>
							</div>
						</c:forEach>
					</c:when>
				</c:choose>




			</div>


			<!--     페 이 징    -->
			<div class="container">
				<ul class="pagination">
					<c:if test="${pageMaker.prev}">
						<li class="paginate_button previous"><a
							href="${pageMaker.startPage -1}">Previous</a></li>


					</c:if>


					<c:forEach var="num" begin="${pageMaker.startPage}"
						end="${pageMaker.endPage}">
						<li class="paginate_button  ${pageMaker.cri.pageNum == num ? "active":""}"><a
							href="${num}">${num}</a>&nbsp;&nbsp;&nbsp;</li>
					</c:forEach>


					<c:if test="${pageMaker.next}">
						<li class="paginate_button next"><a
							href="${pageMaker.endPage +1}">Next</a></li>

					</c:if>
				</ul>
			</div>
		</div>
	</div>

	<!-- Modal -->
	<div class="modal fade" id="loginModal" tabindex="-1"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h1 class="modal-title fs-5" id="exampleModalLabel">로그인</h1>
					<button type="button" class="btn-close" data-bs-dismiss="modal"
						aria-label="Close"></button>
				</div>


				<div class="modal-body">
					<form id="addOrder">
						<div id="option1">

							<div class="input-group mb-3">
								<span class="input-group-text" id="inputGroup-sizing-default">아이디</span>
								<input type="text" class="form-control login-input"
									aria-label="Sizing example input"
									aria-describedby="inputGroup-sizing-default" name="memberEmail"
									value="">
							</div>

							<div class="input-group mb-3">
								<span class="input-group-text " id="inputGroup-sizing-default">비밀번호</span>
								<input type="password" class="form-control login-input"
									aria-label="Sizing example input"
									aria-describedby="inputGroup-sizing-default"
									name="memberPassword" value="">
							</div>

						</div>
					</form>
				</div>


				<div class="modal-footer">
					<button type="button" id="btn-cancle" class="btn btn-secondary"
						data-bs-dismiss="modal">취소</button>
					<button type="button" id="btn-login" class="btn btn-primary">로그인</button>
				</div>
			</div>
		</div>
	</div>
	<!-- /.modal -->
<script>

let modal = $('#loginModal');
var memberNum = '${loginUser.memberNum}';


function checkCart(goodsNum) {
    console.log(goodsNum);
	
	
	if(!memberNum){
		if(confirm("로그인이 필요한 서비스입니다. 로그인 하시겠습니까?")){
			modal.modal("show");
			modal.find('input[name="memberEmail"]').val('');
			modal.find('input[name="memberPassword"]').val('');
			console.log("외않되")
	
		}
		return false;
	}
						
	$.ajax({
			type : "GET",
			url : "/myPage/ajaxCartCheck?memberNum=" + memberNum+"&goodsNum="+goodsNum,
			success : function(data) {
				if (data == "Y") {
					onImg(goodsNum);
				} else {
					offImg(goodsNum);
				}
			}
		});
	return true;
} 

function loginService(memberEmail, memberPassword){
	$.ajax({
		url : "/member/loginProAjax",
		type : "post",
		async:false,
		contentType : "application/json; charset=utf-8",
	//	dataType : 'json',
			data : JSON.stringify({
				memberEmail : memberEmail,
				memberPassword : memberPassword
		}),
		success : function(data){
			console.log(data);
			
			if(data == 'loginSuccess'){
				alert('로그인 되었습니다');
				location.reload();
			}else{
				alert('로그인에 실패하였습니다');
			}
			
		},
		error : function(request, status, error){
			console.log("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
			alert('에러');
		} 
	})
	
	
}





function onImg(goodsNum){
	var ddd = "#wish"+goodsNum;
	
	console.log(ddd);
	console.log("#heart"+goodsNum); 
	$("#wish"+goodsNum).attr("src", "/resources/img/icon/heart_icon.png");
}

function offImg(goodsNum){
	var ddd = "#heart"+goodsNum;
	
	console.log(ddd);
	console.log("#heart"+goodsNum); 
	$("#wish"+goodsNum).attr("src", "/resources/img/icon/empty_heart_icon.png");
}

//페이징 + 정렬 																																					
$(document).ready(function(){
	
	
	
	var actionForm = $("#actionForm");
	actionForm.find("input[name='pageNum']").val('1');

	
	let sortCom = '${pagaMaker.cri.sortCom}';
	
	$('#sortCom').on('change', function() {
	    let sortCom = $(this).find('option:selected').val();
	    console.log(sortCom);
	    $('input[name="sortCom"]').val(sortCom);
	    console.log($('input[name="sortCom"]').val());
	    $('#actionForm').submit();
	})
	
	$(".paginate_button a").on("click", function(e) {
	
	    e.preventDefault();
	
	    console.log('click');
	
	    actionForm.find("input[name='pageNum']").val($(this).attr("href"));
	    actionForm.submit();
	});
	
	$('#btn-login').on('click', function(){
		let memberEmail = $(modal).find('input[name="memberEmail"]').val();
		let memberPassword = $(modal).find('input[name="memberPassword"]').val();
		console.log('입력한 아이디 : ' + memberEmail);
		console.log('입력한 비밀번호 : ' + memberPassword);
		
		loginService(memberEmail, memberPassword)
		
	})
	

});


</script>

</body>
</html>

<style>



li {
	list-style: none;
}

.thumb {
	width: 140px;
	height: 105px;
}

.small {
	width: 100px;
	height: 75px;
}

.myg_category {
	width: 100px;
}

.myg_info {
	padding-left: 20px;
	width: 280px;
}

.myg_button {
	padding-left: 20px;
	width: 140px;
}

.main {
	margin: auto;
}

.myGoodsDiv {
	padding-top: 10px;
	padding-bottom: 15px;
	padding-left: 15px;
	border: solid 1px #C1C1C1;
	width: 800px;
}

.pagingDiv {
	padding-top: 15px;
}

.myGoodsLi {
	padding-top: 4px;
	padding-bottom: 4px;
}

.myGoodsText {
	font-size: 13px;
	color: #808080;
}

.myGoodsName {
	font-size: 18px;
}
.hearticon{
	width:20px;
	height:20px;
}
</style>


