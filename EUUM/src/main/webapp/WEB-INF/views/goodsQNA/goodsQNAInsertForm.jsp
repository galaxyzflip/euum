<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
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


<body>


<br><br><br><br><br><br>
<div id="writeForm">
<div class="container">
  <h2>�� ����</h2>
  <form action="/goodsQNA/InsertPro" method="post">
    
    <div class="form-group" >
    <label for="title">����</label>
    
    <input type="hidden" name="goodsNum" value="1"/>   
    <input type="hidden" name="memberNum" value="1"/> 
    <input type="hidden" id="goodsQNAWriter" name="goodsQNAWriter" value="zzz"/>
    
    <input type="text" class="form-control" id="goodsQNATitle" name="goodsQNATitle" placeholder="���� �Է�" 
       required="required" pattern=".{3,30}" />
    </div>
    
  
    <div class="form-group">
   <label for="content">����</label>
   <textarea class="form-control" rows="5" id="goodsQNAContent" name="goodsQNAContent"
     placeholder="api ���� ����"></textarea>
 </div>
    
    
    
    <button type="submit" class="btn btn-default" >���</button>
    <button type="button" class="btn btn-default" onclick="location.href='/goodsQNA/List';">�������</button>
  <br><br><br>
  </form>
</div>

</div>
</body> 

<script type="text/javascript">







</script>
</html>
