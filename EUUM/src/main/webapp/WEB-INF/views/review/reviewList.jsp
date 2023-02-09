<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>   
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
 
<!DOCTYPE html>
<html>

<style>
    .menu a{cursor:pointer;}
    .menu .hide{display:none;}
</style>

<script type="text/javascript">
	$(document).ready(function(){
	    // menu 클래스 바로 하위에 있는 a 태그를 클릭했을때
	    $(".menu>a").click(function(){
	        var submenu = $(this).next("ul");
	
	        // submenu 가 화면상에 보일때는 위로 보드랍게 접고 아니면 아래로 보드랍게 펼치기
	        if( submenu.is(":visible") ){
	            submenu.slideUp();
	        }else{
	            submenu.slideDown();
	        }
	    });
	    
	    var actionForm = $("#actionForm");

		$(".paginate_button a").on("click", function(e) {

					e.preventDefault();

					console.log('click');

					actionForm.find("input[name='rpageNum']").val($(this).attr("href"));
					actionForm.submit();
				});
	});
</script>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
<br/><br/><br/><br/><br/><br/><br/><br/>
<div class="container">
	<table>
		<thead>
				<tr>
					<th scope="col">번호</th>
					<th scope="col">평점</th>
					<th scope="col">제목</th>	
					<th scope="col">작성자</th>
					<th scope="col">등록일</th>
				</tr>		
					
		</thead>
		
		<c:if test="${fn:length(reviewList) != 0}">
			<c:forEach items="${reviewList}" var="reviewList">
				<tr>
					<td><c:out value="${reviewList.reviewNum }"/></td>
					
					<td>
						<span style="color: #ffc81e"> 
						<c:if test="${reviewList.reviewStar eq 1}">
							<c:out value="★☆☆☆☆" /></c:if>
						 <c:if test="${reviewList.reviewStar eq 2}">
							<c:out value="★★☆☆☆" /></c:if>
						 <c:if test="${reviewList.reviewStar eq 3}">
							<c:out value="★★★☆☆" /></c:if> 
						<c:if test="${reviewList.reviewStar eq 4}">
							<c:out value="★★★★☆" /></c:if> 
						<c:if test="${reviewList.reviewStar eq 5}">
							<c:out value="★★★★★" /></c:if>
						</span>
					</td>
					<td>
						<ul class="menu">
						<a><c:out value="${reviewList.reviewTitle }"/></a>
				            <ul class="hide">
				                <c:out value="${reviewList.reviewContent }"/>
				               	
				            </ul>
				            
				        </ul>
				    </td>
					<td><c:out value="${reviewList.reviewWriter }"/></td>
					<td><fmt:formatDate pattern="yyyy-MM-dd" value="${reviewList.reviewRegdate}" /></td>
				</tr>
				
			</c:forEach>
		</c:if>	
			
		
	</table>	
		<c:if test="${fn:length(reviewList) == 0}">
			<div>
				<table>
					<tr>
					<td>등록된 게시글이 없습니다.</td>
					</tr>
				</table>
			</div>
		</c:if>
				
		<form id='actionForm' action="/goods/goodsDetail" method='get'>
				<input type='hidden' name='rpageNum' value='${rpageMaker.rcri.rpageNum}'>
				<input type='hidden' name='ramount' value='${rpageMaker.rcri.ramount}'>
				<input type='hidden' name='goodsNum' value='${goodsNum}'>
		</form>
		
		<div class='pull-right'>
			<ul class="pagination">
				
					<c:if test="${rpageMaker.prev}">
							<li class="paginate_button previous">
							<a href="${rpageMaker.startPage -1}">Previous</a></li>
							<li class="paginate_button previous">
							<%-- <a href="/goods/goodsDetail/?goodsNum=${detail.goodsNum}&pageNum=${rpageMaker.startPage - 1 }">Previous</a></li> --%>
				
						</c:if>

						<c:forEach var="num" begin="${rpageMaker.startPage}"
							end="${rpageMaker.endPage}">
							<li class="paginate_button  ${rpageMaker.rcri.rpageNum == num ? "active":""} ">
								<a href="${num}">${num}</a>
							<%-- 	<a href="/goods/goodsDetail?goodsNum=${detail.goodsNum}&pageNum=${num}">${num}</a> --%>
							</li>
						</c:forEach>

						<c:if test="${rpageMaker.next}">
							<li class="paginate_button next"><a
								href="${rpageMaker.endPage +1 }">Next</a></li>
							<%-- <li class="paginate_button next">
							<a href="/goods/goodsDetail?goodsNum=${detail.goodsNum}&pageNum=${rpageMaker.endPage + 1}">Next</a></li> --%>
						</c:if>
			</ul>
		</div>	
		
		
			
					
</div>



</body>
</html>