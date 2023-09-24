<%@page import="java.util.ArrayList"%>
<%@page import="model.CommunityDTO"%>
<%@page import="model.CommunityDAO"%>
<%@page import="model.memberDTO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
	<title>커뮤니티</title>
	<meta charset="utf-8" />
	<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
	<link rel="stylesheet" href="assets/css/main.css" />
	<noscript><link rel="stylesheet" href="assets/css/noscript.css" /></noscript>
	
	<style>
	
	@font-face {
    font-family: 'twayair';
    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_tway@1.0/twayair.woff') format('woff');
    font-weight: normal;
    font-style: normal;
}

body {
	font-family:'twayair';
	font-size:30px;
}




		* {
  margin:0px;
  padding:0px;
}

.back_profile{
  width:100%;
  position:relative;
}

.back_img{
  width:100%;
  height:100%;
  display: inline-block;
  background-color: #ccc;
  background-position: center center;
  background-repeat: no-repeat;
  background-size: cover;
}

.profile_page{
  max-width: 900px;
  width: 100%;
  height:auto;
  margin:20px auto;
}

.profile_bar{
  display:flex;
  width:90%;
  max-height:200px;
  margin-left:5%;
}

.profile_img{
  position: relative;
  width: 50%;
}

.profile_img:before {
  content:"";
  display: block;
  padding-top: 100%;
}

.p_img {
  position: absolute;
  top: 0;
  left: 0;
  bottom: 0;
  right: 0;
  display: inline-block;
  background-position: center center;
  background-repeat: no-repeat;
  background-size: cover;
  border-radius:50%;
}

.profiles{
  width:100%;
  margin-bottom:50px;
}

.profile_detail{
  max-height:100px;
  height:100%;
  margin:auto 0;
}

.profiles{
  display:flex;
}

.profiles p{
  margin:10px;
}

.user_data{
  width:90%;
  height:auto;
  margin:0 5%;
  border:2px solid #ccc;
}

.user_basic_header{
  background-color:#eee;
  width:100%;
  height:5vh;
  border-bottom:1px solid #ccc;
}

.user_basic_header h2{
  margin-left:3%;
  padding:1vh 0;
}

.user_basic{
  background-color:#eee;
  width:100%;
  height:auto;
  display:flex;
}

.user_category{
  background-color:#fff;
  width:30%;
  height:auto;
  min-height:50vh;
  border-right:1px solid #ccc;
}

.user_category ul{
  margin-top:5%;
}

.user_category li{
  list-style:none;
  padding:5%;
}

.user_detail{
  background-color:#fff;
  width:70%;
  height:auto;
  min-height:50vh;
  font-size:0.8em;
}

.user_detail_head{
  width:90%;
  height:3vh;
  margin:5%;
  border-bottom:1px solid #ccc;
}

.edit_detail{
  float:right;
}

.fav_page{
  width:100%;
  height:100vh;
}

.plan_page{
  width:100%;
  height:100vh;
}

.active_category{
  border-left:3px solid orange;
  font-weight:bold;
}

.icon_bar{
  position:fixed;
  width:100%;
  height:7%;
  bottom:0;
  left:0;
  background-color:#eee;
  border-top:1px solid #eee;
}

.f_icon{
  margin-left:16%;
  font-size:1.5em;
}

.active_icon{
  color:orange;
}

.temporary_footer{
  width:100%;
  height:200px;
}

@media screen and (min-width:768px){
  
  .profile_detail{
  margin:5% 30px;
}
  .profile_bar{
  margin-bottom:20px;
}
  
  .profile_img{
  position: relative;
  width: 30%;
}
}

@media screen and (min-width:960px){
  .profile_detail{
  margin:auto 30px;
}
.edit_profile:hover{
  color:orange;
}
  
  .user_category li:hover{
  cursor:pointer;
  opacity:0.7;
}
  
  .edit_detail:hover{
  cursor:pointer;
  color:orange;
}

  .icon_bar{
    display:none;
  }
}
img {
	height:200px;
	width:200px;
	border:1px;
	border-radius:100%;
	margin-left:550px;
}
#por{
	margin-bottom:40px;
}

	
#commutable{
text-align:center;
margin-left: 700px;
}

#header {
	padding: 0em 0 0.1em 0 ;
}

#writer{
	width:150px;
	height:80px;
	background-color:#FF8C24;
	font-size: 20px;	
	margin-left:550px;
}

	</style>
	
	<script>
	 	window.addEventListener("DOMContentLoaded", function(){
		  document.getElementById("h_detail2").style.display="none";
		  document.getElementById("h_detail3").style.display="none";
		  document.getElementById("h_detail4").style.display="none";
		 document.getElementById("m_tab").classList.add("active_icon"); document.getElementById("h_category1").classList.add("active_category");
		}, false);
		  

		function change_category(sideLine,category){
		  document.getElementById("h_detail1").style.display="none";
		  document.getElementById("h_detail2").style.display="none";
		  document.getElementById("h_detail3").style.display="none";
		  document.getElementById("h_detail4").style.display="none";
		  document.getElementById(category).style.display="";
		  document.getElementById("h_category1").classList.remove("active_category");
		  document.getElementById("h_category2").classList.remove("active_category");
		  document.getElementById("h_category3").classList.remove("active_category");
		  document.getElementById("h_category4").classList.remove("active_category");
		  document.getElementById(sideLine).classList.add('active_category');
		}
	
	</script>

</head>






<body>


	<%
	memberDTO dto = (memberDTO)session.getAttribute("info");
	CommunityDAO commudao = new CommunityDAO();
	ArrayList<CommunityDTO> al = commudao.select();
	%>
	
	<!-- Header -->
					<header id="header">
						<div style="margin-left: 700px;"
						class="inner" >
							
							
							<!-- Logo -->
							
								<a href="main.jsp" class="logo" style="text-align:center;">
									<span class="symbol"><img style = 'margin-left:300px;'src="images/hehe.png" alt=""/>
									</span><span class="title" style = 'font-size:80px'>WEB & PT</span>
								</a>
							
<nav style = 'right:0'>
									<ul>
										<li><a href="#menu">Menu</a></li>
									</ul>
								</nav>

						</div>
					</header>
					
					
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
	
	
	
	<div>
		<!-- Header -->
					<header id="header" style = "padding-left: -500px;">
						<div class="inner" >

							<!-- Logo -->
							<div style="text-align:center">
								<a href="main.jsp" class="logo" style="">
									<span style = "font-size:80px" >커뮤니티</span>
								</a>
							</div>
							<div id="commutable" style="text-align:center;">
								<a href="CommunityWrite.jsp" style="border-bottom:dotted 1px rgba(255, 255, 255, 0.5)"><button id="writer">글쓰기</button></a>
								<br>
								<br>
								<table style="width:1500px; text-align:center;">
									<tr>
										<td>번호</td>
										<td>제목</td>
										<td>아이디</td>
										<td>날짜</td>
									</tr>
									<%
									for(int i = 0; i<al.size(); i++){
									%>
									<tr>
										<td><%= i+1 %></td>
										<td><a href="CommunityView.jsp?num=<%=al.get(i).getNum()%>"><%= al.get(i).getTitle()%></a>  </td>
										<td><%= al.get(i).getId() %></td>
										<td><%= al.get(i).getDay() %></td>
									</tr>
									<%} %>
								</table>
								
						
							</div>
							</div>
		

		
	</div>
	
	
	
	
</body>
</html>