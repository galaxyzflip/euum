<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<style>
.container {
	margin-top: 150px;
	margin-bottom: 100px;
}

img {
	width: 100px;
	height: 100px;
}

.order-list-table {
	border: 1px solid black;
	width: 1000px;
	border-left: none;
	border-right: none;
	text-align: center;
}

.order-list-table thead td {
	border-bottom: 1px solid black;
	background-color: #eeeeee;
	font-size: 10pt;
	text-align: center;
}

.order-list-table thead tr {
	height: 30px;
}

.order-list-table tbody td {
	border-bottom: 1px solid black;
}

.order-list-table td {
	/* border-left:1px dotted black;
            border-right:1px dotted black; */
	
}

tbody .order-name {
	text-align: left;
	padding-left: 5px;
	height: 200px;
}

.order-detail {
	background-color: #eeeeee;
}

.order-detail {
	display: flex;
	padding: 20px 30px 50px 0px;
}

.order-detail div {
	width: 300px;
}

ul {
	text-align: center;
}

ul li {
	display: inline-block;
	padding: 0px;
}

.anw {
	display: none;
	font-size: 14px;
}

.que.on {
	color: orange;
	font-weight: bold;
}
</style>
<script>
	$(document).ready(function() {

		$(".que").click(function() {
			$(this).parent().parent().next(".anw").stop().slideToggle(0);
			$(this).toggleClass('on').siblings().removeClass('on');
			$(this).parent().parent().next(".anw").siblings(".anw").slideUp(0); // 1개씩 펼치기
		});

	})
</script>


<div class="container">

	<table class="order-list-table">
		<thead>
			<tr>
				<td width="12%">주문번호</td>
				<td width="13%">이미지</td>
				<td width="15%">작가명</td>
				<td class="order-name" width="*">주문내용</td>
				<td width="10%">결제금액</td>
				<td width="10%">주문상태</td>
				<td width="10%"></td>
			</tr>
		</thead>

		<tbody>
			<c:forEach items="${orderList }" var="order">
				<tr>
					<td>${order.orderNum }</td>
					<td><img src="/resources/assets/img/about-2.jpg"></img></td>
					<td>${order.sellerNickname }</td>
					<td class="order-name"><br>
						${order.goodsName }<br>
						${fn:replace(order.orderName,'`','<br>')}
					
					</td>
					<td> 없음 원</td>
					<td>
						<c:if test="${order.orderStatus eq 1 }">입금대기중</c:if>
						<c:if test="${order.orderStatus eq 2 }">입금확인</c:if>
						<c:if test="${order.orderStatus eq 3 }">작업중</c:if>
						<c:if test="${order.orderStatus eq 4 }">작업완료</c:if>
						<c:if test="${order.orderStatus eq 5 }">고객확인중</c:if>
						<c:if test="${order.orderStatus eq 6 }">완료</c:if>
						<c:if test="${order.orderStatus eq 7 }">취소(환불대기중)</c:if>
						<c:if test="${order.orderStatus eq 8 }">취소(환불완료)</c:if>
						<c:if test="${order.orderStatus eq 9 }">취소(입금전 취소)</c:if>
						
					</td>
					<td><span class="que">자세히</span> <!-- <span class="arrow-top">↑</span>
	                        <span class="arrow-bottom">↓</span> --></td>
				</tr>

				<tr class="anw">
					<td colspan="7">
						<!-- <div style="display: block;"><b>작가 연락처</b> : 결제 후 공개됩니다.</div> -->
						<div class="order-detail">
							<div class="order-tap1">
								<ul>
									<li>입금은행 신한은행 :</li>
									<li>110-223-996057</li>
								</ul>
								<ul>
									<li>예금주</li>
									<li>(주)이음</li>
								</ul>
								<ul>
									<li>입금자명</li>
									<li>최창선</li>
								</ul>
								<ul>
									<li>주문자 이메일</li>
									<li>${order.orderEmail }</li>
								</ul>
								<ul>
									<li>주문자 연락처</li>
									<li>${order.orderContact }</li>
								</ul>
							</div>
							<div class="order-tap2">
								<ul>
									<li>결제일</li>
									<li>${order.orderDate }</li>
								</ul>
								<ul>
									<li>완료예정일</li>
									<li>${order.orderExpirationDate}</li>
								</ul>
								<ul>
									<li>제출 파일 유형</li>
									<li>${order.orderFormat }</li>
								</ul>
								<ul>
									<li>해상도</li>
									<li>${order.orderResolution }</li>
								</ul>
								<ul>
									<li>기본 사이즈</li>
									<li>${order.orderSize }</li>
								</ul>
								<ul>
									<li>수정 횟수</li>
									<li>${order.orderModifyCount }</li>
								</ul>

								<ul>
									<li>작업 기간</li>
									<li>시작일로부터 ${order.orderPeriod } 일</li>
								</ul>
							</div>

							<div class="order-tap3">추가금액 결제</div>
						</div>
					</td>
				</tr>
			</c:forEach>

		</tbody>

	</table>



</div>