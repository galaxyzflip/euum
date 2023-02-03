<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>


<div class="mainDiv">
	<div class="topDiv">
		<div class="topUse">${detail.goodsUse}</div>
		<div class="topCategory">${detail.goodsCategory} / 작품번호: ${detail.goodsNum}</div>
		<div class="topSubject"><b>${detail.goodsName}</b></div>
	</div>
	<div class="middleDiv">
		<div class="middleLeftDiv">
			<div>
				<img src="${pageContext.request.contextPath}/resources/img/${detail.goodsImageDate}${detail.goodsImage1}" style="width: 625px;" />
			</div>
			<div>
				<img src="${pageContext.request.contextPath}/resources/img/${detail.goodsImageDate}${detail.goodsImage2}" style="width: 625px;" />
			</div>
			<div>
				<img src="${pageContext.request.contextPath}/resources/img/${detail.goodsImageDate}${detail.goodsImage3}" style="width: 625px;" />
			</div>
		</div>
		<div class="middleRightDiv">
			<!-- 작가프로필 -->
			<div style="height: 450px; border: 1px solid black;">
<!-- 			<div style="height: 450px;"> -->
				<span>작가프로필</span>
			</div>
			<!-- 상세옵션 (고정 개수) -->
			<div style="height: 280px; border: 1px solid black;">
<!-- 			<div style="height: 280px;"> -->
				<span>상세옵션</span>
				<dl>
					<dt>제출 파일 유형</dt>
					<dd>${detail.goodsFormat}</dd>
				</dl>
				<dl>
					<dt>해상도</dt>
					<dd>${detail.goodsResolution}</dd>
				</dl>
				<dl>
					<dt>기본 사이즈</dt>
					<dd>${detail.goodsSize}</dd>
				</dl>
				<dl>
					<dt>수정 횟수</dt>
					<dd>${detail.goodsModifyCount}</dd>
				</dl>
				<dl>
					<dt>작업 기간</dt>
					<dd>${detail.goodsPeriod}</dd>
				</dl>
			</div>
			<!-- 추가옵션 (유동 개수) -->
			<div style="display: inline-block; width:350px; border: 1px solid black;">
<!-- 			<div style="display: inline-block; width:350px;"> -->
				<span>추가옵션</span>
				<ul>
					<c:choose>
						<c:when test="${fn:length(optionList) > 0}">
							<c:forEach items="${optionList}" var="selectList" varStatus="status">
								<ul id="option_info${status.index }">
									<span class="option-name">${selectList[0].goodsOptName}</span>
									<select id="select_option" class="select_option" onChange="selectOption(${status.index });">
										<option value="0">선택하세요</option>
										<c:forEach items="${selectList}" var="row" varStatus="status">

											<option value="${row.goodsOptContent}`${row.goodsOptPrice}">
												<span class="option-content">${row.goodsOptContent}</span> 
                        <span class="option-price">(<fmt:formatNumber value="${row.goodsOptPrice}" groupingUsed="true" />)</span>

											</option>
										</c:forEach>
									</select>
								</ul>
							</c:forEach>
						</c:when>
					</c:choose>
				</ul>
			</div>
			<!-- 주문 -->
			<div style="display: inline-block; width:350px; height:200px; border: 1px solid black;">
<!-- 			<div style="display: inline-block; width:350px;"> -->


				<!-- 선택된 옵션 보여주는곳... -->
				<div class="selected-option">
				
				</div>

				<span>결제 금액</span><br/>
				
				<strong><span class="total_price">0</span> 원</strong>
				<button type="button" onclick="buy()">주문 하기</button>
			</div>
		</div>
	</div>
	<!-- 상품 상세안내 -->
	<div class="bottomDiv">
		<div class="content">
			<span>상세 안내</span>
			<div>${detail.goodsContent}</div>
		</div>
		
	</div>
		<!-- 테스트로 만들어본 input type file -->
		<div class="grid-wrapper">
			<input type="file">
			<input type="file">
			<input type="file">
		</div>
</div>


<!-- 주문시 아래 폼에 input 태그 입력 후 서브밋 -->
<form id="orderForm" action="/order/orderForm" method="post">
	<input type="hidden" name="" value="${detail.memberNum }"/> 
	<input type="hidden" name="" value="${detail.goodsSellerNickname }"/> 
	
	
</form>

<script>

let num = 0;


function buy(){
	

	
	const selectedOption = document.getElementsByClassName('option-data');
	
	console.log('주문시작 선택된 옵션 확인 : ' + selectedOption);
	console.log('선택된 옵션 개수 : ' + selectedOption.length);
	
	if(selectedOption.length > 0){
		
		$.each(selectedOption, function(index, item){
			let buyOptionName = $(this).find('.option-name').text();
			let buyOptionPrice = $(this).find('.ori-price').val().replace(/,/g, "");
			let buyOptionCount = $(this).find('.option-count').text();
			
			console.log(index + " 번째 주문할 옵션 이름 : " + buyOptionName);	
			console.log(index + " 주문할 옵션 금액 : " + buyOptionPrice);	
			console.log(index + " 주문할 옵션 수량 : " + buyOptionCount);	
			
			let inner = '';
			let goodsNum = '${detail.goodsNum}';
			
			
			inner += '<input type="hidden" name="optionList['+index+'].orderOptName" value="'+buyOptionName+'">';
			inner += '<input type="hidden" name="optionList['+index+'].orderOptPrice" value="'+buyOptionPrice+'">';
			inner += '<input type="hidden" name="optionList['+index+'].orderOptCount" value="'+buyOptionCount+'">';
			inner += '<input type="hidden" name="optionList['+index+'].goodsNum" value="'+goodsNum+'">';
			
			console.log('입력할 input 태그들... : ' + inner);
			
			$('#orderForm').append(inner);
			
		})
		
		$('#orderForm').submit();
		$('#orderForm').load(location.href+'#orderForm');
		
	}else{
		alert('옵션 선택 후 주문해주시기 바랍니다');
	}
}

// 창선: 옵션명, 옵션내용, 금액 넣어주면 선택된 옵션 추가해주는 함수...
function insertSelectedOption(optionName, optionContent, optionPrice){
	
	
	let selectedOptionList = $('.option-name');
	let orderOptionName = optionName + ' / ' + optionContent;
	
	// 선민: toLocaleString()을 위한 Number타입 형변환
	let toLocaleStringOptionPrice = parseInt(optionPrice).toLocaleString();
	console.log("toLocaleStringOptionPrice: " + toLocaleStringOptionPrice);
		
	if(dulicateCheck(selectedOptionList, orderOptionName) != 0){
		console.log(optionName);
		
		let inner = '';
		
		inner += '<div class="option-data" id="optionData'+num+'"><div>';
		inner += '<div class="option-name">' + orderOptionName + '</div>';
		inner += '<div class="optionCountPrice"><span class="#">  <button class="plus" onclick="counter(\'plus\', '+num+')"> + </button> <span class="option-count" id="count' +num +'">1</span>';
		inner += '<button class="minus" onclick="counter(\'minus\', '+num+')"> - </button></span> <span class="option-price" id="price' + num + '">' + toLocaleStringOptionPrice + '</span>';
		inner += '<button id="delete' + num + '" onclick="deleteOption('+num+')" > x </button>'
		inner += '</div><input type="hidden" class="ori-price" id="ori-price' +num + '" value="'+optionPrice+'"/></div></div>';

		$('.selected-option').append(inner);
		
		num++;
		
		setTotalPrice();
	}
	
	
}

 
//선택된 옵션에서 사용할 index...

 
//옵션 선택시 동작
function selectOption(index) {
	
	let selectOption = document.getElementById('option_info'+index);
	//console.log(selectOption);
	
	//선택된 옵션명
	let optionName = $(selectOption).find('span').text();
	
	//선택된 옵션내용, 가격... 아래 optionContent, optionPrice 로 나눌거임
	let optionStr = $(selectOption).find('select option:selected').val();
	//선택된 옵션 내용
	let optionContent ='';
	//선택된 옵션 가격
	let optionPrice = '';
	//옵션 내용 옵션 가격 각 변수에 대입
	[optionContent, optionPrice] = optionStr.split('`');
	
	//선택하세요. 옵션 선택시에는 옵션 추가 안되게...
	if(optionContent === '0') {
		return false;
	}

	//선택된 옵션정보 로그 찍어보기
	//console.log(optionName);
	//console.log(optionContent);
	//console.log(optionPrice);
	
	insertSelectedOption(optionName, optionContent, optionPrice);
	
	//옵션 선택 후 셀렉트박스 초기화	
	const option = document.getElementsByClassName('select_option');
	$.each(option, function(index, item){
		item.value='0';
		
	})
	
//	$('.select_option option:eq(0)').prop("selected", true);
	
}


//선택된 옵션 리스트들(selectedOptionList)과 방금 선택된 옵션(orderOptionName) 을 비교하여 
//중복이면 return 0, 중복 아니면 1을 리턴...
function dulicateCheck(selectedOptionList, orderOptionName){
	
	let check = 1;
	
	$.each(selectedOptionList, function(index, item){
		if($(item).text() == orderOptionName){
			check = 0;
			return false;
		}
	})
	return check;
}
 


function deleteOption(index){
	const selectedOption = document.getElementById('optionData'+index);
	selectedOption.remove();
	setTotalPrice();
}

 
 //수량 증감 함수, 버튼 onclick 이벤트 걸려있음...
 //type : plus, minus ; num : 추가된 옵션의 인덱스...
 function counter(type, num){
	 
	 const countElement = document.getElementById('count'+num);
	 const priceElement = document.getElementById('price'+num);
	 const oriPriceElement = document.getElementById('ori-price'+num);
	 
	 let count = countElement.innerText;
	 let price = priceElement.innerText;
	 let oriPrice = oriPriceElement.value; 
	 
	 if(type === 'plus'){
		 count = parseInt(count) + 1;
		 
	 }else if(type === 'minus'){
		 count = parseInt(count) - 1;
	 }
	 
	 if(parseInt(count) < 1){
		 count = 1;
	 }
	 
	 price = parseInt(oriPrice) * parseInt(count);
	 console.log("계산된 가격... : " + price);
	 
	 countElement.innerText = count;
	 priceElement.innerText = price.toLocaleString();
	 
	 setTotalPrice();
	 
 }
 

// 선민: 추가옵션에 따른 최종금액 계산
// 옵션선택시, 수량 변경시 해당 함수 사용
 function setTotalPrice() {
	console.log('setTotalPrice 시작');
	
	let totalPrice = 0;
	
	$(".option-data").each(function(index, element) {
	    let optionPrice = $(element).find(".option-price").text();
	    
	    optionPrice = optionPrice.replace(/,/g, "");
	    
	    console.log('optionPrice : ' + optionPrice);
		// 총 가격
		totalPrice += parseInt(optionPrice);
	});
	
	console.log('합계금액 : ' + totalPrice);
    
	// 최종 합계 금액
	$(".total_price").text(totalPrice.toLocaleString());
}
</script>

<style>

.optionCountPrice span{

	justify-content: space-between;	
	padding-right:10px;
	padding-left:10px;
}



div {
	display: block;
}

ul {
	list-style: none;
}

.option-data dl dd{
	display : inline-block;
}

.option-data dl dt{
	display : block;
}

.mainDiv {
/* 	background-color: #d3d3d3; */
	position: relative;
	width: 1000px;
	margin: 0 auto;
/* 	max-width: 1000px; */
	min-height: 1000px;
}

.topDiv {
	height: 60px;
	margin: 120px 0px 30px;
}

.topUse {
	display: inline;
	margin: 0px 10px 0px 0px;
}

.topCategory {
	display: inline;
}

.topSubject {
	font-size: 4;
	margin: 10px 0px 10px 0px;
}

.middleDiv {
	max-width: 1080px;
	margin: 0 auto;
	display: flex;
	justify-content: center;
}

.middleLeftDiv {
	display: inline-block;
/* 	width: 65%; */
	width: 650px;
 	border: 1px solid black; 
}

.middleRightDiv {
	display: inline-block;
/* 	width: 35%; */
	width: 350px;
	text-align: center;
}

.bottomDiv {
	display: inline-block;
	border: 1px solid black; 
	position: relative;
	width: 100%;
	margin: 0 auto;
	max-width: 1000px;
	min-height: 300px;
}

.grid-wrapper {
	display: flex;
	justify-content: space-between;
}

.content {
	display: block;
	text-align: center;
	margin: 60px 0px 40px 0px
}





/* 자동 들여쓰기를 없애기 */
dd {
	margin: 0;
}

/* 제목부분을 왼쪽정렬하고, 오른쪽 패딩 여유분만들기 */
dt {
	float: left;
	padding-right: 10px;
}
</style>