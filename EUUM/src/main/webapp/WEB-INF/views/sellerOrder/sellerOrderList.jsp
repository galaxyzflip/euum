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

.input-group > .form-control{
	width:100%;
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
					<td>${order.orderNum }</td>
					<td>
					<c:if test="${!empty order.imageName }">
						<a href="/goods/goodsDetail?goodsNum=${order.goodsNum }">
							<img src="${pageContext.request.contextPath}/resources/img/${order.imageName}"></img>
						</a>
					</c:if>
					</td>
					<td>${order.sellerNickname }</td>
					<td class="order-name"><br> ${order.goodsName }<br>
						${fn:replace(order.orderName,'`','<br>')}</td>
					<td>${order.orderPrice } 원</td>
					<td class="order-status"><c:if test="${order.orderStatus eq 1 }">입금대기중</c:if> <c:if
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
							
							<div>
								<ul class="status-info-list">
									<li class="trans-btn">
										<c:if test="${order.orderStatus eq '2' }">
											<button onclick="transferOrderStatus('${order.orderNum}', '3', 'order${status.index }', '${order.orderKeyNum }')">작업중 전환</button><br>
										</c:if>
									</li>
									
									<li class='file-yn'>
										<c:if test="${order.fileYn eq 'Y' }">
											<button class="view-file" onclick="fileList(${order.orderKeyNum}, 'order${status.index }')">파일보기</button><br>
										</c:if>
									</li>
									
									
									<li class='file-upload'>
										<c:if test="${order.orderStatus eq '3' }">
											<c:if test="${order.fileYn eq 'N'}">
												<button onclick="openModal('${order.orderKeyNum}', 'order${status.index}', '${order.orderNum }')">파일 업로드</button><br>
											</c:if>
									</c:if>
									</li>
									
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
<div class="modal fade" id="fileUploadModal" tabindex="-1"
	aria-labelledby="exampleModalLabel" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<h1 class="modal-title fs-5" id="exampleModalLabel">파일 업로드</h1>
				<button type="button" class="btn-close" data-bs-dismiss="modal"
					aria-label="Close"></button>
			</div>


			<div class="modal-body">
				<div id="option1">
					
					<form action="/order/fileUpload" id="file-form" enctype="multipart/form-data" method="post">
	
						<div class="input-group">
							<input type="file" class="form-control" id="inputGroupFile04" aria-describedby="inputGroupFileAddon04" aria-label="Upload" name=uploadFile value="">
							
						</div>
	
						<div>
							<input type="hidden" name="orderKeyNum" value=""/>
							<input type="hidden" name="orderForm" value="">
							<input type="hidden" name="orderStatus" value="">
							<input type="hidden" name="orderNum" value="">
						</div>
					</form>
					
				</div>
			</div>

			<div class="modal-footer">
				<button type="button" id="cancle-order" class="btn btn-secondary" data-bs-dismiss="modal">취소</button>
				<button type="button" id="add-order" class="btn btn-primary"  onClick="fileUpload()">업로드</button>
			</div>
			
		</div>
	</div>
</div>
<!-- /.modal -->

<form id="actionForm" action="/order/transferOrderStatus" method="post">
	<input type="hidden" name="orderNum" value="">
	<input type="hidden" name="orderStatus" value="">
</form> 


<script>

$(document).ready(function() {
	
	//파일 다운로드
	$('.file-list').on('click', 'div', function(e){
		var liObj = $(this);
		var path = encodeURIComponent('/' + liObj.data("path")+liObj.data("filename"));
		console.log(path);
		self.location ="/download?fileName="+path
	})
	
	
	//상세정보 펼치기
	$(".que").click(function() {
		$(this).parent().parent().next(".anw").stop().slideToggle(0);
		//$(this).toggleClass('on').siblings().removeClass('on');
		$(this).parent().parent().next(".anw").siblings(".anw").slideUp(0); // 1개씩 펼치기
	});

})

	

	let uploadModal = $('#fileUploadModal');
	
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
	
	
	

	//이미지 업로드 함수
 	function fileUpload(){
 		
		console.log($('input[name="orderKeyNum"]').val());
		let orderKeyNum = $('input[name="orderKeyNum"]').val();
 		
		$('input[name="orderStatus"]').val('4');
 		var form = $('#file-form')[0];
 		var formData = new FormData(form);
 		let orderForm = $('input[name="orderForm"]').val()
 		
 		$.ajax({
 	          url: '/order/fileUpload',
 	          type: 'POST',
 	          data: formData,
 	          success: function (data) {
 	          	console.log(data);
 	          	console.log("파일업로드한 폼 아이디 : " + orderForm);
 	          	uploadResult(orderForm, orderKeyNum);

 	          },
 	          error: function (data) {
 	        	// console.log("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);	alert('에러');
 	          },
 	          cache: false,
 	          contentType: false,
 	          processData: false
 	        });
	}

 	
 	//이미지 업로드 후 작업되는 함수... orderStatus, 파일보기 버튼 생성
 	function uploadResult(orderForm, orderKeyNum){
 		
 		let inner = '<button class="view-file" onclick="fileList(\''+orderKeyNum+'\', \''+orderForm+'\')">파일보기</button>';
 		console.log(inner);
 		let form = $('#'+orderForm);
 		
 		$(form).find('.order-status').text("작업완료");
 		$(form).next().find('.file-yn').html(inner);
 		$(form).next().find('.file-upload').remove();
 		
 		
 		$(uploadModal).find('input[name="uploadFile"]').val('');
 		uploadModal.modal('hide');
 	}

	
	

	//modal show
	function openModal(orderKeyNum, orderForm, orderNum) {
		$('input[name="orderKeyNum"]').val(orderKeyNum);
		$('input[name="orderForm"]').val(orderForm);
		$('input[name="orderNum"]').val(orderNum);
		
		console.log($('input[name="orderForm"]').val());
		uploadModal.modal('show');

	}

	//진행중 상태 변경 함수
	function transferOrderStatus(orderNum, orderStatus, orderForm, orderKeyNum){
		if(!confirm("진행중 상태로 변경하시겠습니까?")){
			return false;			
		}
		updateStatus(orderNum, orderStatus, orderForm, orderKeyNum);
	}
	
	/* function transferOrderStatus(orderNum){
		if(confirm("진행중 상태로 변경하시겠습니까?")){
			$('#actionForm').find('input[name="orderNum"]').val(orderNum);
			$('#actionForm').find('input[name="orderStatus"]').val(3);	
			$('#actionForm').submit();
		}
		
	} */
	
	function updateStatus(orderNum, orderStatus, orderForm, orderKeyNum){
		 $.ajax({
				url : "/order/transferOrderStatusAjax",
				type : "post",
				data : {
					orderNum : orderNum,
					orderStatus : orderStatus
				},
				dataType : 'json',
		        success: function (data) {
					console.log(data);
					console.log('성공');
					resultUpdate(data, orderForm, orderKeyNum);
		       },
		       error: function (data) {
					alert('에러')
					console.log("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);	alert('에러');
		       }
			}) 
	}
	
	function resultUpdate(data, orderForm, orderKeyNum){
		let status = data.orderStatus;
		let form = $('#'+orderForm);
		let inner = '';
		$(form).find('.order-status').text("작업중");
		$(form).next().find('.trans-btn').remove();
// 		$(form).next().find('.trans-btn').css('display', 'none');
		
		inner += '<button onclick="openModal(\''+orderKeyNum+'\', \''+orderForm+'\', \''+data.orderNum+'\')">파일 업로드</button><br>'
		$(form).next().find('.file-yn').html(inner);
		
		
		
	}
</script>













