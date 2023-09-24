package controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.memberDAO;
import model.memberDTO;

@WebServlet("/login")
public class login extends HttpServlet {
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {


		request.setCharacterEncoding("euc-kr");
			
		String id = request.getParameter("id");
 		String pw = request.getParameter("pw");
			
		PrintWriter out = response.getWriter();
		
		memberDAO dao = new memberDAO();
		memberDTO get_dto = dao.login(id, pw);
		
		
		if ( get_dto != null) {
			System.out.println("로그인 성공");
			System.out.println(id);
			HttpSession session =  request.getSession();
			session.setAttribute("info", get_dto);
			response.sendRedirect("main.jsp");
		}else {
			System.out.println("로그인 실패");
			response.sendRedirect("Login.jsp");
			
		}
	
	}

}
