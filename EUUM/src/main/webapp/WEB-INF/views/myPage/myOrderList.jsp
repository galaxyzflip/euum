<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<html>
<style>
.container {
	margin-top: 150px;
	margin-bottom: 100px;
}

.active>.page-link, .page-link.active {
    z-index: 3;
    color: var(--bs-pagination-active-color);
    background-color: #fb8500;
    border-color: #fb8500;
}

.text-orange{
	color : #fb8500;
}

.bold{
	font-weight: bold;
}

.page-link{
	color : #fb8500;
}

.pagination{
	--bs-pagination-hover-color: #fb8500
}

img {
	width: 100px;
	height: 100px;
}

.order-list-table {
	border: 1px solid #dadada;
	width: 1000px;
	border-left: none;
	border-right: none;
	text-align: center;
	margin:auto;
}

.search-box{
	width: 1000px;
	margin:auto;
}

.order-list-table thead td {
	border-bottom: 1px solid #dadada;
	background-color: #f2f2f2;
	font-size: 10pt;
	text-align: center;
}

.order-list-table thead tr {
	height: 30px;
}

.order-list-table tbody td {
	border-bottom: 1px solid #dadada;
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
	
}

.order-detail {
	display: flex;
	padding: 20px 30px 50px 0px;
}

.order-detail div {
	width: 300px;
}

.order-list-table ul {
	text-align: center;
}

.order-list-table ul li {
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

.input-group >.form-control {
	flex: none;
}

.modal-body {
	margin: auto;
	background-color: #eeeeee;
}

.view-file{
	background: orange;
}

.price-td{
	font-weight: bold;
	font-size:18px;
}

.tap{
	width: 120;
    height: 50;
    display: inline-block;
    text-align: center;
    border:1px solid #f2f2f2;
    padding:18px;
    background-color: #ffffff;
    float:left;
    padding:15px;
    cursor: pointer;
}

.receipt-tap{
	background-color: #f2f2f2;
}

.search-tap{
	background-color: #fb8500;	
	color: white;
}

.tap-class{
	width:1000px;
	margin:auto;
	display:block;
	height:50px;
}

.search-box{
	display:none;
	
}

hr{
	width:1000px;
	margin-left:auto;
	margin-right:auto;
}

.order-list-table thead td{
	cursor : pointer;
}

</style>


<div class="container">

	<div class="tap-class">
		<div class="tap receipt-tap">?????????</div>
		<c:if test="${loginSeller ne null }">
			<div class="tap request-tap">?????????</div>
		</c:if>
		<div class="tap search-tap">????????????</div>
	</div>
	
	<div><hr></div>

	<div id="searchBox" class='search-box'>
		<form id='actionForm' action="/myPage/orderList" method='get'>
		
			<input type="hidden" name="sortType" value="${pageMaker.cri.sortType }">
			<input type="hidden" name="sortValue" value="${pageMaker.cri.sortValue }">
			<input type='hidden' name='pageNum' value='${pageMaker.cri.pageNum}'>
			<input type="hidden" name="goodsNum" value="${pageMaker.cri.goodsNum }">
			
			<select name="type">
				<option value="SMGNO" ${pageMaker.cri.type == 'SMGNO' ? 'selected' : '' }>??????</option>
				<option value="S" ${pageMaker.cri.type == 'S' ? 'selected' : '' }>?????? ?????????</option>
				<option value="M" ${pageMaker.cri.type == 'M' ? 'selected' : '' }>?????????</option>
				<option value="G" ${pageMaker.cri.type == 'G' ? 'selected' : '' }>?????????</option>
				<option value="N" ${pageMaker.cri.type == 'N' ? 'selected' : '' }>????????????</option>
				<option value="O" ${pageMaker.cri.type == 'O' ? 'selected' : '' }>????????????</option>
			</select>
			
			<span> <input type="text" name="keyword" id="searchKeyword"
				value='<c:out value="${pageMaker.cri.keyword }"/>' style="width: 200px; height: 30px; display: inline-block;">
			</span>
			
			<select name="amount" id="amount">
				<option value="5" ${pageMaker.cri.amount eq '5' ? 'selected' : '' }>5??????</option>
				<option value="10" ${pageMaker.cri.amount eq '10' ? 'selected' : '' }>10??????</option>
				<option value="25" ${pageMaker.cri.amount eq '25' ? 'selected' : '' }>25??????</option>
				<option value="50" ${pageMaker.cri.amount eq '50' ? 'selected' : '' }>50??????</option>
				<option value="100" ${pageMaker.cri.amount eq '100' ? 'selected' : '' }>100??????</option>
			</select> 
			
			<fieldset>
				<label><input type="checkbox" name="" value="" onclick='selectAll(this)'/>????????????</label>
				<br>
				<label><input type="checkbox" name="orderStatus" value="1"  ${fn:contains(pageMaker.cri.orderStatus, '1') ? 'checked' : ''} />???????????????</label>
				<label><input type="checkbox" name="orderStatus" value="2"  ${fn:contains(pageMaker.cri.orderStatus, '2') ? 'checked' : ''} />????????????</label>
				<label><input type="checkbox" name="orderStatus" value="3"  ${fn:contains(pageMaker.cri.orderStatus, '3') ? 'checked' : ''} />?????????</label>
				<label><input type="checkbox" name="orderStatus" value="4"  ${fn:contains(pageMaker.cri.orderStatus, '4') ? 'checked' : ''} />????????????</label>
				<label><input type="checkbox" name="orderStatus" value="5"  ${fn:contains(pageMaker.cri.orderStatus, '5') ? 'checked' : ''} />???????????????</label>
				<label><input type="checkbox" name="orderStatus" value="6"  ${fn:contains(pageMaker.cri.orderStatus, '6') ? 'checked' : ''} />??????</label>
				<label><input type="checkbox" name="orderStatus" value="7"  ${fn:contains(pageMaker.cri.orderStatus, '7') ? 'checked' : ''} />??????(???????????????)</label>
				<label><input type="checkbox" name="orderStatus" value="8"  ${fn:contains(pageMaker.cri.orderStatus, '8') ? 'checked' : ''} />??????(????????????)</label>
				<label><input type="checkbox" name="orderStatus" value="9"  ${fn:contains(pageMaker.cri.orderStatus, '9') ? 'checked' : ''} />??????(????????? ??????)</label>
				<label><input type="checkbox" name="orderStatus" value="10"  ${fn:contains(pageMaker.cri.orderStatus, '10') ? 'checked' : ''} />??????(?????????)</label>
			</fieldset>
			 
			<span>
				<button type="button" id="search" style="height: 32px; width: 80px;">??????</button>
				<button type="button" id="resetSearch" style="height: 32px; width: 80px;">????????????</button>
			</span>
		</form>
		
	</div>
	
	

	<table class="order-list-table">
		<thead>
			<tr>
				<td width="12%" onclick="sort('order_num', '${pageMaker.cri.sortType == 'order_num' ? (pageMaker.cri.sortValue =='desc' ? 'asc' : 'desc') : 'desc'}' )">????????????</td>
				<td width="13%">?????????</td>
				<td width="15%" onclick="sort('seller_nickname', '${pageMaker.cri.sortType == 'seller_nickname' ? (pageMaker.cri.sortValue =='desc' ? 'asc' : 'desc') : 'desc'}' )">?????????</td>
				<td class="order-name" width="*">????????????</td>
				<td width="10%" onclick="sort('ORDER_PRICE', '${pageMaker.cri.sortType == 'ORDER_PRICE' ? (pageMaker.cri.sortValue =='desc' ? 'asc' : 'desc') : 'desc'}' )">????????????</td>
				<td width="10%" onclick="sort('order_status', '${pageMaker.cri.sortType == 'order_status' ? (pageMaker.cri.sortValue =='desc' ? 'asc' : 'desc') : 'desc'}' )">????????????</td>
				<td width="10%"></td>
			</tr>
		</thead>

		<tbody>
		
		<c:if test="${empty orderList }">
			<tr height="100px">
				<td colspan="7">
			????????? ????????????
				</td>
			</tr>
			
		</c:if>
		
		<c:if test="${!empty orderList }">
			<c:forEach items="${orderList }" var="order" varStatus='status'>
			
				

				<tr id="order${status.index }">
				
					<input type="hidden" name="orderKeyNum" value="${order.orderKeyNum }"/>
					<input type="hidden" name="orderNum" value="${order.orderNum }"/>
					<input type="hidden" name="goodsNum" value="${order.goodsNum }"/>
					
				
					<td id="order-num">${order.orderNum }</td>
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
					<td class="price-td">${order.orderPrice } ???</td>
					<td class="order-status"><c:if test="${order.orderStatus eq 1 }">???????????????</c:if> <c:if
							test="${order.orderStatus eq 2 }">????????????</c:if> <c:if
							test="${order.orderStatus eq 3 }">?????????</c:if> <c:if
							test="${order.orderStatus eq 4 }">????????????</c:if> <c:if
							test="${order.orderStatus eq 5 }">???????????????</c:if> <c:if
							test="${order.orderStatus eq 6 }">??????</c:if> <c:if
							test="${order.orderStatus eq 7 }">??????(???????????????)</c:if> <c:if
							test="${order.orderStatus eq 8 }">??????(????????????)</c:if> <c:if
							test="${order.orderStatus eq 9 }">??????(????????? ??????)</c:if>
						<c:if test="${order.orderStatus eq 10 }">??????(?????????)</c:if>
					</td>
					<td><span class="que">?????????</span> <!-- <span class="arrow-top">???</span>
	                        <span class="arrow-bottom">???</span> --></td>
				</tr>

				<tr class="anw">
					<td colspan="7">
						<!-- <div style="display: block;"><b>?????? ?????????</b> : ?????? ??? ???????????????.</div> -->
						<div class="order-detail">
							<div class="order-tap1">
								<ul>
									<li class="text-orange bold">???????????? ???????????? : </li>
									<li class="text-orange">110-223-996057</li>
								</ul>
								<ul>
									<li class="text-orange">?????????</li>
									<li class="text-orange">(???)??????</li>
								</ul>
								<ul>
									<li>????????????</li>
									<li>?????????</li>
								</ul>
								<ul>
									<li>????????? ?????????</li>
									<li>${order.orderEmail }</li>
								</ul>
								<ul>
									<li>????????? ?????????</li>
									<li>${order.orderContact }</li>
								</ul>
							</div>
							<div class="order-tap2">
								<ul>
									<li>?????????</li>
									<li>${order.orderDate }</li>
								</ul>
								<ul>
									<c:if test="${order.orderStatus le 6 }">
										<li>???????????????</li>
										<li>${order.orderExpirationDate}</li>
									</c:if>
									
									<c:if test="${order.orderStatus gt 6}">
										<li>???????????????</li>
										<li>${order.orderCancleDate}</li>
									</c:if>
									
								</ul>
								<ul>
									<li>?????? ?????? ??????</li>
									<li>${order.orderFormat }</li>
								</ul>
								<ul>
									<li>?????????</li>
									<li>${order.orderResolution }</li>
								</ul>
								<ul>
									<li>?????? ?????????</li>
									<li>${order.orderSize }</li>
								</ul>
								<ul>
									<li>?????? ??????</li>
									<li>${order.orderModifyCount }</li>
								</ul>

								<ul>
									<li>?????? ??????</li>
									<li>?????????????????? ${order.orderPeriod } ???</li>
								</ul>
							</div>
							
							<div id="order-tap3">
								
								<ul>
									<li class="status-info-list">
										<c:if test="${order.orderStatus lt 3}">
											<button class="order-tap3" id="cancle-order" onclick="cancleOrder('${order.orderNum}', '${order.orderStatus }', 'order${status.index }')">?????? ??????</button><br>
										</c:if>
										
										<c:if test="${order.orderStatus lt 4}">
											<button class="order-tap3" id="add-order${status.index }"
										onclick="openModal('${order.orderNum}', '${order.goodsNum }', '${order.orderEmail }', '${order.orderContact}', '${order.sellerNickname}', '${order.sellerNum }')">???????????? ??????</button>
										</c:if>
									</li>
									
									<li class="confirm-order">
										<c:if test="${order.orderStatus eq 5 }">
											<button onclick="updateStatus('${order.orderNum}','${order.orderStatus + 1 }','order${status.index }')">????????????</button>
										</c:if>	
									</li>
									
									<li class="go-review">
										<c:if test="${order.orderStatus eq 6 }">

											<c:if test="${ order.reviewNum ne null}">
												<button onclick="modifyReview('${order.reviewNum}')">????????????</button>		
											</c:if>	
											
											<c:if test="${order.reviewNum eq null}">
												<button onclick="postReview('${order.orderKeyNum}','${order.orderNum }','${order.goodsNum }','order${status.index }')">????????????</button>		
											</c:if>	

										</c:if>	
									</li>
									
									<c:if test="${order.fileYn eq 'Y' }">
										<li class='file-yn'><button class="view-file" onclick="fileList(${order.orderKeyNum}, 'order${status.index }' ,'${order.orderNum }', '${order.orderStatus }')">????????????</button></li><br>
									</c:if>
									
									
									<li class="file-list">
										
									</li>		
								</ul>
								
								<ul>
										<li>???????????? : ${order.orderRequest }</li>
										<c:if test="${order.orderStatus eq 10 }">
											<li>???????????? : ${order.orderCancleReason }</li>
										</c:if>
									</ul>
							</div>
							
							
						</div>
					</td>
				</tr>
			</c:forEach>
		</c:if>
		</tbody>
	
	</table>
</div>

<!-- ????????? ????????? ?????? -->
<div style="margin:auto; text-align:center; width:700px">
	<div class="inner">
			<ul class="pagination" style="text-align: center; justify-content: center;">
			
				<c:if test="${pageMaker.prev }">
					<li class="paginate_button previous"><a class="page-link" href="${pageMaker.startPage - 1 }"
						tabindex="-1" aria-disabled="true">Previous</a></li>
				</c:if>		
						
					<c:forEach var="num" begin="${pageMaker.startPage }" end ="${pageMaker.endPage }">
						<li class="page-item paginate_button ${pageMaker.cri.pageNum == num ? 'active' : '' }">
							<a class="page-link" href="${num }">${num }</a>
						</li>
					</c:forEach>
					
				<c:if test="${pageMaker.next }">
					<li class="paginate_button next"><a class="page-link" href="${pageMaker.endPage + 1 }">Next</a></li>
				</c:if>	
			</ul>
	</div>
</div>

	
<script>

	function postReview(orderKeyNum, orderNum, goodsNum, orderForm){
		if(!confirm(orderNum + "??? ????????? ?????????????????????????")){
			return false;
		}		
		
		let url = "/review/insertForm?orderKeyNum="+orderKeyNum+"&goodsNum="+goodsNum;
		self.location.href = url;
	}

	let modal = $('.modal');
	
	$(document).ready(function() {
		
		var actionForm = $("#actionForm");
		actionForm.find("input[name='pageNum']").val('1');
		
		
		const orderStatus="${pageMaker.cri.orderStatus}";
		let goodsNum="${pageMaker.cri.goodsNum}";
		if(goodsNum == 0){
			goodsNum = null;
		}
		const keyword="${pageMaker.cri.keyword}";
		
		if(orderStatus || goodsNum || keyword){
			$('.search-box').css("display", "block");	
		}
		
		
		
		
		$('.request-tap').on('click', function(){
			self.location.href="/seller/orderList";
		})
		
		$('.receipt-tap').on('click', function(){
			self.location.href="/myPage/orderList";
		})
		
		$('#amount').on('change', function(){
			$(actionForm).submit();			
		})
		
		$(".paginate_button a").on("click", function(e) {

			e.preventDefault();
			actionForm.find("input[name='pageNum']").val($(this).attr("href"));
			actionForm.submit();
		});
		
		$('#search').on('click', function(e){
			e.preventDefault();
			$('input[name="pageNum"]').val('1');
			actionForm.submit();
		})
		
		$('input[name="orderStatus"]').on('click', function(){
			$('input[name="pageNum"]').val('1');
			actionForm.submit();
		})
		
		
		$('#resetSearch').on('click', function(){
			let url = $(actionForm).attr('action');
			self.location.href="/myPage/orderList";
		})
		
		function sort(sortType, sortValue){
			$('input[name="sortType"]').val(sortType);
			$('input[name="sortValue"]').val(sortValue);
			$('input[name="pageNum"]').val('1');
			actionForm.submit();
		}
		
		
		
		
		//?????? ????????????
		$('.file-list').on('click', 'div', function(e){
			
			var liObj = $(this);
			var path = encodeURIComponent('/' + liObj.data("path")+liObj.data("filename"));
			console.log(path);
			
			
			let status = liObj.attr("data-status");
			console.log('???????????? status ??? : ' + status);
			if(status != '6'){
				
				if(!confirm('????????? ???????????? ?????? ?????? ??????????????? ???????????????')){
					return false;
				}
				
				self.location ="/download?fileName="+path;
				
				let orderNum = liObj.data("key");
				let orderStatus = '5';
				let orderForm = liObj.data("form");
				console.log("??????????????? ???????????? : " + orderNum);
				
				updateStatus(orderNum, orderStatus, orderForm);
			}
			
			if(status == '6'){
				self.location ="/download?fileName="+path;
			}
		})
		
		

		
		//????????? ????????? ???????????? ???????????? ???????????? ??????
		$(".que").click(function() {
			$(this).parent().parent().next(".anw").stop().slideToggle(0);
			//$(this).toggleClass('on').siblings().removeClass('on');
			$(this).parent().parent().next(".anw").siblings(".anw").slideUp(0); // 1?????? ?????????
		});
		
		$(".search-tap").click(function() {
			$(".search-box").stop().slideToggle(300);
			//$(this).toggleClass('on').siblings().removeClass('on');
			$(".search-box").siblings(".search-box").slideUp(300); // 1?????? ?????????
		});

	});
	
	function modifyReview(reviewNum){
		let url = "/review/reviewModifyForm?reviewNum="+reviewNum;
		self.location.href=url;
	}
	
	
	function sort(sortType, sortValue){
		$('input[name="sortType"]').val(sortType);
		$('input[name="sortValue"]').val(sortValue);
		$('input[name="pageNum"]').val('1');
		actionForm.submit();
	}
	
	function selectAll(selectAll)  {
		  const checkboxes 
		       = document.getElementsByName('orderStatus');
		  
		  checkboxes.forEach((checkbox) => {
		    checkbox.checked = selectAll.checked;
		  })
		  
		  $('input[name="pageNum"]').val('1');
			actionForm.submit();
	}
	
	
	function updateStatus(orderNum, orderStatus, orderForm){
		
		if(orderStatus == '6'){
			if(!confirm('"????????????" ??? ?????? ????????? ??? ????????????')){
				return false;
			}			
		}
		
		console.log("???????????? ???????????? : " + orderNum + ", " + orderStatus);
		
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
					console.log('??????');
					downloadResult(orderForm, orderStatus, orderNum);
		       },
		       error: function (data) {
					alert('??????')
					console.log("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);	alert('??????');
		       }
			}) 
	}
	
	
	function downloadResult(orderForm, orderStatus, orderNum){
 		
 		let form = $('#'+orderForm)
			
 		
 		$(form).find('.order-status').text("???????????????");
 		
 		
 		if(orderStatus == '5'){
 			
 			inner = '';
 			inner += '<button class="" id="" onclick="updateStatus(\''+orderNum+'\', \'6\',\''+orderForm+'\')">????????????</button>'
 			
 			$(form).next().find('.confirm-order').html(inner);	
 		}
 		
 		if(orderStatus == '6'){
 			$(form).find('.order-status').text("??????");	
 			$(form).next().find('.file-list').find('div').attr('data-status', '6');
 			
 			
 			let orderNum = $(form).find('input[name="orderNum"]').val();
 			let orderKeyNum = $(form).find('input[name="orderKeyNum"]').val();
 			let goodsNum= $(form).find('input[name="goodsNum"]').val();
 			
 			
 			let inner ='<button onclick="postReview(\''+orderKeyNum+'\',\''+orderNum+'\',\''+goodsNum+'\',\''+orderForm+'\')">????????????</button>' 
 			
 			$(form).next().find('.go-review').html(inner);
 			
 			
 			$(form).next().find('.confirm-order').remove();
 		
 		}
 	}
	
	
		//fileList??? callback ????????????...	
		function viewFile(data, orderForm, orderKeyNum, orderNum, orderStatus){
			
		let form = $('#'+orderForm);
		
		$(form).next().find('.view-file').attr('onclick', null);
		
		let inner = '';
		let shortName = data.originalFileName.substr(0, 16) + "...";

		console.log("orderForm ?????? : " + orderForm);
		
		inner += '<div data-path="'+data.imageUploadPath+'" data-filename="'+data.imageFileName
		inner += '" data-key="'+orderNum+'" data-form="'+orderForm+'" data-status="'+orderStatus+'">'+shortName+'</div>'; 
		
		/* inner += '<div data-path="'+data.imageUploadPath+'" data-filename="'+data.imageFileName+'">'
		inner += '<span>'+shortName+'</span><span><img src="/resources/img/attach.png"></span></div>'; 
		 */
		
		console.log(inner);
		
		$(form).next().find('.file-list').html(inner);
	}
	
	//???????????? ?????? ????????? ??????????????? ??????
	 function fileList(orderKeyNum, orderForm, orderNum, orderStatus){
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
	        	
				viewFile(data, orderForm, orderKeyNum, orderNum, orderStatus);
	          },
	          error: function (data) {
				alert('??????')
				console.log("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);	alert('??????');
	          }
	        });
	}
	
	
	// cancleOrder ???????????? ????????????... cancleOrder ?????? ???  ajax ????????? ???????????? ??????...
	function updateOrder(data, order){
		console.log(data.orderNum);
		console.log(data.orderStatus);
		console.log('??????????????????'+order);
		
		let orderForm = document.getElementById(order);
		let status;
		
		if(data.orderStatus == '7'){
			$(orderForm).find('.order-status').text('??????(???????????????)');
		}else if(data.orderStatus == '9'){
			$(orderForm).find('.order-status').text('??????(?????? ??? ??????)');
		}
		
		$(orderForm).next().find('.status-info-list').css('display', 'none');
		
	}
	
	
	//?????? ?????? ??????
	function cancleOrder(orderNum, orderStatus, order){
		if(confirm("????????? ?????????????????????????")){
			
			console.log('????????? ???????????? : ' + orderNum);
			console.log('????????? ???????????? : ' + orderStatus)
			
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
					alert('??????');
				} 
				
			})
		}
	}

	//modal show
	function openModal(orderNum, goodsNum, orderEmail, orderContact, sellerNickname, sellerNum) {
		//????????? ????????? ?????? ?????????...
		$(orderModal).find('input[name="orderPrice"]').val('');
		$(orderModal).find("input[name='goodsNum']").val(goodsNum);
		$(orderModal).find("input[name='orderEmail']").val(orderEmail);
		$(orderModal).find("input[name='orderContact']").val(orderContact);
		$(orderModal).find("input[name='sellerNickname']").val(sellerNickname);
		$(orderModal).find("input[name='sellerNum']").val(sellerNum);

		console.log("????????? orderNum : " + orderNum);
		console.log("????????? goodsNum : " + goodsNum)
		console.log("????????? orderContact : " + orderContact)
		console.log("????????? sellerNickname : " + sellerNickname)

		$('input[name="orderName"]').val(orderNum + " ????????? ?????? ?????? ??????");
		orderModal.modal('show');
		//
	}

	
	/* $('#add-order').on('click', function() {
	
		
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
				alert('??????');
			} 
		})//end ajax
		
		orderModal.modal('hide');
	}) */
	
	
</script>


</html>
