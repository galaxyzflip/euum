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
	    // menu Ŭ���� �ٷ� ������ �ִ� a �±׸� Ŭ��������
	    $(".menu>a").click(function(){
	        var submenu = $(this).next("ul");
	
	        // submenu �� ȭ��� ���϶��� ���� ������� ���� �ƴϸ� �Ʒ��� ������� ��ġ��
	        if( submenu.is(":visible") ){
	            submenu.slideUp();
	        }else{
	            submenu.slideDown();
	        }
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
					<th scope="col">��ȣ</th>
					<th scope="col">����</th>	
					<th scope="col">�ۼ���</th>
					<th scope="col">�����</th>
				</tr>			
		</thead>
		
		<c:if test="${fn:length(reviewList) != 0}">
			<c:forEach items="${reviewList}" var="reviewList">
				<tr>
					<td><c:out value="${reviewList.reviewNum }"/></td>
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
							<td>��ϵ� �Խñ��� �����ϴ�.</td>
							</tr>
						</table>
					</div>
				</c:if>
</div>



</body>
</html>