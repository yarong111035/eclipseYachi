<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>SHOP</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.2/css/all.min.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css" integrity="sha384-B0vP5xmATw1+K9KRQjQERJvTumQW0nPEzvF6L/Z6nronJ3oUOFUFpCjEUQouq2+l" crossorigin="anonymous">
    <link rel="stylesheet" href="<c:url value='/_00_util/allUtil/css/normalize.css'/>">
     <link rel="stylesheet" href="<c:url value='/_00_util/allUtil/css/background.css'/>">
<!--     <link rel="stylesheet" href="slick/slick.css"/> -->
<!-- 		Add the new slick-theme.css if you want the default styling -->
<!--     <link rel="stylesheet" href="slick/slick-theme.css"/> -->
    <link rel="stylesheet" href="<c:url value='/_00_util/nightShopUtil/css/1_shop.css'/>"/>
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/js/bootstrap.min.js" integrity="sha384-+YQ4JLhjyBLPDQt//I+STsc9iw4uQqACwlvpslubQzn4u2UU2UFM80nGisd026JF" crossorigin="anonymous"></script>
<!--     <script type="text/javascript" src="js/slick_jquery1.11.0.min.js"></script> -->
<!--     <script type="text/javascript" src="js/slick_jq_migrate1.2.1.min.js"></script> -->
<!--     <script type="text/javascript" src="slick/slick.js"></script> -->
</head>
<body>
	<jsp:include page="/WEB-INF/views/_00_util/allUtil/jsp/header.jsp" />
	<h1>${store }</h1>
	 <!-- slider -->
	 <div id="carouselExampleIndicators" class="carousel slide" data-ride="carousel">
		  <ol class="carousel-indicators">
		    <li data-target="#carouselExampleIndicators" data-slide-to="0" class="active"></li>
		    <li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
		    <li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
		  </ol>
		  <div class="carousel-inner">
		    <div class="carousel-item active">
		      <img src="<c:url value='/data/images/slidePic/寧夏方家雞肉飯1.jpg'/>" class="d-block w-100" alt="...">
		    </div>
		    <div class="carousel-item">
		      <img src="<c:url value='/data/images/slidePic/寧夏方家雞肉飯2.jpg'/>" class="d-block w-100" alt="...">
		    </div>
		    <div class="carousel-item">
		      <img src="<c:url value='/data/images/slidePic/寧夏方家雞肉飯3.jpg'/>" class="d-block w-100" alt="...">
		    </div>
		  </div>
		  <a class="carousel-control-prev" href="#carouselExampleIndicators" role="button" data-slide="prev">
		    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
		    <span class="sr-only">Previous</span>
		  </a>
		  <a class="carousel-control-next" href="#carouselExampleIndicators" role="button" data-slide="next">
		    <span class="carousel-control-next-icon" aria-hidden="true"></span>
		    <span class="sr-only">Next</span>
		  </a>
	</div>
	 
	 
	 
	 
	 
<!--     <div id="sliderContainer"> -->
<!--         <div class="slider"> -->
<!--             <div class="slick-slider image"><img src="images_2/寧夏方家雞肉飯1.jpg" alt=""></div> -->
<!--             <div class="slick-slider image"><img src="images_2/寧夏方家雞肉飯2.jpg" alt=""></div> -->
<!--             <div class="slick-slider image"><img src="images_2/寧夏方家雞肉飯3jpg.jpg" alt=""></div> -->
<!--             <div class="slick-slider image"><img src="images_2/1_product.jpg" alt=""></div> -->
<!--         </div> -->
<!--     </div> -->
    <!-- End:slider -->

    <div id="secondContainer" class="container">
        <div class="row">
            <!-- Left -->
            <div id="sectionLeft" class="col-8">
                <!-- 商家簡介 -->
                <div id="shopInfo">
                    <h2 style="color: #f26419;">方家雞肉飯</h2>
                    <div>
                        <i class="fas fa-star"></i>
                        <i class="fas fa-star"></i>
                        <i class="fas fa-star"></i>
                        <i class="fas fa-star"></i>
                        <i class="fas fa-star"></i>
                    </div>
                    <p style="color: #78886f;">淋上雞汁鋪上雞肉絲與油蔥的雞肉飯來到這裡必點的招牌,偏甜的滷汁清爽不膩的口感搭配上烹煮合宜的米飯,很容易就秒殺掉一碗;雖然方家的雞肉飯是雞絲狀,但是不會過柴保有一點嫩度與微甜的滷汁一起入口,扒上一大口飯是屬於庶民美食的大大滿足。</p>
                </div>
                <!-- 商家簡介 -->

                <!-- 商家優惠券 -->
                <div class="addCoupon">
                    <div><i class="far fa-plus-square fa-2x"></i></div>
                    <div><img src="<c:url value='/data/images/smallPic/coupon2.png'/>" style="width: 50px;"></div>
                    <div class="couponInfo" >
                        <h3>優惠券簡介</h3>
                       消費滿100元，即可折價40元喔!!!<br>
                        <h4>使用方式</h4>
                        收藏後至會員中心按下立即使用，並給商家核銷即可使用喔!!!
                    </div>
                </div>
                <div class="addCoupon">
                    <div><i class="far fa-plus-square fa-2x"></i></div>
                    <div><img src="<c:url value='/data/images/smallPic/coupon2.png'/>" style="width: 50px;"></div>
                    <div class="couponInfo" >
                        <h3>優惠券簡介</h3>
                        消費滿200元，即可折價90元喔!!!<br>
                        <h4>使用方式</h4>
                        收藏後至會員中心按下立即使用，並給商家核銷即可使用喔!!!
                    </div>
                </div>
                <!-- 商家優惠券 -->
                
                <!-- 留言區 -->
                <div id="comment">
                    <div class="mt-5">
                        <h2><i class="fas fa-comments"></i>立即評價</h2>
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
                                        <i class="far fa-thumbs-up"></i>
                                        <i class="far fa-thumbs-up"></i>
                                        <i class="far fa-thumbs-up"></i>
                                        <i class="far fa-thumbs-up"></i>
                                        <i class="far fa-thumbs-up"></i>
                                    </div>
                                </div>
                            </div>

                            <div class="col-12 flexitem" id="flex-item-1">
                                <input type="text" class="form-control" placeholder="您的暱稱...." aria-label="Username" aria-describedby="basic-addon1">
                            </div>

                            <div class="col-12 flexitem" id="flex-item-2">
                                <textarea class="form-control" aria-label="With textarea" placeholder="留個言吧..."></textarea>
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
                            <span class="memberId">vickychen0087</span>
                            <span class="nickname">Vicky</span>
                            <div class="comment_score">
                                <i class="far fa-thumbs-up"></i>
                                <i class="far fa-thumbs-up"></i>
                                <i class="far fa-thumbs-up"></i>
                                <i class="far fa-thumbs-up"></i>
                                <i class="far fa-thumbs-up"></i>
                            </div>
                        </div>
                        
                         <!-- 點擊會出現檢舉或編輯的下拉選單 -->
                         <div class="doMore"><i class="fas fa-ellipsis-v"></i>
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
                            <span class="memberId">vickychen0087</span>
                            <span class="nickname">Vicky</span>
                            <div class="comment_score">
                                <i class="far fa-thumbs-up"></i>
                                <i class="far fa-thumbs-up"></i>
                                <i class="far fa-thumbs-up"></i>
                                <i class="far fa-thumbs-up"></i>
                                <i class="far fa-thumbs-up"></i>
                            </div>
                        </div>
                        
                         <!-- 點擊會出現檢舉或編輯的下拉選單 -->
                         <div class="doMore"><i class="fas fa-ellipsis-v"></i>
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
                        <div class="item-right">
                            09193939938
                        </div>
                    </div>
                    <div class="item">
                        <div class="item-left">
                            <i class="fas fa-map-marked-alt"></i>
                        </div>
                        <div class="item-right">
                            台北市寧夏夜市
                        </div>
                    </div>
                    <div class="item">
                        <div class="item-left">
                            <i class="fab fa-chrome"></i>
                        </div>
                        <div class="item-right">
                            chickenrice.com.tw
                        </div>
                    </div>
                    <div class="item">
                        <div class="item-left">
                            <i class="fas fa-clock"></i>
                        </div>
                        <div class="item-right">
                            Mon~Fri  : 16~22 <br>
                            Sat~Sun : 16~24
                        </div>
                    </div>
                    <div class="item">
                        <div class="item-left">
                            <i class="fas fa-bars"></i>
                        </div>
                        <div class="item-right">
                            <a href="#">MENU</a>
                        </div>
                    </div>
                </div>
            </div>
            <!-- End:Right -->
        </div>    
            
    </div>


<!--     <script> -->
<!-- //         $(document).ready(function(){ -->
<!-- //             $('.slider').slick({ -->
<!-- //                 dots: true, -->
<!-- //                 infinite: true, -->
<!-- //                 speed: 500, -->
<!-- //                 fade: true, -->
<!-- //                 cssEase: 'linear', -->
<!-- //                 autoplay: true, //自動撥放 -->
<!-- //                 autoplaySpeed: 5000, //自動撥放的切換速率，單位毫秒 -->
<!-- //             }); -->
<!-- //         }); -->
<!--     </script> -->
</body>
</html>