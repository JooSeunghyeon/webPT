package controller;

import java.io.IOException;
import java.net.URLEncoder;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import model.memberDAO;
import model.memberDTO;

@WebServlet("/update")
public class update extends HttpServlet {
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("euc-kr");
		
		String pw = request.getParameter("pw");
		float weight = Integer.parseInt(request.getParameter("weight"));
		float height = Integer.parseInt(request.getParameter("height"));
		String target = request.getParameter("target");
		
		memberDAO dao = new memberDAO();
		HttpSession session = request.getSession();
		memberDTO dto = (memberDTO)session.getAttribute("info");
		
		
		int cnt = dao.update(dto.getId(), pw, weight, height, target);
		if(cnt > 0) {
			response.sendRedirect("mypage.jsp");
			dto.setTarget(target);
			dto.setPw(pw);
			dto.setHeight(height);
			dto.setWeight(weight);
			System.out.println("정보수정 완료");
		} else {
			response.sendRedirect("mypage_update.jsp");
			System.out.println("정보수정 실패");
		}
	}
		
}
