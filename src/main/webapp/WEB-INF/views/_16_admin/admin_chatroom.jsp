<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<!DOCTYPE html>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>客服回應</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css" integrity="sha384-B0vP5xmATw1+K9KRQjQERJvTumQW0nPEzvF6L/Z6nronJ3oUOFUFpCjEUQouq2+l" crossorigin="anonymous">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/_00_util/adminUtil/css/admin_chatroom.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/_00_util/adminUtil/css/normalize.css">
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

<div class="chatroom container">
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
                                <button><span>廣告資訊</span></button>
                            </a>
                        </div>
                        <div class="item">
                            <a href="admin_chatroom.html">
                                <button style="background:rgb(170, 192, 207);"><span>客服回應</span></button>
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
                    <div class="dialogue">
                        <div class="user remote">
                            <div class="avatar">
                                <div class="pic">
                                    <img src="https://picsum.photos/100/100" alt="">
                                </div>
                                <div class="name">Shawn</div>
                            </div>
                            <div class="txt">
                                Hey, Senorita~
                            </div>
                        </div>
                        <div class="user local">
                            <div class="avatar">
                                <div class="pic">
                                    <img src="https://picsum.photos/50/50" alt="">
                                </div>
                                <div class="name">Camila</div>
                            </div>
                            <div class="txt">
                                What's wrong?
                            </div>
                        </div>
                        <div class="user remote">
                            <div class="avatar">
                                <div class="pic">
                                    <img src="https://picsum.photos/100/100" alt="">
                                </div>
                                <div class="name">Shawn</div>
                            </div>
                            <div class="txt">
                                Do you have a date on the weekend?
                            </div>
                        </div>
                        <div class="user local">
                            <div class="avatar">
                                <div class="pic">
                                    <img src="https://picsum.photos/50/50" alt="">
                                </div>
                                <div class="name">Camila</div>
                            </div>
                            <div class="txt">
                                Ooh la la la~
                            </div>
                        </div>
                        <div class="user remote">
                            <div class="avatar">
                                <div class="pic">
                                    <img src="https://picsum.photos/100/100" alt="">
                                </div>
                                <div class="name">Shawn</div>
                            </div>
                            <div class="txt">
                                Do you have a date on the weekend?
                            </div>
                        </div>
                        <div class="user local">
                            <div class="avatar">
                                <div class="pic">
                                    <img src="https://picsum.photos/50/50" alt="">
                                </div>
                                <div class="name">Camila</div>
                            </div>
                            <div class="txt">
                                Ooh la la la~
                            </div>
                        </div>

                    </div>
                </main>
            </div>
        </div>

</body>
</html>