<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<!DOCTYPE html>
<html>
<head>
 	<meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link rel="stylesheet" href="/css/reset.css" type="text/css">
    <link rel="stylesheet" href="/css/member_update.css" type="text/css">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<title>member_update</title>
	
	<script>
        $(function () {
             // change這個event只有代表改變，並不代表有檔案
         $('#file').change(function() { 
                // this代表<input id="file">  
                // files.length == 1 是長度為一的陣列
                let file = this.files[0]; 
                let reader = new FileReader();
                // new FileReader(); 用途是用來讀取檔案，標準的API
                // 如果要FileReader去讀檔案，必須給他一個檔案Object。
                // 它拿到檔案Object後會驅動onload事件
                // 給它URL的方式就是用 readAsDataURL( /*裡面放檔案Object*/ )
                // 所以我們才會放入 reader.readAsDataURL(input.files[0]);
                // onload事件讀出來的會是一個接近二進位檔案，所以可以直接給<img>
                // 所以這邊直接改變img 的 src 就可以了
                reader.readAsDataURL(file); 

                reader.onload = function(){     //成功讀取文件
                    $('#headImg').attr({
                        
                        // src = this.result 
                        // 或者是 src = e.target () 
                        // 只是function(e) 加上e 事件物件處理函數
                        src:this.result , 
                        width:`200px`,
                        height:`200px`
                    });
                }
            });

             /* hover事件切換 如果只寫一個方法  
               那鼠標經過和離開都會觸發這個方法 slideToggle
            */
            // $('.menu-box').hover(function(){
            //     $(this).children('ul').slideToggle();
            // })

            $('.tab-list a').hover(function(){
                /* 為匹配的當前元素切換 class css類別 */
                $(this).toggleClass('liColor');
                
                /* 拿到當前(this) a 的索引號 */
                index = $(this).index();

                /* 讓上面和下面相應的索引號 eq() 顯示內容 
                    其餘siblings() 隱藏起來 */
                $('.tab-panel').eq(index).stop().fadeIn('slow').show().siblings().hide();

            },function(){
                /* 第二個方法處理滑鼠移開事件 */
                $(this).removeClass('liColor');
                $('.tab-panel').hide();
            })

            $('.tab-panel').hover(function(){
                index = $(this).index();
                $(this).css('background-color','white').show();
                $('.tab-list a').eq(index).addClass('liColor');
            },function(){
                $(this).hide();
                $('.tab-list a').eq(index).removeClass('liColor');
            })

        });

    </script>
	
</head>
<body>

	<!-- 引入共同的頁首 -->
	<jsp:include page="/_00_util/allUtil/jsp/header"></jsp:include>
	
	<div class="main-member">
        <aside>
            <div class="function">
                <h3>會員中心</h3>
                <div class="item">
                    <img src="https://picsum.photos/200/200" id="headImg">
                </div>

                <label for="file">
                    <i class="fas fa-image">
                        編輯照片
                        <input type="file" id="file" accept=".jpeg,.png" style="display: none;"
                        >

                    </i>
                </label>

                <div class="item">
                    <a href="#">
                        <button><span>基本資料</span></button>
                    </a>
                </div>
                <div class="item">
                    <a href="#">
                        <button><span>訂單查詢</span></button>
                    </a>
                </div>
                <div class="item">
                    <a href="#">
                        <button><span>我的優惠券</span></button>
                    </a>
                </div>
                <div class="item">
                    <a href="#">
                        <button><span>喜愛商家</span></button>
                    </a>
                </div>
                <div class="item">
                    <a href="#">
                        <button><span>通知</span></button>
                    </a>
                </div>
                <div class="item">
                    <a href="#">
                        <button><span>申請商家</span></button>
                    </a>
                </div>
                <div class="item">
                    <a href="#">
                        <button><span>新增信用卡</span></button>
                    </a>
                </div>
                <div class="item">
                    <a href="#">
                        <button><span>登出</span></button>
                    </a>
                </div>
            </div>
        </aside>



        <main>

            <form:form  method="POST" modelAttribute="member" class="info" >
                <div>
                    <h3> 姓名 : </h3>
                    <form:label path="fullname">
                    <form:input path="fullname" type="text" id="name"/>
                    </form:label>
                </div>
                <div>
                    <h3> 密碼 : </h3>
                    <form:label path="password">
                    <form:input path="password" type="password" id="password"/>
                    </form:label>
                </div>
                <div>
                    <h3> 性別 : </h3>
                    <form:label path="sex">
                    <form:radiobutton path="sex" value="M" label="Male" />
            		<form:radiobutton path="sex" value="F" label="Female" />
                    </form:label>
                </div>
                <div>
                    <h3> 生日 : </h3>
                    <form:label path="birthday">
                    <form:input path="birthday" type="date" id="date" />
                    </form:label>
                </div>
                <div>
                    <h3> 手機號碼 : </h3>
                    <form:label path="phone">
                    <form:input path="phone" id="tel"/>
                    </form:label>
                </div>
                <div>
                    <h3> email : </h3>
                    <form:label path="email">
                    <form:input path="email" type="email" id="email" />
                    </form:label>
                </div>
                <div>
                    <h3> 地址 : </h3>
                    <form:label path="address">
                    <form:input path="address" type="text" id="address" />
                    </form:label>
                </div>
                <div>
                    <h3> 簡介 : </h3>
                    <form:label path="memo">
                    <form:textarea path="memo" id="textarea" cols="20" rows="1"/>
                    </form:label>
                </div>

                <div>
                    <form:button type="submit"><i class="far fa-address-card"></i>修改資料</form:button>
                </div>
   
            </form:form>
        </main>

    </div>

</body>
</html>