<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
<br/><br/><br/><br/><br/><br/>

<div>
	<table align="center" width="1000">
		
		<tr>
			<th><c:out value="${detail.requestStatus }"/></th>
			<th><c:out value="${detail.requestTitle }"/></th>
			<th><c:out value="${detail.requestCategory }"/>/<c:out value="${detail.requestUse }"/></th>
		</tr>
		<tr>
			<th>접수 마감일 : <fmt:formatDate pattern="yyyy-MM-dd" value="${detail.requestDead }"/></th>
			<th>작업 마감일 : <fmt:formatDate pattern="yyyy-MM-dd" value="${detail.requestFinish }"/></th>
			<th>예산 : <c:out value="${detail.requestMoney }"/></th>
		</tr>
		
		<tr>
			<th><c:out value="${detail.requestContent }"/></th>
		</tr>
	</table>
	
</div>

</body>
</html>