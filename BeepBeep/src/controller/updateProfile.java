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

@WebServlet("/updateProfile")
public class updateProfile extends HttpServlet {
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 프로필 사진 수정
				String savePath = request.getServletContext().getRealPath("profile");
				int maxSize = 5 * 1024 * 1024;
				String encoding = "euc-kr";
				
				MultipartRequest multi = new MultipartRequest(request, savePath, maxSize, encoding, new DefaultFileRenamePolicy());
				String fileName = URLEncoder.encode(multi.getFilesystemName("fileName"), "euc-kr");
				
				HttpSession session = request.getSession();
				memberDTO dto = (memberDTO)session.getAttribute("info");
				String afterPath = "C:\\Users\\smhrd\\git\\Beep\\BeepBeep\\WebContent\\profile\\";
				memberDAO dao = new memberDAO();
				int cnt = dao.updateProfile(dto.getId(), fileName);
				if(cnt > 0) {
					response.sendRedirect("mypage.jsp");
					dto.setProfile(fileName);
					System.out.println("프로필 사진 변경 완료");
					dao.copyProfile(savePath + "\\" + fileName, afterPath + fileName);
					System.out.println(savePath + "\\" + fileName);
					System.out.println(afterPath + fileName);
				} else {
					response.sendRedirect("mypage_update.jsp");
					System.out.println("프로필 사진 변경 실패");
				}
	}

}
