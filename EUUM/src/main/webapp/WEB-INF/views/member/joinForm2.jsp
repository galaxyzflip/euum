<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<link rel="stylesheet" type="text/css" href="/resources/css/join.css" />
<script language="JavaScript"
	src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>


<style>
.gray {
	background-color: #8e8e8e;
}

.subMenu {
	height: 190px;
	background-color: #343434;
}

#headbanner {
	position: relative;
	overflow: hidden;
	padding: 42px 0 54px;
	box-sizing: border-box;
}

.h_logo {
	display: block;
	margin: 0 auto;
	width: 240px;
	height: 114px;
	background-image: url(../resources/img/LOGO2.png);
	background-repeat: no-repeat;
	background-position: 0 0;
	background-size: 240px auto;
	color: transparent;
	font-size: 0;
}

.joininner {
	max-width: 460px;
	margin: 0 auto;
}

#footer address .logo {
	top: 2px;
	margin-left: 1px;
	position: relative;
	display: inline-block;
	width: 40px;
	height: 15px;
	background: url(../resources/img/LOGO2.png) no-repeat;
	background-position: 0;
	background-size: 34px auto;
}

.int_adress_area {
	position: relative;
	margin-top: 10px;
	padding: 0 125px 0 0;
}

.zipcodebtn {
	position: absolute;
	top: 0;
	right: 0;
	width: 115px;
	height: 51px;
	padding: 18px 0 16px;
	font-weight: 700;
	text-align: center;
	box-sizing: border-box;
	text-decoration: none;
}

.join_address {
	margin-top: 10px;
}
</style>




<div class="container">

	<div id="headbanner">
		<a href="../" class="h_logo"><span>euum</span></a>
	</div>
	<div class="subContent">
		<div>
			<div class="joininner">
				<form action="/member/joinPro" method="post" id="join_form"
					class="row g-3" onsubmit="">
					<div id="content">
						<!-- tg-text=title -->
						<h2 class="blind"></h2>
						<div class="join_content">
							<!-- 아이디, 비밀번호 입력 -->
							<div class="row_group">
								<div class="join_row">
									<h3 class="join_title">
										<label for="id">이메일(ID)</label>
									</h3>
									<span class="ps_box int_id"> <input type="text"
										id="email" name="memberEmail" class="int" title="EMAIL"
										maxlength="20">
									</span> <span class="error_next_box" id="emailMsg"
										style="display: none" aria-live="assertive"></span>

								</div>

								<div class="join_row">
									<h3 class="join_title">
										<label for="pswd1">비밀번호</label>
									</h3>
									<span class="ps_box int_pass" id="pswd1Img"> <input
										type="password" id="pswd1" name="memberPassword" class="int"
										title="비밀번호 입력" aria-describedby="pswd1Msg" maxlength="20">
										<span class="lbl"><span id="pswd1Span" class="step_txt"></span></span>
									</span> <span class="error_next_box" id="pswd1Msg"
										style="display: none" aria-live="assertive">5~12자의 영문
										소문자, 숫자와 특수기호(_)만 사용 가능합니다.</span>

									<h3 class="join_title">
										<label for="pswd2">비밀번호 재확인</label>
									</h3>
									<span class="ps_box int_pass_check" id="pswd2Img"> <input
										type="password" id="pswd2" name="memberPassword2" class="int"
										title="비밀번호 재확인 입력" aria-describedby="pswd2Blind"
										maxlength="20"> <span id="pswd2Blind" class="wa_blind">설정하려는
											비밀번호가 맞는지 확인하기 위해 다시 입력 해주세요.</span>
									</span> <span class="error_next_box" id="pswd2Msg"
										style="display: none" aria-live="assertive"></span>
								</div>
							</div>
							<!-- // 아이디, 비밀번호 입력 -->

							<div class="row_group">
								<div class="join_row">
									<h3 class="join_title">
										<label for="name">이름</label>
									</h3>
									<span class="ps_box box_right_space"> <input type="text"
										id="name" name="memberName" title="이름" class="int"
										maxlength="40">
									</span> <span class="error_next_box" id="nameMsg"
										style="display: none" aria-live="assertive"></span>
								</div>
								<span class="error_next_box" id="genderMsg"
									style="display: none" aria-live="assertive"></span>




								<!-- 휴대전화 번호, 인증번호 입력 -->
								<div class="join_row join_mobile" id="mobDiv">
									<h3 class="join_title">
										<label for="phoneNo">휴대전화</label>
									</h3>

									<div class="int_mobile_area">
										<span class="ps_box int_mobile"> <input type="tel"
											id="phoneNo" name="memberMobile" placeholder="전화번호 입력"
											aria-label="전화번호 입력" class="int" maxlength="16"> <label
											for="phoneNo" class="lbl"></label>
										</span> <a href="#" class="btn_verify btn_primary gray" id="btnSend"
											role="button"> <span class="">인증번호 받기</span>
										</a>
									</div>
									<div class="ps_box_disable box_right_space" id="authNoBox">
										<input type="tel" id="authNo" name="authNo"
											placeholder="인증번호 미구현 - CoolSMS API로 구현예정"
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
										id="joinMsg" style="display: none" aria-live="assertive"></span>
								</div>
								<!-- // 휴대전화 번호, 인증번호 입력 -->
								<div class="join_row join_email">
									<h3 class="join_title">
										<label for="email">주소<span class="terms_choice">(선택)</span></label>
									</h3>
									<div class="int_adress_area">
										<span class="ps_box int_address"> <input type="text"
											id="memberZipcode" name="memberZipcode" placeholder="선택입력"
											aria-label="선택입력" class="int" maxlength="5">
										</span> <a href="javascript:kakaoPost();"
											class="btn_verify btn_primary gray zipcodebtn" id="btnSend"
											role="button"> <span class="">우편번호</span>
										</a>
									</div>

									<span class="ps_box join_address"> <input type="text"
										id="memberAddress" name="memberAddress" placeholder="선택입력"
										aria-label="선택입력" class="int" maxlength="100">
									</span> <span class="ps_box join_address"> <input type="text"
										id="memberDetailAddress" name="memberDetailAddress"
										placeholder="선택입력" aria-label="선택입력" class="int"
										maxlength="100">
									</span>
								</div>
								<span class="error_next_box" id="emailMsg" style="display: none"
									aria-live="assertive"></span>
							</div>




							<div class="btn_area">
								<button type="button" id="btnJoin" class="btn_type btn_primary">
									<span>가입하기</span>
								</button>
							</div>
						</div>
					</div>





					<!--                     
                    
					<div class="col-md-4" style="width: 100%;">
						<div class="join_Title">
							<label for="name" class="form-label">이름</label>
						</div>
						<input type="text" name="memberName" id="name" class="form-control" maxlength="10" />
						<div class="idmsg"></div>

					</div>
					<div class="col-md-4" style="width: 100%;">
						<div class="join_Title">
							<label for="id" class="form-label">아이디</label>
						</div>
						<input type="text" name="test" id="id" class="form-control"
							maxlength="10" required>
						<div class="valid-feedback">ㅇㅋ</div>
						<div class="invalid-feedback">아이디를 적으세요</div>

					</div>
					<div id="join_email">
						<div class="join_Title">이메일</div>
						<span class="insertbox"> <input type="text"
							name="memberEmail" id="email" class="form-control" maxlength="40">
						</span>
					</div>
					<div id="join_password1">
						<div class="join_Title">비밀번호</div>
						<span class="insertbox"> <input type="password"
							name="memberPassword" id="pswd1" class="form-control"
							maxlength="20">
						</span>
					</div>
					<div id="join_password2">
						<div class="join_Title">비밀번호 확인</div>
						<span class="insertbox"> <input type="password"
							id="pswd2" class="form-control" maxlength="20">
						</span>
					</div>
					<div id="join_phone">
						<div class="join_Title">연락처</div>
						<span class="insertbox"> <input type="text"
							name="memberMobile" id="phone" class="form-control"
							maxlength="11"> <input type="button" value="인증">
						</span>
					</div>
					<div id="join_adress">
						<div class="join_Title">주소</div>
						<span class="insertbox"> <input type="text"
							name="memberZipcode" id="memberZipcode" class="form-control"
							maxlength="5"> <input type="button" value="우편번호 찾기"
							onclick="kakaoPost()">
						</span> <span class="insertbox"> <input type="text"
							name="memberAddress" id="memberAddress" class="form-control"
							maxlength="20">
						</span> <span class="insertbox"> <input type="text"
							name="memberDetailAddress" id="memberDetailAddress"
							class="form-control" maxlength="33">
						</span>

					</div>
					<div class="btnCon">
						<button class="submitbtn reset" type="reset">
							<span>다시작성</span>
						</button>
						<button class="btn btn-primary" type="submit">
							<span>회원가입</span>
						</button>
					</div> -->
				</form>
			</div>




			<div id="footer" role="contentinfo">
				<ul>
					<li>이용약관</li>
					<li>개인정보처리방침</li>
					<li>책임의 한계와 법적고지</li>
					<li>회원정보 고객센터</li>
				</ul>
				<address>
					<em><a href="./main" target="_blank" class="logo"><span
							class="blind">euum</span></a></em> <em class="copy">Copyright</em> <em
						class="u_cri">©</em> <a href="./main" target="_blank"
						class="u_cra">EUUM Corp.</a> <span class="all_r">All Rights
						Reserved.</span>
				</address>
			</div>








		</div>
	</div>
</div>

<script>
	function kakaoPost() {
		new daum.Postcode({
			oncomplete : function(data) {
				document.querySelector("#memberZipcode").value = data.zonecode;
				document.querySelector("#memberAddress").value = data.address
				document.getElementById("#memberDetailAddress").focus();
			}
		}).open();

	}

	//region define, setter
	var emailFlag = false;
	var pwFlag = false;
	var authFlag = false;
	var submitFlag = false;

	$(document).ready(function() {
		defaultScript();

		//region unreal id
		$("#email").blur(function() {
			emailFlag = false;
			checkEmail("first");
		});

		$("#pswd1").blur(function() {
			pwFlag = false;
			checkPswd1();
		}).keyup(function(event) {
			checkShiftUp(event);
		}).keypress(function(event) {
			checkCapslock(event);
		}).keydown(function(event) {
			checkShiftDown(event);
		});

		$("#pswd2").blur(function() {
			checkPswd2();
		}).keyup(function(event) {
			checkShiftUp(event);
		}).keypress(function(event) {
			checkCapslock2(event);
		}).keydown(function(event) {
			checkShiftDown(event);
		});

		$("#name").blur(function() {
			checkName();
		});

		$("#email").blur(function() {
			checkEmail();
		});

		$("#phoneNo").blur(function() {
			checkPhoneNo();
		});

		$("#btnSend").click(function() {
			sendSmsButton();
			return false;
		});


		$("#address").blur(function() {
			checkAdress();
		});

		//endregion

		$("#btnJoin").click(function(event) {
			submitClose();
			if (emailFlag && pwFlag && authFlag) {
				mainSubmit();
			} else {
				setTimeout(function() {
					mainSubmit();
				}, 700);
			}
		});

	});
	//endregion

	//region mainSubmit
	// 유효성 검사 확인 후 서브밋 결정
	function mainSubmit() {
		if (!checkUnrealInput()) {
			submitOpen();
			return false;
		}

		if (emailFlag && pwFlag && authFlag) {
			try {
				desk.f(function(a) {
					$("#nid_kb2").val(a);
					$("#join_form").submit();
				});
			} catch (e) {
				$("#nid_kb2")
						.val("join v2 error: " + e.name + ", " + e.message);
				$("#join_form").submit();
			}
		} else {
			submitOpen();
			return false;
		}
	}

	function checkUnrealInput() {
		if (checkEmail('join') & checkPswd1() & checkPswd2() & checkName()
				& checkEmail() & checkPhoneNo()
		//   & checkAuthNo()
		) {
			return true;
		} else {
			return false;
		}
	}

	//region unreal 가입
	// 이메일 검사
	function checkEmail(event) {
		if (emailFlag)
			return true;

		var email = $("#email").val();
		var oMsg = $("#emailMsg");
		var oInput = $("#email");

		if (email == "") {
			showErrorMsg(oMsg, "필수 정보입니다.");
			setFocusToInputObject(oInput);
			return false;
		}

		var isEmail = /^(([^<>()[\]\\.,;:\s@\"]+(\.[^()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/;
		var isHan = /[ㄱ-ㅎ가-힣]/g;
		if (!isEmail.test(email) || isHan.test(email)) {
			showErrorMsg(oMsg, "이메일 주소를 다시 확인해주세요.");
			return false;
		}

		emailFlag = false;

		$.ajax({
			type : "GET",
			url : "/member/emailCheck?email=" + email,
			success : function(data) {
				var result = data;
				if (data == "Y") {
                        showSuccessMsg(oMsg, "멋진 아이디네요!");
					emailFlag = true;
				} else {
					showErrorMsg(oMsg, "이미 사용중이거나 탈퇴한 아이디입니다.");
					setFocusToInputObject(oInput);
				}
			}
		});
		return true;
	}

	// 비밀번호 검사
	function checkPswd1() {
		if (pwFlag)
			return true;

		var email = $("#email").val();
		var pw = $("#pswd1").val();
		var oImg = $("#pswd1Img");
		var oSpan = $("#pswd1Span");
		var oMsg = $("#pswd1Msg");
		var oInput = $("#pswd1");

		if (pw == "") {
			showErrorMsg(oMsg, "필수 정보입니다.");
			setFocusToInputObject(oInput);
			return false;
		}

		if (isValidPasswd(pw) != true) {
			showPasswd1ImgByStep(oImg, oSpan, 1);
			showErrorMsg(oMsg, "8~16자 영문 대 소문자, 숫자, 특수문자를 사용하세요.");
			setFocusToInputObject(oInput);
			return false;
		}

		pwFlag = false;
		$.ajax({
			type : "GET",
			url : "/member/pwCheck?email=" + escape(encodeURIComponent(email))
					+ "&pw=" + pw,
			success : function(data) {
				var result = data;
				console.log(result);
				if (result == 1) {
					showPasswd1ImgByStep(oImg, oSpan, 1);
					showErrorMsg(oMsg, "8~16자 영문 대 소문자, 숫자, 특수문자를 사용하세요.");
					setFocusToInputObject(oInput);
					return false;
				} else if (result == 2) {
					showPasswd1ImgByStep(oImg, oSpan, 2);
					showErrorMsg(oMsg, "8~16자 영문 대 소문자, 숫자, 특수문자를 사용하세요.");
					setFocusToInputObject(oInput);
				} else if (result == 5) {
					showPasswd1ImgByStep(oImg, oSpan, 5);
					showErrorMsg(oMsg, "아이디가 포함 된 비밀번호는 위험할 수 있습니다.");
					setFocusToInputObject(oInput);
				} else if (result == 3) {
					showPasswd1ImgByStep(oImg, oSpan, 3);
					oMsg.hide();
				} else if (result == 4) {
					showPasswd1ImgByStep(oImg, oSpan, 4);
					oMsg.hide();
				} else {
					showPasswd1ImgByStep(oImg, oSpan, 0);
					oMsg.hide();
				}
				pwFlag = true;
			}
		});
		return true;
	}

	// 비밀번호 확인 검사
	function checkPswd2() {
		var pswd1 = $("#pswd1");
		var pswd2 = $("#pswd2");
		var oMsg = $("#pswd2Msg");
		var oImg = $("#pswd2Img");
		var oBlind = $("#pswd2Blind");
		var oInput = $("#pswd2");

		if (pswd2.val() == "") {
			showPasswd2ImgByDiff(oImg, false);
			showErrorMsg(oMsg, "필수 정보입니다.");
			oBlind.html("설정하려는 비밀번호가 맞는지 확인하기 위해 다시 입력 해주세요.");
			setFocusToInputObject(oInput);
			return false;
		}
		if (pswd1.val() != pswd2.val()) {
			showPasswd2ImgByDiff(oImg, false);
			showErrorMsg(oMsg, "비밀번호가 일치하지 않습니다.");
			oBlind.html("설정하려는 비밀번호가 맞는지 확인하기 위해 다시 입력 해주세요.");
			setFocusToInputObject(oInput);
			return false;
		} else {
			showPasswd2ImgByDiff(oImg, true);
			oBlind.html("일치합니다");
			hideMsg(oMsg);
			return true;
		}

		return true;
	}

	// 이름 정규식 및 유효성검사
	function checkName() {
		var oMsg = $("#nameMsg");
		var nonchar = /[^가-힣a-zA-Z0-9]/gi;

		var name = $("#name").val();
		var oInput = $("#name");
		if (name == "") {
			showErrorMsg(oMsg, "필수 정보입니다.");
			setFocusToInputObject(oInput);
			return false;
		}
		if (name != "" && nonchar.test(name)) {
			showErrorMsg(oMsg, "한글과 영문 대 소문자를 사용하세요. (특수기호, 공백 사용 불가)");
			setFocusToInputObject(oInput);
			return false;
		}

		hideMsg(oMsg);
		return true;
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
								"인증번호를 발송했습니다.(유효시간 30분)<br>인증번호가 오지 않으면 입력하신 정보가 정확한지 확인하여 주세요.<br>이미 가입된 번호이거나, 가상전화번호는 인증번호를 받을 수 없습니다.");
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
	
	
	/* .ajax({
		type : "GET",
		url : "/member/joinAuthAjax?mobno=" + phoneNo,
		success : function(data) {
			var result = data;
			if (result == "S") {
				showSuccessMsg(
						oMsg,
						"인증번호를 발송했습니다.(유효시간 30분)<br>인증번호가 오지 않으면 입력하신 정보가 정확한지 확인하여 주세요.<br>이미 가입된 번호이거나, 가상전화번호는 인증번호를 받을 수 없습니다.");
				$("#authNo").attr("disabled", false);
				var oBox = $("#authNoBox");
				var oCode = $("#authNoCode");
				showAuthDefaultBox(oBox, oCode);
			} else {
				showErrorMsg(oMsg, "전화번호를 다시 확인해주세요.");
			}
		}
	}); */
	
	

/* 	// 인증 넘버 체크
	function checkAuthNo() {
		var authNo = $("#authNo").val();
		var oMsg = $("#authNoMsg");
		var oBox = $("#authNoBox");
		var oCode = $("#authNoCode");
		var oInput = $("#authNo");

		if (authNo == "") {
			showErrorMsg(oMsg, "인증이 필요합니다.");
			setFocusToInputObject(oInput);
			return false;
		}

		if (authFlag) {
			
		} else {
			checkAuthnoByAjax();
		}
		return true;
	}

	// 인증 체크 아이작스
	function checkAuthnoByAjax() {
		var authNo = $("#authNo").val();
		var oMsg = $("#authNoMsg");
		var oBox = $("#authNoBox");
		var oCode = $("#authNoCode");
		var oInput = $("#authNo");

		$.ajax({
			type : "GET",
			url : "/user2/joinAjax?m=checkAuthno&authno=" + authNo + "&key="
					+ key,
			success : function(data) {
				var result = data.substr(4);
				if (result == "S") {
					showSuccessMsg(oMsg, "인증이 성공했습니다.");
					showAuthSuccessBox(oBox, oCode, "일치");
					$("#phoneNoMsg").hide();
					authFlag = true;
				} else if (result == "Cnt") {
					showErrorMsg(oMsg, "인증을 다시 진행해주세요.");
					showAuthErrorBox(oBox, oCode, "불일치");
					setFocusToInputObject(oInput);
				} else {
					
				}
			}
		});
		return true;
	} */

	// 주소 검사
	function checkAdress() {
		var zipcode = $("#zipcode");
		var addr1 = $("#addr1");
		var addr2 = $("#addr2");
		var oMsg = $("#addrMsg");
		var nonchar = /[^가-힣a-zA-Z0-9]/gi;

		var name = $("#name").val();
		var oInput = $("#name");
		if (name == "") {
			showErrorMsg(oMsg, "필수 정보입니다.");
			setFocusToInputObject(oInput);
			return false;
		}
		if (name != "" && nonchar.test(name)) {
			showErrorMsg(oMsg, "한글과 영문 대 소문자를 사용하세요. (특수기호, 공백 사용 불가)");
			setFocusToInputObject(oInput);
			return false;
		}

		hideMsg(oMsg);
		return true;
	}

	// 공통 스크립트

	// 스페이스바 눌럿는지 체크
	function checkSpace(str) {
		if (str.search(/\s/) != -1) {
			return true;
		} else {
			return false;
		}
	}

	// 패스워드 정규식
	function isValidPasswd(str) {
		var cnt = 0;
		if (str == "") {
			return false;
		}

		/* check whether input value is included space or not */
		var retVal = checkSpace(str);
		if (retVal) {
			return false;
		}
		if (str.length < 8) {
			return false;
		}
		for (var i = 0; i < str.length; ++i) {
			if (str.charAt(0) == str.substring(i, i + 1))
				++cnt;
		}
		if (cnt == str.length) {
			return false;
		}

		var isPW = /^[A-Za-z0-9`\-=\\\[\];',\./~!@#\$%\^&\*\(\)_\+|\{\}:"<>\?]{8,16}$/;
		if (!isPW.test(str)) {
			return false;
		}

		return true;
	}

	// 쉬프트키 놓을시
	var isShift = false;
	function checkShiftUp(e) {
		if (e.which && e.which == 16) {
			isShift = false;
		}
	}

	// 쉬프트키 누를시
	function checkShiftDown(e) {
		if (e.which && e.which == 16) {
			isShift = true;
		}
	}

	// pswd1 캡스락
	function checkCapslock(e) {
		var myKeyCode = 0;
		var myShiftKey = false;
		if (window.event) { // IE
			myKeyCode = e.keyCode;
			myShiftKey = e.shiftKey;
		} else if (e.which) { // netscape ff opera
			myKeyCode = e.which;
			myShiftKey = isShift;
		}

		var oMsg = $("#pswd1Msg");
		if ((myKeyCode >= 65 && myKeyCode <= 90) && !myShiftKey) {
			showErrorMsg(oMsg, "Caps Lock이 켜져 있습니다.");
		} else if ((myKeyCode >= 97 && myKeyCode <= 122) && myShiftKey) {
			showErrorMsg(oMsg, "Caps Lock이 켜져 있습니다.");
		} else {
			hideMsg(oMsg);
		}
	}

	// pswd2 캡스락
	function checkCapslock2(e) {
		var myKeyCode = 0;
		var myShiftKey = false;
		if (window.event) { // IE
			myKeyCode = e.keyCode;
			myShiftKey = e.shiftKey;
		} else if (e.which) { // netscape ff opera
			myKeyCode = e.which;
			myShiftKey = isShift;
		}

		var oMsg = $("#pswd2Msg");
		if ((myKeyCode >= 65 && myKeyCode <= 90) && !myShiftKey) {
			showErrorMsg(oMsg, "Caps Lock이 켜져 있습니다.");
		} else if ((myKeyCode >= 97 && myKeyCode <= 122) && myShiftKey) {
			showErrorMsg(oMsg, "Caps Lock이 켜져 있습니다.");
		} else {
			hideMsg(oMsg);
		}
	}

	// 입력창 클릭 시 포커스 클래스 생성해 보더가 보이게 하고 나갈때는 클래스를 지움
	function defaultScript() {
		$('.ps_box').click(function() {
			$(this).children('input').focus();
			$(this).addClass('focus');
		}).focusout(function() {
			var welInputText = $('.ps_box');
			welInputText.removeClass('focus');
		});
	}

	// 서브밋 닫기
	function submitClose() {
		submitFlag = true;
		$("#btnJoin").attr("disabled", true);
	}

	// 서브밋 열기
	function submitOpen() {
		$("#btnJoin").attr("disabled", false);
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

	// 메세지 숨김
	function hideMsg(obj) {
		obj.hide();
	}

	// 비밀번호 조건에 맞는 이미지 출력
	function showPasswd1ImgByStep(oImg, oSpan, step) {
		if ("IE8" == "") {
			return false;
		}
		if (step == 1) {
			oImg.attr("class", "ps_box int_pass_step1");
			oSpan.attr("class", "step_txt txt_red");
			oSpan.html("사용불가");
		} else if (step == 2) {
			oImg.attr("class", "ps_box int_pass_step2");
			oSpan.attr("class", "step_txt txt_orange");
			oSpan.html("위험");
		} else if (step == 3) {
			oImg.attr("class", "ps_box int_pass_step3");
			oSpan.attr("class", "step_txt txt_yellow");
			oSpan.html("보통");
		} else if (step == 4) {
			oImg.attr("class", "ps_box int_pass_step4");
			oSpan.attr("class", "step_txt txt_green");
			oSpan.html("안전");
		} else if (step == 5) {
			oImg.attr("class", "ps_box int_pass_step2");
			oSpan.attr("class", "step_txt txt_orange");
			oSpan.html("위험");
		} else {
			oImg.attr("class", "ps_box int_pass");
			oSpan.attr("class", "step_txt");
			oSpan.html("");
		}
	}

	// 이미지 체크
	function showPasswd2ImgByDiff(oImg, diff) {
		if ("IE8" == "") {
			return false;
		}
		if (diff == false) {
			oImg.attr("class", "ps_box int_pass_check");
		} else {
			oImg.attr("class", "ps_box int_pass_check2");
		}
	}

	// 전화번호 정규식
	function isCellPhone(p) {
		var regPhone = /^((01[1|6|7|8|9])[1-9][0-9]{6,7})$|(010[1-9][0-9]{7})$/;
		return regPhone.test(p);
	}

	function winOpenAtCenter(sURL, sWindowName, w, h, sScroll) {
		// 화면 중앙으로 Popup 띄우기.. 스크롤바는 옵션..
		// ex)
		// openWin("test.asp", "winTest", 400, 300); ☞ 스크롤바 없음
		// openWin("test.asp", "winTest", 400, 300, "yes"); ☞ 스크롤바 있음
		// openWin("test.asp", "winTest", 400, 300, "auto"); ☞ 스크롤바 자동

		var x = (screen.width - w) / 2;
		var y = (screen.height - h) / 2;

		if (sScroll == null)
			sScroll = "no";

		var sOption = "";
		sOption = sOption
				+ "toolbar=no, channelmode=no, location=no, directories=no, resizable=no, menubar=no";
		sOption = sOption + ", scrollbars=" + sScroll + ", left=" + x
				+ ", top=" + y + ", width=" + w + ", height=" + h;

		var win = window.open(sURL, sWindowName, sOption);
		return win;
	}
</script>
