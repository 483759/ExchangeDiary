<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<head>
<title>Exchange_Diary</title>
<link rel="stylesheet" href="style.css" type="text/css">
<link href="https://fonts.googleapis.com/css?family=Do+Hyeon"
	rel="stylesheet">
<style>
body {
	background-size: 100% 100%;
	color: white;
}

a:link {
	color: black;
	text-decoration: none;
}

a:visited {
	color: black;
	text-decoration: none;
}

#login_form {
	position: absolute;
	background-color: black;
	opacity: 0.4;
	border-radius: 10px;
	width: 300px;
	padding: 10px;
	height: 100px;
	top: 250px;
	right: 50px;
}

#login {
	position: absolute;
	opacity: 1.0;
	color: white;
	bottom: 10px;
	left: 50px;
}

#find {
	position: absolute;
	opacity: 1.0;
	color: white;
	bottom: 10px;
	right: 50px;
}
</style>
</head>

<body>

	<div id="login_form">
		<form action="Login.jsp" method="post">
			<table>
				<tr>
					<td>ID :</td>
					<td><input type="text" name="id"></td>
				</tr>
				<tr>
					<td>PASSWORD :</td>
					<td><input type="password" name="pwd"></td>
				</tr>
				<tr>
					<td><input type="submit" value="LOGIN"></td>
					<td><input type="button"
						onclick="location.href='newmember.jsp'" value="JOIN"></td>
				</tr>
			</table>

		</form>
	</div>


	<%
		request.setCharacterEncoding("UTF-8");
		String id = request.getParameter("id");
		String pwd = request.getParameter("pwd");

		String logout = request.getParameter("logout");

		if (logout != null && logout.equals("yes")) {
			session.removeAttribute("id");
			session.removeAttribute("login");
		}
	%>
</body>

</html>