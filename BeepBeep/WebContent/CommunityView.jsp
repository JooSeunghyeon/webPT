<%@page import="model.CommentDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="model.memberDTO"%>
<%@page import="model.CommunityDAO"%>
<%@page import="model.CommunityDTO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>

	<title>커뮤니티 작성글</title>
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
		<link rel="stylesheet" href="assets/css/main.css" />
		<noscript><link rel="stylesheet" href="assets/css/noscript.css" /></noscript>
		
		<link rel="preconnect" href="https://fonts.gstatic.com">
<link href="https://fonts.googleapis.com/css2?family=Gothic+A1:wght@600&display=swap" rel="stylesheet">







<style>


@font-face {
    font-family: 'twayair';
    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_tway@1.0/twayair.woff') format('woff');
    font-weight: normal;
    font-style: normal;
}

body, input {
	font-family:'twayair';
	font-size:30px;
}

.box-sizing{ height: 500px; }


		* {
  margin:0px;
  padding:0px;
  align:center;
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
	height:500px;
	width:500px;
	border:1px;
}
.
input {
margin:0 auto;
}


.list{
width:1800px;
margin-left:550px;
}

button{
	width:180px;
	height:80px;
	background-color:#FF8C24;
	font-size: 20px;	
	margin-left:1450px;
}

.commentbtn{
	width: 150px;
	height:80px;
	background-color:#FF8C24;
	font-size: 20px;
	align:center;
}

input[type=text] {
	height: 50px;
	width: 1200px;
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
			<link href="https://use.fontawesome.com/releases/v5.6.1/css/all.css" rel="stylesheet">
</head>
<body>
<%
int num = Integer.parseInt(request.getParameter("num"));

CommunityDAO commudao = new CommunityDAO();
CommunityDTO commudto = commudao.oneSelect(num);  //위에 인트로 받아온 num
memberDTO dto = (memberDTO)session.getAttribute("info");

ArrayList<CommentDTO> al2 = commudao.comment_select(num);

%>


	<div id = "community">
	
		<header id="header" style = "padding-left: -500px;">
						<div class="box-sizing"  align ="center">

							<!-- Logo -->
								<a href="main.jsp" class="logo">
									<span class="symbol"><img src="images/mainimage.png" alt="" style="width: 500px; height: 500px;" /></span>
								</a>
						</div>			
				<div>				
				<table class="list" border="1px" align="center">
					<tr>
						<td>제목</td>
						<td><%= commudto.getTitle() %></td>
					</tr>
					<tr>
						<td>아이디</td>
						<td><%= commudto.getId() %></td>
					</tr>
					<tr>
						<td colspan="2">내용</td>
					</tr>
					<tr>
						<td colspan="2">
							<img src="community\<%= commudto.getFilename() %>">
							<%= commudto.getContent() %>
						</td>
					</tr>
					<tr>
						<td colspan="2"><a href="Community.jsp" style="border-bottom:dotted 1px rgba(255, 255, 255, 0.5)"><button>뒤로가기</button></a></td>
					</tr>
				</table>
				</div>
			
			
			
			<!-- 댓글 출력 -->
			<div>
		<table class="list" border = "1px" align = "center">
			<tr>
				<td>아이디</td>
				<td align="center">내용</td>
				<td align="center">날짜</td>
				<td></td>
			</tr>
			<%
			for(int i = 0; i<al2.size(); i++){
			%>
			<tr>
				<td><%= al2.get(i).getComment_id() %></td>
				<td align="center"><%= al2.get(i).getComment_content() %></td>
				<td align="center"><%= al2.get(i).getComment_date() %></td>
				<td>
				<%if(dto.getId().equals(al2.get(i).getComment_id())){%>
					 <form action="CommentDelete">
					<input type="hidden" name="community_num" value="<%=num %>">
					<input type="hidden" name="comment_num" value="<%=al2.get(i).getComment_num() %>">
					<input class="commentbtn" type="submit" value="삭제">
					</form> 
				<% }%></td>
			</tr>
			<%} %>
		</table>
		
		
	</div>
			
			
			
			
			<!-- 댓글입력란 -->
			<div>
			<form action="Comment" method="post">
			<table class="list" border="1">
			<tr> <td> <input type="hidden" name="community_num" value="<%=num %>"> </td>
			<td align="left"> <input type="text" name="comment_content"> </td> 
			<td align="left"><input type="submit" value="등록"></td>
			</tr>
			</table>
			</form>
			
			
			</div>
			
			
			
			
			
</body>
</html>