<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>    
<!DOCTYPE html>
<html>
<head>
<script>	
$(document).ready(function(){
	
	$(".move").on("click", function(e){
		e.preventDefault();
		actionForm.append("<input type='hidden' name='requestNum' value='"+$(this).attr("href")+"'>");
		actionForm.attr("action","/request/requestDetail");
		actionForm.submit();
	});

	var actionForm = $("#actionForm");

	$(".paginate_button a").on("click", function(e) {

				e.preventDefault();

				console.log('click');

				actionForm.find("input[name='rqpageNum']").val($(this).attr("href"));
				actionForm.submit();
			});
	
	var searchForm = $("#searchForm");

	$("#searchForm button").on("click",function(e) {
		

		if (!searchForm.find("option:selected").val()) {
			alert("�˻������� �����ϼ���");
			return false;
			}

			if (!searchForm.find("input[name='keyword']").val()) {
			alert("Ű���带 �Է��ϼ���");
			return false;
			}

			searchForm.find("input[name='pageNum']").val("1");
			e.preventDefault();
			searchForm.submit();

			});
});
</script>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
<br/><br/><br/><br/><br/><br/><br/>
<div>
	<table border="1">
		<thead>
			<tr>
				<th>����</th>
				<th>ī�װ�</th>
				<th>����</th>
				<th>�ۼ���</th>
				<th>��������</th>
				<th>�Ϸ����</th>
			</tr>	
		</thead>
		
		<div>
			<form>
				<c:forEach items="${rqlist }" var="rqlist">
					<tr>	
						<input type="hidden" value="${rqlist.requestNum } }"/>
						<td><c:out value="${rqlist.requestStatus }"/></td>
						<td><c:out value="${rqlist.requestCategory }"/></td>
						<td>
						<a class='move' href='<c:out value="${rqlist.requestNum }"/>'>	
						<c:out value="${rqlist.requestUse }"/> &nbsp;&nbsp;<c:out value="${rqlist.requestTitle }"/></a></td>
						<td><c:out value="${rqlist.requestWriter }"/></td>
						<td><fmt:formatDate pattern="yyyy-MM-dd" value="${rqlist.requestFinish }" /></td>
						<td><fmt:formatDate pattern="yyyy-MM-dd" value="${rqlist.requestDead }" /></td>							
					</tr>	
				</c:forEach>
			</form>		
		</div>
							
	</table>
	<form id='actionForm' action="/request/requestList" method='get'>
		<input type='hidden' name='rqpageNum' value='${rqpageMaker.rqcri.rqpageNum}'>
		<input type='hidden' name='rqamount' value='${rqpageMaker.rqcri.rqamount}'>
		<input type='hidden' name='rqtype' value='<c:out value="${ rqpageMaker.rqcri.rqtype }"/>'> 
		<input type='hidden' name='rqkeyword' value='<c:out value="${ pageMaker.rqcri.rqkeyword }"/>'>
	</form>
</div>

</body>
</html>