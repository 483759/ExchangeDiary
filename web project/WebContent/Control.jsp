<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"  import="WhiteNoise.dbconnection.*,java.util.*"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<%
	request.setCharacterEncoding("utf-8");
%>

<jsp:useBean id="dao" class="WhiteNoise.dbconnection.dao"/> 
<jsp:useBean id="dto" class="WhiteNoise.dbconnection.dto"/>
<jsp:setProperty name="dto" property="*"/> 
<% 
	// 컨트롤러 요청 파라미터
	String action = request.getParameter("action");

	// 파라미터에 따른 요청 처리
	// 주소록 목록 요청인 경우
	if(action.equals("main")) {
		pageContext.forward("main.html");
	}
	else if(action.equals("insert")) {		
		if(dao.insertDB(dto)) {
			response.sendRedirect("Control.jsp?action=main");
		}
		else
			throw new Exception("DB 입력오류");
	}
	else {
		out.println("<script>alert('action 파라미터를 확인해 주세요!!!')</script>");
	}
%>