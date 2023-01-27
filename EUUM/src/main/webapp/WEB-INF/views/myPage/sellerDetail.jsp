<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
</head>
<body>

<div class="body">

<div class="sellerInfo">
<c:choose>
<c:if test="${member.memberClass = 'S'}">
<!-- 프로필 사진 -->
<div>
<img src="">
</div>

<!-- 닉네임 -->
<div id="section1">
<ul>${seller.sellerNickname}</ul>
<ul></ul>
</div>

<!-- 회원정보 -->
<div id="section2">
<ul></ul>
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

<div id="profile_Box">

<ul><ol><img src=""></ol></ul>
<ul>"권장사이즈 "<font>180 x 180 px</font></ul>
<ul>
<input type="file" name="sellerImage" multiple-id="">
<ol class="" type="button">이미지 선택</ol>
</ul>

<div id="item_Inp">

<ul>
<ol>닉네임</ol>
<ol><input type="text" name="sellerNickname" id="sellerNickname" maxlength="30" value="${seller.sellerNickname}" placeholder="(필수) 한글 기준 10자 이내"></ol>
</ul>

<ul>
<ol>전문분야</ol>
<ol></ol>
</ul>

<ul>
<ol>소개글</ol>
<ol>
<dl>
<textarea name="sellerDescription" rows="" maxlength="" placeholder="※ 연락수단과 관련된 내용 불가, SNS 홍보 불가.(한글 기준 100자 이내)"></textarea>
</dl>
<dl>
<font class="">
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
<ol><input type="text" name="sellerContact1" value placeholder="선택"></ol>
</ul>

<ul>
<ol>연락처 3</ol>
<ol><input type="text" name="sellerContact2" value placeholder="선택"></ol>
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
<div class="">
<li><button type="button" class="">비밀번호 변경</button></li>
<li><button type="button" class="">회원탈퇴</button></li>
</div>

<div class="">저 장</div>

</div>
<!-- body -->


</body>
</html>