package controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.google.gson.Gson;

import model.calendarDAO;
import model.calendarDTO;
import model.memberDTO;
import model.youtubeDTO;
@WebServlet("/calendar")
public class calendar extends HttpServlet {
	private static final long serialVersionUID = 1L;
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

	
	
		request.setCharacterEncoding("UTF-8");
	
		HttpSession session = request.getSession();
		memberDTO dto = (memberDTO)session.getAttribute("info");
		
		String title = request.getParameter("edit-title");
		String start = request.getParameter("start").substring(2, 10).replace("-", "/");
		String end = request.getParameter("end").substring(2, 10).replace("-", "/");
		String desc= request.getParameter("edit-desc");
		String type = request.getParameter("edit-type");
		String user = dto.getId();
		String color = request.getParameter("color");
		
		System.out.println(user);
	
		
	    calendarDTO cal_dto = new calendarDTO(title, start, end, desc, type, user, color);
		
		calendarDAO cal_dao = new calendarDAO();
		
		/*
		 * int cnt = cal_dao.add(cal_dto);
		 * 
		 * if ( cnt > 0) { System.out.println("구웃");
		 * response.sendRedirect("calendar.jsp"); }else { System.out.println("베드");
		 * response.sendRedirect("calendar.jsp");
		 * 
		 * }
		 */
		Gson gson = new Gson();
		
		ArrayList<calendarDTO> list = cal_dao.calendar_select(user);
		
		String result = gson.toJson(list);
		
		PrintWriter out = response.getWriter();
		
		out.print(result);
		
		
		response.sendRedirect("calendar.jsp");
		
		
		
		
		
		
		
		/*
		 * response.setCharacterEncoding("utf-8");
		 * 
		 * // gson library // [[ 자바 객체형태의 자료형 ]] 을 json구조로 바꿔줄 수 있는 기능을 가진 라이브러리 Gson
		 * gson = new Gson();
		 * 
		 * // 여러명의 데이터를 전송해주고 싶다면? // ArrayList를 사용하자! ArrayList<calendarDTO> list = new
		 * ArrayList<calendarDTO>();
		 * 
		 * // 리스트 추가 list.add(new calendarDTO(title, start, end, desc, type, user,
		 * color));
		 * 
		 * // json 자료구조로 변경하는 방법 // gson.toJson(json구조로 변경하고 싶은 데이터를 넣는다. 단, 객체형태로)
		 * String result = gson.toJson(list);
		 * 
		 * // 요청을 돌려주려면 필요한 객체 생성 PrintWriter out = response.getWriter();
		 * 
		 * // json : "" 안에 "를 넣기 위해서 \를 반드시 앞에 붙여줘야 한다. out.print(result);
		 * 
		 */
		
		
		
		
		
	
	}

}
