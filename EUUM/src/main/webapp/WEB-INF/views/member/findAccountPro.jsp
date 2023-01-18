<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>

<style>
.container {
	margin-top: 150px;
	margin-bottom: 100px;
}
</style>



<div class="container">
	<c:if test="${resultMap.status eq -1 }">
		<div>찾으시는 Id 가 없습니다.</div>
	</c:if>

	<c:if test="${resultMap.status eq 0 }">
		
		<div>찾으시는 ID 는 ${resultMap.result.memberEmail } 입니다.</div>
	</c:if>
<%-- 	<c:if test="${resultMap.status eq 0 }">
		<c:set var="account" value="${resultMap.result }" />
		<div>찾으시는 ID 는 ${account.memberEmail } 입니다.</div>
	</c:if> --%>



</div>