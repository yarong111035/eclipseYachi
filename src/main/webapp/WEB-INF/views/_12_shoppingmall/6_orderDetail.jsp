<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
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
        <form:form method="POST" modelAttribute="orderBean" class="infoBox">
            <div class="form">
                <div class="shopping_title">訂購人資料</div>
                <div class="formBox">

                    <div class="form-group row col-8">
                        <label for="orderName" class="col-sm-2 col-form-label">姓名</label>
                        <div class="col-sm-10">
<%--                           <form:input type="text" path="memberBean.username" class="form-control" id="orderName"/> --%>
							${LoginOK.username} 
                        </div>
                    </div>

                    <div class="form-group row col-8">
                        <label for="phone" class="col-sm-2 col-form-label">行動電話</label>
                        <div class="col-sm-10">
<%--                           <form:input type="phone" path="memberBean.phone" class="form-control" id="phone"/> --%>
                        	${LoginOK.phone} 
                        </div>
                    </div>

                    <div class="form-group row col-8">
                        <label for="email" class="col-sm-2 col-form-label">電子郵件</label>
                        <div class="col-sm-10">
<%--                           <form:input type="email" path="memberBean.email" class="form-control" id="email"/> --%>
                        	${LoginOK.email} 
                        </div>
                    </div>

                    <div class="form-group row col-8">
                        <label for="delivery_address" class="col-sm-2 col-form-label">出貨地址</label>
                        <div class="col-sm-10">
                          <c:if test='${empty LoginOK.address}'>
                          	  <form:input type="address" path="order_address" class="form-control" id="delivery_address" placeholder="地址空空如也! 趕快填上吧"  onfocus="this.placeholder=''" onblur="this.placeholder='地址空空如也! 趕快填上吧'"/>
                          	  <form:errors path="order_address" cssClass="error"/>
                          </c:if>
                          <c:if test='${!empty LoginOK.address}'>
                          	  <form:input type="address" path="order_address" class="form-control" id="delivery_address" value="${LoginOK.address}"/>
                          	  <form:errors path="order_address" cssClass="error"/>
                          </c:if>
                        </div>
                    </div>

                    <div class="form-group row col-8">
                        <label for="companyId" class="col-sm-2 col-form-label">統一編號</label>
                        <div class="col-sm-10">
                          	<form:input type="text" path="company_id" min="0" class="form-control" id="companyId"/>
                        </div>
                    </div>
                    
                </div>
            </div>
            <div class="select">
                <div class="col-8 deliveryBox"> 
                    <label for="delivery" class="col-sm-2 col-form-label">取貨方式</label>
                    <form:select path="shipTypeBean.ship_type_id" class=" custom-select">
	                    <form:option value="-1" label="選擇取貨方式"/>
	                    <form:options items="${shipTypeMap}"/>
                  	</form:select><br>
                </div>
	            <form:errors path="shipTypeBean" cssClass="error"/>
            </div>
            <div class="select">
                <div class="col-8 deliveryBox"> 
                    <label for="delivery" class="col-sm-2 col-form-label">付款方式</label>
                    <form:select path="payTypeBean.pay_type_id" class=" custom-select">
	                    <form:option value="-1" label="選擇付款方式"/>
	                    <form:options items="${payTypeMap}"/>
                  	</form:select>
                </div>
	            <form:errors path="payTypeBean" cssClass="error"/>
            </div>
		    <!-- 按鈕 -->
		    <div class="shopBtn">
		        <div class="btn">
		            <input type="button" name="shoppingBtn" value="繼續購物" onclick="shoppingContinue()"/>
		        </div>
		        <div class="confirmBtn">
		            <input type="submit" name="orderBtn" id="orderBtn" value="確認購買" />
		        </div>
		    </div>
        </form:form> 
    </div>
	<script>
		//點選繼續購物回到商城首頁(不清除購物車內容)
		function shoppingContinue(){
			document.forms[0].action="<c:url value='/DisplayPageProducts' />";
			document.forms[0].method="GET";
			document.forms[0].submit();
		}
		
		//此方法不會送表單出去，所以bean不會有東西
// 		function reConfirmOrder(){
// 			if(confirm("確定送出此訂單?")){
// 				document.forms[0].action="<c:url value='/checkout' />";
// 				document.forms[0].method="POST";
// 				document.forms[0].submit();
// 				return;
// 			}else{
// 				return;
// 			}
// 		}
		
		var orderBtn = document.getElementById('orderBtn');
		orderBtn.addEventListener('click',function(e){
			var yes = confirm("確定送出此訂單?");
			if(yes == false){					
				e.preventDefault(); //預防表單預設事件(按取消不要送出去)
			}
			document.forms[0].action="<c:url value='/checkout' />";
			document.forms[0].method="POST";
			document.forms[0].submit();
		});
		
	</script>
</body>
</html>