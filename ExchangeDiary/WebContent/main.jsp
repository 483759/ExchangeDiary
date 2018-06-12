<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
	<head>
		<title>Epilogue by TEMPLATED</title>
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1" />
		<link rel="stylesheet" href="assets/css/main.css" />
		<link rel="stylesheet" href="style.css" type="text/css">
		<link href="https://fonts.googleapis.com/css?family=Do+Hyeon" rel="stylesheet">
		
			<style>
			body{
				background-size: 100% 100%;
				color: black;
				text-align: center;
				font-family:HS가을생각체;
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
				font-color: black;
				opacity: 0.8;
				border-radius: 10px;
				width: 400px;
				padding: 10px;
				height: 80px;
				text-align: center;
				position:center;
				
			}
			
			#login {
			
				opacity: 1.0;
				color: black;
				bottom: 10px;
				left: 50px;
			}
			
			#find {
			
				opacity: 1.0;
				color: black;
				bottom: 10px;
				right: 50px;
			}
			
	</style>
	</head>
	
	<body>

		<!-- Header -->
			<header id="header" class="alt">
				<div class="inner">
					<h1>Diary</h1>
						<p>일상을 기록하고 다른 사람들과 공유하세요</p>
				</div>
			</header>

		<!-- Wrapper -->
			<div id="wrapper">

				<!-- Banner -->
					<section id="intro" class="main">
						<span class="icon fa-diamond major"></span>
						<h2>Login</h2>
						<center>
						<div id="login_form" class="main">
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
		
					</center>
					</section>

				

				<!-- CTA -->
					<section id="cta" class="main special">
						<h2>Open Source Project</h2>
						<p>Professor  /  Kang Jae Ku</p>
						<P>Team   :   Kim Han Byeol   /   Lee Sang Rok   /   Yun I Jin</p>
						<ul class="actions">
							<li><a href="#" class="button big">Move Up</a></li>
						</ul>
					</section>

				<!-- Main -->
				<!--
					<section id="main" class="main">
						<header>
							<h2>Lorem ipsum dolor</h2>
						</header>
						<p>Fusce malesuada efficitur venenatis. Pellentesque tempor leo sed massa hendrerit hendrerit. In sed feugiat est, eu congue elit. Ut porta magna vel felis sodales vulputate. Donec faucibus dapibus lacus non ornare. Etiam eget neque id metus gravida tristique ac quis erat. Aenean quis aliquet sem. Ut ut elementum sem. Suspendisse eleifend ut est non dapibus. Nulla porta, neque quis pretium sagittis, tortor lacus elementum metus, in imperdiet ante lorem vitae ipsum. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Etiam eget neque id metus gravida tristique ac quis erat. Aenean quis aliquet sem. Ut ut elementum sem. Suspendisse eleifend ut est non dapibus. Nulla porta, neque quis pretium sagittis, tortor lacus elementum metus, in imperdiet ante lorem vitae ipsum. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas.</p>
					</section>
				-->

				<!-- Footer -->
					<footer id="footer">
						<ul class="icons">
							<li><a href="#" class="icon fa-twitter"><span class="label">Twitter</span></a></li>
							<li><a href="#" class="icon fa-facebook"><span class="label">Facebook</span></a></li>
							<li><a href="#" class="icon fa-instagram"><span class="label">Instagram</span></a></li>
							<li><a href="#" class="icon fa-linkedin"><span class="label">LinkedIn</span></a></li>
							<li><a href="#" class="icon fa-envelope"><span class="label">Email</span></a></li>
						</ul>
						<p class="copyright">&copy; 7조</p>
					</footer>

			</div>

		<!-- Scripts -->
			<script src="assets/js/jquery.min.js"></script>
			<script src="assets/js/skel.min.js"></script>
			<script src="assets/js/util.js"></script>
			<script src="assets/js/main.js"></script>

	</body>
</html>