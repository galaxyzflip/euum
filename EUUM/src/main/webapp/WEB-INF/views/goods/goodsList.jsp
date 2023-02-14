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
}  */

 function loading(){
	document.getElementById('list_loading').style.display='block';
	setTimeout(function(){
			document.getElementById('list_loading').style.display='none';
	},2000);

} 

  //작품등록시,memberClass로 전문가회원인지 일반회원인지 구분하기 위함 
/* function writer_chk(level){
	if(level == "S"){
		location.href="";
	}else{
		alert('작가회원만 작품등록이 가능합니다. \n일반회원은 회원정보에서 작가회원으로 변경하실 수 있습니다');
		return false;
	}
} */


//정렬
/* document.getElementById("sortCom").onchange = function() {
	this.form.submit();
} */





	// 페이징 + 정렬 																																					
	$(document).ready(function(e){
		
		var actionForm = $("#actionForm");
		actionForm.find("input[name='pageNum']").val('1');
		
		let sortCom = '${pagaMaker.cri.sortCom}';
		
	
		$('#sortCom').on('change', function(){
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
		
	})



</script>

<body>
	<br><br><br><br><br>
	<div class="container">
		<div class="sub_menu_back">
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
					<img src="${pageContext.request.contextPath}/resources/assets/img/zz1.jpeg/${goodsImage1}" alt="" style='width: 260px; height: 220px'>
				</a>
				<a href="/goods/goodsDetail?goods_num=${goodsNum}">
					<img src="${pageContext.request.contextPath}/resources/assets/img/zz2.jpeg/${goodsImage2}" alt="" style='width: 260px; height: 220px'>
				</a>
				<a href="/goods/goodsDetail?goods_num=${goodsNum}">
					<img src="${pageContext.request.contextPath}/resources/assets/img/zz3.jpeg/${goodsImage3}" alt="" style='width: 260px; height: 220px'>
				</a>
			</div>
			
			
			
		</div>
	</div>

	<div class="clear 5px;">&nbsp;</div>

		<br> <br> <br>

		<div class="container">
			<div class="row gy-5">
				<div class="col">
					<div style="float: left; font-size: 14.5px;">
						<div id="searchBox">
						<form id='actionForm' action="/goods/goodsList" method='get'>
				<input type='hidden' name='pageNum' value='${pageMaker.cri.pageNum}'>
				<input type='hidden' name='amount' value='${pageMaker.cri.amount}'>
				<input type="hidden" name="sortCom" value="${pageMaker.cri.sortCom }">
			    <%-- <input type='hidden' name='type' value='<c:out value="${ pageMaker.cri.type }"/>'> --%>
				<%-- <input type='hidden' name='keyword' value='<c:out value="${ pageMaker.cri.keyword }"/>'>  --%>
			<!-- </form> -->
							<!-- this.form.submit()<form method="get" action="/goods/goodsSearch">  -->
								<select name="type" value="${pageMaker.cri.type }">
									<option value="goods_Name">상품 이름</option>
									<option value="GOODS_SELLER_NICKNAME">작가 이름</option>
								</select>
								<span>
									<input type="text" name="keyword" id="searchKeyword" value='<c:out value="${ pageMaker.cri.keyword }"/>' style="width: 200px; height: 30px; display: inline-block;">
								</span>
								<span>
									<button type="submit" style="height: 32px; width: 80px;">검색</button>
								</span>
							</form>
						</div>



						
                        <!--    정 렬 옵 션   -->
						<div class="goodsSort">
							<form method="post" action="/goods/goodsSort" name="sortCom">
	
								<select id="sortCom" name="sortCom">
								    <option value="" >선택해주세요</option>
									<option value="1" ${pageMaker.cri.sortCom eq "1" ? 'selected' : ''}>최신순</option>
								    <option value="2" ${pageMaker.cri.sortCom eq "2" ? 'selected' : ''}>상업용</option>
									<option value="3" ${pageMaker.cri.sortCom eq "3" ? 'selected' : ''}>비상업용</option>
									<option value="4" ${pageMaker.cri.sortCom eq "4" ? 'selected' : ''}>상업용+비상업용</option>
								</select>
							</form>
						</div>
						
					</div>
				
				
					<div style="float: right; font-size: 14.5px;">
					    <div class="sBtn1" style="height: 42px; line-height: 42px;" onclick="location.href='<c:url value='/myPage/myGoods'/>';">작품 등록 / 수정</div>
				    </div>
				</div>
			</div>
			<br> <br> <br> <br>


           
			<div class="container">
				<c:choose>
					<c:when test="${fn:length(goodsList) > 0}">
						<c:forEach items="${goodsList}" var="row" >
							<div style="padding-bottom: 15px;">
							<form id='goodsList' action='/goods/goodsList' method='get'> ${row.goodsNum}
                                         <a href="/goods/goodsDetail?goodsNum=${row.goodsNum}">
								<table style="border: solid 1px">
								  
									<tr>
										<td>    
											<img class="thumb" src="${pageContext.request.contextPath}/resources/assets/img/zz1.jpeg/${row.goodsImageDate1}s_${row.goodsImage1}"> 
											<img class="thumb" src="${pageContext.request.contextPath}/resources/assets/img/zz2.jpeg/${row.goodsImageDate2}s_${row.goodsImage2}"> 
											<img class="thumb" src="${pageContext.request.contextPath}/resources/assets/img/zz3.jpeg/${row.goodsImageDate3}s_${row.goodsImage3}">
										</td>
										<td class="myg_info">
											<li>${row.goodsName} / ${row.goodsUse}</li>
											<li>${row.goodsSellerNickname} / ${row.goodsPrice}</li>
										</td>
									 </tr>
								</table>
								       </a>
						     </form>
								
							</div>
						</c:forEach>
					</c:when>
					<c:otherwise>
						판매중인 상품이 없습니다.
					</c:otherwise>
				</c:choose>
			</div>
			
			
			<!--     페 이 징    -->
			<div class="container" >
				<ul class="pagination">
				
					<c:if test="${pageMaker.prev}">
							<li class="paginate_button previous">
							<a href="${pageMaker.startPage -1}">Previous</a></li>
							
					</c:if>

						<c:forEach var="num" begin="${pageMaker.startPage}" end="${pageMaker.endPage}">
							<li class="paginate_button  ${pageMaker.cri.pageNum == num ? "active":""}">
								<a href="${num }">${num }</a>&nbsp;&nbsp;
							</li>
						</c:forEach>


					 <c:if test="${pageMaker.next}">
					      <li class="paginate_button next">
						  <a href="${pageMaker.endPage +1 }">Next</a></li>
					</c:if>
				</ul>
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