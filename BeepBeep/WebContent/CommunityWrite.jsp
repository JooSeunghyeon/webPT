<%@page import="model.memberDTO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<link rel="stylesheet" href="assets/css/main.css" />
<noscript>
	<link rel="stylesheet" href="assets/css/noscript.css" />
</noscript>
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, user-scalable=no" />
<style>
@font-face {
	font-family: 'twayair';
	src:
		url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_tway@1.0/twayair.woff')
		format('woff');
	font-weight: normal;
	font-style: normal;
}

body {
	font-family: 'twayair';
	font-size: 30px;
	align: 'center';
}

.back_profile {
	width: 100%;
	position: relative;
}

.back_img {
	width: 100%;
	height: 100%;
	display: inline-block;
	background-color: #ccc;
	background-position: center center;
	background-repeat: no-repeat;
	background-size: cover;
}

.profile_page {
	max-width: 900px;
	width: 100%;
	height: auto;
	margin: 20px auto;
}

.profile_bar {
	display: flex;
	width: 90%;
	max-height: 200px;
	margin-left: 5%;
}

.profile_img {
	position: relative;
	width: 50%;
}

.profile_img:before {
	content: "";
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
	border-radius: 50%;
}

.profiles {
	width: 100%;
	margin-bottom: 50px;
}

.profile_detail {
	max-height: 100px;
	height: 100%;
	margin: auto 0;
}

.profiles {
	display: flex;
}

.profiles p {
	margin: 10px;
}

.user_data {
	width: 90%;
	height: auto;
	margin: 0 5%;
	border: 2px solid #ccc;
}

.user_basic_header {
	background-color: #eee;
	width: 100%;
	height: 5vh;
	border-bottom: 1px solid #ccc;
}

.user_basic_header h2 {
	margin-left: 3%;
	padding: 1vh 0;
}

.user_basic {
	background-color: #eee;
	width: 100%;
	height: auto;
	display: flex;
}

.user_category {
	background-color: #fff;
	width: 30%;
	height: auto;
	min-height: 50vh;
	border-right: 1px solid #ccc;
}

.user_category ul {
	margin-top: 5%;
}

.user_category li {
	list-style: none;
	padding: 5%;
}

.user_detail {
	background-color: #fff;
	width: 70%;
	height: auto;
	min-height: 50vh;
	font-size: 0.8em;
}

.user_detail_head {
	width: 90%;
	height: 3vh;
	margin: 5%;
	border-bottom: 1px solid #ccc;
}

.edit_detail {
	float: right;
}

.fav_page {
	width: 100%;
	height: 100vh;
}

.plan_page {
	width: 100%;
	height: 100vh;
}

.active_category {
	border-left: 3px solid orange;
	font-weight: bold;
}

.icon_bar {
	position: fixed;
	width: 100%;
	height: 7%;
	bottom: 0;
	left: 0;
	background-color: #eee;
	border-top: 1px solid #eee;
}

.f_icon {
	margin-left: 16%;
	font-size: 1.5em;
}

.active_icon {
	color: orange;
}

.temporary_footer {
	width: 100%;
	height: 200px;
}

@media screen and (min-width:768px) {
	.profile_detail {
		margin: 5% 30px;
	}
	.profile_bar {
		margin-bottom: 20px;
	}
	.profile_img {
		position: relative;
		width: 30%;
	}
}

@media screen and (min-width:960px) {
	.profile_detail {
		margin: auto 30px;
	}
	.edit_profile:hover {
		color: orange;
	}
	.user_category li:hover {
		cursor: pointer;
		opacity: 0.7;
	}
	.edit_detail:hover {
		cursor: pointer;
		color: orange;
	}
	.icon_bar {
		display: none;
	}
}

img {
	height: 200px;
	width: 200px;
	border: 1px;
	border-radius: 100%;
	margin-left: 550px;
}

#por {
	margin-bottom: 40px;
}

table {
	margin-left: auto;
	margin-right: auto;
	width: 1800px;
}

textarea {
	width: 100%;
	height: 700px;
	padding: 10px;
	box-sizing: border-box;
	font-size: 30px;
	resize: both;
}

input {
	border: 0;
	height: 50px;
	width: 600px;
}

.btn-file {
	position: relative;
	overflow: hidden;
	border-style: outset;
	line-height: 50px;
}

.btn-file input[type=file] {
	position: absolute;
	top: 0;
	right: 0;
	min-width: 100%;
	min-height: 100%;
	font-size: 100px;
	text-align: right;
	filter: alpha(opacity = 0);
	opacity: 0;
	outline: none;
	background: white;
	cursor: inherit;
	display: block;
}

label, input[type=file] {
	display: inline-block;
	width: 200px;
	height: 50px;
	border: 3px;
}

.ver{display:table-cell; vertical-align:middle;}


</style>

<script>
	window.addEventListener("DOMContentLoaded",
			function() {
				document.getElementById("h_detail2").style.display = "none";
				document.getElementById("h_detail3").style.display = "none";
				document.getElementById("h_detail4").style.display = "none";
				document.getElementById("m_tab").classList.add("active_icon");
				document.getElementById("h_category1").classList
						.add("active_category");
			}, false);

	function change_category(sideLine, category) {
		document.getElementById("h_detail1").style.display = "none";
		document.getElementById("h_detail2").style.display = "none";
		document.getElementById("h_detail3").style.display = "none";
		document.getElementById("h_detail4").style.display = "none";
		document.getElementById(category).style.display = "";
		document.getElementById("h_category1").classList
				.remove("active_category");
		document.getElementById("h_category2").classList
				.remove("active_category");
		document.getElementById("h_category3").classList
				.remove("active_category");
		document.getElementById("h_category4").classList
				.remove("active_category");
		document.getElementById(sideLine).classList.add('active_category');
	}
</script>
</head>
<body>
	<%
	memberDTO dto = (memberDTO) session.getAttribute("info");
	%>
	<!-- Header -->
	<header id="header">
		<div style="margin-left: 300px;" class="inner">
			<!-- Logo -->
			<a href="main.jsp" class="logo"> <span class="symbol"> <img
					style='margin-left: 300px;' src="images/hehe.png" alt="" />
			</span> <span class="title" style='font-size: 80px'>WEB & PT</span>
			</a>
		</div>
	</header>

	<div>
		<!-- Header -->
		<header id="header" style="padding-left: -500px;">
			<div class="inner">

				<form action="Community" method="post" enctype="multipart/form-data">
					<div id="commutable">
						<table width=70% border="1px">
							<tr align="center" height="10px">
								<td width=10% class="ver">제목</td>
								<td width=40% class="ver" colspan="1"><input type="text" name="title"
									style="font-size: 40px;"></td>
								<td width=15% align="right" class="ver">작성자</td>
								<td width=15% align="center" class="ver"><%=dto.getId()%></td>

								<td width=20% style="word-break:break-all;"><label class="btn btn-primary btn-file ver"
									style="vertical-align: center; cursor: pointer;">파일추가 <input
										name="fileName" type="file" style="display: none;" class="ver"
										onchange="javascript:document.getElementById('fileName').value = this.value">
								</label>
								<input type="text" id="fileName" name="fileName" style="text-decoration: none;">
								</td>
							</tr>
						



							<tr align="center">
								<td colspan="5"><textarea name="content" rows="40"
										style="resize: none;"></textarea></td>
							</tr>
							<tr>
								<td colspan="5" align="center">
									<input class="icon" type="reset" value="초기화">
									<input class="icon" type="submit" value="저장하기">
								</td>
							</tr>
						</table>
				</form>

			</div>
	</div>
</body>
</html>