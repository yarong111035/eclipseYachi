<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<!DOCTYPE html>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>廣告資訊</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css" integrity="sha384-B0vP5xmATw1+K9KRQjQERJvTumQW0nPEzvF6L/Z6nronJ3oUOFUFpCjEUQouq2+l" crossorigin="anonymous">
    <link rel="stylesheet" href="<c:url value='/_00_util/adminUtil/css/normalize.css'/>">
    <link rel="stylesheet" href="<c:url value='/_00_util/adminUtil/css/admin_adinfo.css'/>">
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/js/bootstrap.min.js" integrity="sha384-+YQ4JLhjyBLPDQt//I+STsc9iw4uQqACwlvpslubQzn4u2UU2UFM80nGisd026JF" crossorigin="anonymous"></script>
    <script src="https://kit.fontawesome.com/a076d05399.js"></script>
    <script src="${pageContext.request.contextPath}/js/jquery-3.5.1.js"></script>
    <script src="${pageContext.request.contextPath}/js/jquery-ui.js"></script>
    <script src="${pageContext.request.contextPath}/_00_util/adminUtil/javascript/header.js"></script>
    
    <script>
        $(function () {
            
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
	
	<jsp:include page="/WEB-INF/views/_00_util/allUtil/jsp/header.jsp" />
	
    <div class="administrator container">
        <div class="row">
            <aside class="col-4">
                <div class="function">
                    <!-- <h3>管理員</h3> -->
                    <div class="item">
                        <img src="https://picsum.photos/250/250" id="headImg">
                    </div>

                    <label for="file">
                        <i class="fas fa-image">
                            編輯頭貼
                            <input type="file" id="file" accept=".jpeg,.png" style="display: none;">
                        </i>
                    </label>

                    <div class="item">
                        <a href="administrator.html">
                            <button><span>管理員首頁</span></button>
                        </a>
                    </div>
                    <div class="item">
                        <a href="#">
                            <button><span>商品維護</span></button>
                        </a>
                    </div>
                    <div class="item">
                        <a href="admin_activity.html">
                            <button><span>平台優惠活動</span></button>
                        </a>
                    </div>
                    <div class="item">
                        <a href="admin_coupon.html">
                            <button><span>平台優惠券</span></button>
                        </a>
                    </div>
                    <div class="item">
                        <a href="admin_adinfo.html">
                            <button style="background:rgb(170, 192, 207);"><span>廣告資訊</span></button>
                        </a>
                    </div>
                    <div class="item">
                        <a href="admin_chatroom.html">
                            <button><span>客服回應</span></button>
                        </a>
                    </div>
                    <div class="item">
                        <a href="#">
                            <button><span>審核商家</span></button>
                        </a>
                    </div>
                    <div class="item">
                        <a href="admin_announcement.html">
                            <button><span>公告</span></button>
                        </a>
                    </div>
                    <div class="item">
                        <a href="#">
                            <button><span>申訴單</span></button>
                        </a>
                    </div>
                    <div class="item">
                        <a href="#">
                            <button><span>基本資料</span></button>
                        </a>
                    </div>
                    <div class="item">
                        <a href="#">
                            <button><span>登出</span></button>
                        </a>
                    </div>
                </div>
            </aside>
            <main class="col-8">
                <div class="adinfo">
                    <div>
                        <fieldset>    
                            <legend align="center">近期廣告</legend>
                            <div>
                                <img src="https://picsum.photos/150/150" class="ad-photo">
                                <img src="https://picsum.photos/150/150" class="ad-photo">
                                <img src="https://picsum.photos/150/150" class="ad-photo">
                            </div>
                        </fieldset>
                    </div>
                    <div>
                        <fieldset>
                            <legend align="center">預定廣告</legend>
                            <div>
                                <img src="https://picsum.photos/150/150" class="ad-photo">
                                <img src="https://picsum.photos/150/150" class="ad-photo">
                                <img src="https://picsum.photos/150/150" class="ad-photo">
                            </div>
                        </fieldset>
                    </div>
                    <div class="adinfo-mid">
                        <label for="">廣告名稱 :</label>
                        <input type="text" placeholder="請輸入酷炫廣告名稱" maxlength="30" style="margin-left: 2.8rem";>
                    </div>
                    <div class="adinfo-mid">
                        <label for="">廣告上架日期 :</label>
                        <input type="date" value="1" step="1" min="0" style="width: 130px; margin-left: 0.3rem";> 
                        <label for="" style="margin-left: 0.5rem"> ~ </label>
                        <input type="date" value="1" step="1" min="0" style="width: 130px; margin-left: 0.5rem";>
                    </div>
                    <div class="adinfo-mid">
                        <label for="">廣告網址 :</label>
                        <input type="text" placeholder="請輸入酷炫廣告網址" maxlength="30" style="margin-left: 2.8rem";>
                    </div>
                    <div class="adinfo-mid">
                        <label for="">優惠券圖片:</label>
                        <div style="display: flex;">
                            <label for="file">
                                <i class="fas fa-image adinfo-photo" style="margin-top: 2rem; font-size: 18px;">
                                    ☛選擇圖片<input type="file" id="file" accept=".jpeg,.png" style="display: none;">
                                </i>
                            </label>
                            <div class="item">
                                <img src="https://picsum.photos/500/250" id="headImg" style="margin-left: 1.8rem; margin-top: -25px;">
                            </div>
                        </div>
                        <div>
                            <a href="#">
                                <button class="adinfo-button">儲存</button>
                            </a>
                        </div>
                    </div>
                </div>
            </main>
        </div>
    </div>

</body>
</html>