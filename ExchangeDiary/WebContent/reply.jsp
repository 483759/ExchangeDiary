<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css"
	integrity="sha384-WskhaSGFgHYWDcbwN70/dfYBj47jz9qbsMId/iRN3ewGhXQFZCSftd1LZCfmhktB"
	crossorigin="anonymous">
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>답글 쓰기</title>
</head>
<body>
	<%
		request.setCharacterEncoding("UTF-8");
		String name = (String) session.getAttribute("name");
	%>

	<div class="container">
		<br> <br>
		<center>
			<h2>답글 달기</h2>
		</center>

		<form action="reply.do" method="post">
			<input type="hidden" name="num" value="${replyui.num}"> <input
				type="hidden" name="repRoot" value="${replyui.repRoot}"> <input
				type="hidden" name="repStep" value="${replyui.repStep}"> <input
				type="hidden" name="repIndent" value="${replyui.repIndent}">
			<div class="form-group">
				<label for="Title">제목 : </label> <input type="text"
					class="form-control" name="title" value="${replyui.title}>">
			</div>
			<div class="form-group">
				<label for="Author">쓴 사람 : </label> <input type="text"
					class="form-control" name="author" value="<%=name%>">
			</div>
			<div class="form-group">
				<label for="date">쓴 날짜 : </label> <input type="date"
					class="form-control" name="writeday" value="${retrieve.writeday}">
			</div>

			<br>
			<div class="form-group">
				<label for="content">내용 : </label>
				<textarea name="content" class="form-control" rows="10">${replyui.content}></textarea>

				<br> <br>

				<center>

					<button type="button" class="btn btn-info"
						onclick="location.href='list.do'">목록 보기</button>
					<button type="submit" class="btn btn-info">쓰기</button>

				</center>
			</div>

			<br>
			<center></center>

		</form>
	</div>
</body>

</html>
