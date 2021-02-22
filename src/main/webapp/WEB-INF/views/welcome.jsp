<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Welcome</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
</head>

<!--model.addAttribute("title", "歡迎蒞臨xxx購物商城"); 會存到 request裡面-->
<%
	java.util.Enumeration<String> e = request.getAttributeNames();  
	while(e.hasMoreElements()){
		String name = e.nextElement();
		Object o = request.getAttribute(name);
		out.println(name + "==>" + o + "<hr>");
	}
%>

<body>
	<div style="text-align: center" class="jumbotron">
		<h1>${title}</h1>
		<p>${subtitle}</p>
	</div>
	<div align='center'>
		<a href="<c:url value='/' />">回首頁</a>
		<a href="<c:url value='/index.html' />">回首頁.HTML</a>
	</div>	
</body>
</html>
