<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>公館夜市(師大夜市)</title>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.2/css/all.min.css">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css"
	integrity="sha384-B0vP5xmATw1+K9KRQjQERJvTumQW0nPEzvF6L/Z6nronJ3oUOFUFpCjEUQouq2+l"
	crossorigin="anonymous">
<link rel="stylesheet"
	href="<c:url value='/_00_util/allUtil/css/normalize.css'/>">
<link rel="stylesheet"
	href="<c:url value='/_00_util/allUtil/css/background.css'/>">
<!-----------------------------------slick 套件引用--------------------------------- -->
    <link rel="stylesheet" href="<c:url value='/_00_util/allUtil/css/slick.css'/>"/>
<!-- 		sAdd the new slick-theme.css if you want the default styling -->
    <link rel="stylesheet" href="<c:url value='_00_util/allUtil/css/slick-theme.css'/>"/>
<!-----------------------------------slick 套件引用--------------------------------- -->
<link rel="stylesheet"
	href="<c:url value='/_00_util/nightShopUtil/css/1_shop1.css'/>" />
	
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
<!--     <script type="text/javascript" src="js/slick_jquery1.11.0.min.js"></script> -->
<!--     <script type="text/javascript" src="js/slick_jq_migrate1.2.1.min.js"></script> -->
<!--     <script type="text/javascript" src="slick/slick.js"></script> -->
<style>
.box {
/* 	border: 1px solid #cccccc; */
	width: 720px;
	height: 500px;
	background-color: #FFFFFF;
	padding: 5px;
	overflow: auto;
}
div.card{
/* 	box-shadow: 1px 1px 3px 1px #ccc; */
}
.card-body{
	padding: 5px;
    text-align: center;
}
.shopImage{
	height: 130px;
	width:100%;
}

.shopArea{
    margin-left: 20px;
}
</style>

</head>
<body>

	<jsp:include page="/WEB-INF/views/_00_util/allUtil/jsp/header.jsp" />
	
	<h1></h1>
	<!-- slider -->
	<div id="carouselExampleIndicators" class="carousel slide"
		data-ride="carousel">
		<ol class="carousel-indicators">
			<li data-target="#carouselExampleIndicators" data-slide-to="0"
				class="active"></li>
			<li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
			<li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
		</ol>
		<div class="carousel-inner">
			<div class="carousel-item active">
				<img src="<c:url value='/data/images/Night_Market/公館/公館1.jpeg'/>"
					class="d-block w-100" alt="...">
			</div>
			<div class="carousel-item">
				<img src="<c:url value='/data/images/Night_Market/公館/公館2.jpeg'/>"
					class="d-block w-100" alt="...">
			</div>
			<div class="carousel-item">
				<img src="<c:url value='/data/images/Night_Market/公館/公館3.jpeg'/>"
					class="d-block w-100" alt="...">
			</div>
		</div>
		<a class="carousel-control-prev" href="#carouselExampleIndicators"
			role="button" data-slide="prev"> <span
			class="carousel-control-prev-icon" aria-hidden="true"></span> <span
			class="sr-only">Previous</span>
		</a> <a class="carousel-control-next" href="#carouselExampleIndicators"
			role="button" data-slide="next"> <span
			class="carousel-control-next-icon" aria-hidden="true"></span> <span
			class="sr-only">Next</span>
		</a>
	</div>


	<div id="secondContainer" class="container">
		<div class="row">
			<!-- Left -->
			<div id="sectionLeft" class="col-8">
				<!-- 商家簡介 -->
				<div id="shopInfo">
					<h1 style="color: #f26419;">公館夜市(師大夜市)</h1>
					<!-----------------------------------評分數開始---------------------------------- -->
					<div>
						<div class="ratings">
							<div class="empty-stars"></div>

							<div class="full-stars" style="width: ${nightMarketBean.market_score * 20}%; "></div>
						</div>
					</div>
					<!-----------------------------------評分數結束---------------------------------- -->
					<p style="color: #78886f;margin-top:10px;">師大夜市也稱為師大夜市商圈，是一個位於台北市大安區的知名商圈，由於地點就在臺北市臺灣師範大學旁的區域範圍而得名，主要範圍為師大路、龍泉街及和平東路一段之間所涵蓋的區域，大約在1990年代興起，初期僅為簡易的社區商圈，隨後擴大成師大夜市商圈，近年來爭議不少的師大夜市商圈歷經多次轉型，雖曾經被列為重要觀光商圈，但是轉型與店租等問題，讓商圈的人潮與觀光價值一直改變，目前以文化形商圈的方向邁進，以與傳統的夜市商圈做出明顯的區別，師大商圈附近還有永康商圈及公館夜市。</p>
					
				</div>
				<!-- 商家簡介 -->

				<!-- 商家優惠券 -->
				<div class="mt-5 mb-4">
						<h2>
							<i class="fas fa-store"></i>&nbsp;推薦商家
						</h2>
					</div>
				
<!-- 				<div class="box"> -->



				<div class=" shopArea">

					<c:forEach var="shop" varStatus="stat" items="${shops}">
						<div class="card shadow p-3 mb-5 bg-white rounded"
							style="width: 250px; margin: 20px">
							<a
								href="<c:url value='/_50_shop/_54_showShops/ShowShops/${shop.shop_id}' />">
								<img
								src="<c:url value='/_50_shop/_53_shopRegister/getPicture/${shop.shop_id}'/>"
								class="card-img-top shopImage" alt="...">
							</a>
							<div class="card-body shadow-sm bg-white rounded">
								<p class="card-text">${shop.shop_name}</p>
							</div>
						</div>

					</c:forEach>



				</div>

				<!-- 				</div> -->



				<!-- 商家優惠券 -->

				<div style="margin-top: 20px;">
				<div class="mt-5">
						<h2>
							<i class="fas fa-parking"></i>&nbsp;周遭停車場
						</h2>
					</div>
					<p>順康尊賢平面停車場（$40 / 小時），距離 133公尺。</p>
				</div>
				
				<div style="margin-top: 20px;">
				<div class="mt-5">
						<h2>
							<i class="fas fa-subway"></i>&nbsp;鄰近捷運站
						</h2>
					</div>
					<div style="display:flex;">
					<div style="display:flex;padding:10px;border:1px solid #ccc;width:180px;">
					<div style="background-color:green;padding:10px;font:20px;font-weight:bold;color:white;">松山新店線</div><div style="padding:10px;font:20px;">公館</div>
					</div>
					
					</div>
				</div>



				<!-- 留言區 -->
				<div id="comment">
					<div class="mt-5">
						<h2>
							<i class="fas fa-comments"></i>&nbsp;立即評價
						</h2>
					</div>
					<div class="container pb-4 my-5 border-bottom">
						<div class="row" id="flexbox1">

							<div class="col-12">
								<div>
									您尚未登入，將以訪客身分留言，亦可<span>登入</span>留言
								</div>
								<div class="row py-2">
									<div class="col-3">給商家們個評價吧~~</div>
									<div id="score" class="col-3">
										<i class="far fa-thumbs-up"></i> <i class="far fa-thumbs-up"></i>
										<i class="far fa-thumbs-up"></i> <i class="far fa-thumbs-up"></i>
										<i class="far fa-thumbs-up"></i>
									</div>
								</div>
							</div>

							<div class="col-12 flexitem" id="flex-item-1">
								<input type="text" class="form-control" placeholder="您的暱稱...."
									aria-label="Username" aria-describedby="basic-addon1">
							</div>

							<div class="col-12 flexitem" id="flex-item-2">
								<textarea class="form-control" aria-label="With textarea"
									placeholder="留個言吧..."></textarea>
							</div>

							<div class="col-12 flexitem" id="flex-item-3">
								<button type="button" class="btn btn-secondary btn-sm btn-block">送出留言</button>
							</div>

						</div>

					</div>
				</div>

				<!-- 留言內容 -->
				<div class="commentBox">

					<div class="memberInfo">
						<div class="putLeft">
							<div class="memberImage">

								<img src="<c:url value='/data/images/mediumPic/noPeople.png'/>">
							</div>
							<span class="memberId">vickychen0087</span> <span
								class="nickname">Vicky</span>
							<div class="comment_score">
								<i class="far fa-thumbs-up"></i> <i class="far fa-thumbs-up"></i>
								<i class="far fa-thumbs-up"></i> <i class="far fa-thumbs-up"></i>
								<i class="far fa-thumbs-up"></i>
							</div>
						</div>

						<!-- 點擊會出現檢舉或編輯的下拉選單 -->
						<div class="doMore">
							<i class="fas fa-ellipsis-v"></i>
							<!-- 分開管理css 與 jq 的 class屬性值 -->
							<!-- <ul class="dropdownList jq-dropdown">
                                <li>編輯</li>
                                <li>檢舉</li>
                            </ul> -->
						</div>
					</div>

					<div class="comment_content">
						<span>好吃</span>
					</div>

				</div>
				<div class="commentBox">

					<div class="memberInfo">
						<div class="putLeft">
							<div class="memberImage">
								<img src="<c:url value='/data/images/mediumPic/noPeople.png'/>">
							</div>
							<span class="memberId">vickychen0087</span> <span
								class="nickname">Vicky</span>
							<div class="comment_score">
								<i class="far fa-thumbs-up"></i> <i class="far fa-thumbs-up"></i>
								<i class="far fa-thumbs-up"></i> <i class="far fa-thumbs-up"></i>
								<i class="far fa-thumbs-up"></i>
							</div>
						</div>

						<!-- 點擊會出現檢舉或編輯的下拉選單 -->
						<div class="doMore">
							<i class="fas fa-ellipsis-v"></i>
							<!-- 分開管理css 與 jq 的 class屬性值 -->
							<!-- <ul class="dropdownList jq-dropdown">
                                <li>編輯</li>
                                <li>檢舉</li>
                            </ul> -->
						</div>
					</div>

					<div class="comment_content">
						<span>搭配優惠券真的省很多</span>
					</div>

				</div>

				<!-- 留言區 -->

			</div>
			<!-- End:Left -->
			<!-- Right -->
			<div id="RightBorder" class="col-4">
				<div id="shopPhone">
					<div class="item">
						<div class="item-left">
							<i class="fas fa-phone-alt"></i>
						</div>
						<div class="item-right">02-2873-6580</div>
					</div>
					<div class="item">
						<div class="item-left">
							<i class="fab fa-chrome"></i>
						</div>
						<div class="item-right">
						<a href="https://tw.tripperway.com/ta.php?s=%E5%B8%AB%E5%A4%A7%E5%A4%9C%E5%B8%82">TripperWay</a>
						</div>
					</div>
					<div class="item">
						<div class="item-left">
							<i class="fas fa-clock"></i>
						</div>
						<div class="item-right">
							星期日	08:00 - 22:00<br>
							星期一	08:00 - 22:00<br>
							星期二	08:00 - 22:00<br>
							星期三	08:00 - 22:00<br>
							星期四	08:00 - 22:00<br>
							星期五	08:00 - 22:00<br>
							星期六	08:00 - 22:00
						</div>
					</div>
					<div class="item">
						<div class="item-left">
							<i class="fas fa-map"></i>
						</div>
						<div class="item-right">
							<a href="#">位置資訊</a>
						</div>
					</div>
					<div class="item">
						<iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3615.6006682147026!2d121.53250701487913!3d25.013681683981876!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x3442ac1555555555%3A0xf07cd33759fa01c1!2z5Y-w5YyX5YWs6aSo5aSc5biC!5e0!3m2!1szh-TW!2stw!4v1615867140033!5m2!1szh-TW!2stw" width="330" height="300" style="border:0;margin-top:15px;" allowfullscreen="" loading="lazy"></iframe>
					</div>
					<div class="item">
						<div class="item-left">
							<i class="fas fa-cloud"></i>
						</div>
						<div class="item-right">
							<a href="#">天氣</a>
						</div>
					</div>
					<div class="item" style="border:1px solid #ccc">
						<div id="feedback" style="line-height:50px;margin-left:20px;">
							
						</div>
						<div id="icon" style="margin-left:20px;">
							<img id="wicon" src="" alt="Weather icon">
						</div>
					</div>
				</div>
			</div>
			<!-- End:Right -->
		</div>

	</div>
	
	<!--------------------------------slick 套件------------------------------- -->
	 <script type="text/javascript" src="<c:url value='/_00_util/allUtil/javascript/slick_jquery1.11.0.min.js'/>"></script>
    <script type="text/javascript" src="<c:url value='/_00_util/allUtil/javascript/slick_jq_migrate1.2.1.min.js'/>"></script>
    <script type="text/javascript" src="<c:url value='/_00_util/allUtil/javascript/slick.min.js'/>"></script>
	<!--------------------------------slick 套件------------------------------- -->
	
	
	<script>
	function doFirst(){
		

		//slick
		  $('.shopArea').slick({
			  slidesToShow: 3,
			  slidesToScroll: 1,
			  autoplay: true,
			  autoplaySpeed: 2000,
		});
		
	    feedback = document.getElementById('feedback');
	    wicon = document.getElementById('wicon');
	    xhr = new XMLHttpRequest();
	        

	        xhr.addEventListener('readystatechange',function(){
	            if(xhr.readyState == 4){
	                if(xhr.status == 200){
	                   
	                    let jsonData = xhr.responseText;
	                    jsonData = JSON.parse(jsonData);
	                    console.log(jsonData);
	                 
	                 
	                    var iconcode = jsonData.weather[0].icon;
	                    var iconurl = "http://openweathermap.org/img/w/" + iconcode + ".png";
	                    wicon.src = iconurl;
	        
	                    var temperature = jsonData.main.temp;
	                    temperature = Math.round((temperature-273.15) * 10) / 10
	                    feedback.innerText = '現在溫度: ' + temperature + '°C';
	        
	                }
	        
	            }

	        });

	        let url = 'http://api.openweathermap.org/data/2.5/weather?q=%E5%8F%B0%E5%8C%97%E5%B8%82,%E5%A4%A7%E5%AE%89%E5%8D%80&appid=33c026cdcd1198f1baef9244b4f9494e';
	        xhr.open('GET', url, true);  //true:非同步｜fasle:同步
	        xhr.send();




	  
	
	
	}
	
	window.addEventListener('load', doFirst);
	</script>



</body>
</html>