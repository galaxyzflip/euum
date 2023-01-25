<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

  <style>
        .container {
            margin-top: 150px;
            margin-bottom: 100px;
            margin-left: 100px;
            margin-right: 100px;
        }

       .order-goods-table td {
            padding-top: 50px;
            padding-bottom: 50px;
            border: 1px solid black;
            padding-left:15px;
            padding-right:15px;
        }

        .order-goods-table{

            border: 1px solid black;
            border-collapse: collapse;
            width: 1100px;
            margin: auto;
        }

        .pay-table{
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

        
    </style>
    
     <div class="container">
		<form id="order-form" action="/order/orderPro" method="post">
			<!-- 주문할 상품정보 및 이메일 등... -->
			<input type="hidden" name="orderFormat" value="${goodsInfo.goodsFormat }"/>
			<input type="hidden" name="orderName" value="${goodsInfo.goodsName }">
			<input type="hidden" name="orderModifyCount" value="${goodsInfo.goodsModifyCount }">
			<input type="hidden" name="orderPeriod" value="${goodsInfo.goodsPeriod }">
			<input type="hidden" name="orderResolution" value="${goodsInfo.goodsResolution }">
			<input type="hidden" name="orderSize" value="${goodsInfo.goodsSize }">
			<input type="hidden" name="goodsNum" value="${goodsInfo.goodsNum }">
			<input type="hidden" name="orderEmail" value="">
			<input type="hidden" name="orderPayType" value="임시값">
			<input type="hidden" name="orderImage" value="임시값">
			
			<!-- 주문할 옵션 정보들 -->
			<c:forEach items="${orderList }" var="order" varStatus="status">
				<input type="hidden" name="optionList[${status.index }].orderOptName" value="${order.orderOptName }">
				<input type="hidden" name="optionList[${status.index }].orderOptPrice" value="${order.orderOptPrice }">
				<input type="hidden" name="optionList[${status.index }].orderOptCount" value="${order.orderOptCount }">
				<input type="hidden" name="optionList[${status.index }].goodsNum" value="${order.goodsNum }">
			</c:forEach>
			
			
        <table class="pay-table">
            <tr>
                <td colspan="3">결제 방법 다음 페이지에 안내되는 계좌번호로 입금합니다.</td>
            </tr>

            <tr>
                <td>입금자명</td>
                <td><input type="text" value="${loginUser.memberName }"/> * 작가에게 노출 안됨</td>
            </tr>
            <tr>
                <td>연락처</td>
                <td><input type="text" name="orderContact" value="${loginUser.memberMobile }"/></td>
            </tr>
            <tr>
                <td>이메일</td>
                <td>
                    <input type="text" class="start-email" value="${fn:substringBefore(loginUser.memberEmail, '@') }"/> @ 
                    <input type="text" class="end-email" value="${fn:substringAfter(loginUser.memberEmail, '@') }"/> 
                    <select>
                        <option>직접입력</option>
                        <option>naver.com</option>
                    </select>
                </td>
            </tr>
            <tr>
                <td>요청사항</td>
                <td><textarea rows="3" cols="80" name="orderRequest"></textarea></td>
            </tr>

        </table>
        <button type="submit" id="order-btn">결제</button>
 		</form>
        <br><br>

        <table class="order-goods-table">
            <tr>
                <td class="goods-image-box" style="width:20%"><img
                        src="/resources/assets/img/apple-touch-icon.png" /></td>
                <td style="width:40%">

                        <div class="order-info">
                            <div class="seller-name">${goodsInfo.goodsSellerNickname }</div>
                            <div class="goods-name">${goodsInfo.goodsName }</div>

							
							<c:forEach items="${orderList }" var="order">
								<div>
	                                <span class="goods-left">${order.orderOptName } / ${order.orderOptCount }개</span>
	                                <span class="goods-right optTotalPrice"><fmt:formatNumber value="${order.orderOptPrice * order.orderOptCount}" groupingUsed="true" /></span>
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
                            <span class="goods-right"> ${goodsInfo.goodsFormat }</span>
                        </div>
                        <div>
                            <span class="goods-left">해상도</span>
                            <span class="goods-right"> ${goodsInfo.goodsResolution }</span>
                        </div>
                        <div>
                            <span class="goods-left">기본 사이즈</span>
                            <span class="goods-right"> ${goodsInfo.goodsSize }</span>
                        </div>
                        <div>
                            <span class="goods-left">수정 횟수</span>
                            <span class="goods-right">${goodsInfo.goodsModifyCount } 회</span>
                        </div>
                        <div>
                            <span class="goods-left">작업 기간</span>
                            <span class="goods-right"> 결제일로 부터 ${goodsInfo.goodsPeriod }일</span>
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
    		
    		
    		//결제버튼 클릭시 이메일 합치고 submit
    		$('#order-btn').on('click', function(e){
    			e.preventDefault();
    			let email = $('.start-email').val() + "@" + $('.end-email').val();
    			$('input[name="orderEmail"]').val(email);
    			$('#order-form').submit();
    			
    		})
    		
    		
    	})
    	
    
    </script>