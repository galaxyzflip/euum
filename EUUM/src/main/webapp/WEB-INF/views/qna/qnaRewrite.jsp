<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt"%>    
<!DOCTYPE html>
<html>
<head>
<style>
#title{
  width: 200px;
}

</style>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css">


<body>

<div class="container">

  <h2>�亯 �ϱ�</h2>
  <form action="/qna/rewritePro" method="post">
    
    <div class="form-group" align="500px;">
     <label for="title">����</label>  
    <input type="text" class="form-control" id="qnaTitle" name="qnaTitle" placeholder="���� �Է�" 
       required="required" pattern=".{4,100}" />
    </div>
    
  
    <div class="form-group">
   <label for="content">����</label>
   <textarea class="form-control" rows="5" id="qnaContent" name="qnaContent"
     placeholder="api ���� ����"></textarea>
 </div>
    
    <input type="hidden" name="qnaLayer" value="${re.qnaLayer }"/>
    <input type="hidden" name="qnaOrdered" value="${re.qnaOrdered}"/>
    <input type="hidden" name="qnaNid" value="${re.qnaNid}" />   
    <input type="hidden" name="memberNum" value="1"/> 
    <input type="hidden" id="qnaWriter" name="qnaWriter" value="zzz"/>
    
    <button type="submit" class="btn btn-default" >���</button>
    <button type="list" class="btn btn-default" onclick="location.href='/qna/List';">�������</button>
  </form>
</div>
</body>

<script type="text/javascript">







</script>
</html>