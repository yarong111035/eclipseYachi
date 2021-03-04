<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title></title>
<link rel="stylesheet"href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.2/css/all.min.css">
<link rel="stylesheet"href="<c:url value='/_00_util/allUtil/css/normalize.css'/>">
<link rel="stylesheet"href="<c:url value='/_00_util/allUtil/css/header.css'/>">
</head>

<body>
	<!-- Start:header -->
	<!-- 回到上方的按鈕 -->
	<!-- <a href="#" class="toTop"><i class="fas fa-arrow-up"></i></a> -->

	<a href="#" id="go-top"><i class="fas fa-arrow-up"></i></a>
	
	<header>
		<nav class="myNav">
			<div class="navbar">
				<div class="ig-links">
					<a href="#">快速登入</a> 
					 <a href="#"><img src="<c:url value='/data/images/smallPic/facebook.png'/>" alt=""></a>
                     <a href="#"><img src="<c:url value='/data/images/smallPic/instagram.png'/>" alt=""></a>
                     <a href="#"><img src="<c:url value='/data/images/smallPic/search.png'/>" alt=""></a>
				</div>
				<div class="space"></div>
				<div class="links">
					<a href="#"><i class="fas fa-user-friends"></i>關於我們</a> <a href="#"><i
						class="fas fa-info-circle"></i>最新消息</a> <a href="#"><i
						class="far fa-question-circle"></i>幫助中心</a> <a href="#"><i
						class="fas fa-comment-dots"></i>意見回應</a>
				</div>
			</div>
		</nav>


		<div class="search">
			<div class="search-wrap">

				<div class="logo-wrap">
						<img src="<c:url value='/data/images/smallPic/yachiLogo50.png'/>">
				</div>

				<form class="search-food" action="https://www.google.com/">
					<div class="search-input">
						<input type="search" placeholder="不要來搜尋">
						<button>
							<i class="fas fa-search"></i>
						</button>

					</div>
					<div class="food-trending">
						<a href="#">大腸包大腸</a> <a href="#">測試中</a> <a href="#">優惠券</a> <a
							href="#">關鍵字</a> <a href="#">測試</a>
					</div>
				</form>

				<div class="search-ticket">
					    <img src="<c:url value='/data/images/smallPic/yachiLogo50.png'/>">
					<div class="txt">
						<a href="#"><h2>優惠券專區</h2></a>
					</div>

				</div>

				<div class="member">
					<c:if test="${!empty member}">
					<a href="#"><font>你好 ! </font></a>
				    <a href="#"><font>${member.fullname}</font></a>
				</c:if>
				
			    <c:if test="${empty member}">
			    	<a href="<c:url value='/LoginAndRegister'/>"><font>免費註冊</font></a>
			    	<a href="<c:url value='/LoginAndRegister'/>"><font>登入</font></a>
			    </c:if>
			    
                    <a href="#"><i class="fas fa-shopping-cart"></i></a>

				</div>

			</div>
		</div>



		<div class="tab">
			<div class="tab-warp">

				<div class="tab-list">
					<a href="#">夜市簡介</a> <a href="#">優質商家</a> <a href="#">美食推薦</a> <a
						href=" <spring:url value="/" />">購物中心</a> <a href="#">會員中心</a>
				</div>

				<div class="tab-content">
				
					<div class="tab-panel">
					  <a href="#">寧夏夜市</a><br>
                      <a href="#">艋舺夜市</a><br>
                      <a href="#">士林夜市</a><br>
                      <a href="#">公館夜市</a><br>
                      <a href="#">饒河夜市</a><br>
                      <a href="#">延三夜市</a><br>
                      <a href="#">南機場夜市</a><br>
                      <a href="#">臨江街觀光夜市</a><br>
					</div>
					
					<div class="tab-panel">

						<a href="<c:url value='nightMarketShop' />">方家雞肉飯</a><br>
						<a href="<c:url value='/' />">測試1超好吃店家</a><br>
						<a href="<c:url value='/' />">測試2世界第一好吃</a><br>
						<a href="<c:url value='/' />">測試3</a><br>
						
					</div>
					<div class="tab-panel">
						  <a href="#">方家雞肉飯</a><br>
                          <a href="#">方家雞肉飯2</a><br>
                          <a href="#">方家雞肉飯3</a><br>
                          <a href="#">方家雞肉飯4</a><br>
                          <a href="#">方家雞肉飯5</a><br>
                          <a href="#">方家雞肉飯5</a><br>
                          <a href="#">方家雞肉飯5</a><br>
                          <a href="#">方家雞肉飯5方家雞肉飯5</a><br>
					</div>
					<div class="tab-panel">
						<a href="<c:url value='/DisplayPageProducts' />">購物商城</a><br> <a
							href="<c:url value='update/price' />">點我更新價格(+50元)</a><br>
					</div>
					<div class="tab-panel">
						 <a href="<c:url value='/administrator' />">管理員首頁</a><br>
						 <a href="<c:url value='/admin_editProduct' />">商品維護</a><br>
						 <a href="<c:url value='/admin_coupon' />">平台優惠券</a><br>
						 <a href="<c:url value='/admin_chatroom' />">客服回應</a><br>
						 <a href="<c:url value='/admin_announcement' />">公告</a><br>
						 <a href="<c:url value='/admin_adinfo' />">廣告資訊</a><br>
						 <a href="<c:url value='/admin_activity' />">平台優惠活動</a><br>
						 <a href="<c:url value='/admin_checkShop' />">審核商家</a><br>
						 
						 <c:if test="${!empty member}">
						 	<a href="<c:url value='/member/update/${member.memberId}'/>">修改會員資料</a>
                         </c:if>
                         <c:if test="${!empty member}">
							<a href="<c:url value='/doLogout'/>"><font>登 出</font></a>
						 </c:if>
						 
					</div>
				</div>

			</div>
		</div>


	</header>

	<script
		src="<c:url value='/_00_util/allUtil/javascript/jquery-3.5.1.js'/>"></script>
	<script
		src="<c:url value='/_00_util/allUtil/javascript/jquery-ui.js'/>"></script>
	<script src="<c:url value='/_00_util/allUtil/javascript/header.js'/>"></script>
	<!-- End:header -->
</body>
</html>