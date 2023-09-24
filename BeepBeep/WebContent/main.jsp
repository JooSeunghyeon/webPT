<%@page import="model.memberDTO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
		<title>����</title>
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
		<link rel="stylesheet" href="assets/css/main.css" />
		
		
		<style>
	
			@font-face {
		    font-family: 'twayair';
		    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_tway@1.0/twayair.woff') format('woff');
		    font-weight: normal;
		    font-style: normal;
			}
			
			h2 {
				font-family:'twayair';
				font-size:100px;
			}
					
					
					
			body{
				transform-origin: 100% 100%;
				align:'center';
			}
			
			span.title{
			   font-size : 50px;
			}
		</style>
		
 
</head>  

<body>


<%      memberDTO dto = (memberDTO)session.getAttribute("info");
%>


      <!-- Wrapper -->
         <div id="wrapper">

            <!-- Header -->
               <header id="header">
                  <div class="inner" >
                     
                     
                     <!-- Logo -->
                        <a href="main.jsp" class="logo" ">
                           <span class="symbol"><img style = 'margin-left:250px;'src="images/hehe.png" alt="" />
                           </span><span class="title" style = 'font-size:80px'>WEB & PT</span>
                        </a>

                     <!-- Nav -->
                        <nav style = 'right:0'>
                           <ul>
                              <!-- a�±� ��Ʈ ���� �����ϴ� ��� �����غ��� -->

                              <% if (dto == null) {
                                 out.print("<button style = 'height:70px;'><a style = 'font-size:30px;' href = 'login'>LOGIN</a></button>");
                                 out.print("<span>��</span>");
                                 out.print("<button  style = 'height:70px;'><a style = 'font-size:30px;' href = 'Join.jsp'>JOIN</a></button>");
                                 out.print("<span>��</span>");
                              } else if (dto.getId() != null) {
                                 out.print("<button  style = 'height:70px;'><a style = 'font-size:30px;' href = 'logout'>LOGOUT</a></button>");
                                 out.print("<span>��</span>");
                                 out.print("<button  style = 'height:70px;'><a style = 'font-size:30px;' href = 'mypage.jsp'>MY PAGE</a></button>");
                                 out.print("<span>��</span>");
                              }
                              %>
                              <li><a href="#menu">Menu</a></li>
                           </ul>
                        </nav>

				<!-- Menu -->
					<nav id="menu">
						<h2 style = 'font-size:50px'>Menu</h2>
						
						<ul>
							<li><a href="main.jsp">����ȭ������</a></li>
							<li><a href="video.jsp">����</a></li>
							<li><a href="recommend.jsp">�Ĵ���õ</a></li>
							<li><a href="meal.jsp">�Ĵ�</a></li>
							<li><a href="calTest.jsp">Ķ����</a></li>
						</ul>
					</nav>
                  </div>
               </header>

				<!-- Main -->
					<div id="main">
						<div class="inner">
							<section class="tiles">
								<article id = "article1" class="style1 article">
									<span class="image">
										<img src="images/video.jpg" alt="" />
									</span>
									<% if (dto == null) {
										out.print("<a href='main.jsp'>");
									}else{
										out.print("<a href='video.jsp'>");
									}%>
										<h2>����</h2>
										<div class="content">
											<p>������ �˰������� ����� ��� ��õ���ݴϴ�.</p>
										</div>
									</a>
								</article>
								<article id = "article2" class="style2 article">
									<span class="image">
										<img src="images/meal.jpg" alt="" />
									</span>
									<% if (dto == null) {
										out.print("<a href='main.jsp'>");
									}else{
										out.print("<a href='recommend.jsp'>");
									}%>
										<h2>�Ĵ���õ</h2>
										<div class="content">
											<p>����� �ǰ��� �Ľ����� �����ص帳�ϴ�.</p>
										</div>
									</a>
								</article>
								<article id = "article3" class="style3 article">
									<span class="image">
										<img src="images/recommend.jpg" alt="" />
									</span>
										<% if (dto == null) {
										out.print("<a href='main.jsp'>");
									}else{
										out.print("<a href='Community.jsp'>");
									}%>
										<h2>Ŀ�´�Ƽ</h2>
										<div class="content">
											<p>ȸ����� ������� ������ ���ƿ�!</p>
										</div>
									</a>
								</article>
								<article id = "article4" class="style4 article">
									<span class="image">
										<img src="images/calendar.png" alt="" />
									</span>
									<% if (dto == null) {
										out.print("<a href='main.jsp'>");
									}else{
										out.print("<a href='calTest.jsp'>");
									}%>
										<h2>Ķ����</h2>
										<div class="content">
											<p>����� �Ĵ� ���� � ��ϵ��� ���ݴϴ�.</p>
										</div>
									</a>
								</article>
							
							</section>
						</div>
					</div>
            <!-- Menu -->
               <nav id="menu">
                  <h2 style = 'font-size:50px'>Menu</h2>
                  
                  <ul>
                     <li><a href="main.jsp">����ȭ������</a></li>
                     <li><a href="video.jsp">����</a></li>
                     <li><a href="recommend.jsp">�Ĵ���õ</a></li>
                     <li><a href="meal.jsp">�Ĵ�</a></li>
                     <li><a href="calTest.jsp">Ķ����</a></li>
                  </ul>
               </nav>

          

            
<hr>
<p align = 'center'> WEP & PT ���������Ȥ�|�԰������� ó����ħ��|��Copyright@WEBPT Corp.��All Rights Reserved </p>
      
      
      
      
      <script>
   
         let article1 = document.getElementById('article1');
         let article2 = document.getElementById('article2');
         let article3 = document.getElementById('article3');
         let article4 = document.getElementById('article4');

         article1.onclick = function() {
      <%if (dto == null) {%>
         alert("�α��� �� �̿밡���մϴ�.")
      <%}%>
         }

         article2.onclick = function() {
      <%if (dto == null) {%>
         alert("�α��� �� �̿밡���մϴ�.")
      <%}%>
         }
         article3.onclick = function() {
      <%if (dto == null) {%>
         alert("�α��� �� �̿밡���մϴ�.")
      <%}%>
         }
         article4.onclick = function() {
      <%if (dto == null) {%>
         alert("�α��� �� �̿밡���մϴ�.")
      <%}%>
         }
      </script>
   
      
      
      
      
      
      <!-- Scripts -->
         <script src="assets/js/jquery.min.js"></script>
         <script src="assets/js/browser.min.js"></script>
         <script src="assets/js/breakpoints.min.js"></script>
         <script src="assets/js/util.js"></script>
         <script src="assets/js/main.js"></script>

</body>
</html>