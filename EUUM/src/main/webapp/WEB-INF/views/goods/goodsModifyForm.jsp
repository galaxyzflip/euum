<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

<div class="mainBody" style="margin: 100px;">
	<div class="mainDiv">
		<c:choose>
			<c:when test="${goods.goodsStatus eq '임시저장'}">
				<form action="/goods/goodsModifyTempToRegularPro" method="post" id="goodsForm" enctype="multipart/form-data">
			</c:when>
			<c:otherwise>
				<form action="/goods/goodsModifyPro" method="post" id="goodsForm" enctype="multipart/form-data">
			</c:otherwise>
		</c:choose>		
		
			<div class="div_register">
			<h1><strong>상품 등록</strong></h1>
			<hr style="border:solid 1px #FF6600;"><br/><br/>
				<table>
					<tr>
						<th>상품 번호</th>
						<td>
							<span>${goods.goodsNum}</span>
							<input type="hidden" name="goodsNum" value="${goods.goodsNum}">
							<input type="hidden" name="goodsStatus" value="${goods.goodsStatus}">
							<span class="span_validate" id="goodsNameMsg" aria-live="assertive"></span>
						</td>
					</tr>
					<tr>
						<th>카테고리</th>
						<td>
							<select name="goodsCategory" id="input_goodsCategory">
								<option value="">선택하세요</option>
								<option value="캐릭터 일러스트">캐릭터 일러스트</option>
								<option value="일러스트">일러스트</option>
								<option value="3D 모델링">3D 모델링</option>
								<option value="디자인">디자인</option>
								<option value="웹툰 · 만화">웹툰 · 만화</option>
							</select>
							<span class="span_validate" id="goodsCategoryMsg" aria-live="assertive"></span>
						</td>
					</tr>
					<tr>
						<th>제목</th>
						<td>
							<input type="text" name="goodsName" id="input_goodsName" value="${goods.goodsName}" class="input_text_l" placeholder="특수문자, 이모티콘 등으로 제목을 강조하는 경우 예고 없이 삭제됩니다">
							<span class="span_validate" id="goodsNameMsg" aria-live="assertive"></span>
						</td>
					</tr>
				</table>
			</div>
			<div class="div_register">
				<table>
					<tr>
						<th>현재 등록 이미지</th>
						<td>
							<c:choose>
								<c:when test="${goods.goodsImage1 eq null}">
									<img class="thumb" src="${pageContext.request.contextPath}/resources/img/no_image.png">
								</c:when>
								<c:otherwise>
									<img class="thumb" src="${pageContext.request.contextPath}/resources/img/${goods.goodsImageDate1}s_${goods.goodsImage1}">
								</c:otherwise>
							</c:choose>
							<c:choose>
								<c:when test="${goods.goodsImage2 eq null}">
									<img class="thumb" src="${pageContext.request.contextPath}/resources/img/no_image.png">
								</c:when>
								<c:otherwise>
									<img class="thumb" src="${pageContext.request.contextPath}/resources/img/${goods.goodsImageDate2}s_${goods.goodsImage2}">
								</c:otherwise>
							</c:choose>
							<c:choose>
								<c:when test="${goods.goodsImage3 eq null}">
									<img class="thumb" src="${pageContext.request.contextPath}/resources/img/no_image.png">
								</c:when>
								<c:otherwise>
									<img class="thumb" src="${pageContext.request.contextPath}/resources/img/${goods.goodsImageDate3}s_${goods.goodsImage3}">
								</c:otherwise>
							</c:choose>
						</td>
					</tr>
					<tr>
						<th>변경할 이미지</th>
						<td>
							<input type="file" name="uploadFile" id="uploadFile1" class="input_file">
							<input type="file" name="uploadFile" id="uploadFile2" class="input_file">
							<input type="file" name="uploadFile" id="uploadFile3" class="input_file">
						</td>
					</tr>
				</table>
				<div class="caution" style="margin:10px 0 0 150px;">
					<span class="span_validate" style="margin-left: 0px;" id="uploadFileMsg" aria-live="assertive"></span>
				</div>
				<div class="caution" style="margin:10px 0 0 150px;">
				* 권장 사이즈 : 가로 세로 4 : 3 비율 <span class="lsp0">( 732px x 549px )</span> / 1개당 최대 용량 20MB <br>
				* 업로드 중 에러가 발행할 경우 이미지 사이즈를 줄여주세요.
				</div>
			</div>
			<div class="div_register">
				<table>
					<tr>
						<th>제작용도</th>
						<td>
							<input type="radio" name="goodsUse" id="commercial" class="input_goodsUse" value="상업용">
							<label for="commercial" class="label_radio">상업용</label>
							<input type="radio" name="goodsUse" id="no_commercial" class="input_goodsUse" value="비상업용">
							<label for="no_commercial" class="label_radio">비상업용</label>
							<input type="radio" name="goodsUse" id="all_for_use" class="input_goodsUse" value="상업용+비상업용">
							<label for="all_for_use" class="label_radio" style="padding-right: 0px;">상업용+비상업용</label>
							<span class="span_validate" id="goodsUseMsg" aria-live="assertive" style="margin-left: 7px;" ></span>
						</td>
					</tr>
					<tr>
						<th>제출파일 유형</th>
						<td>
							<input type="text" name="goodsFormat" id="input_goodsFormat" value="${goods.goodsFormat}" class="input_text_s" placeholder="예) png, jpg, ai">
							<span class="span_validate" id="goodsFormatMsg" aria-live="assertive"></span>
						</td>
						
					</tr>
					<tr>
						<th>기본 사이즈</th>
						<td>
							<input type="text" name="goodsSize" id="input_goodsSize" value="${goods.goodsSize}" class="input_text_s" placeholder="예) 1280x720, A4">
							<span class="span_validate" id="goodsSizeMsg" aria-live="assertive"></span>
						</td>
					</tr>
					<tr>
						<th>작업 해상도</th>
						<td>
							<input type="text" name="goodsResolution" id="input_goodsResolution" value="${goods.goodsResolution}" class="input_text_s">
							dpi
							<span class="span_validate" id="goodsResolutionMsg" aria-live="assertive"></span>
						</td>
					</tr>
					<tr>
						<th>수정 횟수</th>
						<td>
							<input type="text" name="goodsModifyCount" id="input_goodsModifyCount" value="${goods.goodsModifyCount}" class="input_text_ss" placeholder="">
							회
							<span class="span_validate" id="goodsModifyCountMsg" aria-live="assertive"></span>
						</td>
					</tr>
					<tr>
						<th>작업 소요기간</th>
						<td>
							<span style="padding-right: 5px;">주문 승인일로부터</span>
							<input type="text" name="goodsPeriod" id="input_goodsPeriod" value="${goods.goodsPeriod}" class="input_text_ss">
							일
							<span class="span_validate" id="goodsPeriodMsg" aria-live="assertive"></span>
						</td>
					</tr>
				</table>
			</div>
			<div class="div_register">
				<table class="opTable">
					<tr>
						<th>추가옵션</th>
						<td>
							<button type="button" id="opAdd_bt">옵션추가</button>
							<button type="button" id="test" onclick="copyOptNameArr()">테스트</button>
							<button type="button" id="test" onclick="test2()">테스트2</button>
						</td>
					</tr>
					<tr>
						<td colspan="2">
							<div class="input_options" style="width: 146px;"></div>
							<div class="input_options" style="width: 175px;">옵션명</div>
							<div class="input_options" style="width: 350px;">내용</div>
							<div class="input_options" style="width: 130px;">가격</div>
						</td>
					</tr>
					<!-- 옵션수정 -->
					<c:choose>
						<c:when test="${fn:length(optionList) > 0}">
							<c:forEach items="${optionList}" var="row" varStatus="status">
								<tbody class="opBody_${status.count}" id="opBody_${status.count}">
									<tr class="opList_1" id="opList_1">
										<td style="width: 850px;" colspan="2">
											<div class="input_options" style="width: 146px;"></div>
											<input type="text" name="goodsOptNameArr" id="input_goodsOptNameArr" style="width: 146px;" class="input_options optNameArr_1 optName">
											<button type="button" id="opContentAdd_bt" onclick="opContentAdd(1);">+</button>
											<input type="text" name="goodsOptContentArr" id="input_goodsOptContentArr" style="width: 350px;" class="input_options optContent">
											<input type="text" name="goodsOptPriceArr" id="input_goodsOptPriceArr" style="width: 130px;" class="input_options optPrice">
										</td>
									</tr>
								</tbody>
							</c:forEach>
						</c:when>
					</c:choose>
					
					
					
					
					
					
				</table>
				<div class="caution" style="margin:10px 0 0 150px;">
					<span class="span_validate" style="margin-left: 0px;" id="goodsOptionMsg" aria-live="assertive"></span>
				</div>
				<div class="caution" style="margin:10px 0 0 150px;">
				* 추가옵션은 최소 1개 이상 입력해야 등록, 임시저장이 가능합니다. 
				</div>
			</div>
			<div class="div_register">
				<table>
					<tr>
						<th>상세안내</th>
						<td>
							<textarea class="input_text_l" name="goodsContent" id="input_goodsContent" cols="30" rows="5">${goods.goodsContent}</textarea>
						</td>
					</tr>
				</table>
				<div class="caution" style="margin:10px 0 0 150px;">
					<span class="span_validate" style="margin-left: 0px;" id="goodsContentMsg" aria-live="assertive"></span>
				</div>
			</div>
			
			<div style="position: fixed; bottom: 100px; right: 0; z-index: 10">
				<c:choose>
					<c:when test="${goods.goodsStatus eq '임시저장'}">
						<div>
							<button type="button" id="modifyTempBtn">임시저장</button>
						</div>
						<div>
							<button type="button" id="registerBtn" style="margin-top: 8px">등록</button>
						</div>
						<div>
							<button type="button" id="cancelBtn" style="margin-top: 8px">뒤로가기</button>
						</div>
					</c:when>
					<c:otherwise>
						<div>
							<button type="button" id="registerBtn">수정 완료</button>
						</div>
						<div>
							<button type="button" id="cancelBtn" style="margin-top: 8px">뒤로가기</button>
						</div>
					</c:otherwise>
				</c:choose>
			</div>

		</form>
	</div>
</div>



<!-- ------------------------------------------------------------------------------------------ -->
<script>

function test2() {
    console.log("유효성 시작");
	if(checkUnrealInput()) {
	    console.log("유효성 O");
		copyOptNameArr();
	} else {
	    console.log("유효성 X");
	}
	return false;
}

function registerValidate() {
	console.log("유효성 시작");
	copyOptNameArr();
	console.log(checkUnrealInput());
	return checkUnrealInput();
}

function registerTempValidate() {
	console.log("유효성 시작");
	copyOptNameArr();
	return checkUnrealTempInput();
}

$("#input_goodsCategory").change(function() {
    checkCategory();
});
$("#input_goodsName").blur(function() {
    checkName();
});
$("#uploadFile1").change(function() {
    checkImage();
});
$("#uploadFile2").change(function() {
    checkImage();
});
$("#uploadFile3").change(function() {
    checkImage();
});
$(".input_goodsUse").click(function() {
    checkUse();
});
$("#input_goodsFormat").blur(function() {
    checkFormat();
});
$("#input_goodsSize").blur(function() {
    checkSize();
});
$("#input_goodsResolution").blur(function() {
    checkResolution();
});
$("#input_goodsModifyCount").blur(function() {
    checkModifyCount();
});
$("#input_goodsPeriod").blur(function() {
    checkPeriod();
});
$("#input_goodsContent").blur(function() {
    checkContent();
});


function checkCategory() {
    var oMsg = $("#goodsCategoryMsg");
	var inputValue = $("#input_goodsCategory").val();
	var inputTag = $("#input_goodsCategory");
	
	if(PreventBlank(inputValue, inputTag, oMsg)) {
		console.log("카테고리 X");
	    return false;
	}
	console.log("카테고리 OK");
	hideMsg(oMsg);
	return true;
}

function checkName() {
	var oMsg = $("#goodsNameMsg");
	var inputValue = $("#input_goodsName").val();
	var inputTag = $("#input_goodsName");
	
	if(PreventBlank(inputValue, inputTag, oMsg)) {
		console.log("제목 X");
	    return false;
	}
	console.log("제목 OK");
	hideMsg(oMsg);
	return true;
}

function checkImage() {
    var oMsg = $("#uploadFileMsg");
	var inputValue1 = $("#uploadFile1").val();
	var inputValue2 = $("#uploadFile2").val();
	var inputValue3 = $("#uploadFile3").val();
	var inputTag = $("#uploadFile1");
	
	console.log(inputValue1);
	console.log(inputValue2);
	console.log(inputValue3);
	
	console.log("체크이미지: " + oMsg);
	
	if (inputValue1 != "" && inputValue2 != "" && inputValue3 != "") {
		console.log("이미지 3장 OK");
		hideMsg(oMsg);
	    return true;
	} else {
		console.log("이미지 3장 없음");
		PreventBlankImage(inputValue1, inputValue2, inputValue3, inputTag, oMsg);
	    return false;
	}
}

function checkUse() {
    var oMsg = $("#goodsUseMsg");
	var inputValue = $('input[class=input_goodsUse]:checked').val();
	var inputTag = $("#commercial");
	
	if(inputValue === undefined) {
	    inputValue = "";
	}
	
	console.log(inputValue);
	if(PreventBlank(inputValue, inputTag, oMsg)) {
		console.log("제작용도 X");
	    return false;
	}
	console.log("제작용도 OK");
	hideMsg(oMsg);
	return true;
}

function checkFormat() {
    var oMsg = $("#goodsFormatMsg");
	var inputValue = $("#input_goodsFormat").val();
	var inputTag = $("#input_goodsFormat");
	
	if(PreventBlank(inputValue, inputTag, oMsg)) {
		console.log("파일유형 X");
	    return false;
	}
	console.log("파일유형 OK");
	hideMsg(oMsg);
	return true;
}

function checkSize() {
    var oMsg = $("#goodsSizeMsg");
	var inputValue = $("#input_goodsSize").val();
	var inputTag = $("#input_goodsSize");
	
	if(PreventBlank(inputValue, inputTag, oMsg)) {
		console.log("기본사이즈 X");
	    return false;
	}
	console.log("기본사이즈 OK");
	hideMsg(oMsg);
	return true;
}

function checkResolution() {
    var oMsg = $("#goodsResolutionMsg");
	var inputValue = $("#input_goodsResolution").val();
	var inputTag = $("#input_goodsResolution");
	
	if(PreventBlank(inputValue, inputTag, oMsg)) {
		console.log("해상도 X");
	    return false;
	}
	console.log("해상도 OK");
	hideMsg(oMsg);
	return true;
}

function checkModifyCount() {
    var oMsg = $("#goodsModifyCountMsg");
	var inputValue = $("#input_goodsModifyCount").val();
	var inputTag = $("#input_goodsModifyCount");

	if(PreventBlank(inputValue, inputTag, oMsg)) {
		console.log("수정횟수 X");
	    return false;
	} else if(isNotNumber(inputValue, inputTag, oMsg)) {
	    return false;
	}
	
	console.log("수정횟수 OK");
	hideMsg(oMsg);
	return true;
}

function checkPeriod() {
    var oMsg = $("#goodsPeriodMsg");
	var inputValue = $("#input_goodsPeriod").val();
	var inputTag = $("#input_goodsPeriod");

	if(PreventBlank(inputValue, inputTag, oMsg)) {
		console.log("소요기간 X");
	    return false;
	} else if(isNotNumber(inputValue, inputTag, oMsg)) {
	    return false;
	}
	
	console.log("소요기간 OK");
	hideMsg(oMsg);
	return true;
}

function checkOption() {
    console.log("opNum: " + opNum);
    console.log("op: " + op);
    let tbody;
	let optNameMain;
	let optNameValue;
	let optNameArr;
	let optContentArr;
	let optPriceArr;
	let regNum = /^[0-9]+$/; 
	
	var oMsg = $("#goodsOptionMsg");
	var inputTag = $(".optNameArr_1");
	
	for(var i=1; i<=opNum; i++) {
		optNameMain = $(".optNameArr_" + i);
		optNameValue = $(".optNameArr_" + i).val();
		tbody = document.querySelector("#opBody_" + i);
		
		// 기준 옵션명 공란방지 (copyOptNameArr의 대상이 될 옵션명을 의미)
		if(optNameValue == "") {
			console.log("!!! " + i + "번째 옵션명 없음");
			showErrorMsg(oMsg, "옵션의 모든 항목을 빈칸없이 입력하세요.");
			setFocusToInputObject(optNameMain);
			return false;
		} else {
			console.log(i + "번째 옵션명: " + optNameValue);
			hideMsg(oMsg);
		}
	    
		if(tbody !== null) {
			optContentArr = tbody.getElementsByClassName("optContent"); // 배열로 가져오기 위해서 ByClassName()
			optPriceArr = tbody.getElementsByClassName("optPrice"); // 배열로 가져오기 위해서 ByClassName()
			var j;
			
			// 옵션내용 공란방지
			for(j=0; j<optContentArr.length; j++) {
			    if (optContentArr[j].value == "") {
					console.log("!!! 내용 공백있음");
					showErrorMsg(oMsg, "옵션의 모든 항목을 빈칸없이 입력하세요.");
					setFocusToInputObject(optContentArr[j]);
					return false;
			    } else {
					hideMsg(oMsg);
			    }
			}
			
			for(j=0; j<optPriceArr.length; j++) {
			    // 옵션가격 공란방지
			    if (optPriceArr[j].value == "") {
					console.log("!!! 가격 공백있음");
					showErrorMsg(oMsg, "옵션의 모든 항목을 빈칸없이 입력하세요.");
					setFocusToInputObject(optPriceArr[j]);
					return false;
			    } else {
					hideMsg(oMsg);
			    }
				// 옵션가격 숫자만 입력했는지 판별
			    if (regNum.test(optPriceArr[j].value)) {
					hideMsg(oMsg);
				} else {
					console.log("!!! 가격 숫자아님");
					showErrorMsg(oMsg, "가격은 숫자만 입력할 수 있습니다.");
					setFocusToInputObject(optPriceArr[j]);
					return false;
				}
			}
			
	    } else {
			console.log("tbody is null");
	    }
	}
	console.log("최종완료ㅇㅇㅇㅇㅇㅇ");
    return true; // true
}

// 옵션명 placeholder 유효성
// function checkOptNameArr(optName, index) {
// 	var inputTag = $(".optNameArr_" + index);
	
// 	if(optName == "") {
// 		document.getElementsByClassName("optNameArr_" + index)[0].setAttribute("placeholder", "옵션명 입력 필수");
//     	setFocusToInputObject(inputTag);
// 		return true;
// 	} else {
// 		return false;
// 	}
// }

function checkContent() {
    var oMsg = $("#goodsContentMsg");
	var inputValue = $("#input_goodsContent").val();
	var inputTag = $("#input_goodsContent");
	
	if(PreventBlank(inputValue, inputTag, oMsg)) {
		console.log("상세안내 X");
	    return false;
	}
	console.log("상세안내 OK");
	hideMsg(oMsg);
	return true;
}


/* ------------------------------------------------------------------------------------------------------------ */
// 텍스트기입 공란방지 사후처리
function PreventBlank(inputValue, inputTag, oMsg) {
	if(inputValue == "") {
	    showErrorMsg(oMsg, "필수 입력 사항입니다.");
    	setFocusToInputObject(inputTag);
		return true;
	} else {
		return false;
	}
}

// 이미지업로드 공란방지 사후처리
function PreventBlankImage(inputValue1, inputValue2, inputValue3, inputTag, oMsg) {
	if (inputValue1 != "" && inputValue2 != "" && inputValue3 != "") {
		console.log("이미지 3장 OK");
		hideMsg(oMsg);
		return false;
	} else {
		console.log("이미지 3장 없음");
		showErrorMsg(oMsg, "이미지는 반드시 3장 모두 업로드하세요.");
		setFocusToInputObject(inputTag);
		return true;
	}
}

// 숫자만 입력했는지 판별
function isNotNumber(inputValue, inputTag, oMsg) {
    let regNum = /^[0-9]+$/; 
    
    if (regNum.test(inputValue)) {
		console.log("모두 숫자입니다.");
		hideMsg(oMsg);
		return false;
	} else {
		console.log("숫자가 아닌 입력값이 있습니다.");
		showErrorMsg(oMsg, "숫자만 입력할 수 있습니다.");
		setFocusToInputObject(inputTag);
		return true;
	}
}

// 포커스를 입력개체에 설정
function setFocusToInputObject(inputTag) {
	    inputTag.focus();
}

// (조건 충족 X) 에러 메세지 출력
function showErrorMsg(oMsg, msg) {
	oMsg.attr("class", "span_validate");
	oMsg.html(msg);
	oMsg.show();
}

// (조건 충족 O) 에러 메시지 숨기기
function hideMsg(obj) {
	obj.hide();
}

// (상품등록) 유효성 전체 검사
function checkUnrealInput() {
	if (checkCategory() & checkName() & checkImage() & checkUse() &  checkFormat() & checkSize() & checkResolution() & checkModifyCount() & checkPeriod() & checkOption() & checkContent()) {
// 	if (checkOption()) {
	    console.log("성공ㅇㅇ");
	    return true; // true
	} else {
	    console.log("실패ㅜㅜ");
	    return false;
	}
}

// (임시저장) 유효성 부분 검사
function checkUnrealTempInput() {
	if (checkCategory() & checkName() & checkUse() & checkOption()) {
	    console.log("성공ㅇㅇ");
	    return true; // true
	} else {
	    console.log("실패ㅜㅜ");
	    return false;
	}
}

</script>


<script>
let opNum = 1;
let op = 1;
let newBox;
let opBody;
let opTable;

$(function() {
    /* 임시 저장 버튼 */
    var registerTempBtn = $("#registerTempBtn");

	registerTempBtn.click(function() {
	    if(!registerTempValidate()) {
			return false;
	    }
		
		const form = $("#goodsForm");
		form.attr("action", "/goods/goodsRegisterTempPro");
		form.attr("method", "post");
		form.submit();
	})
	
	/* 상품 등록 버튼 */
    var registerBtn = $("#registerBtn");

	registerBtn.click(function() {
	    if(!registerValidate()) {
			return false;
	    }
		
		const form = $("#goodsForm");
		form.attr("action", "/goods/goodsRegisterPro");
		form.attr("method", "post");
		form.submit();
	})
});

$(document).ready(function() {
	
	/* 옵션 추가 버튼 */
	$('#opAdd_bt').on('click', function() {
		newBox = "";
		opTable = document.querySelector('.opTable');
	
		opNum++;
		op++;
		
		newBox += '<tbody class="opBody_' + opNum + '" id="opBody_' + opNum + '">';
		newBox += '<tr class="opList_' + op + '" id="opList_' + op + '">';
		newBox += '<td style="width: 850px;" colspan="2">';
		newBox += '<div class="input_options" style="width: 146px;"></div>';
		newBox += '<input type="text" name="goodsOptNameArr" id="input_goodsOptNameArr" style="width: 146px;margin-left: 4px;margin-right: 2px;" class="input_options optNameArr_' + opNum + ' optName">';
		newBox += '<button type="button" id="opContentAdd_bt" style="margin-left: 2px;margin-right: 2px;" onclick="opContentAdd(' + opNum + ');">+</button>';
		newBox += '<input type="text" name="goodsOptContentArr" style="width: 350px;margin-left: 2px;margin-right: 2px;" class="input_options optContent">';
		newBox += '<input type="text" name="goodsOptPriceArr" style="width: 130px;margin-left: 2px;margin-right: 4px;" class="input_options optPrice">';
		newBox += '<button type="button" id="opContentDel_bt" onclick="opDel(' + opNum + ');">X</button>';
		newBox += '</td></tr></tbody>';

		opTable.insertAdjacentHTML('beforeend', newBox);
	})
});

/* 옵션세부항목 개별삭제 버튼 */
function opContentDel(index) {
	var opList = document.getElementById("opList_" + index);
	opList.remove();
}

/* 옵션 통합삭제 버튼 */
function opDel(index) {
	var opBody = document.getElementById("opBody_" + index);
	opBody.remove();
	
	if(index == opNum) {
	    opNum--;
	}
}

/* 옵션과 그 옵션에 속한 세부항목의 옵션명 값을 동일하게 변경 */
function copyOptNameArr() {
	let tbody;
	let optNameValue;
	let optNameArr;

	for(var i=1; i<=opNum; i++) {
	    optNameValue = $(".optNameArr_" + i).val();
		tbody = document.querySelector("#opBody_" + i);	    
		console.log(i);
		console.log("tbody: " + tbody);	
	    
		if(tbody !== null) {
			optNameArr = tbody.getElementsByClassName("optName"); // 배열로 가져오기 위해서 ByClassName()
	
			for(var j=0; j<optNameArr.length; j++) {
			    optNameArr[j].setAttribute("value", optNameValue);
			}
	    } else {
			console.log("tbody is null");
	    }
    }
}

/* 상세항목 추가 버튼 */
function opContentAdd(index) {
    newBox = "";
	opBody = document.querySelector('.opBody_' + index);
    
    op++;
    
    newBox += '<tr class="opList_' + op + '" id="opList_' + op + '">';
	newBox += '<td style="width: 850px;" colspan="2">';
	newBox += '<div class="input_options" style="width: 146px;margin-left:2px;"></div>';
	newBox += '<input type="text" name="goodsOptNameArr" value="" style="width: 146px;margin-left: 2px;margin-right: 31px;visibility:hidden;" class="input_options optName">';
	newBox += '<input type="text" name="goodsOptContentArr" style="width: 350px;margin-left: 2px;margin-right: 2px;" class="input_options optContent">';
	newBox += '<input type="text" name="goodsOptPriceArr" style="width: 130px;margin-left: 2px;margin-right: 4px;" class="input_options optPrice">';
	newBox += '<button type="button" id="opContentDel_bt" onclick="opContentDel(' + op + ');">X</button>';
	newBox += '</td></tr>';

	opBody.insertAdjacentHTML('beforeend', newBox);
}

$(document).ready(function() {
    let goodsUse = "<c:out value='${goods.goodsUse}'/>";
    let goodsCategory = "<c:out value='${goods.goodsCategory}'/>";
    let goodsUseInput;
    
    /* goodsUse 초기화 */
    switch(goodsUse) {
		case '상업용':
			goodsUseInput = document.querySelector('input[id=commercial]');
			break;
		case '비상업용':
		    goodsUseInput = document.querySelector('input[id=no_commercial]');
			break;
		case '상업용+비상업용':
		    goodsUseInput = document.querySelector('input[id=all_for_use]');
			break;
		default:
			alert('이거뜨면먼가오류있음');
			break;
	}
	goodsUseInput.setAttribute('checked', true);
	
    /* goodsCategory 초기화 */
    $("#input_goodsCategory").val(goodsCategory).attr("selected", "selected");
});
</script>






<style>
ul, ol, dl, li {
	list-style: none;
}
th {
	width: 150px;
}
table {
	border-collapse: separate;
	border-spacing: 0 5px;
}
/* tr { */
/* 	margin-bottom: 15px; */
/* } */
.mainDiv {
	width: 950px;
	margin: 130px auto 0 auto;
}
.input_text_l {
	width: 634px;
}

.input_text_s {
	width: 150px;
}

.input_text_ss {
	width: 70px;
}

.input_file {
	width: 250px;
}

.input_options {
	display: inline-block;
}

.label_radio {
	padding-right: 15px;
}

.td_s {
	width: 240px;
}

.div_register {
	padding-bottom: 30px;
}
.caution {
	font-size: 11px;
	color: #FF6600;
}
.span_validate {
	font-size: 12px;
	margin-left: 10px;
	color: red;
}
.thumb {
	width: 160px;
	height: 120px;
}
</style>