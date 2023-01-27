<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<body onload="Timer();">
<div class="mainContent">
	<div class="subContent">
		<div style="text-align: center">
			<strong><font size="6">회원가입을 환영합니다.</font></strong>
			<div id="joinOKDiv" style="margin-top: 20px"></div>
		</div>
		<script>countdown();</script>
	</div>
</div>
</body>


<script type="text/javascript">
	function Timer() {
		setTimeout("locateMain()", 10000);
	}
	function locateMain() {
		location.replace("../");
	}


	var count = 5; // 시간 설정
	function countdown() {
		if (count == 0) { // 남은시간이 0일 경우 이동
			locateMain();
		} else {
			// 시간이 남았을 경우 시간 1초씩 감소
			document.getElementById("joinOKDiv").style.fontSize = "15px"; // joinOKDiv에 속한 폰트 사이즈 15px
			document.all.joinOKDiv.innerHTML = count + "초 후 로그인 화면으로 이동합니다.";
			setTimeout("countdown()", 1000);
			count--;
		}
	}
	
</script>