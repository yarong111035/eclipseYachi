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
<script src="//cdn.jsdelivr.net/npm/sweetalert2@10"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
   
    <script>
    

	
	
    
    
    
    
        var token = true;
        $(function() {
    
        	$('#file').change(function() { 
   	         // this�N��<input id="file">  
   	         // files.length == 1 �O���׬��@���}�C
   	         let file = this.files[0]; 
   	         let reader = new FileReader();
   	         
   	         reader.readAsDataURL(file); 

   	         reader.onload = function(){     //���\Ū�����
   	             $('#headImg').attr({
   	                 
   	                 // src = this.result 
   	                 // �Ϊ̬O src = e.target () 
   	                 // �u�Ofunction(e) �[�We �ƥ󪫥�B�z���
   	                 src:this.result , 
   	                 width:`250px`,
   	                 height:`150px`
   	             });
   					
   	         }
   	     });

    
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
    
	<jsp:include page="/WEB-INF/views/_00_util/allUtil/jsp/header.jsp" />
	

    <!-- <div class="advertisement">    /*�s�i����l*/
        <img src="https://picsum.photos/1200/300">
    </div> -->

    <div class="main-member">
		<!-- �\����}�l -->
		<jsp:include page="/WEB-INF/views/_00_util/shopUtil/jsp/shop_aside.jsp" />
		<!-- �\���浲�� -->



        <main>
            <div class="column">
                <div class="column-pic">
                    <p class="column-picname" id="menu_pic">�ӫ~�Ӥ�</p>
                </div>
                <div class="column-name">�ӫ~�W��</div>
                <div class="column-content">�ӫ~����</div>
                <div class="column-amount">����</div>
                <div class="column-edit">
                    <p style="margin-right: 70px;">�s��</p>
                </div>
                
            </div>
            <%-- ���J bean���� c:foreach --%>
            <%-- ���B��J�Ҧ���Jshopmenu-table�༴�쪺�Ҧ���� --%>
        <c:forEach var="list" varStatus="stat" items="${shopmenu}">
            <div class="column">
                <div class="column-pic">
                <%-- ��mpic --%>
                <img src="<c:url value='/_50_shop/_52_shopmenu/picture/${list.menu_id}'/>" style="margin-left: 5px;" height="62px" class="coupon-pic">
                    
                </div>
                <%-- �~�Wname --%>
                <div class="column-name">${list.menu_name}</div>
                <%-- �Ӷ�detail --%>
                <div class="column-content">${list.menu_detail}</div>
                <%-- ����price --%>
                <div class="column-amount">${list.menu_price}</div>
                <div class="coupon-edit">
                    <input type="button" value="�s��" onclick="location.href='${pageContext.request.contextPath}/_50_shop/_52_shopmenu/modify/${list.menu_id}'">
                    /
                    <input type="button" value="�R��" onclick="location.href='${pageContext.request.contextPath}/_50_shop/_52_shopmenu/delete/${list.menu_id}'">

                </div>
            </div>
        </c:forEach>

            <div style="display: none; justify-content: center;
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
                    enctype='multipart/form-data'>
                        <div>
                            <form:input id="menu_name" type="text" path="menu_name" class="form" />
                        </div>
                        <div>
                            <form:textarea id="menu_info" path="menu_detail" cols="40" rows="5" 
                            style="margin-top: 25px;" />
                        </div>
                        <div>
                        	<form:input id="menu_price" type="text" path="menu_price" class="form" />
                        </div>
                        <div style="display: flex;">
                            <div
                                style="width: 250px; height: 150px; margin-top: 5px;" >
                                <img src="${pageContext.request.contextPath}/data/images/smallPic/yachiLogo50.png" alt="" id="headImg" style="width: 250px; height: 150px;margin-top: 10px">		
                            </div>
                            <div>
                                <form:input type="file" path="productImage" style="margin-left: 5px;margin-top: 130px;" id="file"/>
                                <div style="width: 100%;text-align: right;height: 60px;">
                                    <input type="submit" value="�x�s" style="margin-top: 28px;width: 120px;height: 30px;"/>
                                </div>
                            </div>
                        </div>
                    </form:form>
                    <!--form:form ���� -->
                </div>
            </div>
            <div class="middle-bottom" 
                style="width: 95%; height: 40px; margin: 20px; border: 2px dashed #333; display: flex;">
                <button style="margin: 3px;" id="insertbtn">�� �s�W�ӫ~</button>
            </div>
            
        </main>

    </div>
  <script>
//�@���J�\��
  //�s��input���Ҫ��ȥ����ϥ�.val()��k
  $('#menu_pic').click(function(){
	  $('#menu_name').val("�[���D��");
	  $('#menu_info').val("�h�L�]�����Y�D��");
	  $('#menu_price').val("45");
  })
  </script>
    
</body>
</html>
