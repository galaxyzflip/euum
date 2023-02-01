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

					actionForm.find("input[name='pageNum']").val($(this).attr("href"));
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
				
		<form id='actionForm' action="/review/list" method='get'>
				<input type='hidden' name='pageNum' value='${pageMaker.rcri.pageNum}'>
				<input type='hidden' name='amount' value='${pageMaker.rcri.amount}'>
		</form>
		
		<div class='pull-right'>
				<ul class="pagination">
				
					<c:if test="${pageMaker.prev}">
							<li class="paginate_button previous"><a
								href="${pageMaker.startPage -1}">Previous</a></li>
						</c:if>

						<c:forEach var="num" begin="${pageMaker.startPage}"
							end="${pageMaker.endPage}">
							<li class="paginate_button  ${pageMaker.rcri.pageNum == num ? "active":""} ">
								<a href="${num}">${num}</a>
							</li>
						</c:forEach>

						<c:if test="${pageMaker.next}">
							<li class="paginate_button next"><a
								href="${pageMaker.endPage +1 }">Next</a></li>
						</c:if>
				</ul>
			</div>	
					
</div>



</body>
</html>