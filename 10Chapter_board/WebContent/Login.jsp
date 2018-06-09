<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.sql.*,com.DiaryDB"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<%
	request.setCharacterEncoding("UTF-8");

	String id = request.getParameter("id");
	String pwd = request.getParameter("pwd");

	Connection conn = DiaryDB.connect();

	String sql = "select * from member where id = ?";
	PreparedStatement pstmt = conn.prepareStatement(sql);

	pstmt.setString(1, id);
	ResultSet rs = pstmt.executeQuery();
	String password;
	String name;
	rs.next();
	name = rs.getString("username");
	password = rs.getString("pwd");

	DiaryDB.disconnect(rs);
	DiaryDB.disconnect(pstmt);
	DiaryDB.disconnect(conn);

	if (password.equals(pwd)) { //로그인에 성공했을 때
		//out.println("<script>alert('로그인 성공')</script>");
		response.sendRedirect("list.jsp");
		session.setAttribute("id", id);
		session.setAttribute("name", name);
		session.setAttribute("login", "yes");
	} else { //비밀번호가 틀렸을 때
		response.sendRedirect("newmember.jsp");
		//out.println("<script>alert('로그인 실패')locaction.href='main.html'</script>");		
	}
%>