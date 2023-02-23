<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>   
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>    
<!DOCTYPE html>
<html>
<style>
	#myform fieldset{
    display: inline-block;
    direction: rtl;
    border:0;
	}
	#myform fieldset legend{
	    text-align: right;
	}
	#myform input[type=radio]{
	    display: none;
	}
	#myform label{
	    font-size: 3em;
	    color: transparent;
	    text-shadow: 0 0 0 #f0f0f0;
	}
	#myform label:hover{
	    text-shadow: 0 0 0 rgba(250, 208, 0, 0.99);
	}
	#myform label:hover ~ label{
	    text-shadow: 0 0 0 rgba(250, 208, 0, 0.99);
	}
	#myform input[type=radio]:checked ~ label{
	    text-shadow: 0 0 0 rgba(250, 208, 0, 0.99);
	}
	#reviewContents {
	    width: 100%;
	    height: 150px;
	    padding: 10px;
	    box-sizing: border-box;
	    border: solid 1.5px #D3D3D3;
	    border-radius: 5px;
	    font-size: 16px;
	    resize: none;
	}
</style>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>

<br/><br/><br/><br/><br/><br/>

<div align="center">
	<form id="myform" action="/review/reviewModifyPro" method="post" enctype="multipart/form-data">
		<input type="hidden" name="memberNum" value="1">
		<input type="hidden" name="goodsNum" value="1">
		<input type="hidden" name="orderNum" value="1">
		
		<input type="hidden" name="reviewWriter" value="ㅇㅅㅇ주">
		
		<input type="text" name="reviewNum" value="${modify.reviewNum }">
		<fieldset>
		<span class="text-bold">별점을 선택해주세요</span>
		<input type="radio" name="reviewStar" value="5" id="rate1">
		<label for="rate1">★</label>
		<input type="radio" name="reviewStar" value="4" id="rate2">
		<label for="rate2">★</label>
		<input type="radio" name="reviewStar" value="3" id="rate3">
		<label for="rate3">★</label>
		<input type="radio" name="reviewStar" value="2" id="rate4">
		<label for="rate4">★</label>
		<input type="radio" name="reviewStar" value="1" id="rate5">
		<label for="rate5">★</label>
		</fieldset>
		
		
		<div>
			<textarea class="col-auto form-control" type="text" name="reviewTitle"
					  placeholder="제목을 입력 해 주세요.">${modify.reviewTitle }</textarea>
			
			<!--  이미지 리스트 -->
            <c:forEach items="${image}" var="row">
            <img src="/resources/img/${row.imageUploadPath}${row.imageFileName}" width=350; height=350;>        
            </c:forEach>			  	
             <p>
             <input type="file" name="uploadFile">
	         <input type="file" name="uploadFile">	
	         <input type="file" name="uploadFile">				  
		      </p>	
			<textarea class="col-auto form-control" type="text" name="reviewContent"
					  placeholder="후기를 입력 해 주세요.">${modify.reviewContent }</textarea>
		</div>
		<div align="center">
			<button class="reset" type="reset"><span>다시작성</span></button>
			<button class="done" type="submit"><span>작성하기</span></button>
		</div>
	</form>
	
</div>
	
</body>
</html>