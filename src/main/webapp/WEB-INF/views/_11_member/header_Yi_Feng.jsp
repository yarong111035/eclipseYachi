<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="/css/reset.css" type="text/css">
    <link rel="stylesheet" href="/css/header.css" type="text/css">
    <script src="https://kit.fontawesome.com/a076d05399.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <title>Document</title>
    
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
    
    <style>
    	
    </style>

</head>

<body style="background-color: #F3F8F2;">
    <!-- 回到上方的按鈕 -->
    <a href="#" class="toTop"><i class="fas fa-arrow-up"></i></a>
    <header>
        <nav>
            <div class="navbar">
                <div class="ig-links">
                    <a href="#">快速登入</a>
                    <a href="#"><img src="/img/facebook.png" alt=""></a>
                    <a href="#"><img src="/img/search.png" alt=""></a>
                    <a href="#"><img src="/img/instagram.png" alt=""></a>
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
					<a href="/"><img src="/img/yachiLogo50.png" alt=""></a>
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
                    <img src="/img/yachiLogo50.png">
                    <div class="txt">
                        <a href="#"><h2>優惠券專區</h2></a>
                    </div>
                    
                </div>

                <div class="member">

				<c:if test="${!empty LoginOK}">
					<a href="#"><font>你好 ! </font></a>
				    <a href="#"><font>${LoginOK}</font></a>
				</c:if>
				
			    <c:if test="${empty LoginOK}">
			    	<a href="/LoginAndRegister"><font>免費註冊</font></a>
			    	<a href="/LoginAndRegister"><font>登入</font></a>
			    </c:if>
			    
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
                    <a href="#">購物中心</a>
                    <a href="#">會員中心</a>
                </div>

                <div class="tab-content">
                    <div class="tab-panel">
                        Lorem ipsum, dolor sit amet consectetur adipisicing elit. Sed cumque porro nam alias explicabo nihil labore quidem laborum repellat dignissimos. Mollitia sequi, sit facilis magni eveniet culpa eligendi debitis! Aliquid?Lorem ipsum, dolor sit amet consectetur adipisicing elit. Qui rem a provident vel fugit corrupti placeat! Perferendis, eligendi quo repellat consequatur, dignissimos rerum quibusdam veritatis, voluptates error sint enim explicabo.
                    </div>
                    <div class="tab-panel">
                        <img src="https://picsum.photos/500/200" alt="">
                    </div>
                    <div class="tab-panel">
                        <img src="https://picsum.photos/600/200" alt="">
                    </div>
                    <div class="tab-panel">
                        待補充待補充待補充待補充待補充待補充待補充待補充待補充待補充待補充待補充待補充待補充待補充待補充待補充待補充待補充待補充待補充待補充待補充待補充待補充待補充待補充待補充待補充待補充待補充待補充待補充待補充待補充待補充待補充待補充待補充待補充待補充
                    </div>
                    <div class="tab-panel member-panel">
                    
                        <div>
                        	<c:if test="${!empty LoginOK}">
                            <a href="/member/update/${member.memberId}">修改會員資料</a>
                            </c:if>
                        </div>

                        <div>
							<c:if test="${!empty LoginOK}">
								<a href="/doLogout"><font>登 出</font></a>
							</c:if>
                        </div>
                        
                    </div>
                </div>

            </div>
        </div>


    </header>
</body>
</html>
