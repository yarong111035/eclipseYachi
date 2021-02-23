<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<!DOCTYPE html>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>平台優惠券</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css" integrity="sha384-B0vP5xmATw1+K9KRQjQERJvTumQW0nPEzvF6L/Z6nronJ3oUOFUFpCjEUQouq2+l" crossorigin="anonymous">
    <link rel="stylesheet" href="<c:url value='/_00_util/adminUtil/css/normalize.css'/>">
    <link rel="stylesheet" href="<c:url value='/_00_util/adminUtil/css/admin_coupon.css'/>">
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/js/bootstrap.min.js" integrity="sha384-+YQ4JLhjyBLPDQt//I+STsc9iw4uQqACwlvpslubQzn4u2UU2UFM80nGisd026JF" crossorigin="anonymous"></script>
    <script src="https://kit.fontawesome.com/a076d05399.js"></script>
    
    
</head>
<body>
	<!-- 引入共同的頁首 -->
	
	<jsp:include page="/WEB-INF/views/_00_util/allUtil/jsp/header.jsp" />
	
	<div class="administrator container">
        <div class="row">
            <!-- 功能選單開始 -->
			<jsp:include page="/WEB-INF/views/_00_util/adminUtil/jsp/admin.jsp" />
			<!-- 功能選單結束 -->
            <main class="col-8">
                <div class="coupon">
                    <div class="coupon-mid">
                        <label for="">優惠券名稱 :</label>
                        <input type="text" placeholder="輸入優惠券名稱" maxlength="30" style="margin-left: 2.8rem";>
                    </div>
                    <div class="coupon-mid">
                        <label for="">使用規定 :</label>
                        <input type="text" placeholder="輸入使用規定" maxlength="30">
                    </div>
                    <div class="coupon-mid">
                        <label for="">使用次數 :</label>
                        <input type="number" value="1" step="1" min="0" style="width: 45px;"> 
                    </div>
                    <div class="coupon-mid">
                        <label for="">使用期限 :</label>
                        <input type="date" value="1" step="1" min="0" style="width: 130px;"> 
                    </div>
                    <div class="coupon-mid">
                        <label for="">消費金額 :</label>
                        <input type="number" value="100" step="1" min="0" max="100">
                    </div>
                    <div class="coupon-mid">
                        <label for="">折價金額 :</label>
                        <input type="number" value="50" step="1" min="0" max="50">
                    </div>
                    <div class="coupon-mid">
                        <label for="">可使用商品類型 :</label>
                        <select name="" style=" margin-left: 0.3rem;">
                            <!-- 下拉式選單  -->
                            <option value="">請選擇商品類型</option>
                            <option value="">aaa</option>
                            <option value="">bbb</option>
                            <option value="">ccc</option>
                            <option value="">ddd</option>
                        </select>
                    </div>

                    <div class="coupon-mid">
                        <label for="">優惠券圖片:</label>
                        <div style="display: flex;">
                            <label for="file">
                                <i class="fas fa-image coupon-photo" style="margin-top: 2rem; font-size: 18px;">
                                    ☛選擇圖片<input type="file" id="file" accept=".jpeg,.png" style="display: none;">
                                </i>
                            </label>
                            <div class="item">
                                <img src="https://picsum.photos/500/250" id="headImg" style="margin-left: 48px; margin-top: -25px;">
                            </div>
                        </div>
                    </div>
                    <div class="coupon-mid">
                        <a href="#">
                            <button class="coupon-button">儲存</button>
                        </a>
                    </div>
                </div>
            </main>
        </div>
    </div>
</body>
</html>