<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.sql.*,com.DiaryDB"%>

<%
	request.setCharacterEncoding("UTF-8");
	String username = request.getParameter("name");
	String id = request.getParameter("id");
	String pwd = request.getParameter("pwd");
	String tel = request.getParameter("tel");
	String birth = request.getParameter("birth");

	Connection conn = DiaryDB.connect();

	String sql ="insert into member(username, id, birth, phone, pwd) values(?,?,?,?,?)";
	PreparedStatement pstmt = conn.prepareStatement(sql);

	pstmt = conn.prepareStatement(sql);

	pstmt.setString(1, username);
	pstmt.setString(2, id);
	pstmt.setString(3, birth);
	pstmt.setString(4, tel);
	pstmt.setString(5, pwd);

	pstmt.executeUpdate();

	DiaryDB.disconnect(pstmt);
	DiaryDB.disconnect(conn);

	pageContext.forward("main.jsp");
%>