<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Shopping</title>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css"
	integrity="sha384-B0vP5xmATw1+K9KRQjQERJvTumQW0nPEzvF6L/Z6nronJ3oUOFUFpCjEUQouq2+l"
	crossorigin="anonymous">

<link rel="stylesheet"
	href="<c:url value='/_00_util/allUtil/css/normalize.css'/>">
<link rel="stylesheet"
	href="<c:url value='/_00_util/shoppingMallUtil/css/4_shopping_cart.css'/>">
<link rel="stylesheet"
	href="<c:url value='/_00_util/shoppingMallUtil/css/2_mix.css'/>">
	 <script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>
	 
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

<link rel="stylesheet"
	href="<c:url value='/WEB-INF/views/_00_util/allUtil/css/reset.css'/>">
<link rel="stylesheet"
	href="<c:url value='/WEB-INF/views/_00_util/homeUtil/css/home.css'/>">
<link rel="stylesheet" href="<c:url value='/test/reset.css'/>">
<link rel="stylesheet" href="<c:url value='/test/header.css'/>">

<style>
* {
	margin: 0px;
	padding: 0px;
	list-style: none;
}

/* -----------start-----------------*/
/* .image {
			width: 100%;
			height: 300px;
			/* border: 1px solid #ccc; */
/* } */
#Board_wrap {
	/* border: 1px solid rgb(34, 34, 201); */
	border-radius: 5px;
	width: 800px;
	height: 500px;
	margin: 0px auto;
	padding: 5px;
	display: flex;
	/* justify-content:right;  */
	/* align-items:center; */
}

#Board {
	/* border: 1px solid red; */
	width: 800px;
	height: 500px;
	margin: 0px auto;
	overflow: hidden;
	position: relative;
	/* justify-content:right; 
            align-items:center; */
}

#Board img {
	max-width: 800px;
}

#foodname_wrap {
	/* background:grey; */
	border: 1px solid grey;
	border-radius: 3px;
	width: 300px;
	height: 50px;
	margin: 20px auto;
	padding: 5px;
	display: flex;
}

#food_name {
	/* border: 1px solid red; */
	margin: auto;
	font-size: 35px;
}

#Number_wrap {
	/* border: 1px solid rgb(17, 13, 233); */
	border-radius: 3px;
	margin: 20px auto;
	padding: 5px;
	display: flex;
	justify-content: center;
	font-size: 30px;
}

#btn_wrap {
	/* border: 1px solid rgb(17, 13, 233); */
	border-radius: 3px;
	width: 300px;
	height: 50px;
	margin: -15px auto;
	padding: 5px;
	display: flex;
}

.btn {
	/* border: 1px solid red; */
	margin: -50px auto 0xp 0xp;
	margin: auto;
}

.btn button {
	/* border: 1px solid red; */
	border-radius: 8px;
	width: 100px;
	height: 40px;
	margin: auto;
}

/* ----------- End -----------------*/
</style>
</head>
<jsp:include page="/WEB-INF/views/_00_util/allUtil/jsp/header.jsp" />

<body style="background-color: #F3F8F2;">
	<!-- 回到上方的按鈕 -->
	<!------------------------- Start ------------------------------->



	<!------------------------- End ------------------------------->
	<!------------------------- Start ------------------------------->
	
        <div id="Board_wrap">
            <div id="Board">
                <ul>
                    <img src="<c:url value='/data/images/voucher/beefNoodle.jpg'/>" class="card-img-top" alt="..."></li>

<!--                     <li><img src="img/Taiwanese hamburger.jpg"></li> -->
                </ul>
            </div>
        </div>

        <div id="foodname_wrap">
            <div id="food_name">
                招牌刈包
            </div>
        </div>

        <div id="Number_wrap">
            <div id="Number">
                <label>使用張數</label>
                <input type="number" name="num" id="num">
            </div>
        </div>
        <div id="btn_wrap">
            <div class="btn">
                <button id="collect">收藏</button>
            </div>
            <div class="btn">
                <button id="using">使用</button>
            </div>
        </div>

 
    <!-------------------------  End  ------------------------------->

 <script>
        $(function () {

            //     // /* hover事件切換 如果只寫一個方法  
            //     //    那鼠標經過和離開都會觸發這個方法 slideToggle
            //     // */
            //     // // $('.menu-box').hover(function(){
            //     // //     $(this).children('ul').slideToggle();
            //     // // })

            $('.tab-list a').hover(function () {
                /* 為匹配的當前元素切換 class css類別 */
                $(this).toggleClass('liColor');

                /* 拿到當前(this) a 的索引號 */
                index = $(this).index();

                /* 讓上面和下面相應的索引號 eq() 顯示內容 
                    其餘siblings() 隱藏起來 */
                $('.tab-panel').eq(index).stop().fadeIn('slow').show().siblings().hide();

            }, function () {
                /* 第二個方法處理滑鼠移開事件 */
                $(this).removeClass('liColor');
                $('.tab-panel').hide();
            })

            $('.tab-panel').hover(function () {
                index = $(this).index();
                $(this).css('background-color', 'white').show();
                $('.tab-list a').eq(index).addClass('liColor');
            }, function () {
                $(this).hide();
                $('.tab-list a').eq(index).removeClass('liColor');
            })

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
                    position: 'center',
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