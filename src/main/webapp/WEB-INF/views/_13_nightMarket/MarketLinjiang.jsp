<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>臨江街觀光夜市</title>
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
<!--     <link rel="stylesheet" href="slick/slick.css"/> -->
<!-- 		Add the new slick-theme.css if you want the default styling -->
<!--     <link rel="stylesheet" href="slick/slick-theme.css"/> -->
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
	border: 1px solid #cccccc;
	width: 720px;
	height: 500px;
	background-color: #FFFFFF;
	padding: 5px;
	overflow: auto;
}
div.card{
	box-shadow: 1px 1px 3px 1px #ccc;
}

.shopImage{
	height: 165px;
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
				<img src="<c:url value='/data/images/Night_Market/臨江/臨江1.jpeg'/>"
					class="d-block w-100" alt="...">
			</div>
			<div class="carousel-item">
				<img src="<c:url value='/data/images/Night_Market/臨江/臨江2.jpg'/>"
					class="d-block w-100" alt="...">
			</div>
			<div class="carousel-item">
				<img src="<c:url value='/data/images/Night_Market/臨江/臨江3.jpg'/>"
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
					<h1 style="color: #f26419;">臨江街觀光夜市</h1>
					<div>
						<i class="fas fa-star"></i> <i class="fas fa-star"></i> <i
							class="fas fa-star"></i> <i class="fas fa-star"></i> <i
							class="fas fa-star"></i>
					</div>
					<p style="color: #78886f;margin-top:10px;">具有客家文化的臨江街夜市，在大安區的住宅區裡，是臺北市少數合法掛牌設立的夜市，約有8年的歷史，近200個攤位的各種美食小吃，讓許多臺北人流連忘返，附近上班族幾乎天天在這裡吃晚飯，既省錢又美味。</p>
					<p style="color: #78886f;">有名的小吃多到數不清，古早味的乾伴麵加肉羹湯、香滑順口的蚵仔麵線、好吃的臺式蚵仔煎、香噴噴的烤香腸、入味不油的狀元滷味、灑了滿滿花生粉的豬血糕、石家刈包香香軟軟的魯肉、清香好喝的米粉湯、小朋友最愛的雞蛋糕等等，各式美食應有盡有 ，就這麼邊逛邊吃，真是太滿足了！沿著文昌街走下去，還有流行時尚的中、西式家具店，各式新穎獨特的造型，也是快活。</p>
				</div>
				<!-- 商家簡介 -->

				<!-- 商家優惠券 -->
				<div class="mt-5 mb-4">
						<h2>
							<i class="fas fa-store"></i>&nbsp;推薦商家
						</h2>
					</div>
				
				<div class="box">
					
				

					<div class="row shopArea">

						<c:forEach var="shop" varStatus="stat" items="${shops}">
						<div class="card" style="width: 18rem; margin: 20px">
						<a href="<c:url value='/_50_shop/_54_showShops/ShowShops/${shop.shop_id}' />">
							<img src="<c:url value='/_50_shop/_53_shopRegister/getPicture/${shop.shop_id}'/>" class="card-img-top shopImage"
								alt="..."></a>
							<div class="card-body">
								<p class="card-text">${shop.shop_name}</p>
							</div>
						</div>
					
					</c:forEach>
						

					</div>

				</div>



				<!-- 商家優惠券 -->

				<div style="margin-top: 20px;">
				<div class="mt-5">
						<h2>
							<i class="fas fa-parking"></i>&nbsp;周遭停車場
						</h2>
					</div>
					<p>臨江停車場（$60 / 小時），距離 108公尺。</p>
				</div>
				
				<div style="margin-top: 20px;">
				<div class="mt-5">
						<h2>
							<i class="fas fa-subway"></i>&nbsp;鄰近捷運站
						</h2>
					</div>
					<div style="display:flex;">
					<div style="display:flex;padding:10px;border:1px solid #ccc;width:210px;margin-right:10px;">
					<div style="background-color:red;padding:10px;font:20px;font-weight:bold;color:white;">淡水信義線</div><div style="padding:10px;font:20px;">信義安和</div>
					</div>
					<div style="display:flex;padding:10px;border:1px solid #ccc;width:210px;margin-right:10px;">
					<div style="background-color:brown;padding:10px;font:20px;font-weight:bold;color:white;">文湖線</div><div style="padding:10px;font:20px;">六張犁</div>
					</div>
					<div style="display:flex;padding:10px;border:1px solid #ccc;width:210px;">
					<div style="background-color:red;padding:10px;font:20px;font-weight:bold;color:white;">淡水信義線</div><div style="padding:10px;font:20px;">世貿</div>
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
						<div class="item-right">02-2550-5220</div>
					</div>
					<div class="item">
						<div class="item-left">
							<i class="fab fa-chrome"></i>
						</div>
						<div class="item-right">
						<a href="https://www.travel.taipei/zh-tw/attraction/details/1562">台北旅遊網</a>
						</div>
					</div>
					<div class="item">
						<div class="item-left">
							<i class="fas fa-clock"></i>
						</div>
						<div class="item-right">
							星期日	18:00 - 00:00<br>
							星期一	18:00 - 00:00<br>
							星期二	18:00 - 00:00<br>
							星期三	18:00 - 00:00<br>
							星期四	18:00 - 00:00<br>
							星期五	18:00 - 00:00<br>
							星期六	18:00 - 00:00
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
						<iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3615.115995657285!2d121.55208261487938!3d25.030137283974202!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x3442abcb3e5a8b07%3A0xba5d7dc78fba5d2e!2z5Y-w5YyX5biC6Ieo5rGf6KGX6KeA5YWJ5aSc5biC772c6YCa5YyW6KGX5aSc5biCIFRhaXdhbiBUYWlwZWkgTmlnaHQgTWFya2V0!5e0!3m2!1szh-TW!2stw!4v1615869180571!5m2!1szh-TW!2stw" width="330" height="300" style="border:0;margin-top:15px;" allowfullscreen="" loading="lazy"></iframe>
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
	
	<script>
	function doFirst(){
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