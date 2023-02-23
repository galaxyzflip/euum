<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<style>
.modifybody {
    width: 1080px;
    margin: 0 auto;
    clear: both;
    padding-top: 106px;
    padding-bottom: 150px;
}

#modify li div:nth-child(1) {
    width: 136px;
    line-height: 32px;
}

#modify li div {
    float: left;
    line-height: 2px;
}

.modifybody {
   	max-width: 980px;
    margin: 0 auto;
    list-style: none;
        
} 

#modifyForm input[type="text"] {
    width: 266px;
}

.s_title {
    font-size: 20px;
    letter-spacing: -1px;
    display: inline-block;
}


.lsp0 {
    letter-spacing: 0;
}

.fsize12 {
    font-size: 12px;
}

.rBtn_lGray {
    float: left;
    cursor: pointer;
    padding: 0 10px;
    height: 28px;
    text-align: center;
    line-height: 28px;
    border: 1px solid #dadada;
    background: #d7d7d7;
    font-size: 13px;
    margin: 0 auto;
    border-radius: 3px;
}

.fa {
    display: inline-block;
    font: normal normal normal 14px/1 FontAwesome;
    font-size: inherit;
    text-rendering: auto;
    -webkit-font-smoothing: antialiased;
    -moz-osx-font-smoothing: grayscale;
    transform: translate(0, 0);
}

.blank {
    clear: both;
    overflow: hidden;
}

.left_li li {
    float: left;
}

.left_ol ol {
    float: left;
}

.lsp0 {
    letter-spacing: 0;
}

.btn_auth {
    width: 80px;
    height: 32px;
    line-height: 32px;
    background: #eeeeee;
    border: 1px solid #dadada;
    border-left: 0;
    text-align: center;
    cursor: pointer;
    font-size: 14px;
    
}

.clear {
    clear: both;
    overflow: hidden;
}	

.cf:after {
    content: "";
    display: block;
    clear: both;
    visibility: hidden;
    width: 0;
    height: 0;
    font-size: 0;
}

.btn1 {
    width: 188px;
    height: 58px;
    line-height: 58px;
    background: #343434;
    color: #fff;
    text-align: center;
    cursor: pointer;
    margin: 0 auto;
    float: right;
}

#orgButton {
    display: none; 
}

#orgFile {
    display: none; 
}

</style>
<head>

</head>
<body>


<div class="modifybody">

<!-- sellerInfo -->

<form role="form" method="post" id="modifyForm" action="/myPage/modifyPro" enctype="multipart/form-data" onSubmit="return modifyPro();">
<input type="hidden" name="jmode" value="modify">
<input type="hidden" name="ckBtn">
<input type="hidden" name="receive" value="N">
<input type="hidden" name="auth_check">
<input type="hidden" name="memberNum" value="${memberDetail.memberNum}">

<div class="modify">

<div id="subtitle" style="margin-bottom: 62px">
<p class="s_title">회원정보 수정</p>
</div>

<li class="1sp">
<div class="1sp">아이디(이메일)</div>
<div>${memberDetail.memberEmail}</div>
</li>

<li class="1sp">
<div>휴대전화 번호</div>
<div class="left_ol cf">
<div class="lsp0" style="line-height: 32px; margin-right: 20px">${memberDetail.memberMobile}</div>
<div class="rBtn_lGray" style="height:25px; line-height: 25px; margin-top:2px" onclick="onDisplay();">전화번호 변경</div>
</div>
</li>

<!-- 									<div class="int_mobile_area" id="phoneNoBox" style="display:none ;">
										<span class="ps_box int_mobile"> <input type="tel"
											id="phoneNo" name="memberMobile" placeholder="전화번호 입력"
											aria-label="전화번호 입력" class="int" maxlength="16"> <label
											for="phoneNo" class="lbl"></label>
										</span> <a href="#" class="btn_verify btn_primary gray" id="btnSend"
											role="button"> <span class="">인증번호 받기</span>
										</a>
									</div>
									<div class="ps_box_disable box_right_space" id="authNoBox" style="display:none ;">
										<input type="tel" id="authNo" name="authNo"
											placeholder="인증번호 입력"
											aria-label="인증번호 입력하세요" aria-describedby="wa_verify"
											class="int" disabled="" maxlength="4"> <label
											id="wa_verify" for="authNo" class="lbl"> <span
											class="wa_blind">인증받은 후 인증번호를 입력해야 합니다.</span> <span
											class="input_code" id="authNoCode" style="display: none;"></span>
										</label>
									</div>

									<span class="error_next_box" id="phoneNoMsg"
										style="display: none" aria-live="assertive"></span> <span
										class="error_next_box" id="authNoMsg" style="display: none"
										aria-live="assertive"></span> <span class="error_next_box"
										id="joinMsg" style="display: none" aria-live="assertive"></span> -->

<div id="change_phone" class="cf" style="display:none ;">
<div>
<div class="left_ol cf">
<div class="fsize12 " style="margin-bottom: 10px">
<i class="fa fa-exclamation-circle" style="margin:-3px 4px 0 0; font-size: 14px"></i>저장 버튼이 아닌 변경 버튼을 누르셔야 전화번호가 변경됩니다.</div>
<div><input type="text" name="memberMobile" id="memberMobile" placeholder="휴대전화 번호"></div>
<div class="btn_auth" onclick="return submit3();">변경</div>
</div>

<!-- <div id="atuhNum" style="margin-top: 10px;">
<div class="left_ol">
<div><input type="text" name="auth_num" id="auth_num" style="width:266px" placeholder="인증번호 입력"></div>
<input type="button" id="orgButton" class="btn_aauth" onclick="return submit3(this.form);">
<div class="btn_auth">확인</div>
</div>
</div> -->
</div>

<!-- 변경될 번호 입력 및 인증 번호 -->
<div class="clear"></div>
</div>


<li style="height: 56px">
<div>이름</div>
<div><input type="text" name="memberName" id="memberName" value="${memberDetail.memberName}" maxlength="8"></div>
</li>

<li>
<div>우편번호</div>
<div><input type="text" id="memberZipcode" name="memberZipcode" value="${memberDetail.memberZipcode}" readonly>
<div type="button" onclick="kakaoPost()">검색</div>
</div>
</li>

<li>
<div>주소</div>
<div><input type="text" id="memberAddress" name="memberAddress" value="${memberDetail.memberAddress}" readonly></div>
</li>

<li>
<div>상세주소</div>
<div><input type="text" name="memberDetailAddress" value="${memberDetail.memberDetailAddress}"></div>
</li>

<!-- modifyMember -->

<div class="blank" style="height:70px;"></div>
<div class="left left_li" style="padding-left:4px">
<li style="margin-right: 30px" type="button" onclick="location.href='/myPage/modifyPassForm';">비밀번호 변경</li>
<li style="margin-right: 30px" type="button" onclick="location.href='/myPage/leaveForm';">회원탈퇴</li>
<c:set var="memberClass" value="${memberDetail.memberClass}"></c:set>
<c:if test="${memberDetail.memberClass != 'S'}">
<input type="button" class="real-Button" id="orgFile" onclick="submit2()" value="전문가 회원전환">
<li style="margin-right: 30px" class="Button" type="button" onclick="return submit2(this.form);">전문가 회원전환</li>
</c:if>
</div>

</div>

<input class="btn1 right"  type="submit" value="저 장">

</form>
</div>
<!-- body -->

</body>
<script>
function kakaoPost() {
	new daum.Postcode({
		oncomplete : function(data) {
			document.querySelector("#memberZipcode").value = data.zonecode;
			document.querySelector("#memberAddress").value = data.address
		}
	}).open();
}


/* 진짜 버튼 기능과 가짜 보이는 버튼 연동 */
const realButton = document.querySelector('.real-Button');
const Button = document.querySelector('.Button');

function submit2(frm) {
	
	var frm = document.getElementById("modifyForm");
	
	if (confirm("전문가 회원으로 전환 하시겠습니까?") == true) {
		frm.action = '/myPage/transSeller';
		frm.target = "_self";
		frm.method = "post";
		frm.submit();
		alert("전문가 회원으로 전환 되셨습니다.");
	} else {
		return false;
	}
}

function submit3(frmm) {
	
	var frmm = document.getElementById("modifyForm");
	var phone = $("#memberMobile").val();
	var pcheck = RegExp(/^[0-9]{3}[0-9]{4}[0-9]{4}$/);
	
/* 	if (confirm("휴대폰 번호를 변경 하시겠습니까?") == true) {
		frmm.action = '/myPage/modifyMobilePro';
		frmm.target = "_self";
		frmm.method = "post";
		frmm.submit();
		alert("휴대폰 번호가 변경 되셨습니다.");
	} else {
		return false;
	} */
	
	if (phone == "") {
	 alert("전화번호를 입력해주세요.");
	 $("#memberMobile").focus();
	 return false;
	}
	if(!pcheck.test(phone)) {
	 alert("'-'을 제외한 전화번호 형식에 맞게 입력해주세요.");
	 $("#memberMobile").val("");
	 $("#memberMobile").focus();
	 return false;
	}else {
		alert("전화번호가 변경 되었습니다.");
		frmm.action = '/myPage/modifyMobilePro';
		frmm.target = "_self";
		frmm.method = "post";
		frmm.submit();
		return true;
	}
}

function modifyPro() {
	
	var name = $("#memberName").val();
	var ncheck = RegExp(/^[가-힣]+$/);
	
	if(name == "") {
	 alert("이름을 입력해주세요.");
	 $("#memberName").focus();
	 return false;
	} 
	if(!ncheck.test(name)) {
	 alert("이름형식에 맞게 입력해주세요.");
	 $("#memberName").val("");
	 $("#memberName").focus();
	 return false;
	}else {
		alert("회원정보가 변경 되었습니다.");
		return true;
	}
	
}

/* 버튼 클릭시 숨겨진 div 보이기 */
function onDisplay() { 

$('#change_phone').show();


 } 


/* function offDisplay() { 

$('#noneDiv').hide(); 

}  */

</script>

<!-- <script>

$(document).ready(function() {
	defaultScript();

$("#phoneNo").blur(function() {
	checkPhoneNo();
});

$("#btnSend").click(function() {
	sendSmsButton();
	return false;
});

}

// 휴대폰 입력 확인
function checkPhoneNo() {
	var phoneNo = $("#phoneNo").val();
	var oMsg = $("#phoneNoMsg");
	var oInput = $("#phoneNo");

	if (phoneNo == "") {
		showErrorMsg(oMsg, "필수 정보입니다.");
		setFocusToInputObject(oInput);
		return false;
	}
//	authFlag = true;   // 인증안할시 활성화
	hideMsg(oMsg);
	return true;
}

// 휴대폰 번호 인증 유효성 검사
function sendSmsButton() {
	var phoneNo = $("#phoneNo").val();
	var oMsg = $("#phoneNoMsg");
	var email = $("#email").val();
	var oCode = $("#authNoCode");


	phoneNo = phoneNo.replace(/ /gi, "").replace(/-/gi, "");
	$("#phoneNo").val(phoneNo);
	authFlag = false;

	$("#authNoMsg").hide();
	if (!isCellPhone(phoneNo)) {
		showErrorMsg(oMsg, "형식에 맞지 않는 번호입니다.");
		return false;
	}
	$
			.ajax({
				type : "GET",
				url : "/member/joinAuthAjax?mobno=" + phoneNo,
				success : function(data) {
					console.log(data);
					const checkNum = data;
					showSuccessMsg(
							oMsg,
							"인증번호를 발송했습니다.(유효시간 30분)<br>인증번호가 오지 않으면 입력하신 정보가 정확한지 확인하여 주세요.<br>없는 번호이거나, 가상전화번호는 인증번호를 받을 수 없습니다.");
					$("#authNo").attr("disabled", false);
					
		            //인증하기 이벤트
					$("#authNo").blur(function(){
						var authNo = $("#authNo").val();	
						if(checkNum == authNo){
							showSuccessMsg(oMsg, "인증이 성공했습니다.");
							showAuthSuccessBox(oBox, oCode, "일치");
							$("#phoneNoMsg").hide();
							authFlag = true;
							return true;
						}else {
							showErrorMsg(oMsg, "인증번호를 다시 확인해주세요.");
							showAuthErrorBox(oBox, oCode, "불일치");
							setFocusToInputObject(oInput);
							authFlag = false;
						}
					});

	return false;
}
			});
}

// 포커스를 입력 개체에 설정
function setFocusToInputObject(obj) {
	if (submitFlag) {
		submitFlag = false;
		obj.focus();
	}
}

// 조건에 맞지 않을 시 메세지 출력
function showErrorMsg(obj, msg) {
	obj.attr("class", "error_next_box");
	obj.html(msg);
	obj.show();
}

// 조건에 맞을 시 메세지 출력
function showSuccessMsg(obj, msg) {
	obj.attr("class", "error_next_box green");
	obj.html(msg);
	obj.show();
}

// 인증 기본 
function showAuthDefaultBox(oBox, oCode) {
	oBox.attr("class", "ps_box");
	oCode.html("");
	oCode.hide();
}

// 인증 완료
function showAuthSuccessBox(oBox, oCode, msg) {
	oBox.attr("class", "ps_box accord");
	oCode.html(msg);
	oCode.show();
}

// 인증 실패
function showAuthErrorBox(oBox, oCode, msg) {
	oBox.attr("class", "ps_box discord");
	oCode.html(msg);
	oCode.show();
}

// 전화번호 정규식
function isCellPhone(p) {
	var regPhone = /^((01[1|6|7|8|9])[1-9][0-9]{6,7})$|(010[1-9][0-9]{7})$/;
	return regPhone.test(p);
}		
</script> -->
</html>