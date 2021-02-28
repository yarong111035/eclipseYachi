<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css"
	integrity="sha384-B0vP5xmATw1+K9KRQjQERJvTumQW0nPEzvF6L/Z6nronJ3oUOFUFpCjEUQouq2+l"
	crossorigin="anonymous">
<link rel="stylesheet"
	href="<c:url value='/_00_util/allUtil/css/normalize.css'/>">
<link rel="stylesheet" href="<c:url value='/_00_util/allUtil/css/background.css'/>">
<link rel="stylesheet"
	href="<c:url value='/_00_util/adminUtil/css/9_editProduct.css'/>">
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
<script src="<c:url value='/_00_util/allUtil/javascript/jquery-3.5.1.js'/>"></script>
<script src="<c:url value='/_00_util/allUtil/javascript/jquery-ui.js'/>"></script>
<title>Edit Product</title>
</head>
<body>
	<!-- 引入共同的頁首 -->
	<jsp:include page="/WEB-INF/views/_00_util/allUtil/jsp/header.jsp" />
	<!-- 引入共同的頁首 結束 -->
	
	
	<div class="container pt-4">
    <div class="row">
       
    	<!-- 功能選單開始 -->
    	<jsp:include page="/WEB-INF/views/_00_util/adminUtil/jsp/admin.jsp" />
    	<!-- 功能選單結束 -->

		<!-- 商品明細區域開始 -->
        <main class="col-8">
            <div class="editBtn">
                <a href="<c:url value='/products/add'/>" id="insertProduct" >新增商品</a>
                <a href="#" id="downProduct">下架商品</a>
                <a href="#" id="deleteProduct">刪除商品</a>
                
            </div>

            <div id="productTab">
                <div id="tab_nav">
                    <a href="javascript:;" class="tab_selected onsale">商品上架中</a>
                    <a href="javascript:;">商品已下架</a>
                    <a href="javascript:;">商品缺貨中</a>
                </div>
                <div class="tabs_content content_selected">

                    <div class="tabs_panel product_info" style="display: block;">
                        <div class="itemsList">
                            <div class="table">
                                <div class="thead">
                                	    <div class="tr">
                                        <div class="th checkBox">
                                            <input type="checkbox" id="vehicle1" name="vehicle1" value="Bike">
                                            <label for="vehicle1"></label><br>
                                        </div>
                                        <div class="th pic">圖片</div>
                                        <div class="th name">商品名稱</div>
                                        <div class="th price">價格</div>
                                        <div class="th count">數量</div>
                                        <div class="th upDate">上架順序</div>
                                        <div class="th edit">修改</div>
                                        <!-- <div class="th delete">刪除</div> -->
                                    </div>
                                </div>
                                <div class="tbody">
                                
                                	<c:forEach var='product' items='${editProducts}'>
	                                    <div class="tr">
	                                        <div class="td checkBox">
	                                            <input type="checkbox" id="vehicle1" name="vehicle1" value="Bike">
	                                            <label for="vehicle1"></label>
	                                        </div>
	                                        <div class="td pic">
	                                            <img src="<c:url value='/getPicture/${product.product_id}'/>">
	                                        </div>
	                                        <div class="td name">
	                                            <a href="#">${product.product_name}</a>
	                                            <div>
	                                                <span>${product.product_spec}</span>
	                                            </div>
	                                        </div>
	                                        <div class="td price">
	                                            <span>NT$ ${product.product_price }</span>
	                                        </div>
	                                        <div class="td count">
	                                            <span>${product.product_stock }</span>
	                                        </div>
	                                        <div class="td upDate">
	                                            <span>${product.product_id }</span>
	                                        </div>
	                                        <div class="td edit">
	                                            <a href="#"><i class="fas fa-pen"></i></a>
	                                        </div>
	                                        <!-- <div class="td delete">
	                                            <a href="#"><i class="fas fa-trash"></i></i></a>
	                                        </div> -->
	                                    </div>
                         			</c:forEach>
                              
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="tabs_panel noSale">
                        <div class="itemsList">
                            <div class="table">
                                <div class="thead">
                                    <div class="tr">
                                    
                                        <div class="th pic">圖片</div>
                                        <div class="th name">商品名稱</div>
                                        <div class="th price">價格</div>
                                        <div class="th count">數量</div>
                                        <div class="th upDate">下架時間</div>
                                        <div class="th edit">修改</div>
                                        <!-- <div class="th delete">刪除</div> -->
                                    </div>
                                </div>
                                <div class="tbody">
                                    <div class="tr">
                                        <div class="td pic">
                                            <img src="/images_2/1_product.jpg">
                                        </div>
                                        <div class="td name">
                                            <a href="#">超好用收納購物袋</a>
                                            <div>
                                                <span>白色</span>
                                            </div>
                                        </div>
                                        <div class="td price">
                                            <span>NT$ 199</span>
                                        </div>
                                        <div class="td count">
                                            <span>30</span>
                                        </div>
                                        <div class="td upDate">
                                            <span>2021-02-28</span>
                                        </div>
                                        <div class="td edit">
                                            <a href="#"><i class="fas fa-pen"></i></a>
                                        </div>
                                        <!-- <div class="td delete">
                                            <a href="#"><i class="fas fa-trash"></i></i></a>
                                        </div> -->
                                    </div>
                         
             
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="tabs_panel noStock">
                        測試三
                            
                    </div>

                </div>
            </div>













            
        </main>
		<!-- 商品明細區域結束 -->
    
    </div>
</div>
	
	
<script>
    $(function () {
    $('#tab_nav a').click(function(){ 
        // 當點擊tabs-nav的元素a時  替當前(this)的a超連結增加.tab_selected類  
        // 其餘兄弟類 siblings() remove .change類
        $(this).addClass('tab_selected').siblings().removeClass('tab_selected');

        // 點擊的同時 拿到當前 a 超連結的索引號
        let index = $(this).index();     //  index從0開始
        // console.log(index);

        // 讓下面對應的索引號  .tabs-content 的子元素.tabs-panel[index] 渲染出來  
        // 其他 子元素 兄弟類 siblings() 的 .tabs_panel 隱藏
        // 找出 panel 的 index 對應到 #tab_nav a 的 index
        $('.tabs_content .tabs_panel').eq(index)  
        .addClass('show_panel animated_tabs').show().siblings().hide();

    });

});
</script>
	
</body>
</html>