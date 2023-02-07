<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
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
	margin:auto;
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

.add-option {
	width: 350px !important;
}

.input-group>.form-control {
	flex: none;
}

.modal-body {
	margin: auto;
	background-color: #eeeeee;
}

.view-file{
	background: orange;
}

</style>


<div class="container">

	<table class="order-list-table">
		<thead>
			<tr>
				<td width="12%">주문번호 </td>
				<td width="13%">이미지</td>
				<td width="15%">작가명</td>
				<td class="order-name" width="*">주문내용</td>
				<td width="10%">결제금액</td>
				<td width="10%">주문상태</td>
				<td width="10%"></td>
			</tr>
		</thead>

		<tbody>
			<c:forEach items="${orderList }" var="order" varStatus='status'>
			
				

				<tr id="order${status.index }">
					<td id="order-num">${order.orderNum }</td>
					<td><a href="/goods/goodsDetail?goodsNum=${order.goodsNum }"><img src="/resources/assets/img/about-2.jpg"></img></a></td>
					<td>${order.sellerNickname }</td>
					<td class="order-name"><br> ${order.goodsName }<br>
						${fn:replace(order.orderName,'`','<br>')}</td>
					<td>${order.orderPrice } 원</td>
					<td id="order-status"><c:if test="${order.orderStatus eq 1 }">입금대기중</c:if> <c:if
							test="${order.orderStatus eq 2 }">입금확인</c:if> <c:if
							test="${order.orderStatus eq 3 }">작업중</c:if> <c:if
							test="${order.orderStatus eq 4 }">작업완료</c:if> <c:if
							test="${order.orderStatus eq 5 }">고객확인중</c:if> <c:if
							test="${order.orderStatus eq 6 }">완료</c:if> <c:if
							test="${order.orderStatus eq 7 }">취소(환불대기중)</c:if> <c:if
							test="${order.orderStatus eq 8 }">취소(환불완료)</c:if> <c:if
							test="${order.orderStatus eq 9 }">취소(입금전 취소)</c:if></td>
					<td><span class="que">자세히</span> <!-- <span class="arrow-top">↑</span>
	                        <span class="arrow-bottom">↓</span> --></td>
				</tr>

				<tr class="anw">
					<td colspan="7">
						<!-- <div style="display: block;"><b>작가 연락처</b> : 결제 후 공개됩니다.</div> -->
						<div class="order-detail">
							<div class="order-tap1">
								<ul>
									<li>입금은행 신한은행 : </li>
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
									<c:if test="${order.orderStatus le '6' }">
										<li>완료예정일</li>
										<li>${order.orderExpirationDate}</li>
									</c:if>
									
									<c:if test="${order.orderStatus gt '6' }">
										<li>주문취소일</li>
										<li>${order.orderCancleDate}</li>
									</c:if>
									
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
							
							<div id="order-tap3">
								<ul>
									<c:if test="${order.orderStatus lt 3 }">
										<button class="order-tap3" id="cancle-order" onclick="cancleOrder('${order.orderNum}', '${order.orderStatus }', 'order${status.index }')">주문 취소</button><br>
									</c:if>
									
									<c:if test="${order.orderStatus lt 4 }">
										<button class="order-tap3" id="add-order${status.index }"
									onclick="openModal('${order.orderNum}', '${order.goodsNum }', '${order.orderEmail }', '${order.orderContact}', '${order.sellerNickname}', '${order.sellerNum }')">추가금액 결제</button>
									</c:if>
									
									<c:if test="${order.fileYn eq 'Y' }">
										<li class='file-yn'><button class="view-file" onclick="fileList(${order.orderKeyNum}, 'order${status.index }')">파일보기</button></li><br>
									</c:if>
									
									<li class="file-list">
										
									</li>		
									
									<li>요청사항 : ${order.orderRequest }</li>
								</ul>
							</div>
							
							
						</div>
					</td>
				</tr>
			</c:forEach>

		</tbody>

	</table>
</div>

<!-- Modal -->
<div class="modal fade" id="addOptionModal" tabindex="-1"
	aria-labelledby="exampleModalLabel" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<h1 class="modal-title fs-5" id="exampleModalLabel">추가 주문하기</h1>
				<button type="button" class="btn-close" data-bs-dismiss="modal"
					aria-label="Close"></button>
			</div>


			<div class="modal-body">
			<form id="addOrder">
				<div id="option1">

					<div class="input-group mb-3">
						<span class="input-group-text" id="inputGroup-sizing-default">결제 내용</span> 
						<input type="text" class="form-control add-option"
							aria-label="Sizing example input" aria-describedby="inputGroup-sizing-default" name="orderName"	value="">
					</div>

					<div class="input-group mb-3">
						<span class="input-group-text" id="inputGroup-sizing-default">추가 금액</span> 
						<input type="text" class="form-control add-option"
							aria-label="Sizing example input" aria-describedby="inputGroup-sizing-default" name="orderPrice"> 원
					</div>
					
					<div>
						<input type="hidden" name="goodsNum" value=""/>
						<input type="hidden" name="orderContact" value=""/>
						<input type="hidden" name="orderEmail" value=""/>
						<input type="hidden" name="sellerNickname" value=""/>
						<input type="hidden" name="sellerNum" value=""/>
						<input type="hidden" name="orderPayType" value="임시값"/>
					</div>
				</div>
			</form>
			</div>


			<div class="modal-footer">
				<button type="button" id="cancle-order" class="btn btn-secondary"
					data-bs-dismiss="modal">취소</button>
				<button type="button" id="add-order" class="btn btn-primary">주문</button>
			</div>
		</div>
	</div>
</div>
<!-- /.modal -->
<script>

	let modal = $('.modal');
	
	$(document).ready(function() {
		
		//파일 다운로드
		$('.file-list').on('click', 'div', function(e){
			
			if(!confirm('파일을 다운로드 하면 고객 확인상태로 변경됩니다')){
				return false;
			}
			
			var liObj = $(this);
			var path = encodeURIComponent('/' + liObj.data("path")+liObj.data("filename"));
			console.log(path);
			self.location ="/download?fileName="+path
		})

		
		//자세히 클릭시 아코디언 형식으로 상세보기 출력
		$(".que").click(function() {
			$(this).parent().parent().next(".anw").stop().slideToggle(0);
			//$(this).toggleClass('on').siblings().removeClass('on');
			$(this).parent().parent().next(".anw").siblings(".anw").slideUp(0); // 1개씩 펼치기
		});

	});
	
	
		//fileList의 callback 비스무리...	
		function viewFile(data, orderForm){
		
		let inner = '';
		let shortName = data.originalFileName.substr(0, 16) + "...";

		console.log("orderForm 이름 : " + orderForm);
		
		inner += '<div data-path="'+data.imageUploadPath+'" data-filename="'+data.imageFileName+'">'
		inner += shortName+'</div>'; 
		
		/* inner += '<div data-path="'+data.imageUploadPath+'" data-filename="'+data.imageFileName+'">'
		inner += '<span>'+shortName+'</span><span><img src="/resources/img/attach.png"></span></div>'; 
		 */
		
		console.log(inner);
		
		let form = $('#'+orderForm); 
		$(form).next().find('.file-list').html(inner);
	}
	
	//파일보기 버튼 클릭시 파일리스트 출력
	 function fileList(orderKeyNum, orderForm){
		let imageUse = 'order';
		let imageUseNum = orderKeyNum;
		
		$.ajax({
	          url: '/order/getFile',
	          type: 'POST',
	          data: {
	        	imageUse : imageUse,
	        	imageUseNum : imageUseNum
	        	
	          },
	          dataType : 'json',
	          success: function (data) {
	        	console.log('ajax');
				console.log(data);
	        	console.log('ajax');
				viewFile(data, orderForm);
	          },
	          error: function (data) {
				alert('에러')
				console.log("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);	alert('에러');
	          }
	        });
	}
	
	
	// cancleOrder 콜백함수 비스무리... cancleOrder 함수 내  ajax 성공시 실행하는 함수...
	function updateOrder(data, order){
		console.log(data.orderNum);
		console.log(data.orderStatus);
		console.log('몇번오더인지'+order);
		
		let orderForm = document.getElementById(order);
		let status;
		
		if(data.orderStatus == '7'){
			$(orderForm).find('#order-status').text('취소(환불대기중)');
		}else if(data.orderStatus == '9'){
			$(orderForm).find('#order-status').text('취소(입금 전 취소)');
		}
		
		$(orderForm).next().find('#order-tap3').css('display', 'none');
		
	}
	
	
	//주문 취소 함수
	function cancleOrder(orderNum, orderStatus, order){
		if(confirm("주문을 취소하시겠습니까?")){
			
			console.log('취소할 주문번호 : ' + orderNum);
			console.log('취소할 주문상태 : ' + orderStatus)
			
		 	$.ajax({
				url : "/order/cancleOrder",
				type : "post",
				async : false,
//				contentType : "application/json; charset=utf-8",
	//			dataType : 'json',
	 			data : {
	 				orderNum : orderNum,
	 				orderStatus : orderStatus
	 			},
				success : function(data){
					console.log(data);
					updateOrder(data, order);
					
				},
				error : function(request, status, error){
					console.log("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
					alert('에러');
				} 
				
			})
		}
	}

	//modal show
	function openModal(orderNum, goodsNum, orderEmail, orderContact, sellerNickname, sellerNum) {
		//기존에 입력된 가격 초기화...
		$('input[name="orderPrice"]').val('');
		$(modal).find("input[name='goodsNum']").val(goodsNum);
		$(modal).find("input[name='orderEmail']").val(orderEmail);
		$(modal).find("input[name='orderContact']").val(orderContact);
		$(modal).find("input[name='sellerNickname']").val(sellerNickname);
		$(modal).find("input[name='sellerNum']").val(sellerNum);

		console.log("선택한 orderNum : " + orderNum);
		console.log("선택된 goodsNum : " + goodsNum)
		console.log("선택된 orderContact : " + orderContact)
		console.log("선택된 sellerNickname : " + sellerNickname)

		$('input[name="orderName"]').val(orderNum + " 주문의 추가 금액 결제");
		modal.modal('show');
		//
	}

	
	$('#add-order').on('click', function() {
	
		
		let formData = $('#addOrder');
		
		$.ajax({
			url : "/order/addOrder",
			type : "post",
			async:false,
			//contentType : "application/json; charset=utf-8",
			dataType : 'json',
 			data : formData.serialize(),
			success : function(data){
				location.reload()
			},
			error : function(request, status, error){
				console.log("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
				alert('에러');
			} 
		})//end ajax
		
		modal.modal('hide');
	})
	
</script>













