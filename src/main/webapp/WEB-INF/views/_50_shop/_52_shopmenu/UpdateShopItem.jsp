<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>���</title>
<link rel="stylesheet" 
	href="<c:url value='/_00_util/shopUtil/css/reset.css'/>">
    <link rel="stylesheet" 
    href="<c:url value='/_00_util/shopUtil/css/�s�W���.css'/>">
    <script src="https://kit.fontawesome.com/a076d05399.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    
   
    <script>
        var token = true;
        $(function() {
    
            /* hover�ƥ���� �p�G�u�g�@�Ӥ�k  
               �����иg�L�M���}���|Ĳ�o�o�Ӥ�k slideToggle
             */
            // $('.menu-box').hover(function(){
            //     $(this).children('ul').slideToggle();
            // })
            $('.tab-list a').hover(
                    function() {
                        /* ���ǰt����e�������� class css���O */
                        $(this).toggleClass('liColor');
    
                        /* �����e(this) a �����޸� */
                        index = $(this).index();
    
                        /* ���W���M�U�����������޸� eq() ��ܤ��e 
                            ��lsiblings() ���ð_�� */
                        $('.tab-panel').eq(index).stop().fadeIn('slow').show()
                                .siblings().hide();
    
                    }, function() {
                        /* �ĤG�Ӥ�k�B�z�ƹ����}�ƥ� */
                        $(this).removeClass('liColor');
                        $('.tab-panel').hide();
                    })
    
            $('.tab-panel').hover(function() {
                index = $(this).index();
                $(this).css('background-color', 'white').show();
                $('.tab-list a').eq(index).addClass('liColor');
            }, function() {
                $(this).hide();
                $('.tab-list a').eq(index).removeClass('liColor');
            })
    
            $('#insertbtn').click(function() {
                if (token == true) {
                    $('#insert').css("display", "flex");
                    $('#insertbtn').text("����");
                    token = false;
                } else {
                    $('#insert').css("display", "none");
                    $('#insertbtn').text("�� �s�W�ӫ~");
                    token = true;
                }
            });
            
        });
        

    </script>
</head>
<body>
    

	<!-- �ޤJ�@�P������ -->
	<jsp:include page="/WEB-INF/views/_00_util/allUtil/jsp/header.jsp" />
	



    <!-- <div class="advertisement">    /*�s�i����l*/
        <img src="https://picsum.photos/1200/300">
    </div> -->

    <div class="main-member">
      	<!-- �\����}�l -->
		<jsp:include page="/WEB-INF/views/_00_util/shopUtil/jsp/shop_aside.jsp" />
		<!-- �\���浲�� -->
      



        <main>
          
            <div style="display: flex; justify-content: center;
            border: 2px dashed #333; padding: 10px; margin: 20px;"
            id="insert">
                <div style="width: 35%; text-align: right;">
                    <div class="text">�ӫ~�W�١G</div>
                    <div class="text" style="margin-top: 30px;">�ӫ~���e�G</div>
                    <div class="text" style="margin-top: 70px;">�ӫ~����G</div>
                    <div class="text" style="margin-top: 150px;">�ӫ~�Ӥ��G</div>
                </div>
                <div style="width: 65%; text-align: left;">
                    <!--form:form ���J�I -->
                    <form:form method="POST" modelAttribute="shopmenubean" 
                    enctype='multipart/form-data' >
                        <div>
                            <form:input type="text" path="menu_name" class="form" />
                        </div>
                        <div>
                            <form:textarea path="menu_detail" cols="40" rows="5" 
                            style="margin-top: 25px;" />
                        </div>
                        <div>
                        	<form:input type="text" path="menu_price" class="form" />
                        </div>
                        <div style="display: flex;">
                            <div style="width:250px;height:150px;background:#eee;margin-top:5px;">
                                <img src="<c:url value='/_50_shop/_52_shopmenu/picture/${shopmenubean.menu_id}'/>" style="width:250px;height:150px;margin-left: 5px;" class="coupon-pic">
                            </div>
                            <div>
                            	<div style="width:250px;height:150px;">
	                             	<img style="width:250px;height:150px;margin-top:4px;margin-left:5px;"  id="blah"/>
                            	</div>
                                <form:input type="file" id="imgInp" path="productImage" accept=".jpeg,.png" style="margin-left: 5px;margin-top: 130px;"  />
                                <div style="width: 100%;text-align: right;height: 60px;">
                                	<input type="button" onclick="location.href='${pageContext.request.contextPath}/_50_shop/_52_shopmenu/InsertShopItem/${shopmenubean.shopBean.shop_id}'" value="����" style="margin-top: 28px;width: 120px;height: 30px;"></input>
                                	<!--  <input type="button" onclick="getUrlParameter('modify')" value="����" style="margin-top: 28px;width: 120px;height: 30px;"></input>
                                	-->
                                    <input type="submit" value="�x�s" style="margin-top: 28px;width: 120px;height: 30px;"></input>
                                </div>
                            </div>
                        </div>
                    </form:form>
                    <!--form:form ���� -->
                </div>
            </div>
 
        </main>

    </div>
   <script type="text/javascript"> 
  function readURL(input) {
	  if (input.files && input.files[0]) {
	    var reader = new FileReader();
	    
	    reader.onload = function(e) {
	      $('#blah').attr('src', e.target.result);
	    }
	    
	    reader.readAsDataURL(input.files[0]); // convert to base64 string
	  }
	}

	$("#imgInp").change(function() {
	  readURL(this);
	});
   </script>
    
</body>
</html>
