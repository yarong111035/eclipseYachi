<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Search</title>

<link rel="stylesheet" href="<c:url value='/_00_util/allUtil/css/reset.css'/>" >
<link rel="stylesheet" href="<c:url value='/_00_util/homeUtil/css/searchALL.css' />" >
<script src="https://kit.fontawesome.com/a076d05399.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

<link rel="stylesheet" href="https://cdn.jsdelivr.net/gh/fancyapps/fancybox@3.5.7/dist/jquery.fancybox.min.css" />
<script src="https://cdn.jsdelivr.net/gh/fancyapps/fancybox@3.5.7/dist/jquery.fancybox.min.js"></script>

<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>

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
           $('.tabs-content .tabs-panel').eq(index)
           .addClass('fadeIn animated-tabs').show().siblings().hide();


       });

	   // product-type 專用js 
	   $('#product-type a').click(function(){

			$(this).addClass('change').siblings().removeClass('change');

			let index = $(this).index();

			$('.type-content .type-panel').eq(index).addClass('fadeIn animated-tabs').show().siblings().hide();

	   })

	   // shoptype 專用class 
	   $('#shop-type a').click(function(){

			$(this).addClass('change').siblings().removeClass('change');

			let index = $(this).index();

			$('.shoptype-content .shoptype-panel').eq(index).addClass('fadeIn animated-tabs').show().siblings().hide();

		})



	   var splide = new Splide( '#splide' );

		splide.on( 'autoplay:playing', function ( rate ) {
			console.log( rate ); // 0-1
		} );

		splide.mount();

		});
   
  
   		

</script>
<style>
.bstrap-alink a{
	padding: 10px;
	width: 150px;
	margin: 0 5px;
	font-weight: bold;
}


.shop-card{
	margin: 0 0 20px 50px;
	height: 550px;
}

/* 撐開卡片容器 */
.addSpace{
	width: inherit;
    height: 50px;
}
.gotoshop{
	position: absolute;
	left: 100px;
}

/* CSS 限制字數/行數 */
.ellipsis {
overflow:hidden;
white-space: nowrap;
text-overflow: ellipsis;
display: -webkit-box;
-webkit-line-clamp: 5;
-webkit-box-orient: vertical;
white-space: normal;
}

</style>

<body>
	<!-- 引入共同的頁首 -->
	<jsp:include page="/WEB-INF/views/_00_util/allUtil/jsp/header.jsp" />
	
	<!-- 搜尋頁面開始 -->
	<div class="nav-first">
		<a href="<c:url value='/home' />">首頁</a>
		<h5>--></h5>
		<h4>搜尋結果</h4>
	</div>

	<main>

		<div id="main_tabs">

			<div id="tabs-nav">
<!-- 				<a href="#">依夜市</a> -->
				<a href="<c:url value='/search/ALLproducts'/>">全部商城商品</a>
				<a href="<c:url value='/search/product?product_name=' />" >依商城商品</a>
				<a href="<c:url value='/search/ProductType'/>" class="change">依商品類型</a>
				<a href="<c:url value='/search/shop?shop_name='/>">依商家</a>
				<a href="<c:url value='/search/ShopType'/>">依商家類型</a>
			</div>
			
			<div class="tabs-content">

				<div class="tabs-content">

                    <!-- 先讓第一個內容顯示出來 display:block -->
                  <div class="tabs-panel" > 

                  </div>
               
                  <div class="tabs-panel">

                  </div>
               
                  <div class="tabs-panel" style="display:block">
					<div class="product-price bstrap-alink">
					
						<a href="<c:url value='/search/product_type/1'/>" class="btn btn-success btn-sm active" role="button" aria-pressed="true">環保杯套</a>
						<a href="<c:url value='/search/product_type/2'/>" class="btn btn-success btn-sm active" role="button" aria-pressed="true">環保餐具</a>
						<a href="<c:url value='/search/product_type/3'/>" class="btn btn-success btn-sm active" role="button" aria-pressed="true">環保購物袋</a>
						<a href="<c:url value='/search/product_type/4'/>" class="btn btn-success btn-sm active" role="button" aria-pressed="true">陶瓷碗盤</a>
						<a href="<c:url value='/search/product_type/5'/>" class="btn btn-success btn-sm active" role="button" aria-pressed="true">攤販用具</a>
						<a href="<c:url value='/search/product_type/6'/>" class="btn btn-success btn-sm active" role="button" aria-pressed="true">免洗餐具</a>
						<a href="<c:url value='/search/product_type/7'/>" class="btn btn-success btn-sm active" role="button" aria-pressed="true">紙袋</a>
						<a href="<c:url value='/search/product_type/8'/>" class="btn btn-success btn-sm active" role="button" aria-pressed="true">餐車</a>
					
					</div>									
						
					<div class="product-container">

						<c:forEach var="productBean" items="${list}">
							<div class="product">
	
								<a data-fancybox="gallery" href="<c:url value='/searchProductPicture/${productBean.product_id}'/>">
							    <img src="<c:url value='/searchProductPicture/${productBean.product_id}'/>"></a>
	
								<div class="name">${productBean.product_name}</div>
								<div class="info">${productBean.product_spec}</div>
								<div class="price">$&nbsp;${productBean.product_price}</div>
								
								<c:if test="${productBean.product_stock == 0}">								
									<div class="release">商品庫存&nbsp;&nbsp;<em style="color: red;">缺貨中</em></div>
								</c:if>
								<c:if test="${productBean.product_stock > 0}">								
									<div class="release">商品庫存&nbsp;&nbsp;${productBean.product_stock}</div>
								</c:if>
							</div>
						</c:forEach>
					</div>

                  </div>
               

                  <div class="tabs-panel">
                

                  </div>
               
                  <div class="tabs-panel">
					
                  </div>
            
                  <div class="tabs-panel">

              

                  </div>
               
                </div>




			</div>
			
		</div>
    </main>
	
</body>
</html>