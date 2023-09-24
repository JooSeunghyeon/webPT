<%@page import="com.google.gson.Gson"%>
<%@page import="com.google.gson.JsonArray"%>
<%@page import="com.google.gson.JsonObject"%>
<%@page import="model.calendarDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="model.calendarDAO"%>
<%@page import="model.memberDTO"%>
<%@page import="model.memberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
	<%
		String userId = request.getParameter("userId");
		Gson gson = new Gson();
		calendarDAO dao = new calendarDAO();
		ArrayList<calendarDTO> arr = dao.select(userId);
		String result = gson.toJson(arr);
		out.print(result);
	%>