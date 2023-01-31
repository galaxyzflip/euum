<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
</head>
<style>

.left_div div {
    float: left;
}

#orgFile {
    display: none; 
}

input[type='file'] {
    outline: none;
    text-indent: 0px;
    font-size: 12px;
    height: 30px;
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

#sellerProfile .profile_box .item_inp {
    width: 350px;
    margin: 42px auto 0 auto;
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

.blank {
    clear: both;
    overflow: hidden;
}

.left_li li {
    float: left;
}

.modifySellerbody {
   	max-width: 980px;
    margin: 0 auto;
    list-style: none;
        
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

</style>
<body>

<div class="modifySellerbody">

<form method="post" id="modifySellerInfo" action="/myPage/modifySellerPro" enctype="multipart/form-data" onSubmit="return modifySellerPro();">

<input type="hidden" name="memberNum" value="${seller.memberNum}">

<div id="sellerInfo" class="left_div">
<c:choose>
<c:if test="${member.memberClass = 'S'}">
<!-- 프로필 사진 -->
<div>
<img src="">
</div>

<!-- 닉네임 -->
<div id="section1">
<ul>${seller.sellerNickName}</ul>
<ul></ul>
</div>

<!-- 회원정보 -->
<div id="section2">
<ul class="line left_right_ol"></ul>
</div>

<!-- 연락처 -->
<div id="section3">
<ul>연락처</ul>
<ul>${member.memberEmail}</ul>
<ul>${seller.sellerContact1}</ul>
<ul>${seller.sellerContact2}</ul>
</div>

</c:if>
</c:choose>
</div>
<!-- sellerInfo -->

<div class="sellerProfile">

<div id="subtitle">
<p class="s_title">내 프로필</p>
</div>

<div id="bank_main">

<div class="guide">
<ul>입금계좌정보는 거래가 체결되었을 때 입력하셔도 됩니다.</ul>
<ul>입금은 '수령완료'된 날로부터 2일 이내 입금됩니다. (공휴일 제외).</ul>
</div>

<div id="bank_sub" class="cf">
<ul>
<ol>은행명</ol>
<ol><input type="text" name="sellerBankName" maxlength="30" value="${seller.sellerBankName}"></ol>
</ul>

<ul>
<ol>계좌번호</ol>
<ol><dl><input type="text" name="sellerAccountNum" maxlength="30" value="${seller.sellerAccountNum}" placeholder="정확하게 기입해 주세요">
		<span style="margin-left:20px" class="fsize13">' - ' 포함하여 기입</span></dl></ol>
</ul>

<ul>
<ol>예금주</ol>
<ol><dl><input type="text" name="sellerAccountName" maxlength="30" value="${seller.sellerAccountName}"></dl></ol>
</ul>

</div>

</div>

<div id="profile_Box">

<ul><ol><img src="/resources/img/${seller.sellerImage}"></ol></ul>
<ul>"권장사이즈 "<font>180 x 180 px</font></ul>
<ul style="margin-top:14px; text-align: center;" class="cf">
<input type="file" class="real-upload" name="sellerImage" multiple id="orgFile">
<ol class="rBtn_lGray" onclick="file_check()">이미지 선택</ol>

</ul>

<div id="item_Inp">

<ul>
<ol>닉네임</ol>
<ol><input type="text" name="sellerNickName" id="sellerNickName" maxlength="30" value="${seller.sellerNickName}" placeholder="(필수) 한글 기준 10자 이내"></ol>
</ul>

<ul>
<ol>전문분야</ol>
<ol></ol>
</ul>

<ul>
<ol>소개글</ol>
<ol>
<dl>
<textarea name="sellerDescription" rows="5" maxlength="300" placeholder="※ 연락수단과 관련된 내용 불가, SNS 홍보 불가.(한글 기준 100자 이내)">${seller.sellerDescription}</textarea>
</dl>
<dl>
<font class="comment orange Ldefault">
"* 연락수단과 관련된 내용 불가"
<br>
"* SNS 홍보 불가"
</font>
</dl>
</ol>
</ul>

<ul>
<ol>연락처 1</ol>
<ol>${member.memberEmail}</ol>
</ul>

<ul>
<ol>연락처 2</ol>
<ol><input type="text" name="sellerContact1" value="${seller.sellerContact1}" placeholder="선택"></ol>
</ul>

<ul>
<ol>연락처 3</ol>
<ol><input type="text" name="sellerContact2" value="${seller.sellerContact2}" placeholder="선택"></ol>
</ul>

<ul>
<div>회원 구분</div>
<div>
<input type="radio" name="sellerBuisnessYn" id="Y" value="${seller.sellerBuisnessYn = 'Y'}">
<label for="Y">개인 (비사업자)</label>
<span>
<input type="radio" name="sellerBuisnessYn" id="N" value="${seller.sellerBuisnessYn = 'N'}">
<label for="N">개인/법인 사업자</label>
</span>
<div>
<i></i>
"정보 수정 후 아래에 있는 "
<font>저장 버튼</font>
"을 눌러주세요"
</div>
</div>
</ul>

<div id="seller_Img">

</div>
<!-- seller_Img -->
</div>
<!-- item_Inp -->
</div>
<!-- profile_Box -->
</div>
<!-- sellerProfile -->

<div class="blank"></div>
<div class="left left_li" style="padding-left:4px">
<li style="margin-right: 30px" type="button" onclick="location.href='/myPage/modifyPassForm';">비밀번호 변경</li>
<li style="margin-right: 30px" type="button" onclick="location.href='/myPage/leaveForm';">회원탈퇴</li>
</div>

<input class="btn1 right"  type="submit" value="저 장">

</form>
</div>
<!-- body -->


</body>
<script>
function modifySellerPro() {
	//var form = document.getElementById("modifyForm");
	if (confirm("전문가 정보를 변경하시겠습니까?") == true) {
		alert("전문가 정보가 변경 되었습니다.");
		return true;
	} else {
		return false;
	} 
}

const realUpload = document.querySelector('.real-upload');
const upload = document.querySelector('.rBtn_lGray');

upload.addEventListener('click', () => realUpload.click());

</script>
</html>