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


@WebServlet("/join")
public class join extends HttpServlet {
	private static final long serialVersionUID = 1L;

	
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("EUC-kr");
		
		String id = request.getParameter("id");
		String pw = request.getParameter("pw");
		String name = request.getParameter("name");
		int age = Integer.parseInt(request.getParameter("age"));
		int gender = Integer.parseInt(request.getParameter("gender"));
		String target = request.getParameter("target");
		String tel = request.getParameter("tel");
		float height = Float.parseFloat(request.getParameter("height"));
		float weight = Float.parseFloat(request.getParameter("weight"));
		
		
		memberDAO memberdao = new memberDAO();
		
		int cnt = memberdao.join(id, pw, name, age, gender, target, tel, height, weight);
		
		if(cnt>0) {
			System.out.println("회원가입 성공");
			response.sendRedirect("Login.jsp");
		}else {
			System.out.println("회원가입 실패");
			response.sendRedirect("Join.jsp");
		}
		
	
		
	}

}
