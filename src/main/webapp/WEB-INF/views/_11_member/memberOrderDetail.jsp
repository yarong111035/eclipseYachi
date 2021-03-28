<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css"
	integrity="sha384-B0vP5xmATw1+K9KRQjQERJvTumQW0nPEzvF6L/Z6nronJ3oUOFUFpCjEUQouq2+l"
	crossorigin="anonymous">
<script src="//cdn.jsdelivr.net/npm/sweetalert2@10"></script>
<link rel="stylesheet"
	href="<c:url value='/_00_util/allUtil/css/normalize.css'/>">
<link rel="stylesheet"
	href="<c:url value='/_00_util/allUtil/css/background.css'/>">
<link rel="stylesheet"
	href="<c:url value='/_00_util/memberUtil/css/member_order_detail.css'/>">
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"
	integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj"
	crossorigin="anonymous"></script>
<script
	src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"
	integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN"
	crossorigin="anonymous"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/js/bootstrap.min.js"
	integrity="sha384-+YQ4JLhjyBLPDQt//I+STsc9iw4uQqACwlvpslubQzn4u2UU2UFM80nGisd026JF"
	crossorigin="anonymous"></script>
<script
	src="<c:url value='/_00_util/allUtil/javascript/jquery-3.5.1.js'/>"></script>
<script src="<c:url value='/_00_util/allUtil/javascript/jquery-ui.js'/>"></script>
<title>會員訂單詳情</title>
</head>
<body>
	
	<!-- 引入共同的頁首 -->
	<jsp:include page="/WEB-INF/views/_00_util/allUtil/jsp/header.jsp" />
	<!-- 引入共同的頁首 結束 -->
	


	<div class="main-member">
	<!-- 功能選單開始 -->
	<jsp:include page="/WEB-INF/views/_00_util/memberUtil/jsp/member_aside.jsp" />
	<!-- 功能選單結束 -->
        <!-- 側邊攔開始 -->
<!--         <aside> -->
<!--             <div class="function"> -->
<!--                 <h3>會員中心</h3> -->
<!-- 				<div class="item"> -->
<%-- 		              <img src='<c:url value='/_00_init/getMemberImage?memberId=${LoginOK.memberId}' /> ' --%>
<!-- 		                  id="headImgg" height='200px' width='200px'>					 -->
<!-- 	            </div> -->


<!--                 <div class="item"> -->
<%--                     <a href="<c:url value='/member/update/${LoginOK.memberId}'/>"> --%>
<!--                         <button><span>基本資料</span></button> -->
<!--                     </a> -->
<!--                 </div> -->
<!--                 <div class="item"> -->
<%--                     <a href="<c:url value='/_23_orderProcess/orderList'/>"> --%>
<!--                         <button><span>訂單查詢</span></button> -->
<!--                     </a> -->
<!--                 </div> -->
<!--                 <div class="item"> -->
<%--                     <a href="<c:url value='/member/keep/coupons'/>"> --%>
<!--                         <button><span>我的優惠券</span></button> -->
<!--                     </a> -->
<!--                 </div> -->
<!--                 <div class="item"> -->
<%--                     <a href="<c:url value="/queryFavoriteShop"/>"> --%>
<!--                         <button><span>喜愛商家</span></button> -->
<!--                     </a> -->
<!--                 </div> -->
<!--                 <div class="item"> -->
<!--                     <a href="#"> -->
<!--                         <button><span>通知</span></button> -->
<!--                     </a> -->
<!--                 </div> -->
<%--                 <c:if test="${empty LoginOK.shopBean.shop_id}">	 --%>
<!--                 <div class="item"> -->
<%--                     <a href="<c:url value='/_50_shop/_53_shopRegister/InsertShop' />"> --%>
<!--                         <button><span>申請商家</span></button> -->
<!--                     </a> -->
<!--                 </div> -->
<%--                 </c:if> --%>
<!--                 <div class="item"> -->
<!--                     <a href="#"> -->
<!--                         <button><span>新增信用卡</span></button> -->
<!--                     </a> -->
<!--                 </div> -->
<!--                 <div class="item"> -->
<%--                     <a href="<c:url value='/doLogout'/>" onclick="return window.confirm('確定登出嗎?');"> --%>
<!--                         <button><span>登出</span></button> -->
<!--                     </a> -->
<!--                 </div> -->
<!--             </div> -->
<!--         </aside> -->
        <!-- 側邊攔結束 -->



        <main> 
              <div class="content">

                  <!-- 訂單詳情 -->
                  <div> 
                		<div id="backToList">
                  			<a href="<c:url value='/_23_orderProcess/orderList'/>">返回訂單查詢</a>
                  		</div>
                  		<h3>訂單詳情 </h3> 
                  		
           
                  	<div class="descArea">
	                  	<span class = "descTitle">訂單狀態: </span><span class="descContent" style="color:red;font-size:1.1rem;"> ${orderBean.orderStatusBean.status_name}</span><br>
	                  	<span class = "descTitle">明細數量: </span><span class="descContent"> 共 ${orderBean.items.size() } 樣商品</span><br>
	                  	<span class = "descTitle">訂單總計: </span><span class="total"> ${orderBean.order_total } 元整</span><br>
	                  	<span class = "descTitle">訂購日期: </span><span class="descContent"> <fmt:formatDate value="${ orderBean.order_datetime}" pattern="yyyy年MM月dd日 HH點mm分ss秒"/></span><br>
	                  	<span class = "descTitle">訂單編號: </span><span class="descContent"> ${orderBean.orderNumber}</span><br>
	                  	<span class = "descTitle">配送地址: </span><span class="descContent"> ${orderBean.order_address}</span><br>
	                  	<span class = "descTitle">付款方式: </span><span class="descContent"> ${orderBean.payTypeBean.pay_type_name }</span><br>
	                  	<c:if test="${!empty orderBean.company_id }">
	                  	<span class = "descTitle">統一編號: </span><span class="descContent"> ${orderBean.company_id}</span><br>
                    	</c:if>
                    </div>
                    
                    <table>
                    	
						<c:forEach var="item" items="${orderBean.items}">
	                        <thead>
	                        	
	                            <tr class="img-tr">
	                                <td colspan="2" rowspan="5" class="img-td">
	                                    <img src="<c:url value='/getProductPictureA/${item.productBean.product_id }'/>">
	                                </td>
	                                <td colspan="6"><span class="productName">商品名稱: ${item.productBean.product_name }</span></td> 
	                            </tr>
	                            <!-- <tr>
	                                <td colspan="4" rowspan="4" white-space:pre-wrap>${item.productBean.product_info}</td>
	                            </tr> -->
                                <tr>
	                                <td colspan="4" rowspan="4"></td>
	                            </tr>
	                            <tr>
	                                <td style="text-align: center;">數量</td>
	                                <td style="text-align: right;">x ${item.amount}</td>
	                            </tr>
	                            <tr>
	                                <td style="text-align: center;">單價</td>
	                                <td style="text-align: right;">$ ${item.unitPrice}</td>
	                            </tr>
	                            <tr>
	    
	                                <td style="text-align: center;">小計</td>
	                                <td style="text-align: right;">$ ${item.amount * item.unitPrice }</td>
	                            </tr> 
	                        </thead>
                     	</c:forEach>
                     	
                    </table>
                    
                    <div class="btCancel">
                        
                        <a href="#"><button><i class="fas fa-cart-arrow-down"></i>再買一次</button></a>
                        
                        <c:choose>
                        	<c:when test="${orderBean.orderStatusBean.status_id == 1}">
                        		<a id="cancelBtn"  onclick='cancelHandler(${orderBean.order_id})'><button><i class="fas fa-window-close"></i>取消訂單</button></a>
                        	</c:when>
                        	<c:when  test="${orderBean.orderStatusBean.status_id == 5}">
                        		<a id="cancelBtn" href="javascript:;" ><button disabled style="cursor: no-drop;"><i class="fas fa-window-close"></i>訂單已取消</button></a>
                        	</c:when>
                        	<c:otherwise>
                        			<!--只要不是未付款狀態 -->
                        		 <a onclick="alert('訂單已付款!  請聯繫客服處理 謝謝！')"><button><i class="fas fa-window-close"></i>取消訂單</button></a>
                        	</c:otherwise>
                        </c:choose>
                        
                        
                        
                        

                       
                        
                        
                    </div>
                
                  </div>
                  <!-- 訂單詳情 -->
                   
                   
              </div>
        </main>

    </div>
<!-- -------------------------------引入共同的頁尾---------------------------------------- -->
<jsp:include page="/WEB-INF/views/_00_util/allUtil/jsp/footer.jsp" />
<!-- -------------------------------引入共同的頁尾----------------------------------------- -->    
    <script>
    
    function cancelHandler(order_id){
   		Swal.fire({
    		  title: '確定取消此筆訂單?',
    		  icon: 'warning',
    		  showCancelButton: true,
    		  confirmButtonColor: '#3085d6',
    		  cancelButtonColor: '#d33',
    		  confirmButtonText: 'Yes!'
    		}).then((result) => {
    		  if(result.isConfirmed) {
    		   
    		    $.ajax({
		            url:"<c:url value='/cancelOrder/asdf9" + order_id + "8'/>",
		            type:"get",
		            data:{},
	       		 })
	       		  Swal.fire(
    		      '此筆訂單已取消！',
    		      '2秒後頁面即將自動重整',
    		      'success'
    		    )
	       		setTimeout(() => {
	       			window.location.reload();
				}, 1800); 
	       		 
    		  }  
    		 return false;
    		})
	}	
        
		
		
    $(function () {
         // 每三秒執行一次
         setInterval(function(){
            $('#news li:first-child').slideUp(function(){

                $(this).appendTo($('#news')).slideDown();
            });

        },3000);

        // 點擊移除商品
        $('.remove-product').click(function(){
            $(this).closest('.product-item').remove(); 

        });

    });    

    
    
    </script>
</body>
</html>