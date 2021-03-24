<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Shopping</title>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css"
	integrity="sha384-B0vP5xmATw1+K9KRQjQERJvTumQW0nPEzvF6L/Z6nronJ3oUOFUFpCjEUQouq2+l"
	crossorigin="anonymous">

<link rel="stylesheet"
	href="<c:url value='/_00_util/allUtil/css/normalize.css'/>">
<link rel="stylesheet"
	href="<c:url value='/_00_util/shoppingMallUtil/css/4_shopping_cart.css'/>">
<link rel="stylesheet"
	href="<c:url value='/_00_util/shoppingMallUtil/css/2_mix.css'/>">
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>

<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"
	integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj"
	crossorigin="anonymous"></script>
<script
	src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"
	integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN"
	crossorigin="anonymous"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/js/bootstrap.min.js"
	integrity="sha384-+YQ4JLhjyBLPDQt//I+STsc9iw4uQqACwlvpslubQzn4u2UU2UFM80nGisd026JF"
	crossorigin="anonymous"></script>
<script
	src="<c:url value='/_00_util/allUtil/javascript/jquery-3.5.1.js'/>"></script>
<script src="<c:url value='/_00_util/allUtil/javascript/jquery-ui.js'/>"></script>

<link rel="stylesheet"
	href="<c:url value='/WEB-INF/views/_00_util/allUtil/css/reset.css'/>">
<link rel="stylesheet"
	href="<c:url value='/WEB-INF/views/_00_util/homeUtil/css/home.css'/>">
<link rel="stylesheet" href="<c:url value='/test/reset.css'/>">
<link rel="stylesheet" href="<c:url value='/test/header.css'/>">


<style>
* {
	margin: 0px;
	padding: 0px;
	list-style: none;
	box-sizing: border-box;
}

.carousel-inner{
}

.carousel-item img {
     width: 500px; 
     height: 300px; 
}

/* -----------start-----------------*/
/* .image {
			width: 100%;
			height: 300px;
			/* border: 1px solid #ccc; */
/* } */
#Board_wrap {
	/* border: 1px solid rgb(34, 34, 201); */
	border-radius: 5px;
	width: 800px;
	height: 500px;
	margin: 0px auto;
	padding: 5px;
	display: flex;
	/* justify-content:right;  */
	/* align-items:center; */
}

#Board {
	/* border: 1px solid red; */
	width: 800px;
	height: 500px;
	margin: 0px auto;
	overflow: hidden;
	position: relative;
	/* justify-content:right; 
            align-items:center; */
}

#Board img {
	max-width: 800px;
}

#foodname_wrap {
	/* background:grey; */
	border: 1px solid grey;
	border-radius: 3px;
	width: 300px;
	height: 50px;
	margin: 20px auto;
	padding: 5px;
	display: flex;
}

#food_name {
	/* border: 1px solid red; */
	margin: auto;
	font-size: 35px;
}

#addr_wrap {
	/* background:grey; */
	border: 1px solid grey;
	border-radius: 3px;
	width: 300px;
	height: 100px;
	margin: 20px auto;
	padding: 5px;
	display: flex;
}

#addr_name {
	/* border: 1px solid red; */
	margin: auto;
	font-size: 35px;
}

/* ----------- End -----------------*/
</style>
</head>

<body style="background-color: #F3F8F2;">

	<jsp:include page="/WEB-INF/views/_00_util/allUtil/jsp/header.jsp" />




	<div class="slider " style="margin: 0px 550px;">
		<div id="carouselExampleIndicators" class="carousel slide"
			data-ride="carousel">
			<ol class="carousel-indicators">
				<li data-target="#carouselExampleIndicators" data-slide-to="0"
					class="active"></li>
				<li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
			</ol>
			<div class="carousel-inner">
				<div class="carousel-item active">
					<img src="<c:url value='/data/images/couponPic/RedBean_pies.webp.jpg'/>" >
				</div>
				<div class="carousel-item">
					<img src="<c:url value='/data/images/Night_Market/Raohe2.png'/>">
				</div>
			</div>
			<a class="carousel-control-prev" href="#carouselExampleIndicators"
				role="button" data-slide="prev"> <span
				class="carousel-control-prev-icon" aria-hidden="true"></span> <span
				class="sr-only">Previous</span>
			</a> <a class="carousel-control-next" href="#carouselExampleIndicators"
				role="button" data-slide="next"> <span
				class="carousel-control-next-icon" aria-hidden="true"></span> <span
				class="sr-only">Next</span>
			</a>
		</div>
	</div>


	<div id="foodname_wrap">
		<div id="food_name">
			<h2>日式紅豆餅</h2>
		</div>
	</div>
	<div id="addr_wrap">
		<div id="addr_name">
			<h3>地址:台北市松山區饒河街111號對面</h3>
		</div>
	</div>

	<div style="width:900px; display:flex; margin:auto">
		位於饒河街觀光夜市，又稱饒河街夜市、饒河夜市。位於台灣臺北市松山區饒河街，為臺北市著名的觀光夜市之一，也是臺灣繼華西街觀光夜市後第二座觀光夜市。
		胡椒餅已是饒河夜市的有名小吃也是不少國外旅客來饒河必吃美食</div>

	



</body>
</html>