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
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    
   
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
    
	<jsp:include page="/WEB-INF/views/_00_util/allUtil/jsp/header.jsp" />

  

    <div class="main-member">
        <aside>
            <div class="function">
                <h3>商家管理頁面</h3>
                

                <div class="item">
                    <a href="<c:url value='/_50_shop/_53_shopRegister/modifyShop/${LoginOK.shopBean.shop_id}' />">
                        <button><span>商家資料</span></button>
                    </a>
                </div>
                <div class="item">
                    <a href="<c:url value='/_50_shop/_52_shopmenu/InsertShopItem/${LoginOK.shopBean.shop_id}' />">
                        <button><span>菜單商品</span></button>
                    </a>
                </div>
                <div class="item">
                    <a href="<c:url value='/_50_shop/_51_coupon/InsertCoupon/${LoginOK.shopBean.shop_id}' />">
                        <button><span>優惠券管理</span></button>
                    </a>
                </div>
                <div class="item">
                    <a href="<c:url value='/_50_shop/_55_shopData/DataFromAll' />">
                        <button><span>報表</span></button>
                    </a>
                </div>
                <div class="item">
					<a href="<c:url value='/_50_shop/_54_showShops/ShowShops/${LoginOK.shopBean.shop_id}' />">
						<button>
							<span>商家頁面</span>
						</button>
					</a>
				</div>
                <div class="item">
                    <a href="<c:url value='/doLogout'/>" onclick="return window.confirm('確定登出嗎?');">
                        <button><span>登出</span></button>
                    </a>
                </div>
            </div>
        </aside>



        <main>
          
            <div id="insertmenu">
                <div style="width: 35%; text-align: right;">
                    <div class="text">菜單名稱：</div>
                    <div class="text" style="margin-top: 51px;">菜單內容：</div>
                    <div class="text" style="margin-top: 70px;">菜單價格：</div>
                    <div class="text" style="margin-top: 150px;">菜單照片：</div>
                </div>
                <div style="width: 65%; text-align: left;">
                    <!--form:form 插入點 -->
                    <form:form method="POST" modelAttribute="shopmenubean" 
                    enctype='multipart/form-data' >
                        <div>
                            <form:input type="text" path="menu_name" class="form" />
                        </div>
                        <div>
                            <form:textarea path="menu_detail" cols="30" rows="4" 
                            style="margin-top: 25px;" />
                        </div>
                        <div>
                        	<form:input type="text" path="menu_price" class="form" />
                        </div>
                        <div style="display: flex;justify-content: center;align-items: left;flex-direction: column;">
                            <div style="width:250px;height:150px;background:#eee;margin-top:5px;">
                                <img src="<c:url value='/_50_shop/_52_shopmenu/picture/${shopmenubean.menu_id}'/>" style="width:250px;height:150px;margin-left: 5px;" class="coupon-pic">
                            </div>
                            <div style="">
<!--                             	<div style="width:250px;height:150px;"> -->
<!-- 	                             	<img style="width:250px;height:150px;margin-top:4px;margin-left:5px;"  id="blah"/> -->
<!--                             	</div> -->
                                <form:input type="file" id="imgInp" path="productImage" accept=".jpeg,.png" style="margin-left: 5px;margin-top: 10px;"  />
                                <div style="width: 100%;text-align: left;height: 60px;">
                                	<input type="button" onclick="location.href='${pageContext.request.contextPath}/_50_shop/_52_shopmenu/InsertShopItem/${shopmenubean.shopBean.shop_id}'" value="取消" style="margin-top: 28px;width: 120px;height: 30px;"></input>
                                	<!--  <input type="button" onclick="getUrlParameter('modify')" value="測試" style="margin-top: 28px;width: 120px;height: 30px;"></input>
                                	-->
                                    <input type="submit" value="儲存" style="margin-top: 28px;width: 120px;height: 30px;"></input>
                                </div>
                            </div>
                        </div>
                    </form:form>
                    <!--form:form 結束 -->
                </div>
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