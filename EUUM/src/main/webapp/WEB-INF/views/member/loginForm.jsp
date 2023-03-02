<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>



<style>
#validate-message {
	color: red;
	font-weight: bold;
	margin: 0px;
}

.sub-box ul li {
	list-style-type: none;
	flex-direction: row;
	display: flex;
}

.sub-box ul {
	display: flex;
	justify-content: space-evenly;
}

.input-box .insertbox {
	padding: 5px;
}

.input-box input {
	height: 30px;
	width: 200px;
}

.login-form {
	display: flex;
	flex-direction: row;
	align-items: center;
	width: 300px;
	height: 120px;
	margin: auto;
}

.main-form {
	border: solid 1px #bbb;
	width: 800px;
	margin: auto;
}

.login-btn {
	height: 70px;
	width: 100px;
	border-radius: 0rem;
}

.container {
	margin-top: 150px;
	margin-bottom: 100px;
}

li {
	list-style-type: none;
	display: flex;
}

.validate-box{
	margin: auto;
}
</style>



<div class="container">
	<div class="subMenu">
		<div class="siteWidth">
			<span>로그인</span>
		</div>
	</div>

	<div class="main-form">
		<form id="loginForm" method="post" action="/member/loginPro">

		<div class="hell">

			<div>
				<ul>
					<li>아직 이음 아이디가 없다면</li>
					<li><a href="/member/joinForm1">회원가입 바로가기</a></li>
				</ul>
				
			</div>

			<div class="login-form">
				<div class=input-box>
					<div class="insertbox">
						<!-- <label for="memberEmail">아이디(이메일)</label> -->
						<input type="text" id="memberEmail" name="memberEmail" class="insert" maxlength="30" placeholder="아이디(이메일)">
					</div>
					<div class="insertbox">
						<!-- <label for="memberPassword">비밀번호</label> -->
						<input type="password" id="memberPassword" name="memberPassword" class="insert" maxlength="20" placeholder="비밀번호">
					</div>
				</div>

				<div class="button-box">
					<button class="btn btn-danger login-btn" type="submit">	<span>로그인</span></button>
				</div>

			</div>
			<!-- end loginForm -->
			<div class="validate-box">
				<p id="validate-message"> </p>
			</div>
			<div class="sub-box">
				<ul>
					<li><input type="checkbox" value="아이디 저장">아이디 저장</li>
					<li><a href="/member/findAccountForm">아이디 찾기/비밀번호 찾기</a></li>
				</ul>
			</div>


			
				<div id="naver_id_login" style="text-align: center">
					<a href="${url }"> <img width="223" src="https://developers.naver.com/doc/review_201802/CK_bEFnWMeEBjXpQ5o8N_20180202_7aot50.png" /></a>
				</div>
				<div id="kakao_id_login" style="text-align: center">
					<a href="https://kauth.kakao.com/oauth/authorize?client_id=406f013cd09687a6ebea7a93af36fe8e&redirect_uri=http://localhost:9020/kakaoLoginCallback&response_type=code"> <img width="223" src="/resources\img\kakao_login_medium_narrow.png" /></a>
				</div>
				<br>
			</div>
		</form>

	</div>
</div>
<script type="text/javascript" src="https://static.nid.naver.com/js/naverLogin_implicit-1.0.2.js" charset="utf-8"></script>
<script>

	$(document).ready(function() {
		let message = '${result}';
		if(message != ''){
			if (message == 'loginFail') {
				alert('로그인에 실패하였습니다');
			}else if(message == 'resetSuccess'){
				alert('비밀번호가 변경되었습니다.');
				
			}else if(message == 'resetError'){
				alert('비밀번호 변경 오류');
			}else if(message =='duplicateId'){
				alert("이메일이 중복됩니다")
			}
		}
		
		
		$('.login-btn').on('click', function(e){
			e.preventDefault();
			if($('#memberEmail').val() == ''){
				$('#validate-message').html('아이디를 입력해주세요')	
				return false;
			}else if($('#memberPassword').val() == ''){
				$('#validate-message').html('비밀번호를 입력해주세요')
				return false;
			}
			
			$('#loginForm').submit();
			
				
		})
	})
</script>