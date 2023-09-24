package controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.CommunityDAO;

@WebServlet("/CommunityDelete")
public class CommunityDelete extends HttpServlet {
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int community_num = Integer.parseInt(request.getParameter("community_num"));
		
		CommunityDAO dao = new CommunityDAO();
		int cnt = dao.delCommunity(community_num);
		
		if(cnt > 0) {
			System.out.println("게시글 삭제 성공");
			response.sendRedirect("Community.jsp");
		} else {
			System.out.println("게시글 삭제 실패");
			response.sendRedirect("Community.jsp");
		}
	}

}
