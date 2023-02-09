<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>


<div class="mainContent">
	<div class="subMenu">
		<div class="siteWidth">
			<span>회원가입</span>
		</div>
	</div>
	
      
      
	<div class="subContent">
		<div>
			<form id="join_form" method="post" action="">
				<div id="join_name">
					<div class="join_Title">
						<h3>이름(닉네임)</h3>
					</div>
					<span class="insertbox">
						<input type="text" name="NAME" id="name" name="memberName" class="insert" maxlength="10">
					</span>
				</div>
				<div id="join_email">
					<div class="join_Title">
						<h3>이메일</h3>
					</div>
					<span class="insertbox">
						<input type="text" name="EMAIL" id="email" name="memberEmail" class="insert" maxlength="40">
					</span>
				</div>
				<div id="join_password1">
					<div class="join_Title">
						<h3>비밀번호</h3>
					</div>
					<span class="insertbox"> 
						<input type="password" id="password" name="memberPassword" class="insert" maxlength="20">
					</span>
				</div>
				<div id="join_password2">
					<div class="join_Title">
						<h3>비밀번호 확인</h3>
					</div>
					<span class="insertbox"> 
						<input type="password" id="password_confirm" name="memberPassword2" class="insert" maxlength="20">
					</span>
				</div>
				<div id="join_phone">
					<div class="join_Title">
						<h3>연락처</h3>
					</div>
					<span class="insertbox"> 
						<input type="text" id="phone" class="insert" maxlength="11" name="memberMobile">
						<input type="button" value="인증">
					</span>
					
				</div>
				<div id="join_zipcode">
					<div class="join_Title">
						<h3>우편번호</h3>
						<button type="button" id="findZipcode" onclick="sample6_execDaumPostcode()">우편번호 검색</button>
					</div>
					<span class="insertbox"> 
						<input type="text" id="sample6_postcode" class="insert" maxlength="5" name="memberZipcode">
						
					</span>
					
				</div>
				<div id="join_address">
					<div class="join_Title">
						<h3>주소</h3>
					</div>
					<span class="insertbox"> 
						<input type="text" id="sample6_address" class="insert" maxlength="30" name="memberAddress">
					</span>
					
				</div>
				<div id="join_detail_address">
					<div class="join_Title">
						<h3>상세주소</h3>
					</div>
					<span class="insertbox"> 
						<input type="text" id="sample6_detailAddress" class="insert" maxlength="30" name="memberDetailAddress">
					</span>
					
				</div>
				<div class="btnCon">
						<button class="submitbtn reset" type="reset"><span>다시작성</span></button>
						<button class="submitbtn done" type="button"><span>회원가입</span></button>
						<button data-oper='list'>취소</button>
				</div>
			</form>
		</div>
	</div>
</div>



<script>

$(document).ready(function(){
	
	
	$('.done').on('click', function(){
		checkEssentials();
		
	})
})


//필수값 입력
function checkEssentials(){
	
//		var form = $('#join_form');
		var form = document.getElementById('join_form');
        

        if(form.name.value.length == 0){
          alert("이름을 입력해주세요.");	
          form.name.focus();
          return false;
        }
        
        if(form.email.value.length == 0){
          alert("아이디를 입력해주세요.");	
          form.email.focus();
          return false;
        }
        
        if(form.password.value.length == 0){
          alert("비밀번호를 입력해주세요.");	
          form.password.focus();
          return false;
        }
        
        if(form.password_confirm.value.length == 0){
          alert("비밀번호 확인을 입력해주세요.");	
          form.password_confirm.focus();
          return false;
        }
        
        if(form.password.value != form.password_confirm.value){
          alert("비밀번호가 일치하지 않습니다.");	
          form.password_confirm.focus();
          return false;
        }
        
        if(form.phone.value.length == 0){
          alert("연락처를 입력해주세요.");	
          form.phone.focus();
          return false;
        }
       
        
      //this.form.submit();
      alert('유효성검사 통과');
        
	
}



//다음 주소검색
function sample6_execDaumPostcode() {
  new daum.Postcode({
      oncomplete: function(data) {
          // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.
          // 각 주소의 노출 규칙에 따라 주소를 조합한다.
          // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
          var addr = ''; // 주소 변수
          var extraAddr = ''; // 참고항목 변수
          //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
          if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
              addr = data.roadAddress;
          } else { // 사용자가 지번 주소를 선택했을 경우(J)
              addr = data.jibunAddress;
          }
          // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
          if(data.userSelectedType === 'R'){
              // 법정동명이 있을 경우 추가한다. (법정리는 제외)
              // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
              if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                  extraAddr += data.bname;
              }
              // 건물명이 있고, 공동주택일 경우 추가한다.
              if(data.buildingName !== '' && data.apartment === 'Y'){
                  extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
              }
              // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
              if(extraAddr !== ''){
                  extraAddr = ' (' + extraAddr + ')';
              }
              // 조합된 참고항목을 해당 필드에 넣는다.
              
          
          } else {
              
          }
          // 우편번호와 주소 정보를 해당 필드에 넣는다.
          document.getElementById('sample6_postcode').value = data.zonecode;
          document.getElementById("sample6_address").value = addr;
          // 커서를 상세주소 필드로 이동한다.
          document.getElementById("sample6_detailAddress").focus();
      }
  }).open();
}


</script>