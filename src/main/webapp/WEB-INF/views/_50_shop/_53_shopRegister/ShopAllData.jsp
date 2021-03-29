<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Shopping</title>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css"
	integrity="sha384-B0vP5xmATw1+K9KRQjQERJvTumQW0nPEzvF6L/Z6nronJ3oUOFUFpCjEUQouq2+l"
	crossorigin="anonymous">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.2/css/all.min.css">
<link rel="stylesheet"
	href="<c:url value='/_00_util/shopUtil/css/normalize.css'/>">
<link rel="stylesheet"
	href="<c:url value='/_00_util/shopUtil/css/shop_register1.css'/>">
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="${pageContext.request.contextPath}/javascript/header.js"></script>
 <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.4.0/Chart.min.js"></script>
<!-- MATERIAL DESIGN ICONIC FONT
<link rel="stylesheet" href="fonts/material-design-iconic-font/css/material-design-iconic-font.min.css"> -->
<style>
.marketBtn{
	margin-right:10px;
}


</style>

</head>
<body>

	<!-- 引入共同的頁首 -->
	<jsp:include page="/WEB-INF/views/_00_util/allUtil/jsp/header.jsp" />
	
	<div class="main-member">
		<aside>
			<div class="function">
				<h3>商家管理頁面</h3>
				

				<div class="item">
				<a href="<c:url value='/_50_shop/_53_shopRegister/modifyShop/${LoginOK.shopBean.shop_id}' />">
						<button>
							<span>商家資料</span>
						</button>
					</a>
				</div>
				<div class="item">
					<a href="#">
						<button>
							<span>商家商品</span>
						</button>
					</a>
				</div>
				<div class="item">
					<a href="<c:url value='/_50_shop/_51_coupon/InsertCoupon/${LoginOK.shopBean.shop_id}' />">
						<button>
							<span>優惠券管理</span>
						</button>
					</a>
				</div>
				<div class="item">
					<a href="#">
						<button>
							<span>報表</span>
						</button>
					</a>
				</div>
				<div class="item">
					<a href="<c:url value='/_50_shop/_54_showShops/ShowShops/${LoginOK.shopBean.shop_id}' />">
						<button>
							<span>商家頁面</span>
						</button>
					</a>
				</div>
				
				<div class="item">
					<a href="<c:url value='/doLogout'/>" onclick="return window.confirm('確定登出嗎?');">
						<button>
							<span>登出</span>
						</button>
					</a>
				</div>
			</div>
		</aside>



		<main>


	<!-- 商家註冊頁面開始 -->
	<div  >
		<div style="margin:20px;">
		<button class="btn btn-outline-primary marketBtn" onclick="location.href='${pageContext.request.contextPath}/_50_shop/_55_shopData/DataFromSex'">顧客男女比</button>
		<button class="btn btn-outline-primary marketBtn" onclick="location.href='${pageContext.request.contextPath}/_50_shop/_55_shopData/DataFromCoupon'">優惠券使用數量</button>
		<button class="btn btn-outline-primary marketBtn" onclick="location.href='${pageContext.request.contextPath}/_50_shop/_55_shopData/DataFromTime'">期間優惠券使用數量</button>
		<button class="btn btn-outline-primary marketBtn" onclick="location.href='${pageContext.request.contextPath}/_50_shop/_55_shopData/DataFromAge'">顧客年齡分佈</button>
		<button class="btn btn-outline-primary marketBtn" onclick="location.href='${pageContext.request.contextPath}/_50_shop/_55_shopData/DataFromAll'">全部資料</button>
		</div>
		
		<div >
			<div style="margin-top:70px;display:flex;">
				<div style="width:400px;height:400px;margin-left:60px;">
					<canvas id="example" width="200px" height="100px"></canvas>
					<div style="margin-top:40px;">
					*此表為商家所有顧客男女比，均衡的男女比有益於商家發展，能將客群穩定發展，若男女比有嚴重失衡時至1:3時，建議執行更吸引缺乏之性別相關活動。
					</div>
				</div>
				
				<div style="width:400px;height:400px;margin-left:60px;">
					<canvas id="example1" width="200px" height="100px"></canvas>
					<div style="margin-top:40px;">
					*此表為商家所有顧客之年齡分佈，店家性質與年齡分佈有極大關係，若期望拓展商家觸及率，建議可投放廣告至缺乏之年齡範圍。
					</div>
				</div>
			</div>
			<div style="margin-top:10px;display:flex;">
				<div style="width:400px;height:400px;margin-left:60px;">
					<canvas id="example2" width="200px" height="100px"></canvas>
					<div style="margin-top:40px;">
					*此表為商家所有被使用優惠券之次數，高使用次數之優惠券建議可延長使用時間或固定期間發放，低次數優惠券建議更改期使用內容，或藉由yachi廣告增加其曝光率。
					</div>
				</div>
				
				<div style="width:400px;height:400px;margin-left:60px;">
					<canvas id="example3" width="200px" height="100px"></canvas>
					<div style="margin-top:40px;">
					*此表顯示為店家近三個月的所有優惠券被使用次數，三月使用量相較於二月使用量有些微上升。
					</div>
				</div>
			</div>
		</div>
		
	</div>
	</main>
	</div>
<script>
        var ctx = document.getElementById( "example" ),
            example = new Chart(ctx, {
                // 參數設定[註1]
                type: ${type}, // 圖表類型
                data: {
                    labels: ${label}, // 標題
                    datasets: [{
                        label: "次數", // 標籤
                        data: ${data}, // 資料
                        backgroundColor: ${backgroundColor},
                        borderWidth: 1 // 外框寬度
                    }]
                },
                options: {
                    title: {
                        text: ${text},
                        display: true,
                        fontSize: 20
                    },
                    legend: {
                        position: 'right'
                    },
                    scales: {
                        yAxes: [{
                            display: true,
                            ticks: {
                                beginAtZero: true
                            }
                        }]
                    }
                }
            });
        
        var ctx = document.getElementById( "example1" ),
        example1 = new Chart(ctx, {
            // 參數設定[註1]
            type: ${type1}, // 圖表類型
            data: {
                labels: ${label1}, // 標題
                datasets: [{
                    label: "次數", // 標籤
                    data: ${data1}, // 資料
                    backgroundColor: ${backgroundColor1},
                    borderWidth: 1 // 外框寬度
                }]
            },
            options: {
                title: {
                    text: ${text1},
                    display: true,
                    fontSize: 20
                },
                legend: {
                    position: 'right'
                },
                scales: {
                    yAxes: [{
                        display: true,
                        ticks: {
                            beginAtZero: true
                        }
                    }]
                }
            }
        });
        
        var ctx = document.getElementById( "example2" ),
        example2 = new Chart(ctx, {
            // 參數設定[註1]
            type: ${type2}, // 圖表類型
            data: {
                labels: ${label2}, // 標題
                datasets: [{
                    label: "次數", // 標籤
                    data: ${data2}, // 資料
                    backgroundColor: ${backgroundColor2},
                    borderWidth: 1 // 外框寬度
                }]
            },
            options: {
                title: {
                    text: ${text2},
                    display: true,
                    fontSize: 20
                },
                legend: {
                    position: 'right'
                },
                scales: {
                    yAxes: [{
                        display: true,
                        ticks: {
                            beginAtZero: true
                        }
                    }]
                }
            }
        });
        
        var ctx = document.getElementById( "example3" ),
        example3 = new Chart(ctx, {
            // 參數設定[註1]
            type: ${type3}, // 圖表類型
            data: {
                labels: ${label3}, // 標題
                datasets: [{
                    label: "次數", // 標籤
                    data: ${data3}, // 資料
                    backgroundColor: ${backgroundColor3},
                    borderWidth: 1 // 外框寬度
                }]
            },
            options: {
                title: {
                    text: ${text3},
                    display: true,
                    fontSize: 20
                },
                legend: {
                    position: 'right'
                },
                scales: {
                    yAxes: [{
                        display: true,
                        ticks: {
                            beginAtZero: true
                        }
                    }]
                }
            }
        });

          
    </script>
	
	
</body>
</html>