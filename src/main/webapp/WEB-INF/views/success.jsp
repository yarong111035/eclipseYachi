<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>  

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link rel="stylesheet" href="/css/reset.css">
    <script src="https://kit.fontawesome.com/a076d05399.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

</head>

<body>
	
	<!-- 引入共同的頁首 -->
	<jsp:include page="/_00_util/allUtil/jsp/header"></jsp:include>
	
	<c:if test="${!empty pageContext.request.userPrincipal.name}">
		<a href="#"><font>登入成功 ! </font></a><br>
	    <a href="#"><font>${pageContext.request.userPrincipal.name} 歡迎回來 !</font></a>
	</c:if>

	<p>${member.birthday}</p>
	<c:if test="${!empty errorInfo}"><p>這個帳號 : ${errorInfo} 已經有人註冊了</p></c:if>
	<p>${LoginOK}</p>
	

</body>

</html>