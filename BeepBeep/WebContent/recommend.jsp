<%@page import="java.net.URLEncoder"%>
<%@page import="java.net.URLDecoder"%>
<%@page import="model.memberDTO"%>
<%@page import="model.foodDTO"%>
<%@page import="model.foodDAO"%>
<%@page import="controller.youtube"%>
<%@page import="java.util.Random"%>
<%@page import="model.memberDTO"%>
<%@page import="model.youtubeDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="model.youtubeDAO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
   pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<title>Generic - Phantom by HTML5 UP</title>
<meta charset="utf-8" />
<meta name="viewport"
   content="width=device-width, initial-scale=1, user-scalable=no" />
<link rel="stylesheet" href="assets/css/main.css" />
<noscript>
   <link rel="stylesheet" href="assets/css/noscript.css" />
</noscript>


<title>Ÿ��Ʋ-����</title>
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

body {
	font-family:'twayair';
	font-size:30px;
}

input {
   font-family:'ROKABold';
   font-size:30px;
   color : white;
}



img{
width : 200px;
height:200px;}

.test{
font-size: 21px;
padding:0 0.75em 0.75em 0.75em;
text-align: center;
        animation-name: big;
        animation-duration: 2s;
        animation-timing-function: linear;
        animation-delay: 2s;
        animation-iteration-count: 4;
        animation-direction: alternate;
        animation-fill-mode: none;
        animation-play-state: running;
}

table tr>td{
    vertical-align: middle;
    }
.ass {
   list-style-type: none;
   margin: 0;
   padding: 0;
   background-color: white;

.ass:after {
   content: '';
   display: block;
   clear: both;
}

li {
   float: left;
}

li a {
   color: white;
   text-align: center;
   padding: 14px 16px;
   text-decoration: none;
}

li a:hover:not(.active) {
   background-color: #111;
}

.active:hover {
   background-color: #4CAF50;
>>>>>>> branch 'master' of https://github.com/2021-SMHRD-KDT-Bigdata-3/WepPT.git
}
</style>
</head>
<body>
   


   <!-- Wrapper -->
   <div id="wrapper">

      <!-- Header -->
      <header id="header" style='margin-top:20px'>
         <div class="inner">

            <!-- Logo -->
            <a href="main.jsp" class="logo"> <span class="symbol"><img style = 'margin-left:500px;'
                  src="images/hehe.png" alt="" /></span><span style = 'font-size:100px;'class="title">Web & PT</span>
            </a><h1  style = 'margin-left:600px;'>�� �� ��  �� �� ���� õ</h1>
               <h3 style = 'margin-left:620px;'> �� �� �̸� Ŭ���� ���� �˴ϴ�.</h3>
               <h3 style = 'margin-left:620px;'> �� ��ǰ �̸� Ŭ���� ����Ʈ�� �̵��˴ϴ�.</h3>
            <!-- Nav -->
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
            <li><a href="main.jsp">����ȭ������</a></li>
            <li><a href="video.jsp">����</a></li>
            <li><a href="recommend.jsp">�Ĵ���õ</a></li>
            <li><a href="meal.jsp">�Ĵ�</a></li>
            <li><a href="calTest.jsp">Ķ����</a></li>
         </ul>
      </nav>

          <script src = "JS/jquery-3.6.0.js"></script>
    <script src = "JS/jquery-ui.js"></script>
    <script>
       function None() {
       $('img').each(function(){ //�̹����� �迭�� ���·� ������ ---> for���� ���鼭 �ϳ��� �̾ƿ���
         $(this).on('error',function(){
            $('.temp01').closest('.row').hide(); //closest-> �θ��Ҹ� css�����ڸ� Ȱ���ؼ� ������ �� �ִ� ���
            $('.temp11').closest('.row').hide(); //closest-> �θ��Ҹ� css�����ڸ� Ȱ���ؼ� ������ �� �ִ� ���
            $('.temp21').closest('.row').hide(); //closest-> �θ��Ҹ� css�����ڸ� Ȱ���ؼ� ������ �� �ִ� ���
            $('.temp31').closest('.row').hide(); //closest-> �θ��Ҹ� css�����ڸ� Ȱ���ؼ� ������ �� �ִ� ���
            $('.temp41').closest('.row').hide(); //closest-> �θ��Ҹ� css�����ڸ� Ȱ���ؼ� ������ �� �ִ� ���
            //������ �𸣰ڴµ� 11,21,31,41 �̷��� ������ ���ϱ淡 �׳� �� ������ �����
            //���۾��ϴ� ������ �� ã�ƺ��� �� �� ������ �ϴ� �ذ�!
            $(this).closest('.row').hide();
            });
          });
       }
    
    </script>
<%
   memberDTO dto = (memberDTO)session.getAttribute("info");

   String category;
   if(dto.getCategory().equals("0")){
      category = "desc";
   }else{
      category = "asc";
   }


   foodDAO dao = new foodDAO();
   ArrayList<foodDTO> arr = dao.getFood_info(category);
   String link = "img/";
%>
<!-- Wrapper -->
         <div id="wrapper">

            <!-- Header -->
               <header id="header">
                  <div class="inner" style = 'height:50px;'>
                     
                        

    <table id = "testTable" class="sortable" border="1px">
    <thead>
        <tr>
            <th style = 'font-size:40px' class="test">�̹���</th>
            <th style = 'font-size:40px' class="test">��ǰ�̸�</th>
            <th style = 'font-size:40px' class="test">Į�θ�(Kcal)</th>  
            <th style = 'font-size:40px' class="test">ź��ȭ��(g)</th>
            <th style = 'font-size:40px' class="test">�ܹ���(g)</th>
            <th style = 'font-size:40px' class="test">����(g)</th>
        </tr>
    </thead>
    <tbody>    
            <%for(int i = 0; i < arr.size(); i++){ 
            %>
            <tr class = 'row' style = 'display: table-row !important;'>
               <td>
                     <img src= "<%=link + arr.get(i).getProduct_name() + ".jpg"%>" onerror = 'None()' class = <%= "temp"+i+1 %>>
               </td>
               <td><a href = "https://search.shopping.naver.com/search/all?where=all&frm=NVSCTAB&query=<%=URLEncoder.encode(arr.get(i).getProduct_name(), "utf-8")%>"><%=arr.get(i).getProduct_name()%></a></td>
               <td><%=arr.get(i).getProduct_cal()%></td>
               <td><%=arr.get(i).getProduct_carb()%></td>
               <td><%=arr.get(i).getProduct_prot()%></td>
               <td><%=arr.get(i).getProduct_fat()%></td>
            </tr>
            <%}%>
            </tbody>
    </table>
       <script src = "JS/jquery-3.6.0.js" type="text/javascript"></script>
    <script>
    var num = 0;
    const getCellValue = (tr, idx) => tr.children[idx].innerText || tr.children[idx].textContent;

    const comparer = (idx, asc) => (a, b) => ((v1, v2) => 
        v1 !== '' && v2 !== '' && !isNaN(v1) && !isNaN(v2) ? v1 - v2 : v1.toString().localeCompare(v2)
        )(getCellValue(asc ? a : b, idx), getCellValue(asc ? b : a, idx));

   document.querySelectorAll('th').forEach(th => th.addEventListener('click', (() => {
           num += 1;
        const table = th.closest('table');
        Array.from(table.querySelectorAll('tr:nth-child(n+2)'))
            .sort(comparer(Array.from(th.parentNode.children).indexOf(th), this.asc = !this.asc))
            .forEach(tr => table.appendChild(tr) );
        th.onclick = function(){
           if(num % 2 == 0){
           th.style.fontWeight = "bolder";
           } else{
              th.style.backgroundColor == "blue";
           }
        };
    })));
    
  /* let th = document.getElementsByclassName("test");
   th.onclick = function(){
      th.style.backgroundColor = "blue";
   } */
    </script>

      </div>

   
   <!-- Scripts -->
   <script src="assets/js/jquery.min.js"></script>
   <script src="assets/js/browser.min.js"></script>
   <script src="assets/js/breakpoints.min.js"></script>
   <script src="assets/js/util.js"></script>
   <script src="assets/js/main.js"></script>


</body>
</html>