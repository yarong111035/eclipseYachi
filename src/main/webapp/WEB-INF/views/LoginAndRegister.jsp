<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="/css/reset.css" type="text/css">
    <link rel="stylesheet" href="/css/LoginAndRegister.css" type="text/css">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <title>Document</title>
    
    <script>
        $(function () {

            // 右邊註冊按鈕事件
            $('#register-now').click(function(){

                $('#container').addClass('toRightAction');

            });

            // 登入按鈕事件
            $('#login-now').click(function(){

                $('#container').removeClass('toRightAction');

            });

        });

    </script>
    <style>
    	.error{
        color:red;
    	font-size:8px;
        display: flex;
        width:100px;
        flex-wrap:wrap;
        justify-content: center;
        align-items: center;
        position: absolute;
        top: 5px;
        right: -110.5px;
        margin-bottom: 5px;

      }
    </style>
<body>

    <div class="container" id="container">

      <div class="form-container register-container">

        <form:form action="doRegister" method="POST" modelAttribute="member">

          <h2>註冊</h2>

         <div class="input-div">
             <form:label path="username">帳號</form:label>
             <form:input path="username" name="username" type="text"/>
             <form:errors path="username" cssClass="error"/>
         </div>

         <div class="input-div">
            <form:label path="password">密碼</form:label>
            <form:input path="password" type="password"/>
            <form:errors path="password" cssClass="error"/>
         </div>

<!--          <div class="input-div"> -->
<%--           <form:label path="password-again">確認密碼</form:label> --%>
<%--           <form:input path="password-again" type="password"/> --%>
<%--           <form:errors path="password-again" cssClass="error"/> --%>
<!--          </div> -->

         <div class="input-div">
	         <form:label path="fullname">姓名</form:label>
	         <form:input path="fullname" type="text" />
	         <form:errors path="fullname" cssClass="error"/>
         </div>

         <div class="input-div input-date" >
	         <form:label path="birthday">生日</form:label>
	         <form:input path="birthday" type="date"/>
	         <form:errors path="birthday" cssClass="error"/>
         </div>

        <div class="input-div">
            <form:label path="phone">手機號碼</form:label>
            <form:input path="phone" type="text"/>
	        <form:errors path="phone" cssClass="error"/> 
        </div>

        <div class="input-div">
            <form:label path="email">e-mail</form:label>
            <form:input path="email" type="email" />
	        <form:errors path="email" cssClass="error"/> 
        </div>

        <form:button type="submit" class="btn" >註冊</form:button>

        </form:form>

      </div>


      <div class="form-container login-container">

        <form:form action="doLogin" method="POST" modelAttribute="member">
          
          <h2>登入</h2>

          <div class="social-container">
            <a href="#" class="social"><img src="/images/facebook.png" alt=""/></a>
            <a href="#" class="social"><img src="/images/instagram.png" /></a>
            <a href="#" class="social"><img src="/images/search.png" /></a>
          </div>

          <span>選擇其他登錄方式或使用你的帳號</span>
          
          <div class="input-div">
             <form:label path="username">帳號</form:label>
             <form:input path="username" name="username" type="text"/>
             <span Class="error">${accountError}</span>
          </div>

          <div class="input-div">
            <form:label path="password">密碼</form:label>
            <form:input path="password" name="password" type="password"/>
         </div>
  
          <a href="#">忘記密碼 ?</a>

          <form:button type="submit" class="btn">登入</form:button>

        </form:form>
        
        
      </div>

      <div class="over-container">

        <div class="over">

          <div class="over-item over-left">

            <div class="img-box">
              <img src="/images/yachiLogo50.png" alt="">
            </div>

            <h2>已有帳號?</h2>
            <p>請使用你的帳號進行登入</p>
            <button class="over-btn" id="login-now">登入</button>
          </div>

          <div class="over-item over-right">

            <div class="img-box">
              <img src="/images/yachiLogo50.png" alt="">
            </div>

            <h2>沒有帳號?</h2>
            <p>立即註冊加入我們</p>
            <button class="btn over-btn" id="register-now">註冊</button>
          </div>

        </div>

      </div>

    </div>

</body>
    
</html>
