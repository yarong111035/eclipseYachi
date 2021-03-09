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
                            <div class="th index">序號</div>
                            <div class="th pic"></div>
                            <div class="th name">商品名稱</div>
                            <div class="th price">價格</div>
                            <div class="th count">數量</div>
                            <div class="th total">小計</div>
                            <div class="th delete">刪除</div>
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
                    	<c:forEach var='cart' items='${cartList }' varStatus='i'>
	                        <div class="tr">
	                       		<div class="td price">
	                                <span>${i.count}</span>
	                            </div>
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
	                                <select name="qty" id="selectAmount" onchange='updateAmount(${cart.cart_id}, this.options[this.options.selectedIndex].value,${cart.productBean.product_price})'>
	                                	<c:forEach var="num" begin="1" end="10" >
	                                		<option value="${num}" <c:if test="${cart.cart_amount == num}">selected</c:if>>${num}</option> 
	                                	</c:forEach>
<%-- 	                                	<c:forEach var="num" begin="1" end="10" > --%>
<%-- 	                                		<option value="${num}" <c:if test="${cart.cart_amount == num}">selected</c:if>>${num}</option>  --%>
<%-- 	                                	</c:forEach> --%>
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
    
//     	let newCount = 0;
//     	let selectAmount = document.getElementById('selectAmount');
// 		selectAmount.addEventListener('change',changeItemCount);
// 		function changeItemCount(e){
// 			newCount = e.target.value;
// 			console.log(newCount);
// 			// console.log(`\${cart.productBean.product_price}`);
// 			// let product_price = '${cart.productBean.product_price}';
// 			// console.log(product_price);
		
// 		}
		
		function updateAmount(id,amount,price){
// 			amount = newCount;
// 			this.id = id;
// 			this.amount = amount;
// 			this.price = price;
// 			alert(id);
// 			alert(amount);
// 			alert(price);
			location.href="<c:url value='/update/" + id + "/" + amount + "/" + price + "'/>";				
		}
    	$(function(){
       		
// 			
//     		function updateAmount(cart_id, num, product_price){

    		
			let xhr = new XMLHttpRequest();
			xhr.addEventListener('readystatechange',callState);
			xhr.open("GET","<c:url value='/allProducts' />",true)
			xhr.send();

			function callState(){
				if(xhr.readyState == 4 && xhr.status == 200){
					console.log(xhr.responseText);
					products = JSON.parse(xhr.responseText)
					console.log(products);
					for(let i = 0; i < products.length; i++){
						price = products[i].product_price;
						console.log(price);
					}
				}
			}
			
			let selectAmount = document.getElementById('selectAmount');
			selectAmount.addEventListener('change',changeItemCount);
			function changeItemCount(e){
				newCount = e.target.value;
				console.log(newCount);
				
				
			}
			
			
    		
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