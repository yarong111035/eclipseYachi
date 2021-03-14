<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet"
	href="<c:url value='/_00_util/allUtil/css/normalize.css'/>">
    <!-- ------------bootstrap--------------------- -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css" integrity="sha384-B0vP5xmATw1+K9KRQjQERJvTumQW0nPEzvF6L/Z6nronJ3oUOFUFpCjEUQouq2+l" crossorigin="anonymous">
 
    <!-- ------------bootstrap--------------------- -->
    <!-- ------------fontawesome--------------------- -->
    <link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.1/css/all.min.css">
    <!-- ------------fontawesome--------------------- -->
    <title>Document</title>
</head>
<style>
    .container_search{
        margin: 10px 20px 20px 15px;
    }
    #order_number{
        line-height: 38px;
        margin-right: 10px;
    }
    .input_area{

        border-radius: 20px;
        margin-right: 8px;
    }
    .submit_btn{
        border: none;
        padding: 0 10px;
        line-height: 38px;
        font-size: 1.4rem;
        color: #BE5555;
        border-radius: 50%;
    }
    .submit_btn:hover{
        background-color: #BE5555;
        border-radius: 50%;
    }

</style>
<body>
    <div class="container container_search">
		<div class="row">
			<div class="col">
				<div style="display: inline-flex;">
					<span id="order_number">請輸入訂單編號：</span>

					<form class="d-flex">
						<input class="form-control me-2 input_area" type="search"
							placeholder="YAxxxxxCHI" aria-label="Search">
						<button class="btn btn-outline-success submit_btn" type="submit">
							<i class="fas fa-search"></i>
						</button>
					</form>

				</div>
			</div>

		</div>

	</div>
	   <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/js/bootstrap.min.js" integrity="sha384-+YQ4JLhjyBLPDQt//I+STsc9iw4uQqACwlvpslubQzn4u2UU2UFM80nGisd026JF" crossorigin="anonymous"></script>
</body>
</html>