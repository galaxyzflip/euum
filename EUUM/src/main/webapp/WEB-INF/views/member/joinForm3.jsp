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
				<form action="/member/joinProKakao" method="post" id="join_form"
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
										maxlength="20" value="${sessionScope.kakaoResultInfo.memberEmail }" readOnly>
									</span> <span class="error_next_box" id="emailMsg"
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
										maxlength="40" value="${sessionScope.kakaoResultInfo.memberName }" readOnly>
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
	
	$(document).ready(function(){
		$('#btnJoin').on('click', function(){
			$('#join_form').submit();
		})
	})


</script>
