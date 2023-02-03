<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<!DOCTYPE html>
<html>
<head>
<link href="/resources/assets/css/goods.css" rel="stylesheet">
<meta charset="UTF-8">
</head>

<script type="text/javascript">
function show_id(num){
	if(num=='1'){
		$("#guide1").show(); 
		$("#guide2").hide(); 
		$('#tab1').attr('class','tab_on');
		$('#tab2').attr('class','tab');
	} else {
		$("#guide1").hide(); 
		$("#guide2").show(); 
		$('#tab1').attr('class','tab');
		$('#tab2').attr('class','tab_on');
	}
} */

/* var iMenuLayers = 6; // 총레이어개수
function OnDisplayToggle(szObjName)
{
	var objId = document.all['idMenu'+szObjName];
	var menuId = document.all['menuTop'+szObjName];
	var arMenu = new Array(iMenuLayers);

	for( var i=0; i<iMenuLayers; i++ )
		arMenu[i] = 'idMenu'+i;

	for( var i=0; i<arMenu.length; i++ ) {
		if(document.all[arMenu[i]] && document.all[arMenu[i]]!=objId)
			document.all[arMenu[i]].style.display = 'none';
	}

	    if(objId){
		if(objId.style.display == ''){
			objId.style.display = 'none';
			if(menuId) menuId.style.backgroundColor = '';
		} else {
			objId.style.display = '';
			if(menuId) menuId.style.backgroundColor = '#c65926';
		}
	}
} */

/* function loading(){
	document.getElementById('list_loading').style.display='block';
	setTimeout(function(){
			document.getElementById('list_loading').style.display='none';
	},2000);

} */

function writer_chk(level){
	if(level >= 3){
		location.href="";
	}else{
		alert('작가회원만 작품등록이 가능합니다. \n일반회원은 회원정보에서 작가회원으로 변경하실 수 있습니다');
		return false;
	}
}
</script>

<body>
	<br><br><br>
	<div class="container">
		<div class="sub_menu_back">
			<!-- <div class="siteWidth left_ul"> -->
			<ul class="head_title">
				<span>작품 리스트</span>
				<span class="head_title_s">커미션은 상업적인 용도로 사용할 수 없습니다</span>
			</ul>
			<br> <br>

			<ul id="sub_menu">
				<a href="#" onclick="loading();">
					<li class="">캐릭터 일러스트</li>
				</a>
				<a href="#" onclick="loading();">
					<li class="">일러스트</li>
				</a>
				<a href="#" onclick="loading();">
					<li class="">버츄얼 · Live2D</li>
				</a>
				<a href="#" onclick="loading();">
					<li class="">디자인</li>
				</a>
				<a href="#" onclick="loading();">
					<li class="">영상 · 음향</li>
				</a>
				<a href="#" onclick="loading();">
					<li class="">웹툰 · 만화</li>
				</a>
				<a href="#" onclick="loading();">
					<li class="">글 · 기타</li>
				</a>
			</ul>
		</div>
		<br> <br> <br> <br>


		<div class="subContent">
			<!-- MAIN CENTER START -->
			<div class="cate_banner_title">
				<ul>프리미엄 작가</ul>
			</div>

			<div id="cate_banner" class="clear">
				<a href="/goods/goodsDetail?goods_num=${goodsNum}">
					<%-- 		<img src="${pageContext.request.contextPath}/resources/assets/img/image/zz1.jpeg/${goodsImage1}" alt="" style='width: 260px; height: 220px'> --%>
				</a>
				<a href="/goods/goodsDetail?goods_num=${goodsNum}">
					<img src="${pageContext.request.contextPath}/resources/assets/img/image/zz2.jpeg/${goodsImage2}" alt="" style='width: 260px; height: 220px'>
				</a>
				<a href="/goods/goodsDetail?goods_num=${goodsNum}">
					<img src="${pageContext.request.contextPath}/resources/assets/img/image/zz3.jpeg/${goodsImage3}" alt="" style='width: 260px; height: 220px'>
				</a>
				<a href="/goods/goodsDetail?goods_num=${goodsNum}">
					<img src="${pageContext.request.contextPath}/resources/assets/img/image/zz3.jpeg/${goodsImage3}" alt="" style='width: 260px; height: 220px'>
				</a>
			</div>
			
			
			
		</div>
	</div>

	<div class="clear" style="height: 55px;">&nbsp;</div>

	<div id="listFocus" class="clear" style="height: 6px;">&nbsp;</div>
	<div id="list_top" class="cf">
		<!--  @SEARCH BOX START -->
		<ul class="left" style="padding-top: 10px; width: 930px;">
			<form name="searchForm" method="get" action="/goods/goodsSearch">
				<!-- <input type="hidden" name="channel" value="list">
			<input type="hidden" name="cate" value="">
			<input type="hidden" name="order" value="">
			<input type="hidden" name="limit" value="">
			<input type="hidden" name="field" value=""> -->
		</ul>
		<br> <br> <br>

		<div class="container">
			<div class="row gy-5">
				<div class="col">
					<div style="float: left; font-size: 14.5px;">
						<div id="search_Box">
							<form method="get" action="/goods/goodsSearch" name="searchkeyword">
								<!-- <select name="searchkeyword" >
										<option value="sellerNickname">작가닉네임</option>
										<option value="goodsName">상품이름</option>
							     </select> -->
								<span>
									<input type="text" name="searchKeyword" id="searchKeyword" style="width: 200px; height: 30px; display: inline-block;">
								</span>
								<span>
									<button id="searchKeyword" type="submit" style="height: 32px; width: 80px;">검색</button>
								</span>
							</form>
						</div>



						<!-- @SEARCH BOX END-->

						<div class="goodsSort">
							<form method="post" action="/goods/goodsSort" name="sortType">
								<select id="sortType" name="sort-order" class="sort-order" onchange="sortOrder()">
									<option value="1">최신순</option>
									<option value="2">인기순</option>
								</select>
								<select id="sort-commers" name="sort-commers" class="sort-commers" onchange="sortCommers()">
									<option value="">상업용 / 비상업용</option>
									<option value="Y">상업용</option>
									<option value="N">비상업용</option>
								</select>
							</form>
						</div>
						<div class="lgBtn" onclick="location.href='index.php?channel=today'">최근 본 작가</div>
					</div>
					<!-- </ul> -->
					<!-- <ul class="right"> -->
					<div style="float: right; font-size: 14.5px;">
						<div class="sBtn1" style="height: 42px; line-height: 42px;" onclick="writer_chk('1')">작품 등록 / 수정</div>
						<!-- </ul> -->
					</div>
				</div>
			</div>
			<br> <br> <br> <br>



			<div class="container">
				<c:choose>
					<c:when test="${fn:length(goodsList) > 0}">
						<c:forEach items="${goodsList}" var="row">
							<div style="padding-bottom: 15px;">
								<table style="border: solid 1px">
									<tr>
										<td>
											<img class="thumb" src="${pageContext.request.contextPath}/resources/img/${row.goodsImageDate}s_${row.goodsImage1}"> <img class="thumb" src="/resources/img/${row.goodsImageDate}s_${row.goodsImage2}"> <img class="thumb" src="/resources/img/${row.goodsImageDate}s_${row.goodsImage3}">
										</td>
										<td class="myg_info">
											<li>${row.goodsName} / ${row.goodsUse}</li>
											<li>${row.goodsSellerNickname} / ${row.goodsPrice}</li>
										</td>
									</tr>
								</table>
							</div>
						</c:forEach>
					</c:when>
					<c:otherwise>
						판매중인 상품이 없습니다.
					</c:otherwise>
				</c:choose>
			</div>
			
			
			
		</div>
</body>
</html>

<style>
li {
	list-style: none;
}

.thumb {
	width: 160px;
	height: 120px;
}

.small {
	width: 100px;
	height: 75px;
}

.myg_info {
	padding-left: 20px;
	width: 400px;
}
</style>