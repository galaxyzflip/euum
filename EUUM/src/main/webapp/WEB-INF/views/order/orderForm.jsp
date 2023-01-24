<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

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

        .price {
            color: rgb(255, 102, 0);
        }

        .order-info {
            display: inline-block;
        }

        
    </style>
    
     <div class="container">

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
                <td><input type="text"/></td>
            </tr>
            <tr>
                <td>이메일</td>
                <td>
                    <input type="text" value="${fn:substringBefore(loginUser.memberEmail, '@') }"/> @ 
                    <input type="text" value="${fn:substringAfter(loginUser.memberEmail, '@') }"/> 
                    <select>
                        <option>직접입력</option>
                        <option>naver.com</option>
                    </select>
                </td>
            </tr>
            <tr>
                <td>요청사항</td>
                <td><textarea rows="3" cols="80"></textarea></td>
            </tr>

        </table>

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
	                                <span class="goods-left">${order.goodsOptName } / ${order.goodsOptCount }개</span>
	                                <span class="goods-right">${order.goodsOptPrice }</span>
	                            </div>
								
							</c:forEach>

                            <div class="price-info">
                                <span class="goods-left">총 결제 금액</span>
                                <span class="goods-right price"> ${totalPrice }원</span>
                            </div>

                        </div>
                </td>

                <td style="width:40%">
                    <div class="order-info">
                        <div>
                            <span class="goods-left">제출 파일 유형</span>
                            <span class="goods-right"> psd, png, jpg</span>
                        </div>
                        <div>
                            <span class="goods-left">해상도</span>
                            <span class="goods-right"> 300 dpi</span>
                        </div>
                        <div>
                            <span class="goods-left">기본 사이즈</span>
                            <span class="goods-right"> 3000px 이상 4k</span>
                        </div>
                        <div>
                            <span class="goods-left">수정 횟수</span>
                            <span class="goods-right">2회</span>
                        </div>
                        <div>
                            <span class="goods-left">작업 기간</span>
                            <span class="goods-right"> 결제일로 부터 7일</span>
                        </div>
                    </div>
                </td>
            </tr>

        </table>
        
        
        
        <form action="/order/orderPro" method="post">
			<c:forEach items="${orderList }" var="order" varStatus="status">
				<input type="text" name="optionList[${status.index }].goodsOptName" value="${order.goodsOptName }">
				<input type="text" name="optionList[${status.index }].goodsOptPrice" value="${order.goodsOptPrice }">
				<input type="text" name="optionList[${status.index }].goodsOptCount" value="${order.goodsOptCount }">
				<br>
			</c:forEach>
				<br>
				<input type="text" name="orderFormat" value="${goodsInfo.goodsFormat }">
				<input type="text" name="orderName" value="${goodsInfo.goodsName }">
				<input type="text" name="orderModifyCount" value="${goodsInfo.goodsModifyCount }">
				<input type="text" name="orderPeriod" value="${goodsInfo.goodsPeriod }">
				<input type="text" name="orderResolution" value="${goodsInfo.goodsResolution }">
				<input type="text" name="orderSize" value="${goodsInfo.goodsSize }"> 
				
			<button type="submit">결제</button>	
        </form>



    </div>
    
    <script>
    
    	
    
    </script>