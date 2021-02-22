<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>

<meta charset="UTF-8">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/normalize.css">
<link rel="stylesheet"
href="${pageContext.request.contextPath}/css/funAdmin.css">
<title>admin</title>


<aside class="col-4">
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
			<a href="#">
				<button>
					<span>管理員首頁</span>
				</button>
			</a>
		</div>
		<div class="item">
			<a href="#">
				<button style="background: rgb(170, 192, 207);">
					<span>商品維護</span>
				</button>
			</a>
		</div>
		<div class="item">
			<a href="#">
				<button>
					<span>平台優惠活動</span>
				</button>
			</a>
		</div>
		<div class="item">
			<a href="#">
				<button>
					<span>平台優惠券</span>
				</button>
			</a>
		</div>
		<div class="item">
			<a href="#">
				<button>
					<span>廣告資訊</span>
				</button>
			</a>
		</div>
		<div class="item">
			<a href="#">
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
			<a href="#">
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
