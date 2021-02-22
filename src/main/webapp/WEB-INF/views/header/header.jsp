<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
	<!DOCTYPE html>

    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Shopping</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.2/css/all.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/normalize.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/header.css">
    <script src="${pageContext.request.contextPath}/js/jquery-3.5.1.js"></script>
    <script src="${pageContext.request.contextPath}/js/jquery-ui.js"></script>
    <script src="${pageContext.request.contextPath}/js/header.js"></script>

       
    <!-- Start:header -->
        <!-- 回到上方的按鈕 -->
        <!-- <a href="#" class="toTop"><i class="fas fa-arrow-up"></i></a> -->
        <a href="#" id="go-top"><i class="fas fa-arrow-up"></i></a>

      <header>
          <nav>
              <div class="navbar">
                  <div class="ig-links">
                      <a href="#">快速登入</a>
                      <a href="#"><img src="${pageContext.request.contextPath}/images_2/facebook.png" alt=""></a>
                      <a href="#"><img src="${pageContext.request.contextPath}/images_2/search.png" alt=""></a>
                      <a href="#"><img src="${pageContext.request.contextPath}/images_2/instagram.png" alt=""></a>
                  </div>
                  <div class="space">
                      
                  </div>
                  <div class="links">
                      <a href="#"><i class="fas fa-user-friends"></i>關於我們</a>
                      <a href="#"><i class="fas fa-info-circle"></i>最新消息</a>
                      <a href="#"><i class="far fa-question-circle"></i>幫助中心</a>
                      <a href="#"><i class="fas fa-comment-dots"></i>意見回應</a>
                  </div>
              </div>
          </nav>
  
  
          <div class="search">
              <div class="search-wrap">
                  
                  <div class="logo-wrap">
                      <img src="${pageContext.request.contextPath}/images_2/yachiLogo50.png" alt="">
                  </div>
                  
                  <form class="search-food" action="https://www.google.com/">
                      <div class="search-input">
                          <input type="search" placeholder="不要來搜尋">
                          <button><i class="fas fa-search"></i></button>
  
                      </div>
                      <div class="food-trending">
                          <a href="#">大腸包大腸</a>
                          <a href="#">測試中</a>
                          <a href="#">優惠券</a>
                          <a href="#">關鍵字</a>
                          <a href="#">測試</a>
                      </div>
                  </form>
  
                  <div class="search-ticket">
                      <img src="${pageContext.request.contextPath}/images_2/yachiLogo50.png">
                      <div class="txt">
                          <a href="#"><h2>優惠券專區</h2></a>
                      </div>
                      
                  </div>
  
                  <div class="member">
                      <a href="#">免費註冊</a>
                      <a href="#">登入</a>
                      <a href="#"><i class="fas fa-shopping-cart"></i></a>
                  </div>
  
              </div>
          </div>
  
  
  
          <div class="tab">
              <div class="tab-warp">
  
                  <div class="tab-list">
                      <a href="#">夜市簡介</a>
                      <a href="#">優質商家</a>
                      <a href="#">美食推薦</a>
                      <a href=" <spring:url value="/" />">購物中心</a>
                      <a href="#">會員中心</a>
                  </div>
  
                  <div class="tab-content">
                      <div class="tab-panel">
                          Lorem ipsum, dolor sit amet consectetur adipisicing elit. Sed cumque porro nam alias explicabo nihil labore quidem laborum repellat dignissimos. Mollitia sequi, sit facilis magni eveniet culpa eligendi debitis! Aliquid?Lorem ipsum, dolor sit amet consectetur adipisicing elit. Qui rem a provident vel fugit corrupti placeat! Perferendis, eligendi quo repellat consequatur, dignissimos rerum quibusdam veritatis, voluptates error sint enim explicabo.
                      </div>
                      <div class="tab-panel">
                      
                      		<a href="<c:url value='/welcome' />">方家雞肉飯</a>
<!--                           <img src="https://picsum.photos/500/200" alt=""> -->
                      </div>
                      <div class="tab-panel">
                          <img src="https://picsum.photos/600/200" alt="">
                      </div>
                      <div class="tab-panel">
                          	<a href="<c:url value='/' />">購物商城</a><br>
                          	<a href="<c:url value='update/price' />">點我更新價格(+50元)</a><br>
<%--                           	<a href="<c:url value='queryBySort' />">分類查詢</a><br> --%>
                          	<a href="<c:url value='products/add' />">上架產品</a><br>
                      </div>
                      <div class="tab-panel">
                          <img src="https://picsum.photos/450/200" alt="">
                      </div>
                  </div>
  
              </div>
          </div>
  
  
      </header>
  <!-- End:header -->