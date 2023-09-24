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
		 * if ( cnt > 0) { System.out.println("����");
		 * response.sendRedirect("calendar.jsp"); }else { System.out.println("����");
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
		 * // gson library // [[ �ڹ� ��ü������ �ڷ��� ]] �� json������ �ٲ��� �� �ִ� ����� ���� ���̺귯�� Gson
		 * gson = new Gson();
		 * 
		 * // �������� �����͸� �������ְ� �ʹٸ�? // ArrayList�� �������! ArrayList<calendarDTO> list = new
		 * ArrayList<calendarDTO>();
		 * 
		 * // ����Ʈ �߰� list.add(new calendarDTO(title, start, end, desc, type, user,
		 * color));
		 * 
		 * // json �ڷᱸ���� �����ϴ� ��� // gson.toJson(json������ �����ϰ� ���� �����͸� �ִ´�. ��, ��ü���·�)
		 * String result = gson.toJson(list);
		 * 
		 * // ��û�� �����ַ��� �ʿ��� ��ü ���� PrintWriter out = response.getWriter();
		 * 
		 * // json : "" �ȿ� "�� �ֱ� ���ؼ� \�� �ݵ�� �տ� �ٿ���� �Ѵ�. out.print(result);
		 * 
		 */
		
		
		
		
		
	
	}

}
