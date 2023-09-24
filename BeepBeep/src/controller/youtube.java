package controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.catalina.connector.Response;

import model.memberDTO;
import model.youtubeDAO;
import model.youtubeDTO;

public class youtube {
	
	
	
	HttpServletRequest request;
	HttpServletResponse response;
	HttpSession session;
	String get_part;
	youtubeDAO dao;
	memberDTO get_dto;
	ArrayList<youtubeDTO> al;
	
	public youtube(HttpServletRequest request, HttpSession session) {
		this.request = request;
		this.session = session;
		get_part = request.getParameter("part");
		dao = new youtubeDAO();
		get_dto = (memberDTO)session.getAttribute("info");
		al = dao.select(get_dto.getGender(), get_part);
	}
	public ArrayList<youtubeDTO> getAl() {
		return al;
	}

	
	
	

}
