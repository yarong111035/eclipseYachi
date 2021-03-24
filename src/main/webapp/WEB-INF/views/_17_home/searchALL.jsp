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
				<a href="#">依夜市</a>
				<a href="#">依優惠券</a>
				<a href="#" class="change">依商城商品</a>
				<a href="#">依商品類型</a>
				<a href="#">依商家</a>
				<a href="#">依商家類型</a>
			</div>
			
			<div class="tabs-content">

				<div class="tabs-content">

                    <!-- 先讓第一個內容顯示出來 display:block -->
                  <div class="tabs-panel" > 
					
					<div class="keyword">
						<form action="<c:url value="/search/night"/>" class="keyword-form">
							<a>搜尋夜市</a>
							<input type="text" name="market_name" id="">
							<input type="submit" value="搜尋">
						</form>
						
						<c:if test="${keyword != '?' }">
								
							<p>你所搜尋的&nbsp;<span style="color: red;">${keyword}</span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							總共有&nbsp;<span style="color: red;">${list.size()}</span>&nbsp;筆資料</p>
						
						</c:if>
						
					</div>

					<div class="findNight">

						<img class="findNight-item" src="https://picsum.photos/500/300">


						<h2 class="findNight-item">士林夜市</h2>
						<p class="findNight-item">士林夜市，位於臺灣臺北市士林區。範圍以市定古蹟士林公有市場為中心，東至文林路、西至基河路、北至小北街與小西街的三角地帶，是台北市內最大、亦是全台打卡次數最高的夜市地標。曾多次獲選為台灣代表夜市、觀光客來台必去景點首選，揚名國際。</p>
						<p class="findNight-item">Google評價分數 3.9</p>
						<a href="#" class="findNight-item">更多介紹 ...</a>

					</div>

                  </div>
               
                  <div class="tabs-panel">
					<div class="keyword" >
						<form action="" class="keyword-form">
							<a>搜尋優惠券</a>
							<input type="text" name="" id="">
							<input type="submit" value="搜尋">
						</form>
						<p>你所搜尋的XX關鍵字&nbsp;&nbsp;&nbsp;&nbsp;總共XX筆資料</p>
					</div>
					<div class="coupon">
						<!-- <a>中的連結為大圖的url位置，img的src為小縮圖的 url位置 -->
						<a data-fancybox="gallery" href="<c:url value='/data/images/coupon_01.jpg'/>"><img src="<c:url value='/data/images/coupon_01.jpg'/>"></a>
						
						<div class="coupon-info">

							<div class="name">
								<h4>優惠券名稱：</h4> 
								<h4>1111鐵板麵折價卷</h4>								
							</div>
							<div class="begin">
								<h4>開始日期：</h4> 
								<h4>2020-11-11</h4>	
							</div>
							<div class="end">
								<h4>結束日期：</h4> 
								<h4>2020-11-13</h4>	
							</div>
							<div class="rule">
								<h4>使用規則：</h4> 
								<h4>限定單人使用</h4>
							</div>
							<div class="amount">
								<h4>剩餘張數：</h4> 
								<h4>10</h4>
							</div>

							<div class="owner">

								<h4>所屬的商家名稱：</h4> 
								<h4>你家牛排</h4>

							</div>
						</div>
					</div>

					<div class="coupon">
						<a data-fancybox="gallery" href="<c:url value='/data/images/coupon_01.jpg'/>"><img src="<c:url value='/data/images/coupon_01.jpg'/>"></a>						
						
					</div>


                  </div>
               
                  <div class="tabs-panel" style="display:block">
					<div class="product-price">
					
						<c:if test="${keyword != '?' }">
							<a href="<c:url value='/search/product/low/${keyword}'/>"><input type="button" value="價格低"></a>
							<a href="<c:url value='/search/product/high/${keyword}'/>"><input type="button" value="價格高"></a>
	
							<form action="<c:url value='/search/product/range/${keyword}'/>" >
								<a>搜尋價格</a>
								<input type="number" name="lowPrice" id="" placeholder="最低價" min="1">
								<a>～</a>
								<input type="number" name="highPrice" id="" placeholder="最高價" min="1">
								<input type="submit" value="確認" class="search-submit" id="search-price">
							</form>
						</c:if>
						
						<a href="<c:url value="/search/ALLproducts"/>" style="margin-left: -20px;"><input type="button" value="顯示商城全部的商品"></a>
					</div>

					<div class="keyword">
					
						<c:if test="${keyword == '?' }">								
							<p style="white-space: pre;">你沒有輸入關鍵字哦    !</p>						
						</c:if>
						
						<c:if test="${keyword != '?' }">								
							<p>你所搜尋的&nbsp;<span style="color: red;">${keyword}</span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							總共有&nbsp;<span style="color: red;">${list.size()}</span>&nbsp;筆資料</p>						
						</c:if>
						
					</div>

					<div class="product-container">

						<c:if test="${keyword != '?' }">
							<c:forEach var="productBean" items="${list}">
								<div class="product">
		
									<a data-fancybox="gallery" href="<c:url value='/searchProductPicture/${productBean.product_id}'/>">
								    <img src="<c:url value='/searchProductPicture/${productBean.product_id}'/>"></a>
		
									<div class="name">${productBean.product_name}</div>
									<div class="info">${productBean.product_spec}</div>
									<div class="price">$&nbsp;${productBean.product_price}</div>
									<div class="release">發售日&nbsp;&nbsp;${productBean.product_release}</div>
								</div>
							</c:forEach>
						</c:if>
						
					</div>
                  </div>
               

                  <div class="tabs-panel">
                
					<div id="product-type">
						<a href="#" class="change">零食</a>
						<a href="#">玩具</a>
						<a href="#">文具</a>
						<a href="#">折價券</a>
						<a href="#">衣服</a>
						<a href="#">文創商品</a>
						<a href="#">雜貨</a>
						<a href="#">飲料</a>
						<a href="#">食品</a>
					</div>

					<div class="type-content">
						
						<div class="type-panel" style="display:block">
							測試1
						</div>
						<div class="type-panel">測試2</div>
						<div class="type-panel">測試3</div>
						<div class="type-panel">測試4</div>
						<div class="type-panel">測試5</div>
						<div class="type-panel">測試6</div>
						<div class="type-panel">測試7</div>
						<div class="type-panel">測試8</div>
						<div class="type-panel">測試9</div>

					</div>

                  </div>
               
                  <div class="tabs-panel">
					<div class="keyword">
						<form action="" class="keyword-form">
							<a>搜尋夜市</a>
							<input type="text" name="" id="">
							<input type="submit" value="搜尋">
						</form>
						
						<p>你所搜尋的&nbsp;<span style="color: red;">${keyword}</span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						總共有&nbsp;<span style="color: red;">${list.size()}</span>&nbsp;筆資料</p>
						
					</div>
                	依商家
                  </div>
            
                  <div class="tabs-panel">

                    <div id="shop-type">
						<a href="#" class="change">中式料理</a>
						<a href="#">西式料理</a>
						<a href="#">日式料理</a>
						<a href="#">飲料</a>
						<a href="#">衣服</a>
						<a href="#">飾品</a>
						<a href="#">手機周邊</a>
						<a href="#">日常生活用品</a>
						<a href="#">遊戲</a>
					</div>	

					<div class="shoptype-content">
						
						<div class="shoptype-panel" style="display:block">
							測試1
						</div>
						<div class="shoptype-panel">測試2</div>
						<div class="shoptype-panel">測試3</div>
						<div class="shoptype-panel">測試4</div>
						<div class="shoptype-panel">測試5</div>
						<div class="shoptype-panel">測試6</div>
						<div class="shoptype-panel">測試7</div>
						<div class="shoptype-panel">測試8</div>
						<div class="shoptype-panel">測試9</div>

					</div>
                  </div>
               
                </div>




			</div>
			
		</div>
    </main>
	
</body>
</html>