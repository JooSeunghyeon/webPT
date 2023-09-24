<%@page import="model.calendarDAO"%>
<%@page import="model.memberDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang = "ko">
<head>
<meta charset="UTF-8">
<title>캘린더</title>
<link href='test/packages/testCalendar/css/main.css' rel='stylesheet' />
<link href='test/packages/testCalendar/css/bootstrap.min.css' rel='stylesheet' />
<link href='test/packages/testCalendar/css/bootstrap-datetimepicker.min.css' rel='stylesheet' />
<link href='test/packages/testCalendar/css/fullcalendar.min.css' rel='stylesheet' />
<link href='test/packages/testCalendar/css/select2.min.css' rel='stylesheet' />

</head>
<body>

<%
memberDTO dto = (memberDTO)session.getAttribute("info");
%>

   <div class="container">
        <!-- 일자 클릭시 메뉴오픈 -->
        <div id="contextMenu" class="dropdown clearfix">
            <ul class="dropdown-menu dropNewEvent" role="menu" aria-labelledby="dropdownMenu"
                style="display:block;position:static;margin-bottom:5px;">
                <li><a tabindex="-1" href="#">근력운동</a></li>
                <li><a tabindex="-1" href="#">유산소운동</a></li>
                <li><a tabindex="-1" href="#">식단</a></li>
                <li><a tabindex="-1" href="#">오늘몸무게</a></li>
                <li class="divider"></li>
                <li><a tabindex="-1" href="#" data-role="close">닫기</a></li>
            </ul>
        </div>

        <div id="wrapper">
            <div id="loading"></div>
            <div id="calendar"></div>
        </div>

        <!-- 일정 추가 MODAL -->
        <div class="modal fade" tabindex="-1" role="dialog" id="eventModal">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
<form action = "calendar">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span></button>
                        <h4 class="modal-title"></h4>
                    </div>
                    <div class="modal-body">

                        <div class="row">
                            <div class="col-xs-12">
                                <label class="col-xs-4" for="edit-allDay">하루종일</label>
                                <input name = 'all' class='allDayNewEvent' id="edit-allDay" type="checkbox">
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-xs-12">
                                <label class="col-xs-4" for="edit-title">유저명</label>
                                <% System.out.println(dto.getId()); %>
                                <label class="col-xs-4" for="edit-title"><%=dto.getId() %></label>
                                
                            </div>
                        </div>

                        <div class="row">
                            <div class="col-xs-12">
                                <label class="col-xs-4" for="edit-title">일정명</label>
                                <input autofocus = "true" class="inputModal" type="text" name="edit-title" id="edit-title"
                                    required="required" />
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-xs-12">
                                <label class="col-xs-4" for="edit-start">시작</label>
                                <input name = 'start' class="inputModal" type="text" name="edit-start" id="edit-start" />
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-xs-12">
                                <label class="col-xs-4" for="edit-end">끝</label>
                                <input name = 'end' class="inputModal" type="text" name="edit-end" id="edit-end" />
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-xs-12">
                                <label class="col-xs-4" for="edit-type">구분</label>
                                <select name="edit-type" class="inputModal" type="text"  id="edit-type">
                                    <option value="근력운동">근력운동</option>
                                    <option value="유산소운동">유산소운동</option>
                                    <option value="식단">식단</option>
                                    <option value="오늘몸무게">오늘몸무게</option>
                                </select>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-xs-12">
                                <label class="col-xs-4" for="edit-color">색상</label>
                                <select name="color" class="inputModal"  id="edit-color">
                                    <option value="#D25565" style="color:#D25565;">빨간색</option>
                                    <option value="#9775fa" style="color:#9775fa;">보라색</option>
                                    <option value="#ffa94d" style="color:#ffa94d;">주황색</option>
                                    <option value="#74c0fc" style="color:#74c0fc;">파란색</option>
                                    <option value="#f06595" style="color:#f06595;">핑크색</option>
                                    <option value="#63e6be" style="color:#63e6be;">연두색</option>
                                    <option value="#a9e34b" style="color:#a9e34b;">초록색</option>
                                    <option value="#4d638c" style="color:#4d638c;">남색</option>
                                    <option value="#495057" style="color:#495057;">검정색</option>
                                </select>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-xs-12">
                                <label class="col-xs-4" for="edit-desc">설명</label>
                                <textarea name="edit-desc" rows="4" cols="50" class="inputModal" 
                                    id="edit-desc"></textarea>
                            </div>
                        </div>
                    </div>
                    <div class="modal-footer modalBtnContainer-addEvent">
                        <button type="button" class="btn btn-default" data-dismiss="modal">취소</button>
                        <input id ='set' type='submit' value ='저장'>
                       <!--  <button type="submit" class="btn btn-primary" id="save-event">저장</button> -->
                    </div>
</form>
                    <div class="modal-footer modalBtnContainer-modifyEvent">
                        <button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
                        <button type="button" class="btn btn-danger" id="deleteEvent">삭제</button>
                       <button type="button" class="btn btn-primary" id="updateEvent">저장</button>
                    </div>
                </div><!-- /.modal-content -->
            </div><!-- /.modal-dialog -->
        </div><!-- /.modal -->
        <div class="panel panel-default">

            <div class="panel-heading">
                <h3 class="panel-title">필터</h3>
            </div>

            <div class="panel-body">

                <div class="col-lg-6">
                    <label for="calendar_view">구분별</label>
                    <div class="input-group">
                        <select class="filter" id="type_filter" multiple="multiple">
                            <option value="근력운동">근력운동</option>
                            <option value="유산소운동">유산소운동</option>
                            <option value="식단">식단</option>
                            <option value="오늘몸무게">오늘몸무게</option>
                        </select>
                    </div>
                </div>

               <!--  <div class="col-lg-6">
                    <label for="calendar_view">등록자별</label>
                    <div class="input-group">
                        <label class="checkbox-inline"><input class='filter' type="checkbox" value="정연"
                                checked>test</label>
                        <label class="checkbox-inline"><input class='filter' type="checkbox" value="다현"
                                checked>test2</label>
                        <label class="checkbox-inline"><input class='filter' type="checkbox" value="사나"
                                checked>test3</label>
                        <label class="checkbox-inline"><input class='filter' type="checkbox" value="나연"
                                checked>test4</label>
                        <label class="checkbox-inline"><input class='filter' type="checkbox" value="지효"
                                checked>test5</label>
                    </div> -->
                </div>

            </div>
        </div>
        <!-- /.filter panel -->
   <!--  </div> -->
   
   
   
<!--  <script src = 'JS/jquery-3.6.0.js'></script>
 <script src = 'JS/jquery-ui.js'></script>
<script>
		$('#set').on('click', function(){
			
			$.ajax({
				url : 'calendar.java',
				// post 방식으로 json구조를 전송할때 에러가 뜨는 순간이 있을거다!
				// 이거 하나 써주기 : Json.tostringify ( 내가 전송할 json 구조 데이터)
				// 서버로부터 전송받은 데이터의 형식을 지정해주는 방법
				dataType : 'json', 
				success : function(res){
					alert('요청성공')
					// res -> json Array 형태로 구성이 되어있다.
					// res[i].name
					// $.each : for문 역할
					// 매개변수 2개, function의 매개변수도 두개 index, p(Person)
					// 배열을 열건데 기능을 쓸거야 모든방을 돌면서 두번째 매개변수 p에 들어갈거요
					
					//table에 자손 tr이 있는데 근접후행(+) tr 이하를 다 비워줄거야
				/* 	$('table tr+tr').empty(); // 내가 선택한 태그를 비우는
					$.each( res , function( index, p ){
						// res 배열 안에 있는 데이터가 하나씩 뽑히면서 p에 담긴다.
						// 이게 바로 each라는 기능
						// append : 선택한 태그 내부에 데이터를 추가하는 방법 (th 다음에 추가)
						$('table').append(
								'<tr><td>'+p.name
								+'</td><td>'+p.age
							    +'</td><td>'+p.gender
							    +'</td></tr>'
						);
					}) */
				},
				error : function(){
					alert('요청실패')
				}
			})
		
		})
</script>
 -->
 	<script src = 'JS/jquery-3.6.0.js'></script>
 
 
 
 
 <script>
    <!-- /.container -->
<script src = 'test/packages/testCalendar/js/jquery-3.6.0.js'></script>
<script src = 'test/packages/testCalendar/js/jquery-ui.js'></script>
<script src = 'test/packages/testCalendar/js/bootstrap.min.js'></script>
<script src='test/packages/testCalendar/js/moment.min.js'></script>
<script src='test/packages/testCalendar/js/fullcalendar.min.js'></script>
<script src='test/packages/testCalendar/js/ko.js'></script>
<script src='test/packages/testCalendar/js/select2.min.js'></script>
<script src='test/packages/testCalendar/js/bootstrap-datetimepicker.min.js'></script>

<script src='test/packages/testCalendar/js/addEvent.js'></script>
<script src='test/packages/testCalendar/js/editEvent.js'></script>
<script src='test/packages/testCalendar/js/main.js'></script>
<script src='test/packages/testCalendar/js/etcSetting.js'></script>
<script type="text/javascript">
   
	
	$(function getAll() {
		$.ajax({
			url : "ajaxTest.jsp",
			dataType : 'json',
			method : 'post',
			success : function(res){
				$.each(res, function(index, res){
					console.log(res)
				})
			}
		})
	})
	$(function() {

  $('#calendar').fullCalendar({
    defaultView: 'month',
    defaultDate: '2021-06-12',
    eventColor: 'green',
    
    events: [
      {
        title: 'All Day Event',
        start: '2021-06-01'
      },
      {
        title: 'Long Event',
        start: '2021-06-07',
        end: '2021-06-10',
        color: 'purple' // override!
      },
      {
        id: 999,
        title: 'Repeating Event',
        start: '2021-06-09T16:00:00'
      },
      {
        id: 999,
        title: 'Repeating Event',
        start: '2021-06-16T16:00:00'
      },
      {
        title: 'Conference',
        start: '2021-06-11',
        end: '2021-06-13',
        color: 'purple' // override!
      },
      {
        title: 'Meeting',
        start: '2021-06-12T10:30:00',
        end: '2021-06-12T12:30:00'
      },
      {
        title: 'Lunch',
        start: '2021-06-12T12:00:00'
      },
      {
        title: 'Meeting',
        start: '2021-06-12T14:30:00'
      },
      {
        title: 'Birthday Party',
        start: '2021-06-13T07:00:00'
      },
      {
        title: 'Click for Google',
        url: 'http://google.com/',
        start: '2021-06-28'
      }
    ]
  });

});
	/* $(function() {
	var calendarEl = document.getElementById('calendar');
	var calendar = new FullCalendar.Calendar(calendarEl, {
		events :  [
		    { // this object will be "parsed" into an Event Object
		        title: 'The Title', // a property!
		        start: '2021-06-24', // a property!
		        end: '2021-06-26' // a property! ** see important note below about 'end' **
		      }
		    ] */
			
			/*{url : 'ajaxTest.jsp',
			method : 'POST',
			extraParams: {
			      custom_param1: 'cal_color',
			      custom_param2: 'cal_description',
			      custom_param3: 'cal_start',
			      custom_param4: 'cal_end',
			      custom_param5: 'cal_id',
			      custom_param6: 'cal_textColor',
			      custom_param7: 'cal_title',
			      custom_param8: 'cal_type',
			      custom_param9: 'cal_user'
			    },
			    failure : function(){
			    	alert('there was an error while fetching events!');
			    }}*/
		
		 
/* });
	}); */
   </script>
   
   
  <script>
  

  
/*    $.ajax({
	url: 'calendar',
	success: function(res){
		var list = res;
		console.log(list);
	); */
		
	
  
  
  </script>
   
   
   
   
   
   
   
   
   
   
</body>
</html>