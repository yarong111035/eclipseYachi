<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css" integrity="sha384-B0vP5xmATw1+K9KRQjQERJvTumQW0nPEzvF6L/Z6nronJ3oUOFUFpCjEUQouq2+l" crossorigin="anonymous">
    <link rel="<c:url value='/_00_util/allUtil/css/normalize.css'/>">
    <link rel="stylesheet" href="<c:url value='/_00_util/shoppingMallUtil/css/6_orderDetail.css'/>">
    <link rel="stylesheet" href="<c:url value='/_00_util/allUtil/css/background.css'/>">
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/js/bootstrap.min.js" integrity="sha384-+YQ4JLhjyBLPDQt//I+STsc9iw4uQqACwlvpslubQzn4u2UU2UFM80nGisd026JF" crossorigin="anonymous"></script>
    <script src="<c:url value='/_00_util/allUtil/javascript/jquery-3.5.1.js'/>"></script>
    <script src="<c:url value='/_00_util/allUtil/javascript/jquery-ui.js'/>"></script>
    <title>order detail</title>
</head>
<body>
	<jsp:include page="/WEB-INF/views/_00_util/allUtil/jsp/header.jsp" />

	<!--  資料表單 -->
    <div class="shopping_form">
        <from class="infoBox">
            <div class="form">
                <div class="shopping_title">訂購人資料</div>
                <div class="formBox">

                    <div class="form-group row col-8">
                        <label for="orderName" class="col-sm-2 col-form-label">姓名</label>
                        <div class="col-sm-10">
                          <input type="text" class="form-control" id="orderName">
                        </div>
                    </div>

                    <div class="form-group row col-8">
                        <label for="phone" class="col-sm-2 col-form-label">行動電話</label>
                        <div class="col-sm-10">
                          <input type="phone" class="form-control" id="phone">
                        </div>
                    </div>

                    <div class="form-group row col-8">
                        <label for="email" class="col-sm-2 col-form-label">電子郵件</label>
                        <div class="col-sm-10">
                          <input type="email" class="form-control" id="email">
                        </div>
                    </div>

                    <div class="form-group row col-8">
                        <label for="address" class="col-sm-2 col-form-label">聯絡地址</label>
                        <div class="col-sm-10">
                          <input type="address" class="form-control" id="address">
                        </div>
                    </div>

                    <div class="form-group row col-8">
                        <label for="delivery_address" class="col-sm-2 col-form-label">出貨地址</label>
                        <div class="col-sm-10">
                          <input type="address" class="form-control" id="delivery_address">
                        </div>
                    </div>

                    <div class="form-group row col-8">
                        <label for="companyId" class="col-sm-2 col-form-label">統一編號</label>
                        <div class="col-sm-10">
                          <input type="number" min="0" class="form-control" id="companyId">
                        </div>
                    </div>
                    
                </div>
            </div>
            <div class="select">
                <div class="col-8 deliveryBox"> 
                    <label for="delivery" class="col-sm-2 col-form-label">取貨方式</label>
                    <select class=" custom-select">
                    <option selected>選擇取貨方式</option>
                    <option value="1">超商取貨</option>
                    <option value="2">宅配到府</option>

                  </select>
                </div>
            </div>
        </from> 
    </div>

    <!-- 按鈕 -->
    <div class="shopBtn">
        <div class="btn">
        
            <a href="<c:url value='/' />"><span>繼續購物</span></a>
        </div>
        <div class="confirmBtn">
            <a href="<c:url value='/' />"><span>確認購買</span></a>
        </div>
    </div>
</body>
</html>