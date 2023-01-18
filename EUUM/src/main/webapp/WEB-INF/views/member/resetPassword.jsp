<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<style>
.container {
	margin-top: 150px;
	margin-bottom: 100px;
}
</style>


<c:if test="${resultMap.status eq -1}">
	<div class="container">
		
		<div><p>계정을 찾을 수 없습니다. </p></div>
			
	</div>
</c:if>


<c:if test="${resultMap.status eq 0}">

<div class="container">

	<div class="rest-form">
		<div class="input-form">
			<form method="post" action="/member/resetPass">
				<input type="hidden" name="memberEmail" value="${resultMap.result.memberEmail }">
				
				<div>
					<label>변경할 비밀번호</label>
					<input id="pw1" type="password" name="memberPassword" placeholder="비밀번호">
				</div>
				<div>
					<label>변경할 비밀번호 확인</label>
					<input id="pw2" type="password" name="memberPassword_check" placeholder="비밀번호 확인">
				</div>
				<button type="submit" class="">비밀번호 변경</button>
			</form>
		</div>
		
		<div class="validate-result">
			<p></p>		
		</div>
	</div>
	
	
</div>

</c:if>

