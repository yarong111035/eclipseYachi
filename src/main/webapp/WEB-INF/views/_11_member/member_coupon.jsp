<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<!DOCTYPE html>
<html>
<head>
 	<meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>member_update</title>
   	<link rel="stylesheet" href="<c:url value='/_00_util/memberUtil/css/reset.css'/>">
	<link rel="stylesheet" href="<c:url value='/_00_util/memberUtil/css/member_coupon.css'/>">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.2/css/all.min.css">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    </head>
	
	<script>
        $(function () {
        
            $('#tabs-nav a').click(function(){ 
                // 當點擊tabs-nav的元素a時  替當前(this)的a超連結增加.change類  
                // 其餘兄弟類 siblings() remove .change類
                $(this).addClass('change').siblings().removeClass('change');

                // 點擊的同時 拿到當前 a 超連結的索引號
                let index = $(this).index();     //  index有6個

                // 讓下面對應的索引號  .tabs-content 的子元素.tabs-panel[index] 渲染出來  
                // 其他 子元素 兄弟類 siblings() 隱藏起來   
                // 用addClass 增加動畫
                $('.tabs-content .tabs-panel').eq(index)
                .addClass('fadeIn animated-tabs').show().siblings().hide();


            });

             // 跑馬燈每三秒執行一次
             setInterval(function(){
                $('#news li:first-child').slideUp(function(){

                    $(this).appendTo($('#news')).slideDown();
                });

            },3000);

            // 點擊移除商品
//             $('.remove-product').click(function(){
//                 $(this).closest('.coupon-shop').remove(); 

//             });

        });    

    </script>
	
</head>
<body>
	<!-- 引入共同的頁首 -->
	<jsp:include page="/WEB-INF/views/_00_util/allUtil/jsp/header.jsp" />

    <!-- 跑馬燈 -->
	<div id="Marquee">
        <h3>最新優惠消息:</h3>
        <ul id="news">
            <li>東西很貴不要買 !</li>
            <li>還沒做完</li>
            <li>目前網路商店全館免運</li>
        </ul>
    </div>
    <!-- 跑馬燈結束 -->

    <!-- 左側的會員導覽列 -->
	<div class="main-member">
        <aside>
            <div class="function">
                <h3>會員中心</h3>
				<div class="item">
		            <img src='<c:url value='/_00_init/getMemberImage?memberId=${LoginOK.memberId}' /> '
		                  id="headImgg" height='200px' width='200px'>					
	            </div>
                <div class="item">
                    <a href="<c:url value='/member/update/${LoginOK.memberId}'/>">
                        <button><span>基本資料</span></button>
                    </a>
                </div>
                <div class="item">
                    <a href="<c:url value='/_23_orderProcess/orderList'/>">
                        <button><span>訂單查詢</span></button>
                    </a>
                </div>
                <div class="item">
                     <a href="<c:url value='/member/keep/coupons'/>">
                        <button><span>我的優惠券</span></button>
                    </a>    
                </div>
                <div class="item">
                    <a href="<c:url value="/queryFavoriteShop"/>">
                        <button><span>喜愛商家</span></button>
                    </a>
                </div>
                <div class="item">
                    <a href="#">
                        <button><span>通知</span></button>
                    </a>
                </div>
                 <c:if test="${empty LoginOK.shopBean.shop_id}">	
                <div class="item">
                    <a href="<c:url value='/_50_shop/_53_shopRegister/InsertShop' />">
                        <button><span>申請商家</span></button>
                    </a>
                </div>
                </c:if>
                <div class="item">
                    <a href="#">
                        <button><span>新增信用卡</span></button>
                    </a>
                </div>
                <div class="item">
                     <a href="<c:url value='/doLogout'/>" onclick="return window.confirm('確定登出嗎?');">
                        <button><span>登出</span></button>
                    </a>
                </div>
            </div>
        </aside>

        <!-- 左側的會員導覽列結束 -->

        <!-- 右側的我的優惠券 -->
        <main> 

            <form action="">

                <div id="hcg_tabs">
    
                    <div id="tabs-nav">
                       <a href="#" class="change">我的優惠券</a>                     
                    </div>
                   
                    <div class="tabs-content">
    
                        <!-- 先讓第一個內容顯示出來 display:block -->
                      <div class="tabs-panel" style="display:block"> 
                        
                        <div class="coupon-container">                            
                           <c:forEach var='couponlist' items='${coupons}'>   
                                                                          
                              <div class="coupon-shop">   
                              <a
						href="<c:url value='/coupon?coupon_id=${couponlist.coupon_id}' />">  
                                  <img src="<c:url value='/getCouponPicture/${couponlist.coupon_id}' />" >
                                  </a>
                              		<a href="<c:url value='/member/delete/${couponlist.coupon_id}'/>" 
                              		class="remove-product" onclick="return window.confirm('確定移除嗎?')">
                              		<i class="fas fa-window-close"></i></a>
                              </div>
                              
                              
                         </c:forEach>           


                        </div>


                      </div>
                   
                   
                      
                
                   
                    </div>
                  
                </div>
            </form>

        </main>

    </div>

</body>
</html>