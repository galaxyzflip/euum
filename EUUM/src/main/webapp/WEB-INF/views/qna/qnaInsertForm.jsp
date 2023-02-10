<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt"%>    
<!DOCTYPE html>
<html>
<head>
<style>
#qnaTitle{
  width: 400px;
}
#qnaContent{
  width: 1000px;
}

</style>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css">
 </head>

<br><br><br><br><br><br>
<div id="writeForm">

<body>
<div class="container">
  <h2>고객 문의</h2>
  <form action="/qna/InsertPro" method="post" enctype="multipart/form-data">
    
    <div class="form-group" >
    <label for="title">제목</label>
      
    <input type="hidden" name="memberNum" value="${memberNum }"/> 
    <input type="hidden" id="qnaWriter" name="qnaWriter" value="${memberName }"/>
    
    <input type="text" class="form-control" id="qnaTitle" name="qnaTitle" placeholder="제목 입력" 
       required="required" pattern=".{3,30}" />
    </div>
    
    <input type="file" name="uploadFile">
    <input type="file" name="uploadFile">
    <input type="file" name="uploadFile">
  
    <div class="form-group">
   <label for="content">내용</label>
   <textarea class="form-control" rows="5" id="qnaContent" name="qnaContent"
     placeholder="api 추후 적용"></textarea>
 </div>
    
    
    
    <button type="submit" class="btn btn-default" >등록</button>
    <button type="list" class="btn btn-default" onclick="location.href='/qna/List';">목록으로</button>
  <br><br><br>
  </form>
</div>
</body>

</div>

<script type="text/javascript">







</script>
</html>
