<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<style>
        .container {
            margin-top: 150px;
            margin-bottom: 100px;
            margin-left: 100px;
            margin-right: 100px;
        }
</style>

<div class="container">

	<div>주문이 완료되었습니다.</div>
	
	<h4>주문내역</h4>
	
	<div class="order-list">
		<div class="order-info">
			상품명 : ${order.orderName } <br>
			주문일 : ${order.orderDate }
			
		</div>
		
		<div class="option-info">
			<c:forEach items="${order.optionList }" var="option">
				옵션명 : ${option.orderOptName } <br>
				가격 : ${option.orderOptPrice }<br>
				수량 : ${option.orderOptCount }<br>
				
			</c:forEach>
		</div>
	
	</div>
	
	



</div>