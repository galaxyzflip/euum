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

.modifySellerbody {
    width: 1080px;
    margin: 0 auto;
    clear: both;
    padding-top: 56px;
    padding-bottom: 150px;
}

#sellerInfo {
    height: 180px;
    border: 1px solid #dadada;
    margin-bottom: 50px;
    box-sizing: border-box;
    padding: 34px 0 0 46px;
    color: #626262;
}

.round_face2 {
    width: 90px;
    height: 90px;
    border-radius: 45px;
    overflow: hidden;
}

#sellerInfo .name {
    font-size: 18px;
    color: #242424;
}

#sellerInfo .brief {
    margin-top: 12px;
    line-height: 130%;
    margin-bottom: 8px;
}

.default {
    font-size: 13px;
    letter-spacing: -0.6px;
    line-height: 140%;
}

#sellerInfo #section1 {
    margin-left: 30px;x`
}

#sellerInfo #section2 {
    margin-left: 54px;
}

#sellerInfo #section3 {
    margin-left: 54px;
    overflow: hidden;
}

.left_div div {
    float: left;
}

#bank_main {
    float: right;
}

#profile_Box {
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

.round_face {
    width: 108px;
    height: 108px;
    border-radius: 54px;
    overflow: hidden;
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

.rBtn_dGray {
    float: left;
    cursor: pointer;
    padding: 0 10px;
    height: 28px;
    text-align: center;
    line-height: 28px;
    border: 1px solid #818181;
    background: #818181;
    font-size: 13px;
    margin: 0 auto;
    border-radius: 3px;
    color: #fff;
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

<form role="form" method="post" id="modifySellerInfo" action="/myPage/modifySellerPro" enctype="multipart/form-data" onSubmit="return modifySellerPro();">

<input type="hidden" name="memberNum" value="${seller.memberNum}">

<c:if test="${member.memberClass = 'S'}">
<div id="sellerInfo" class="left_div">
<c:choose>

<div>
<img class="round_face2" src="${pageContext.request.contextPath}/resources/img/${image.imageUploadPath}s_${image.imageFileName}">
<ul style="height:8px"></ul>
</div>


<div id="section1">
<ul class="name">${seller.sellerNickName}</ul>
<ul class="brief default">${seller.sellerDescription}</ul>
</div>


<div id="section2">
<ul class="line left_right_ol"><ol>결제완료</ol></ul>
<ul class="line left_right_ol"><ol>진행중</ol></ul>
<ul class="line left_right_ol"><ol>입금예정</ol></ul>
<ul class="left_right_ol"><ol>거래완료</ol></ul>
</div>


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

<ul><ol><img class="round_face" src="${pageContext.request.contextPath}/resources/img/${image.imageUploadPath}s_${image.imageFileName}"></ol></ul>
<ul>"권장사이즈 "<font>180 x 180 px</font></ul>
<ul style="margin-top:14px; text-align: center;" class="cf">
<input type="file" class="real-upload" name="uploadFile" multiple id="orgFile">
<ol class="rBtn_lGray" name="sellerImage">이미지 선택</ol>
<input type="button" class="rBtn_dGray" value="저장" onclick="return submit2(this.form);">
</ul>

<div id="item_Inp">

<ul>
<ol>닉네임</ol>
<ol><input type="text" name="sellerNickName" id="sellerNickName" maxlength="30" value="${seller.sellerNickName}" placeholder="(필수) 한글 기준 10자 이내"></ol>
</ul>

<ul>
<ol>전문분야</ol>
<ol><select name="sellerSpecialty" id="sellerSpecialty">
<option value="">선택하세요</option>
<option value="캐릭터 일러스트">캐릭터 일러스트</option>
<option value="일러스트">일러스트</option>
<option value="디자인">디자인</option>
<option value="3D 모델링">3D 모델링</option>
<option value="웹툰 · 만화">웹툰 · 만화</option>
</select></ol>
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
<div id="sellerBuisnessYn">
<input type="radio" name="sellerBuisnessYn" id="Y" value="Y" checked>
<label for="Y">개인 (비사업자)</label>
<span style="margin-left:20px">
<input type="radio" name="sellerBuisnessYn" id="N" value="N">
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

<div class="blank" style="height:70px;"></div>
<div class="left left_li" style="padding-left:4px">
<li style="margin-right: 30px" type="button" onclick="location.href='/myPage/modifyPassForm';">비밀번호 변경</li>
<li style="margin-right: 30px" type="button" onclick="location.href='/myPage/leaveForm';">회원탈퇴</li>
</div>
<input type="hidden" name="memberNum" value="${member.memberNum}">
<input type="hidden" name="sellerNum" value="${seller.sellerNum}">
<input type="hidden" name="sellerImage" value="${image.imageFileName}">
<input class="btn1 right"  type="submit" value="저 장">

</form>
</div>
<!-- body -->

</body>

<script>

window.onload = function(){
	 document.querySelector("#sellerBuisnessYn input[value='${seller.sellerBuisnessYn}']").setAttribute('checked' , true);
}

</script>

<script>
function modifySellerPro() {
	//var form = document.getElementById("modifySellerForm");
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

function submit2(frm) { 
    frm.action='/myPage/modifySellerFilePro'; 
    frm.submit(); 
    return true; 
  } 

$("#sellerSpecialty").val("sellerSpecialty");

$("#sellerSpecialty").val("${seller.sellerSpecialty}").prop("selected", true);



</script>
</html>