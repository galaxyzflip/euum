<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<style>
.container {
	margin-top: 150px;
	margin-bottom: 100px;
}

.order-goods-table td {
	padding-top: 50px;
	padding-bottom: 50px;
	border: 1px solid black;
	padding-left: 15px;
	padding-right: 15px;
}

.order-goods-table {
	border: 1px solid black;
	border-collapse: collapse;
	width: 1100px;
	margin: auto;
}

.pay-table {
	width: 1100px;
	border-collapse: collapse;
	border: 1px solid black;
}

.seller-name {
	font-size: 20px;
	font-weight: bold;
}

.goods-name {
	font-size: 16px;
}

.price-info {
	font-size: 25px;
}

.totalPrice {
	color: rgb(255, 102, 0);
}

.order-info {
	display: inline-block;
}

.order-title{
	text-align:center;
}
</style>

<div class="container">

	<div class='order-title'>주문이 완료되었습니다.</div>
	<div class='order-title'>
		<h4 >주문내역</h4>
	</div>	
	
	<table class="order-goods-table">
            <tr>
                <td class="goods-image-box" style="width:20%"><img
                        src="/resources/assets/img/apple-touch-icon.png" /></td>
                <td style="width:40%">

                        <div class="order-info">
                            <div class="goods-name">${order.orderName }</div>
							
							<c:forEach items="${order.optionList }" var="option">
								<div>
	                                <span class="goods-left">${option.orderOptName } / ${option.orderOptCount }개</span>
	                                <span class="goods-right optTotalPrice"><fmt:formatNumber value="${option.orderOptPrice * option.orderOptCount}" groupingUsed="true" /></span>
	                            </div>
								
							</c:forEach>

                            <div class="price-info">
                                <span class="goods-left">총 결제 금액</span>
                                <span class="goods-right totalPrice"> 원</span>
                            </div>

                        </div>
                </td>

                <td style="width:40%">
                    <div class="order-info">
                        <div>
                            <span class="goods-left">제출 파일 유형</span>
                            <span class="goods-right"> ${orer.orderFormat }</span>
                        </div>
                        <div>
                            <span class="goods-left">해상도</span>
                            <span class="goods-right"> ${order.orderResolution }</span>
                        </div>
                        <div>
                            <span class="goods-left">기본 사이즈</span>
                            <span class="goods-right"> ${order.orderSize }</span>
                        </div>
                        <div>
                            <span class="goods-left">수정 횟수</span>
                            <span class="goods-right">${order.orderModifyCount } 회</span>
                        </div>
                        <div>
                            <span class="goods-left">작업 기간</span>
                            <span class="goods-right"> 결제일로 부터 ${order.orderPeriod }일</span>
                        </div>
                    </div>
                </td>
            </tr>

        </table>

</div>

<script>
    
    	$(document).ready(function(){
    		
    		//옵션합계 금액 모두 더해서 총 결제금액 표시해주기
    		const optTotalPrice = document.getElementsByClassName("optTotalPrice")
    		console.log("옵션 합계 가격들 : " +optTotalPrice);
    		let totalPrice = 0;
    		
    		$.each(optTotalPrice, function(index, item){
    			totalPrice += parseInt($(item).text().replace(/,/g, ""));//금액 ,표시 없애주기
    			
    		})
    		    		
    		$('.totalPrice').text(totalPrice.toLocaleString());
    		//..옵션합계 금액...
    		
    		
    		
    	})
    	
    
    </script>