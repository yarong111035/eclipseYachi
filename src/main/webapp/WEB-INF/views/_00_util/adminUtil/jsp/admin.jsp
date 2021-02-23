<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="<c:url value='/_00_util/adminUtil/css/normalize.css'/>">
<link rel="stylesheet" href="<c:url value='/_00_util/adminUtil/css/funAdmin.css'/>">
<title>admin</title>
</head>

<body>
<aside class="col-4" style="border:none;">
	<div class="function ">
		<!-- <h3>管理員</h3> -->
		<div class="item">
			<img src="https://picsum.photos/250/250" id="headImg">
		</div>

		<label for="file"> <i class="fas fa-image"> 編輯頭貼 <input
				type="file" id="file" accept=".jpeg,.png" style="display: none;">
		</i>
		</label>

		<div class="item">
			<a href="<c:url value='/administrator' />">
				<button>
					<span>管理員首頁</span>
				</button>
			</a>
		</div>
		<div class="item">
			<a href="<c:url value='/products/add' />">
				<button>
					<span>商品維護</span>
				</button>
			</a>
		</div>
		<div class="item">
			<a href="<c:url value='/admin_activity' />">
				<button>
					<span>平台優惠活動</span>
				</button>
			</a>
		</div>
		<div class="item">
			<a href="<c:url value='/admin_coupon' />">
				<button>
					<span>平台優惠券</span>
				</button>
			</a>
		</div>
		<div class="item">
			<a href="<c:url value='/admin_adinfo' />">
				<button>
					<span>廣告資訊</span>
				</button>
			</a>
		</div>
		<div class="item">
			<a href="<c:url value='/admin_chatroom' />">
				<button>
					<span>客服回應</span>
				</button>
			</a>
		</div>
		<div class="item">
			<a href="#">
				<button>
					<span>審核商家</span>
				</button>
			</a>
		</div>
		<div class="item">
			<a href="<c:url value='/admin_announcement' />">
				<button>
					<span>公告</span>
				</button>
			</a>
		</div>
		<div class="item">
			<a href="#">
				<button>
					<span>申訴單</span>
				</button>
			</a>
		</div>
		<div class="item">
			<a href="#">
				<button>
					<span>基本資料</span>
				</button>
			</a>
		</div>
		<div class="item">
			<a href="#">
				<button>
					<span>登出</span>
				</button>
			</a>
		</div>
	</div>




</aside>
</body>
</html>