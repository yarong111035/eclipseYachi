<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<!DOCTYPE html>
<html lang="en"> 
<head>
	<meta charset="UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>cart content</title>
    <link rel="stylesheet" href="<c:url value='/_00_util/allUtil/css/normalize.css'/>">
    <link rel="stylesheet" href="<c:url value='/_00_util/shoppingMallUtil/css/5_cart_content.css'/>">
    <link rel="stylesheet" href="<c:url value='/_00_util/allUtil/css/background.css'/>">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.2/css/all.min.css">   
    <script src="//cdn.jsdelivr.net/npm/sweetalert2@10"></script>
    <script src="<c:url value='/_00_util/allUtil/javascript/jquery-3.5.1.js'/>"></script>
    <script src="<c:url value='/_00_util/allUtil/javascript/jquery-ui.js'/>"></script>
</head>
<body>
	<jsp:include page="/WEB-INF/views/_00_util/allUtil/jsp/header.jsp" />

	<div class="container">
        <!--Start c -->
        <div class="shopping_title">
            <i class="fas fa-shopping-cart"></i>
            <span>購物車</span>
            <!-- 存放購物數量的值 -->
            <c:if test='${empty cartList}'>
            	<span>(0)</span>
            </c:if>
            <c:if test='${!empty cartList}'>
            	<span>(${cartList.size()})</span>
            </c:if>
            
        </div>
        <!---------- End 購物車標頭 -------------------------->

		
        <!--Start 購物車內容 -->
        <form id="shopping_form" method="POST">
        <input type='hidden' name='_method' value='DELETE'>
            <!-- <input type="hidden">  資料傳到後端用-->
            <div class="shopping_items">
                <div class="table">
                    <div class="thead">
                        <div class="tr">
                            <div class="th pic"></div>
                            <div class="th name">商品名稱</div>
                            <div class="th price">價格</div>
                            <div class="th count">數量</div>
                            <div class="th total">小計</div>
                            <div class="th delete"></div>
                        </div>
                    </div>
                    
                    
                    <div class="tbody">
                    	<c:if test='${empty cartList}'>
                    		<div class="emptyCart">
	                   			<a href="<c:url value='/DisplayPageProducts' />" 
	                   			style="display: block;color: #444;font-size: 1.1rem; height: 100px;line-height: 100px;">
	                   				購物車空空如也! 趕快去選購吧
	                   			</a>
                   			</div>
                    	</c:if>
                    	<c:set value='0' var='sum'/>
                    	<c:forEach var='cart' items='${cartList }'>
	                        <div class="tr">
	                            <div class="td pic">
	                                <img src="<c:url value='/getPicture/${cart.productBean.product_id}'/>">
	                            </div>
	                            <div class="td name">
	                                <a href="<c:url value='singleProduct?id=${cart.productBean.product_id}'/>">${cart.productBean.product_name }</a>
	                                <div>
	                                    <span>${cart.productBean.product_spec }</span>
	                                </div>
	                            </div>
	                            <div class="td price">
	                                <span>NT$ ${cart.productBean.product_price }</span>
	                            </div>
	                            <div class="td count">
	                                <select name="cart_amount"  id="" >
	                                    <option value="1">1</option>
	                                    <option value="2">2</option>
	                                    <option value="3">3</option>
	                                    <option value="4">4</option>
	                                    <option value="5">5</option>
	                                    <option value="6">6</option>
	                                    <option value="7">7</option>
	                                    <option value="8">8</option>
	                                    <option value="9">9</option>
	                                    <option value="10">10</option>
	                                </select>
	                            </div>
	                            <div class="td total">
	                                <span>NT$ ${cart.cart_total }</span>
	                            </div>
	                            <div class="td delete">
	                            	
	                                <a class="deleteLink" href="<c:url value='/cartDelete/${cart.cart_id}'/>"><i class="far fa-trash-alt"></i></a>
	                            </div>
	                        </div>
	                        <c:set var='sum' value='${sum + cart.cart_total}'/>
 						</c:forEach>
 						
                    </div>
                </div>
            </div>
		</form>

        
        <!---------- End 購物車內容 -------------------------->

        <!-- 訂單總計 -->
        <div class="totalBox">
            <div class="total">
                <div>訂單總計</div>
                <span>NT$ ${sum}</span>
            </div>
        </div>

        <!-- 按鈕 -->
        <div class="shopBtn">
            <div class="btn">
                <a href="<c:url value='/DisplayPageProducts' />">繼續購物</a>
            </div>
            <div class="confirmBtn">
                <a href="<c:url value='/orderDetail.html' />">填寫資料</a>
            </div>
        </div>
        
        
        
    </div>
    
    <script>
    	$(function(){
    		$('.deleteLink').click(function() {
    			Swal.fire({
  	    		  title: '什麼!不要這個商品了!?',
  	    		  icon: 'warning',
  	    		  showCancelButton: true,
  	    		  confirmButtonColor: '#3085d6',
  	    		  cancelButtonColor: '#d33',
  	    		  confirmButtonText: '不想要了!'
  	    		}).then(function(result){
  	    		  if (result.isConfirmed) {
  	    			let href = $('.deleteLink').attr('href');
              	   	$('form').attr('action', href).submit();
  	    		  }
  	    		})
        		return false;
       		});
    		
    	})
    </script>
    
</body>
</html>