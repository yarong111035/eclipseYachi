<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css"
	integrity="sha384-B0vP5xmATw1+K9KRQjQERJvTumQW0nPEzvF6L/Z6nronJ3oUOFUFpCjEUQouq2+l"
	crossorigin="anonymous">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/normalize.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/8_insertProduct.css">
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
<script src="${pageContext.request.contextPath}/js/jquery-3.5.1.js"></script>
<script src="${pageContext.request.contextPath}/js/jquery-ui.js"></script>
<title>insert product</title>
</head>
<body>
	<!-- 引入共同的頁首 -->
	<jsp:include page="header/header.jsp" />

	<div class="container">
		<div class="row box">
		
			<!-- 功能選單開始 -->
<!-- 			<aside class="col-4"> -->
<!-- 				<div class="function "> -->
<!-- 					<h3>管理員</h3> -->
<!-- 					<div class="item"> -->
<!-- 						<img src="https://picsum.photos/250/250" id="headImg"> -->
<!-- 					</div> -->

<!-- 					<label for="file"> <i class="fas fa-image"> 編輯頭貼 <input -->
<!-- 							type="file" id="file" accept=".jpeg,.png" style="display: none;"> -->
<!-- 					</i> -->
<!-- 					</label> -->

<!-- 					<div class="item"> -->
<!-- 						<a href="#"> -->
<!-- 							<button> -->
<!-- 								<span>管理員首頁</span> -->
<!-- 							</button> -->
<!-- 						</a> -->
<!-- 					</div> -->
<!-- 					<div class="item"> -->
<!-- 						<a href="#"> -->
<!-- 							<button style="background: rgb(170, 192, 207);"> -->
<!-- 								<span>商品維護</span> -->
<!-- 							</button> -->
<!-- 						</a> -->
<!-- 					</div> -->
<!-- 					<div class="item"> -->
<!-- 						<a href="#"> -->
<!-- 							<button> -->
<!-- 								<span>平台優惠活動</span> -->
<!-- 							</button> -->
<!-- 						</a> -->
<!-- 					</div> -->
<!-- 					<div class="item"> -->
<!-- 						<a href="#"> -->
<!-- 							<button> -->
<!-- 								<span>平台優惠券</span> -->
<!-- 							</button> -->
<!-- 						</a> -->
<!-- 					</div> -->
<!-- 					<div class="item"> -->
<!-- 						<a href="#"> -->
<!-- 							<button> -->
<!-- 								<span>廣告資訊</span> -->
<!-- 							</button> -->
<!-- 						</a> -->
<!-- 					</div> -->
<!-- 					<div class="item"> -->
<!-- 						<a href="#"> -->
<!-- 							<button> -->
<!-- 								<span>客服回應</span> -->
<!-- 							</button> -->
<!-- 						</a> -->
<!-- 					</div> -->
<!-- 					<div class="item"> -->
<!-- 						<a href="#"> -->
<!-- 							<button> -->
<!-- 								<span>審核商家</span> -->
<!-- 							</button> -->
<!-- 						</a> -->
<!-- 					</div> -->
<!-- 					<div class="item"> -->
<!-- 						<a href="#"> -->
<!-- 							<button> -->
<!-- 								<span>公告</span> -->
<!-- 							</button> -->
<!-- 						</a> -->
<!-- 					</div> -->
<!-- 					<div class="item"> -->
<!-- 						<a href="#"> -->
<!-- 							<button> -->
<!-- 								<span>申訴單</span> -->
<!-- 							</button> -->
<!-- 						</a> -->
<!-- 					</div> -->
<!-- 					<div class="item"> -->
<!-- 						<a href="#"> -->
<!-- 							<button> -->
<!-- 								<span>基本資料</span> -->
<!-- 							</button> -->
<!-- 						</a> -->
<!-- 					</div> -->
<!-- 					<div class="item"> -->
<!-- 						<a href="#"> -->
<!-- 							<button> -->
<!-- 								<span>登出</span> -->
<!-- 							</button> -->
<!-- 						</a> -->
<!-- 					</div> -->
<!-- 				</div> -->

<!-- 			</aside> -->
				<jsp:include page="function/admin.jsp" />
			<!-- 功能選單結束 -->
		
			<!-- 表單區域開始 -->
			<main class="col-8">
				<div class="formBox pt-3 pb-2 px-5">
					<div class="title">新增產品資料</div>

					<form:form method='POST' modelAttribute='productBean'>
						<div class="form-group row">
							<label for="productName" class="col-sm-2 col-form-label">商品名稱</label>
							<div class="col-sm-10">
<!-- 						path="product_name" => 呼叫ProductBean 的 getProduct_name()-->
								<form:input type="text" path="product_name" class="form-control" id="productName"/>
							</div>
						</div>
						<div class="form-group row">
							<label for="productInfo" class="col-sm-2 col-form-label">商品資訊</label>
							<div class="col-sm-10">
<!-- 							path="product_info" => 呼叫ProductBean 的 getProduct_info() -->
								<form:input type="text" path="product_info" class="form-control" id="productInfo"/>
							</div>
						</div>
						<div class="form-group row">
							<label for="productPrice" class="col-sm-2 col-form-label">商品價格</label>
							<div class="col-sm-10">
								<form:input type="number" path="product_price" min="0" class="form-control"
									id="productPrice"/>
							</div>
						</div>
						<div class="form-group row">
							<label for="productStock" class="col-sm-2 col-form-label">商品庫存</label>
							<div class="col-sm-10">
								<form:input type="number" path="product_stock" min="0" class="form-control"
									id="productStock"/>
							</div>
						</div>
						<div class="form-group row">
							<label for="productSpec" class="col-sm-2 col-form-label">商品規格</label>
							<div class="col-sm-10">
								<form:input type="text" path="product_spec" min="0" class="form-control" id="productSpec"/>
							</div>
						</div>

						<div class="form-group row">
							<label for="sortId" class="col-sm-2 col-form-label">商品種類</label>
							<div class="mb-3 col-10">
								<form:select path="sortId" class="custom-select">
									<form:option value="-1" label="請選擇"/>
									<form:options items="${sortMap}"/>
								</form:select>
							</div>
						</div>
						
						<!-- 選擇照片 -->
						<div class="custom-file">
							<input type="file" class="custom-file-input" id="customFile">
							<label class="custom-file-label" for="customFile">Choose
								file</label>
						</div>

						<div class="imageBox d-flex justify-content-between pt-4">
							<div class="image">
								<img src="${pageContext.request.contextPath}/images_2/dog1.jpg" alt="">
							</div>
							<div class="image">
								<img src="${pageContext.request.contextPath}/images_2/product3-2.jpg" alt="">
							</div>
							<div class="image">
								<img src="${pageContext.request.contextPath}/images/Shinnosuke/Shinnosuke2.jpg" alt="">
							</div>
						</div>
						<!-- 選擇照片 -->


						<div class="form-group row  d-flex justify-content-end mt-5">
							<div>
								<button type="submit" class="btn btn-secondary mr-3">一鍵輸入</button>
							</div>
							<div>
								<button type="submit" id="btnAdd" class="btn btn-primary">新增</button>
							</div>
						</div>


					</form:form>
				</div>
			</main>
		<!-- 表單區域結束 -->
		
		</div>
		
	</div>

</body>
</html>