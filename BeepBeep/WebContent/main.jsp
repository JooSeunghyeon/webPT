<%@page import="model.memberDTO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
		<title>메인</title>
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
                              <!-- a태그 폰트 밑줄 삭제하는 방법 생각해보기 -->

                              <% if (dto == null) {
                                 out.print("<button style = 'height:70px;'><a style = 'font-size:30px;' href = 'login'>LOGIN</a></button>");
                                 out.print("<span>ㅤ</span>");
                                 out.print("<button  style = 'height:70px;'><a style = 'font-size:30px;' href = 'Join.jsp'>JOIN</a></button>");
                                 out.print("<span>ㅤ</span>");
                              } else if (dto.getId() != null) {
                                 out.print("<button  style = 'height:70px;'><a style = 'font-size:30px;' href = 'logout'>LOGOUT</a></button>");
                                 out.print("<span>ㅤ</span>");
                                 out.print("<button  style = 'height:70px;'><a style = 'font-size:30px;' href = 'mypage.jsp'>MY PAGE</a></button>");
                                 out.print("<span>ㅤ</span>");
                              }
                              %>
                              <li><a href="#menu">Menu</a></li>
                           </ul>
                        </nav>

				<!-- Menu -->
					<nav id="menu">
						<h2 style = 'font-size:50px'>Menu</h2>
						
						<ul>
							<li><a href="main.jsp">메인화면으로</a></li>
							<li><a href="video.jsp">영상</a></li>
							<li><a href="recommend.jsp">식단추천</a></li>
							<li><a href="meal.jsp">식단</a></li>
							<li><a href="calTest.jsp">캘린더</a></li>
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
										<h2>영상</h2>
										<div class="content">
											<p>최적의 알고리즘으로 당신의 운동을 추천해줍니다.</p>
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
										<h2>식단추천</h2>
										<div class="content">
											<p>당신의 건강한 식습관을 개선해드립니다.</p>
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
										<h2>커뮤니티</h2>
										<div class="content">
											<p>회원들과 운동일지를 공유해 보아요!</p>
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
										<h2>캘린더</h2>
										<div class="content">
											<p>당신의 식단 일지 운동 기록등을 해줍니다.</p>
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
                     <li><a href="main.jsp">메인화면으로</a></li>
                     <li><a href="video.jsp">영상</a></li>
                     <li><a href="recommend.jsp">식단추천</a></li>
                     <li><a href="meal.jsp">식단</a></li>
                     <li><a href="calTest.jsp">캘린더</a></li>
                  </ul>
               </nav>

          

            
<hr>
<p align = 'center'> WEP & PT ㅤ제휴제안ㅤ|ㅤ개인정보 처리방침ㅤ|ㅤCopyright@WEBPT Corp.ㅤAll Rights Reserved </p>
      
      
      
      
      <script>
   
         let article1 = document.getElementById('article1');
         let article2 = document.getElementById('article2');
         let article3 = document.getElementById('article3');
         let article4 = document.getElementById('article4');

         article1.onclick = function() {
      <%if (dto == null) {%>
         alert("로그인 후 이용가능합니다.")
      <%}%>
         }

         article2.onclick = function() {
      <%if (dto == null) {%>
         alert("로그인 후 이용가능합니다.")
      <%}%>
         }
         article3.onclick = function() {
      <%if (dto == null) {%>
         alert("로그인 후 이용가능합니다.")
      <%}%>
         }
         article4.onclick = function() {
      <%if (dto == null) {%>
         alert("로그인 후 이용가능합니다.")
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