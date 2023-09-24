<%@page import="java.net.URLEncoder"%>
<%@page import="model.memberDTO"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
		<title>Generic - Phantom by HTML5 UP</title>
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
		<link rel="stylesheet" href="assets/css/main.css" />
		<noscript><link rel="stylesheet" href="assets/css/noscript.css" /></noscript>
		<link href="https://use.fontawesome.com/releases/v5.6.1/css/all.css" rel="stylesheet">
		<link rel="preconnect" href="https://fonts.gstatic.com">
<link href="https://fonts.googleapis.com/css2?family=Gothic+A1:wght@600&display=swap" rel="stylesheet">







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
  background-color: #ccc;
  background-position: center center;
  background-repeat: no-repeat;
  background-size: cover;
  border-radius:50%;
}

.profiles{
  width:100%;
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
	border-radius:50%;
}
.
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


%>

		<!-- Wrapper -->
			<div id="wrapper">

				<!-- Header -->
					<header id="header" style = "padding-left: -500px;">
						<div class="inner" style = "width:1200px; ">

							<!-- Logo -->
								<a href="main.jsp" class="logo">
									<span class="symbol"><img src="images/mainimage.png" alt="" /></span>
									<span class="title">Only <%= dto.getName()%>'s Page<span>
								</a>

							<!-- Nav 옆에 세줄로 된 메뉴바 -->
								<nav>
									<ul>
										<li><a href="#menu">Menu</a></li>
									</ul>
								</nav>

						</div>
					</header>

				<!-- Menu -->
					<nav id="menu">
						<h2>Menu</h2>
						<ul>
							<li><a href="main.jsp">메인화면으로</a></li>
							<li><a href="video.jsp">영상</a></li>
							<li><a href="recommend.jsp">식단추천</a></li>
							<li><a href="meal.jsp">식단</a></li>
							<li><a href="calTest.jsp">캘린더</a></li>
						</ul>
					</nav>
					
	<!-- 회원정보칸 -->
	
<div class="back_profile" style="background-color: ghostwhite;">
  <div class="back_img" style="background-image: url('http://file.trip-term.com:81/bamboo.jpg')"></div>
  <p>ㅤ</p>
<div class="profile_page">
  <div class="profile_bar">
    <div class="profile_img">
      <span class="p_img" style="background-image: url('http://file.trip-term.com:81/sample.jpg">
      <img src ="profile/<%=dto.getProfile()%>" onerror = "this.src = 'images/dog.jpg'">
      </span>
    </div>
    <div class="profiles">
      <div class="profile_detail">
        <h3>현재 몸무게 : <%=dto.getWeight() %></h3>
        <div class="profiles">
        <h3>목표 : <%= dto.getTarget()  %></h3><br>
        <h3>목표까지! <%= Integer.parseInt(dto.getTarget()) -dto.getWeight() %></h3><br>
          <p><%
          if(dto.getCategory().equals("0")){
      		out.print("<h3>Type : 벌크업</h3>");
      	} else if(dto.getCategory().equals("3")){
      		out.print("<h3>Type : 다이어트</h3>");
      	}
          %></p>
        </div>
      </div>
    </div>
  </div>
      <p>ㅤ</p>
  <div class="user_data">
    <div class="user_basic_header">
    </div>

    <div class="user_basic">
      <div style = 'height:500px;' class="user_category">
        <ul>
          <li id="h_category1" onclick="change_category('h_category1','h_detail1')">개인정보</li>
          <li id="h_category2" onclick="change_category('h_category2','h_detail2')">회원정보</li>
          <li id="h_category3" onclick="change_category('h_category3','h_detail3')">나의상태</li>
        </ul>
      </div>
      <div style = 'height:500px;' class="user_detail">
        <div id="h_detail1">
          <div class="user_detail_head">ID
            <span class="edit_detail"><%= dto.getId() %></span>
          </div>
          <div class="user_detail_head">PW
            <span class="edit_detail"><%= dto.getPw() %></span>
          </div>
        </div>  
        <div id="h_detail2">
          <div class="user_detail_head">몸무게
            <span class="edit_detail"><%= dto.getWeight() %></span>
          </div>
          <div class="user_detail_head">키
            <span class="edit_detail"><%= dto.getHeight() %></span>
          </div>
        </div>
         <div id="h_detail3">
          <div class="user_detail_head">나의 상태 <!-- //-> 그룹 이름 유지어터 -->
            <span class="edit_detail"><%
            	if(dto.getCategory().equals("0")){
            		out.print("벌크업이 필요해요!");
            	} else if(dto.getCategory().equals("3")){
            		out.print("다이어트가 필요해요!");
            	}
            %></span>
          </div>
          <div class="user_detail_head"><!-- if문 돌려서 그룹2개 다이어터, 벌크업 -> 다이어트 = 과체중, 벌크업 = 저체중 단어가 뜨게-->  
            <span class="edit_detail"><%
            		if(dto.getCategory().equals("0")){
                		out.print("저체중");
                	} else if(dto.getCategory().equals("3")){
                		out.print("과제충");
                	}
            %></span>
          </div>
          <div class="user_detail_head">목표몸무게 <!-- 본인이 이루고 싶은 몸무게..받아와야하지 않나 회원가입에서 받아오기-->
            <span class="edit_detail"><%= dto.getTarget() %></span>
          </div>
          <div class="user_detail_head">현재BMI지수 <!-- 몸무게와 키를 받아와서 보여주기 -->
            <span class="edit_detail"><%= dto.getWeight()/(dto.getHeight()/100)*(dto.getHeight()/100) %></span>
          </div>
        </div>
        <div id="h_detail4">
          <div class="user_detail_head">
            <span class="edit_detail"></span>
          </div>
          <div class="user_detail_head">
            <span class="edit_detail"></span>
          </div>
          <div class="user_detail_head">
            <span class="edit_detail"></span>
          </div>
          <div class="user_detail_head">
            <span class="edit_detail"></span>
          </div>
          <div class="user_detail_head">
            <span class="edit_detail"></span>
          </div>
        </div>
      </div>
    </div>
  </div>
  <p>ㅤ</p>
  <div>
      <button style = 'font-size:30px; margin-left:150px;'><a href="logout">로그아웃</a></button>
      <button style = 'font-size:30px; margin-left:100px;'><a href="mypage_update22222.jsp">정보 수정</a></button>
  </div>
</div>
  <div class="temporary_footer"></div>
</div>

<div class="icon_bar">
  <span><i id="h_footer" onclick="change_menu('h_footer','main_body1');" class="fas fa-home f_icon"></i></span>
  <span><i id="s_footer" onclick="change_menu('s_footer','main_body2');" class="fas fa-map-marked-alt f_icon"></i></span>
  <span><i class="fas fa-heart f_icon"></i></span>
  <span><i id="m_tab" class="fas fa-user f_icon"></i></span>
</div>
			
			
			
				<!-- Footer -->
					<footer id="footer">
						<div class="inner" >
							<section>
								<h2>불편사항을 적어주세요</h2>
								<form method="post" action="#">
									<div class="fields">
										<div class="field half">
											<input style = 'font-size:30px' type="text" name="name" id="name"  placeholder=<%= dto.getId() %> />
										</div>
										<div class="field half">
											<input style = 'font-size:30px' type="email" name="email" id="email" placeholder="제목" />
										</div>
										<div class="field">
											<textarea style = 'font-size:30px; margin-bottom:10px;' name="message" id="message" placeholder="내용"></textarea>
										</div>
									</div>
									<ul class="actions">
										<li><input type="submit" value="전송" class="primary" /></li>
									</ul>
								</form>
							</section>
							<section>
								<h2>pt 소셜</h2>
								<ul class="icons">
									<li><a href="#" class="icon brands style2 fa-twitter"><span class="label">Twitter</span></a></li>
									<li><a href="#" class="icon brands style2 fa-facebook-f"><span class="label">Facebook</span></a></li>
									<li><a href="#" class="icon brands style2 fa-instagram"><span class="label">Instagram</span></a></li>
									<li><a href="#" class="icon brands style2 fa-dribbble"><span class="label">Dribbble</span></a></li>
									<li><a href="#" class="icon brands style2 fa-github"><span class="label">GitHub</span></a></li>
									<li><a href="#" class="icon brands style2 fa-500px"><span class="label">500px</span></a></li>
									<li><a href="#" class="icon solid style2 fa-phone"><span class="label">Phone</span></a></li>
									<li><a href="#" class="icon solid style2 fa-envelope"><span class="label">Email</span></a></li>
								</ul>
							</section>
							<ul class="copyright">
							</ul>
						</div>
					</footer>

			</div>

		<!-- Scripts -->
			<script src="assets/js/jquery.min.js"></script>
			<script src="assets/js/browser.min.js"></script>
			<script src="assets/js/util.js"></script>
			<script src="assets/js/main.js"></script>


</body>
</html>