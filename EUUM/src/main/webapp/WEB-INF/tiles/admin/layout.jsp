<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<%@ include file="/WEB-INF/includes/include-header.jspf"%>

<!DOCTYPE html> 
<html lang="ko">
<head>
  <meta charset="utf-8">
  <meta content="width=device-width, initial-scale=1.0" name="viewport">

  <title>이음</title>
  
  <meta content="" name="description">
  <meta content="" name="keywords">

 
</head>

	<!-- header -->
	<div id="header">
		<tiles:insertAttribute name="header"/>
	</div>
	
	<!-- body -->
	<div id="container">
		<tiles:insertAttribute name="body"/>
	</div>
	
	<!-- footer --> 
	<tiles:insertAttribute name="footer"/>
	
</body>
</html>