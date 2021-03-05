<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<!DOCTYPE html>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Shopping</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css" integrity="sha384-B0vP5xmATw1+K9KRQjQERJvTumQW0nPEzvF6L/Z6nronJ3oUOFUFpCjEUQouq2+l" crossorigin="anonymous">
    
    <link rel="stylesheet" href="<c:url value='/_00_util/allUtil/css/normalize.css'/>">
    <link rel="stylesheet" href="<c:url value='/_00_util/shoppingMallUtil/css/4_shopping_cart.css'/>">
    <link rel="stylesheet" href="<c:url value='/_00_util/shoppingMallUtil/css/2_mix.css'/>">
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/js/bootstrap.min.js" integrity="sha384-+YQ4JLhjyBLPDQt//I+STsc9iw4uQqACwlvpslubQzn4u2UU2UFM80nGisd026JF" crossorigin="anonymous"></script>
    <script src="<c:url value='/_00_util/allUtil/javascript/jquery-3.5.1.js'/>"></script>
    <script src="<c:url value='/_00_util/allUtil/javascript/jquery-ui.js'/>"></script>

    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

<link rel="stylesheet" href="<c:url value='/WEB-INF/views/_00_util/allUtil/css/reset.css'/>">
<link rel="stylesheet" href="<c:url value='/WEB-INF/views/_00_util/homeUtil/css/home.css'/>">

<link rel="stylesheet" href="<c:url value='/test/reset.css'/>">
<link rel="stylesheet" href="<c:url value='/test/header.css'/>">

</head>
<body>
	<jsp:include page="/WEB-INF/views/_00_util/allUtil/jsp/header.jsp" />

  <div class="row row-cols-1 row-cols-md-3 " style="padding:0px 100px 100px 100px">
    <div class="col mb-4">
      <div class="card h-100">
         <a href="home">
        <img	src="<c:url value='/data/images/voucher/beefNoodle.jpg'/>" class="card-img-top" alt="...">
   	  </a>  
        <div class="card-body">
          <h5 class="card-title">陳記牛肉麵 <i class="far fa-star" id="collect"></i></h5>
          <p class="card-text">This is a longer card with supporting text below as a natural lead-in to additional
            content. This content is a little bit longer.</p>
        </div>
      </div>
    </div>
    <div class="col mb-4">
      <div class="card h-100">
        <a href="home"> 
        <img	src="<c:url value='/data/images/voucher/braised dishes.jpg'/>" class="card-img-top" alt="...">
	     </a>
        <div class="card-body">
          <h5 class="card-title">家傳乾麵</h5>
          <p class="card-text">This is a short card.</p>
        </div>
      </div>
    </div>
    <div class="col mb-4">
      <div class="card h-100">
        <a href="#">
            <img	src="<c:url value='/data/images/voucher/bread.jpg'/>" class="card-img-top" alt="...">
        </a>
        <div class="card-body">
          <h5 class="card-title">阿華麵包店</h5>
          <p class="card-text">This is a longer card with supporting text below as a natural lead-in to additional
            content.</p>
        </div>
      </div>
    </div>
    <div class="col mb-4">
      <div class="card h-100">
        <a href="#">
            <img	src="<c:url value='/data/images/voucher/curryRice.jpg'/>" class="card-img-top" alt="...">
        </a>
        <div class="card-body">
          <h5 class="card-title">超級咖哩麵</h5>
          <p class="card-text">This is a longer card with supporting text below as a natural lead-in to additional
            content. This content is a little bit longer.</p>
        </div>
      </div>
    </div>
    <div class="col mb-4">
      <div class="card h-100">
        <a href="#">
            <img	src="<c:url value='/data/images/voucher/dessert.jpg'/>" class="card-img-top" alt="...">
        </a>
        <div class="card-body">
          <h5 class="card-title">豆花之家</h5>
          <p class="card-text">This is a longer card with supporting text below as a natural lead-in to additional
            content. This content is a little bit longer.</p>
        </div>
      </div>
    </div>
    <div class="col mb-4">
      <div class="card h-100">
        <a href="#">
            <img	src="<c:url value='/data/images/voucher/firedRice.jpg'/>" class="card-img-top" alt="...">
        </a>
        <div class="card-body">
          <h5 class="card-title">豪記小吃店</h5>
          <p class="card-text">This is a longer card with supporting text below as a natural lead-in to additional
            content. This content is a little bit longer.</p>
        </div>
      </div>
    </div>
    <div class="col mb-4">
      <div class="card h-100">
        <a href="#">
            <img src="<c:url value='/data/images/voucher/fruit.jpg'/>" class="card-img-top" alt="...">
        </a>
        <div class="card-body">
          <h5 class="card-title">新鮮水果</h5>
          <p class="card-text">This is a longer card with supporting text below as a natural lead-in to additional
            content. This content is a little bit longer.</p>
        </div>
      </div>
    </div>
    <div class="col mb-4">
      <div class="card h-100">
        <a href="#">
            <img	src="<c:url value='/data/images/voucher/Hot Pot1.jpg'/>" class="card-img-top" alt="...">
        </a>
        <div class="card-body">
          <h5 class="card-title">野人小火鍋</h5>
          <p class="card-text">This is a short card.</p>
        </div>
      </div>
    </div>
    <div class="col mb-4">
      <div class="card h-100">
        <a href="#">
            <img	src="<c:url value='/data/images/voucher/Hot Pot2.jpg'/>" class="card-img-top" alt="...">
        </a>
        <div class="card-body">
          <h5 class="card-title">廣記火鍋</h5>
          <p class="card-text">This is a longer card with supporting text below as a natural lead-in to additional
            content.</p>
        </div>
      </div>
    </div>
    <div class="col mb-4">
      <div class="card h-100">
        <a href="#">
            <img	src="<c:url value='/data/images/voucher/Hot Pot3.jpg'/>" class="card-img-top" alt="...">
        </a>
        <div class="card-body">
          <h5 class="card-title">台式小火鍋</h5>
          <p class="card-text">This is a longer card with supporting text below as a natural lead-in to additional
            content. This content is a little bit longer.</p>
        </div>
      </div>
    </div>
    <div class="col mb-4">
      <div class="card h-100">
        <a href="#">
            <img	src="<c:url value='/data/images/voucher/soybean pudding.jpg'/>" class="card-img-top" alt="...">
        </a>
        <div class="card-body">
          <h5 class="card-title">點點之家</h5>
          <p class="card-text">This is a longer card with supporting text below as a natural lead-in to additional
            content. This content is a little bit longer.</p>
        </div>
      </div>
    </div>
    <div class="col mb-4">
      <div class="card h-100">
        <a href="#">
            <img	src="<c:url value='/data/images/voucher/spaghetti.jpg'/>" class="card-img-top" alt="...">
        </a>
        <div class="card-body">
          <h5 class="card-title">義式義大利麵</h5>
          <p class="card-text">This is a longer card with supporting text below as a natural lead-in to additional
            content. This content is a little bit longer.</p>
        </div>
      </div>
    </div>
    <div class="col mb-4">
      <div class="card h-100">
        <a href="#"><img	src="<c:url value='/data/images/voucher/steak.jpg'/>" class="card-img-top" alt="...">
        </a>
        <div class="card-body">
          <h5 class="card-title">林記牛排</h5>
          <p class="card-text">This is a longer card with supporting text below as a natural lead-in to additional
            content. This content is a little bit longer.</p>
        </div>
      </div>
    </div>
    <div class="col mb-4">
      <div class="card h-100">
        <a href="#"><img	src="<c:url value='/data/images/voucher/streetFood1.jpg'/>" class="card-img-top" alt="...">
        </a>
        <div class="card-body">
          <h5 class="card-title">王記小吃店</h5>
          <p class="card-text">This is a longer card with supporting text below as a natural lead-in to additional
            content.</p>
        </div>
      </div>
    </div>
    <div class="col mb-4">
      <div class="card h-100">
        <a href="#"><img	src="<c:url value='/data/images/voucher/Taiwanese hamburger.jpg'/>" class="card-img-top" alt="..."></a>
          <div class="card-body">
            <h5 class="card-title">刈包</h5>
            <p class="card-text">This is a longer card with supporting text below as a natural lead-in to additional
              content. This content is a little bit longer.</p>
          </div>
      </div>
    </div>
    <div class="col mb-4">
      <div class="card h-100">
        <a href="#"><img src="<c:url value='/data/images/voucher/Tear-N-Eat Scallion Pancake.jpg'/>" class="card-img-top" alt="..."></a> 
          <div class="card-body">
            <h5 class="card-title">蔥抓餅</h5>
            <p class="card-text">This is a longer card with supporting text below as a natural lead-in to additional
              content. This content is a little bit longer.</p>
          </div>
      </div>
    </div>
    <div class="col mb-4">
      <div class="card h-100">
        <a href="#"><img	src="<c:url value='/data/images/voucher/Vermicelli .jpg'/>" class="card-img-top" alt="...">
        </a>
        <div class="card-body">
          <h5 class="card-title">蚵仔麵線</h5>
          <p class="card-text">This is a longer card with supporting text below as a natural lead-in to additional
            content. This content is a little bit longer.</p>
        </div>
      </div>
    </div>
    <div class="col mb-4">
      <div class="card h-100">
        <a href="#"><img	src="<c:url value='/data/images/voucher/wheel pies.jpg'/>" class="card-img-top" alt="...">
        </a>
        <div class="card-body">
          <h5 class="card-title">車輪餅</h5>
          <p class="card-text">This is a short card.</p>
        </div>
      </div>
    </div>
    <div class="col mb-4">
      <div class="card h-100">
        <a href="#"><img	src="<c:url value='/data/images/voucher/yamiRice.jpg'/>" class="card-img-top" alt="...">
        </a>
        <div class="card-body">
          <h5 class="card-title">Yami Rice</h5>
          <p class="card-text">This is a longer card with supporting text below as a natural lead-in to additional
            content.</p>
        </div>
      </div>
    </div>
    <div class="col mb-4">
      <div class="card h-100">
        <a href="#"><img	src="<c:url value='/data/images/voucher/dessert.jpg'/>" class="card-img-top" alt="...">
        </a>
        <div class="card-body">
          <h5 class="card-title">甜點</h5>
          <p class="card-text">This is a longer card with supporting text below as a natural lead-in to additional
            content. This content is a little bit longer.</p>
        </div>
      </div>
    </div>
    <div class="col mb-4">
      <div class="card h-100">
        <a href="#"><img	src="<c:url value='/data/images/voucher/Vermicelli2.jpg'/>" class="card-img-top" alt="...">
        </a>
        <div class="card-body">
          <h5 class="card-title">蚵仔大腸麵線</h5>
          <p class="card-text">This is a longer card with supporting text below as a natural lead-in to additional
            content. This content is a little bit longer.</p>
        </div>
      </div>
    </div>
    <div class="col mb-4">
      <div class="card h-100">
        <a href="#"><img	src="<c:url value='/data/images/voucher/lunch_box.webp.jpg'/>" class="card-img-top" alt="...">
        </a>
        <div class="card-body">
          <h5 class="card-title">lunch_box</h5>
          <p class="card-text">This is a longer card with supporting text below as a natural lead-in to additional
            content. This content is a little bit longer.</p>
        </div>
      </div>
    </div>
    <div class="col mb-4">
      <div class="card h-100">
        <a href="#"><img	src="<c:url value='/data/images/voucher/Drinks1.webp.jpg'/>" class="card-img-top" alt="...">
        </a>
        <div class="card-body">
          <h5 class="card-title">Card title</h5>
          <p class="card-text">This is a longer card with supporting text below as a natural lead-in to additional
            content. This content is a little bit longer.</p>
        </div>
      </div>
    </div>
    <div class="col mb-4">
      <div class="card h-100">
        <a href="#"><img	src="<c:url value='/data/images/voucher/Good Day.webp.jpg'/>" class="card-img-top" alt="...">
        </a>
        <div class="card-body">
          <h5 class="card-title">Good Day</h5>
          <p class="card-text">This is a longer card with supporting text below as a natural lead-in to additional
            content. This content is a little bit longer.</p>
        </div>
      </div>
    </div>
    <div class="col mb-4">
      <div class="card h-100">
        <a href="#"><img	src="<c:url value='/data/images/voucher/Like17.webp.jpg'/>" class="card-img-top" alt="...">
        </a>
        <div class="card-body">
          <h5 class="card-title">Like Tea</h5>
          <p class="card-text">This is a longer card with supporting text below as a natural lead-in to additional
            content. This content is a little bit longer.</p>
        </div>
      </div>
    </div>
    <div class="col mb-4">
      <div class="card h-100">
        <a href="#"><img	src="<c:url value='/data/images/voucher/日式紅豆餅.webp.jpg'/>" class="card-img-top" alt="...">
        </a>
        <div class="card-body">
          <h5 class="card-title">日式紅豆餅</h5>
          <p class="card-text">This is a longer card with supporting text below as a natural lead-in to additional
            content. This content is a little bit longer.</p>
        </div>
      </div>
    </div>
    <div class="col mb-4">
      <div class="card h-100">
        <a href="#"><img	src="<c:url value='/data/images/voucher/王記港式燒臘店.webp.jpg'/>" class="card-img-top" alt="...">
        </a>
        <div class="card-body">
          <h5 class="card-title">王記港式燒臘店</h5>
          <p class="card-text">This is a longer card with supporting text below as a natural lead-in to additional
            content. This content is a little bit longer.</p>
        </div>
      </div>
    </div>
    <div class="col mb-4">
      <div class="card h-100">
        <a href="#"><img	src="<c:url value='/data/images/voucher/阿火牛肉麵.webp.jpg'/>" class="card-img-top" alt="...">
        </a>
        <div class="card-body">
          <h5 class="card-title">阿火牛肉麵</h5>
          <p class="card-text">This is a longer card with supporting text below as a natural lead-in to additional
            content. This content is a little bit longer.</p>
        </div>
      </div>
    </div>
    <div class="col mb-4">
      <div class="card h-100">
        <a href="#"><img	src="<c:url value='/data/images/voucher/美式炸雞店.webp.jpg'/>" class="card-img-top" alt="...">
        </a>
        <div class="card-body">
          <h5 class="card-title">美式炸雞店</h5>
          <p class="card-text">This is a longer card with supporting text below as a natural lead-in to additional
            content. This content is a little bit longer.</p>
        </div>
      </div>
    </div>
    <div class="col mb-4">
      <div class="card h-100">
        <a href="#"><img	src="<c:url value='/data/images/voucher/家鄉味越南美食.webp.jpg'/>" class="card-img-top" alt="...">
        </a>
        <div class="card-body">
          <h5 class="card-title">家鄉味越南美食</h5>
          <p class="card-text">This is a longer card with supporting text below as a natural lead-in to additional
            content. This content is a little bit longer.</p>
        </div>
      </div>
    </div>
    <div class="col mb-4">
      <div class="card h-100">
        <a href="#"><img	src="<c:url value='/data/images/voucher/陳媽媽炒手.webp.jpg'/>" class="card-img-top" alt="...">
        </a>
        <div class="card-body">
          <h5 class="card-title">陳媽媽炒手</h5>
          <p class="card-text">This is a longer card with supporting text below as a natural lead-in to additional
            content. This content is a little bit longer.</p>
        </div>
      </div>
    </div>
    <div class="col mb-4">
      <div class="card h-100">
        <a href="#"><img	src="<c:url value='/data/images/voucher/開心壽司店.webp.jpg'/>" class="card-img-top" alt="...">
        </a>
        <div class="card-body">
          <h5 class="card-title">開心壽司店</h5>
          <p class="card-text">This is a longer card with supporting text below as a natural lead-in to additional
            content. This content is a little bit longer.</p>
        </div>
      </div>
    </div>
    <div class="col mb-4">
      <div class="card h-100">
        <a href="#"><img	src="<c:url value='/data/images/voucher/煎餅菓子.webp.jpg'/>" class="card-img-top" alt="...">
        </a>
        <div class="card-body">
          <h5 class="card-title">煎餅菓子</h5>
          <p class="card-text">This is a longer card with supporting text below as a natural lead-in to additional
            content. This content is a little bit longer.</p>
        </div>
      </div>
    </div>
    <div class="col mb-4">
      <div class="card h-100">
        <a href="#"><img	src="<c:url value='/data/images/voucher/義大利麵.webp.jpg'/>" class="card-img-top" alt="...">
        </a>
        <div class="card-body">
          <h5 class="card-title">義大利麵</h5>
          <p class="card-text">This is a longer card with supporting text below as a natural lead-in to additional
            content. This content is a little bit longer.</p>
        </div>
      </div>
    </div>
    <div class="col mb-4">
      <div class="card h-100">
        <a href="#"><img	src="<c:url value='/data/images/voucher/燒肉丼 七號店.webp.jpg'/>" class="card-img-top" alt="...">
        </a>
        <div class="card-body">
          <h5 class="card-title">燒肉丼 七號店</h5>
          <p class="card-text">This is a longer card with supporting text below as a natural lead-in to additional
            content. This content is a little bit longer.</p>
        </div>
      </div>
    </div>
    <div class="col mb-4">
      <div class="card h-100">
        <a href="#"><img	src="<c:url value='/data/images/voucher/隨意小吃.webp.jpg'/>" class="card-img-top" alt="...">
        </a>
        <div class="card-body">
          <h5 class="card-title">隨意小吃</h5>
          <p class="card-text">This is a longer card with supporting text below as a natural lead-in to additional
            content. This content is a little bit longer.</p>
        </div>
      </div>
    </div>
    <div class="col mb-4">
      <div class="card h-100">
                  
        <a href="#"><img	src="<c:url value='/data/images/voucher/鐵板吐司.webp.jpg'/>" class="card-img-top" alt="...">
        </a>
        <div class="card-body">
          <h5 class="card-title">鐵板吐司</h5>
          <p class="card-text">This is a longer card with supporting text below as a natural lead-in to additional
            content. This content is a little bit longer.</p>
        </div>
      </div>
    </div>

  </div>


  <!-- <div>
				<span style="font-size:30px; ">熱門小吃</span>

				<hr>
			</div>
			<div id="footer-shop">
				<div id="footer-shop-content">
					<ul>
						<li><a href=""><img class="voucher" src="Taiwan_streetFood/Chicken Fillet.jpg"></a>
							<div class=" image-section">
								<div class="voucher-name">
									豪大雞排
									<hr>
								</div>
								<div class="discount">
									10%off

								</div>
							</div>
						</li>
						<li><a href=""><img class="voucher" src="Taiwan_streetFood/Bubble tea.jpg"></a>
							<div class=" image-section">
								<div class="voucher-name">
									珍珠奶茶
									<hr>
								</div>
								<div class="discount">
									30%off

								</div>
							</div>
						</li>
						<li><a href=""><img class="voucher" src="Taiwan_streetFood/Oyster Omelet.jpg"></a>
							<div class=" image-section">
								<div class="voucher-name">
									蚵仔煎
									<hr>
								</div>
								<div class="discount">
									10%off

								</div>
							</div>
						</li>
						<li><a href=""><img class="voucher" src="Taiwan_streetFood/Oyster vermicelli.jpg"></a>
							<div class=" image-section">
								<div class="voucher-name">
									蚵仔麵線
									<hr>
								</div>
								<div class="discount">
									40%off

								</div>
							</div>
						</li>
						<li><a href=""><img class="voucher" src="Taiwan_streetFood/Sweet potato balls.jpg"></a>
							<div class=" image-section">
								<div class="voucher-name">
									嫩Q地瓜球
									<hr>
								</div>
								<div class="discount">
									10%off

								</div>
							</div>
						</li>
						<li><a href=""><img class="voucher" src="Taiwan_streetFood/steak.jpg"></a>
							<div class=" image-section">
								<div class="voucher-name">
									招牌牛排
									<hr>
								</div>
								<div class="discount">
									30%off

								</div>
							</div>
						</li>
						<li><a href=""><img class="voucher" src="Taiwan_streetFood/Stinky Tofu.jpg"></a>
							<div class=" image-section">
								<div class="voucher-name">
									港式臭豆腐
									<hr>
								</div>
								<div class="discount">
									30%off

								</div>
							</div>
						</li>
						<li><a href=""><img class="voucher" src="Taiwan_streetFood/soybean pudding.jpg"></a>
							<div class=" image-section">
								<div class="voucher-name">
									豆花
									<hr>
								</div>
								<div class="discount">
									10%off

								</div>
							</div>
						</li>
					</ul>
				</div>
			</div>
		</div> -->









  <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"
    integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous">
  </script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/js/bootstrap.bundle.min.js"
    integrity="sha384-Piv4xVNRyMGpqkS2by6br4gNJ7DXjqk09RmUpJ8jgGtD7zP9yug3goQfGII0yAns" crossorigin="anonymous">
  </script>
  <script > 
  const using = document.getElementById('using');
  using.addEventListener('click', function (e) {
      Swal.fire({
          title: '確定要使用優惠劵嗎?',
          text: "",
          icon: 'warning',
          showCancelButton: true,
          confirmButtonColor: '#3085d6',
          cancelButtonColor: '#d33',
          confirmButtonText: '確定兌換',
          cancelButtonText: '取消'
      }).then((result) => {
          if (result.isConfirmed) {
              Swal.fire(
                  '兌換成功!',
                  '',
                  'success'
              )
          }
      })
  });
  const collect = document.getElementById('collect');
  collect.addEventListener('click', function (e) {
      Swal.fire({
          position: 'top-end',
          icon: 'success',
          title: '成功收藏優惠卷',
          showConfirmButton: false,
          timer: 1500
      })
  });
});
  </script>

</body>

</html>


<!-- 僅供學術研究使用 如有侵權煩請告知 E-mail: a830425tw@gmail.com -->
<!-- 僅供學術研究使用 如有侵權煩請告知 E-mail: a830425tw@gmail.com -->
<!-- 僅供學術研究使用 如有侵權煩請告知 E-mail: a830425tw@gmail.com -->