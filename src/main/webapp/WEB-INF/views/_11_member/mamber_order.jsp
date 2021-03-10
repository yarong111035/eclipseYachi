<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
	href="<c:url value='/_00_util/memberUtil/css/member_order.css'/>">
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
<title>member order</title>
</head>
<body>
	
	<!-- 引入共同的頁首 -->
	<jsp:include page="/WEB-INF/views/_00_util/allUtil/jsp/header.jsp" />
	<!-- 引入共同的頁首 結束 -->
	
    <!-- 跑馬燈 -->
	<div id="Marquee">
        <h3>最新優惠消息:</h3>
        <ul id="news">
            <li>東西很貴不要買 !</li>
            <li>還沒做完</li>
            <li>目前網路商店全館免運</li>
        </ul>
    </div>
    <!-- 跑馬燈結束 -->


	<div class="main-member">
        <!-- 側邊攔開始 -->
        <aside>
            <div class="function">
                <h3>會員中心</h3>
				<div class="item">
		            <img src='/_00_init/getMemberImage?memberId=1'
		                  id="headImgg" height='200px' width='200px'>					
	            </div>

<!-- 	                <label for="file"> -->
<!-- 	                    <i class="fas fa-image">編輯照片 -->
<!-- 	                    <input type="file" id="file" name="fileField" accept=".jpeg,.png"  -->
<!-- 	                    style="display: none;"></i> -->
<!-- 	                </label> -->

                <div class="item">
                    <a href="#">
                        <button><span>基本資料</span></button>
                    </a>
                </div>
                <div class="item">
                    <a href="#">
                        <button><span>訂單查詢</span></button>
                    </a>
                </div>
                <div class="item">
                    <a href="#">
                        <button><span>我的優惠券</span></button>
                    </a>
                </div>
                <div class="item">
                    <a href="#">
                        <button><span>喜愛商家</span></button>
                    </a>
                </div>
                <div class="item">
                    <a href="#">
                        <button><span>通知</span></button>
                    </a>
                </div>
                <div class="item">
                    <a href="#">
                        <button><span>申請商家</span></button>
                    </a>
                </div>
                <div class="item">
                    <a href="#">
                        <button><span>新增信用卡</span></button>
                    </a>
                </div>
                <div class="item">
                    <a href="#">
                        <button><span>登出</span></button>
                    </a>
                </div>
            </div>
        </aside>
        <!-- 側邊攔結束 -->



        <main> 

            <form action="" method="">

                <div id="hcg_tabs">
    
                    <div id="tabs-nav">
                        <a href="#" class="change">訂單詳情</a>
                       <a href="#">購物車</a>
                       <a href="#">待付款</a>
                       <a href="#">待出貨</a>
                       <a href="#">待收貨</a>
                       <!-- <a href="#">給予評價</a> -->
                    </div>
                   
                    <div class="tabs-content">
    
                        <!-- 先讓第一個內容顯示出來 display:block -->

                      <!-- 訂單詳情 -->
                      <div class="tabs-panel"  style="display:block">

                            <table class="order-info">
                                <thead>
                                    <tr class="order-nav">
                                        <th>訂購日期</th>
                                        <th>訂單編號</th>
                                        <th>付款方式</th>
                                        <th>應付金額</th>
                                        <th>發票號碼</th>
                                        <th>評價</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    
                                    <tr>
                                        <td colspan="10" class="alignC">
                                            <!-- <span style="color: Red; font-weight: bold;">查無紀錄</span> -->
                                        </td>
                                    </tr>
                                    
                                </tbody>
                                <tfoot>
                                    <tr>
                                        <th class="alignR" colspan="10">
                                            <div class="pager">
                                                
                                                <h2>共0筆訂單</h2>
                                            </div>
                                        </th>
                                    </tr>
                                </tfoot>
    
                            </table>
    
                      </div>
                      <!-- 訂單詳情 -->

                      <!-- 購物車 -->
                      <div class="tabs-panel"> 

                        <table>

                            <thead class="product-item">
                                <tr class="img-tr">
                                    <td colspan="2" rowspan="4" class="img-td">
                                        <img src="../img/cat.png">
                                    </td>
                                    <td colspan="6">商品名稱</td> 
                                </tr>
                                <tr>
                                    <td colspan="4" rowspan="3">簡介</td>
                                    <td style="text-align: center;">移除商品</td>
                                    <td style="text-align: right;">
                                        <button class="remove-product">移除</button>
                                    </td>
                                                                       
                                </tr>
                                <tr>
                                    <td style="text-align: center;">數量</td>
                                    <td style="text-align: right;">x2</td>
                                </tr>
                                <tr>
        
                                    <td style="text-align: center;">金額</td>
                                    <td style="text-align: right;">$300</td>
                                </tr> 
                            </thead>

                            <thead class="product-item">
                                <tr class="img-tr">
                                    <td colspan="2" rowspan="4" class="img-td">
                                        <img src="../img/cat.png">
                                    </td>
                                    <td colspan="6">商品名稱</td> 
                                </tr>
                                <tr>
                                    <td colspan="4" rowspan="3">簡介</td>
                                    <td style="text-align: center;">移除商品</td>
                                    <td style="text-align: right;">
                                        <button class="remove-product">移除</button>
                                    </td>
                                                                       
                                </tr>
                                <tr>
                                    <td style="text-align: center;">數量</td>
                                    <td style="text-align: right;">x2</td>
                                </tr>
                                <tr>
        
                                    <td style="text-align: center;">金額</td>
                                    <td style="text-align: right;">$300</td>
                                </tr> 
                            </thead>
      
                        </table>
                        
                        <div class="btCancel">
                            
                            <a href="#"><button><i class="fas fa-cart-arrow-down"></i>再買一次</button></a>
                            <a href="#"><button><i class="fas fa-window-close"></i>取消訂單</button></a>
                            
                        </div>
                    
                      </div>
                      <!-- 訂單詳情 -->
                   
                      <div class="tabs-panel">
                       測試2
                      </div>
                   
                      <div class="tabs-panel">
                       測試3
                      </div>
                   
                      <div class="tabs-panel">
                       測試4
                      </div>
                   
                     
                   
                    </div>
                  
                </div>
            </form>

        </main>

    </div>
</body>
</html>