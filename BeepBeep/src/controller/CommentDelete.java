package controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.CommentDTO;
import model.CommunityDAO;
import model.memberDTO;

@WebServlet("/CommentDelete")
public class CommentDelete extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		request.setCharacterEncoding("EUC-KR");

		String encoding = "EUC-KR";
		
		HttpSession session = request.getSession();
		memberDTO dto = (memberDTO)session.getAttribute("info");
		CommunityDAO commudao = new CommunityDAO();
		int community_num = Integer.parseInt(request.getParameter("community_num"));
		int comment_num = Integer.parseInt(request.getParameter("comment_num"));
		
		
		int cnt = commudao.deleteComment(comment_num);
		if(cnt>0) {
			System.out.println("댓글삭제성공");
			response.sendRedirect("CommunityView.jsp?num="+community_num);
		}else {
			System.out.println("댓글삭제실패ㅡㅡ");
		}
	
	}

}
