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

	<div>
	
		<ul class="tabs">
			<li class="tab-link" data-tab="tab-1">��������</li>
			<li class="tab-link" data-tab="tab-2">�Ƿ���FAQ</li>
			<li class="tab-link" data-tab="tab-3">������FAQ</li>
		</ul>
	</div>
	
	<div id="tab-1">	
		<table >
			<thead>
				<tr>
					<th scope="col">��ȣ</th>
					<th scope="col">����</th>	
					<th scope="col">�ۼ���</th>
					<th scope="col">�����</th>
					<th scope="col">��ȸ��</th>
				</tr>			
			</thead>
			
			<c:forEach items="${list}" var="notice">
            <tr>
              <td><c:out value="${notice.noticeNum}" /></td>
               <td>
                  <a class='move' href='<c:out value="${notice.noticeNum}"/>'>
                  <c:out value="${notice.noticeTitle}" />  
                  </a>
              <td><c:out value="${notice.noticeWriter}" /></td>
              <td><fmt:formatDate pattern="yyyy-MM-dd" value="${notice.noticeRegdate}" /></td>
              
            </tr>
          </c:forEach>
		</table>
	</div>
</body>
</html>