<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>菜單</title>
<link rel="stylesheet" 
	href="<c:url value='/_00_util/shopUtil/css/reset.css'/>">
    <link rel="stylesheet" 
    href="<c:url value='/_00_util/shopUtil/css/新增菜單.css'/>">
    <script src="https://kit.fontawesome.com/a076d05399.js"></script>
<script src="//cdn.jsdelivr.net/npm/sweetalert2@10"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
   
    <script>
        var token = true;
        $(function() {
    
            /* hover事件切換 如果只寫一個方法  
               那鼠標經過和離開都會觸發這個方法 slideToggle
             */
            // $('.menu-box').hover(function(){
            //     $(this).children('ul').slideToggle();
            // })
            $('.tab-list a').hover(
                    function() {
                        /* 為匹配的當前元素切換 class css類別 */
                        $(this).toggleClass('liColor');
    
                        /* 拿到當前(this) a 的索引號 */
                        index = $(this).index();
    
                        /* 讓上面和下面相應的索引號 eq() 顯示內容 
                            其餘siblings() 隱藏起來 */
                        $('.tab-panel').eq(index).stop().fadeIn('slow').show()
                                .siblings().hide();
    
                    }, function() {
                        /* 第二個方法處理滑鼠移開事件 */
                        $(this).removeClass('liColor');
                        $('.tab-panel').hide();
                    })
    
            $('.tab-panel').hover(function() {
                index = $(this).index();
                $(this).css('background-color', 'white').show();
                $('.tab-list a').eq(index).addClass('liColor');
            }, function() {
                $(this).hide();
                $('.tab-list a').eq(index).removeClass('liColor');
            })
    
            $('#insertbtn').click(function() {
                if (token == true) {
                    $('#insert').css("display", "flex");
                    $('#insertbtn').text("取消");
                    token = false;
                } else {
                    $('#insert').css("display", "none");
                    $('#insertbtn').text("＋ 新增商品");
                    token = true;
                }
            });
            
        });
    </script>
</head>
<body>
    	<!-- 引入共同的頁首 -->
	<jsp:include page="/WEB-INF/views/_00_util/allUtil/jsp/header.jsp" />
	

    <!-- <div class="advertisement">    /*廣告的位子*/
        <img src="https://picsum.photos/1200/300">
    </div> -->

    <div class="main-member">
		<!-- 功能選單開始 -->
		<jsp:include page="/WEB-INF/views/_00_util/shopUtil/jsp/shop_aside.jsp" />
		<!-- 功能選單結束 -->



        <main>
            <div class="column">
                <div class="column-pic">
                    <p class="column-picname">商品照片</p>
                </div>
                <div class="column-name">商品名稱</div>
                <div class="column-content">商品介紹</div>
                <div class="column-amount">價錢</div>
                <div class="column-edit">
                    <p style="margin-right: 70px;">編輯</p>
                </div>
                
            </div>
            <%-- 插入 bean物件 c:foreach --%>
            <%-- 此處投入所有投入shopmenu-table能撈到的所有資料 --%>
        <c:forEach var="list" varStatus="stat" items="${shopmenu}">
            <div class="column">
                <div class="column-pic">
                <%-- 放置pic --%>
                <img src="<c:url value='/_50_shop/_52_shopmenu/picture/${list.menu_id}'/>" style="margin-left: 5px;" height="62px" class="coupon-pic">
                    
                </div>
                <%-- 品名name --%>
                <div class="column-name">${list.menu_name}</div>
                <%-- 細項detail --%>
                <div class="column-content">${list.menu_detail}</div>
                <%-- 價錢price --%>
                <div class="column-amount">${list.menu_price}</div>
                <div class="coupon-edit">
                    <input type="button" value="編輯" onclick="location.href='${pageContext.request.contextPath}/_50_shop/_52_shopmenu/modify/${list.menu_id}'">
                    /
                    <input type="button" value="刪除" onclick="location.href='${pageContext.request.contextPath}/_50_shop/_52_shopmenu/delete/${list.menu_id}'">

                </div>
            </div>
        </c:forEach>

            <div style="display: none; justify-content: center;
            border: 2px dashed #333; padding: 10px; margin: 20px;"
            id="insert">
                <div style="width: 35%; text-align: right;">
                    <div class="text">商品名稱：</div>
                    <div class="text" style="margin-top: 30px;">商品內容：</div>
                    <div class="text" style="margin-top: 70px;">商品價格：</div>
                    <div class="text" style="margin-top: 150px;">商品照片：</div>

                </div>
                <div style="width: 65%; text-align: left;">
                    <!--form:form 插入點 -->
                    <form:form method="POST" modelAttribute="shopmenubean" 
                    enctype='multipart/form-data'>
                        <div>
                            <form:input type="text" path="menu_name" class="form" />
                        </div>
                        <div>
                            <form:textarea path="menu_detail" cols="40" rows="5" 
                            style="margin-top: 25px;" />
                        </div>
                        <div>
                        	<form:input type="text" path="menu_price" class="form" />
                        </div>
                        <div style="display: flex;">
                            <div
                                style="width: 250px; height: 150px; margine-top:10px;">
                                <img style="width:200px;height:150px;"  id="blah" />
                            </div>
                            <div>
                                <form:input type="file" id="imgInp" path="productImage" style="margin-left: 5px;margin-top: 130px;"/>
                                <div style="width: 100%;text-align: right;height: 60px;">
                                    <input type="submit" value="儲存" style="margin-top: 28px;width: 120px;height: 30px;"/>
                                </div>
                            </div>
                        </div>
                    </form:form>
                    <!--form:form 結束 -->
                </div>
            </div>
            <div class="middle-bottom" 
                style="width: 95%; height: 40px; margin: 20px; border: 2px dashed #333; display: flex;">
                <button style="margin: 3px;" id="insertbtn">＋ 新增商品</button>
            </div>
            
        </main>

    </div>
    <script type="text/javascript"> 
  function readURL(input) {
	  if (input.files && input.files[0]) {
	    var reader = new FileReader();
	    
	    reader.onload = function(e) {
	      $('#blah').attr('src', e.target.result);
	    }
	    
	    reader.readAsDataURL(input.files[0]); // convert to base64 string
	  }
	}

	$("#imgInp").change(function() {
	  readURL(this);
	});
   </script>
    
</body>
</html>