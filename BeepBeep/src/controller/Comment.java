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

@WebServlet("/Comment")
public class Comment extends HttpServlet {
       
	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		request.setCharacterEncoding("EUC-KR");

		String encoding = "EUC-KR";


		HttpSession session = request.getSession();
		memberDTO dto = (memberDTO)session.getAttribute("info");

		// �� �޾ƿ���
		String comment_id = dto.getId();
		String comment_content = request.getParameter("comment_content");
		int community_num = Integer.parseInt(request.getParameter("community_num"));
		
		// dto, dao ����
		CommentDTO commentdto = new CommentDTO(community_num, comment_id, comment_content);
		CommunityDAO commudao = new CommunityDAO();

		// daoȣ�� �� ���
		int cnt = commudao.CommentWrite(commentdto);

		if (cnt > 0) {
			System.out.println("��� �ۼ� ����VV");
			response.sendRedirect("CommunityView.jsp?num="+community_num);
		} else {
			System.out.println("��� �ۼ� ����");
		}

		
		
	}


}
