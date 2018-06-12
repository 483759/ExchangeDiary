<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css"
	integrity="sha384-WskhaSGFgHYWDcbwN70/dfYBj47jz9qbsMId/iRN3ewGhXQFZCSftd1LZCfmhktB"
	crossorigin="anonymous">
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>일기 보기</title>
</head>
<body>
	<%
		request.setCharacterEncoding("UTF-8");
		String name = (String) session.getAttribute("name");
		String logout = request.getParameter("logout");
	%>
	<div class="container">
		<br> <br>
		<center>
			<h2>일기 보기</h2>
		</center>
		<form action="update.do" method="post">
			<input type="hidden" name="num" value="${retrieve.num}">
			<div class="form-group">
				<label for="Title">일기 제목 : </label> <input type="text"
					class="form-control" name="title" value="${retrieve.title}">
			</div>
			<div class="form-group">
				<label for="Author">쓴 사람 : </label> <input type="text"
					class="form-control" name="author" value="${retrieve.author}">
			</div>
			<div class="form-group">
				<label for="date">쓴 날짜 : </label> <input type="date"
					class="form-control" name="writeday" value="${retrieve.writeday}">
			</div>

			<br>
			<div class="form-group">
				<label for="content">내용 : </label>
				<textarea name="content" class="form-control" rows="10">${retrieve.content}</textarea>
				<center>
					<br>
					<c:set var="name" value="<%=name%>"></c:set>
					<c:if test="${retrieve.author==name}">
						<input type="submit" class="btn btn-info" value="수정">
						<button class="btn btn-info"
							onclick="location.href='delete.do?num=${retrieve.num}'">삭제하기</button>
					</c:if>

				</center>
			</div>

			<br>
			<center>
				<button type="button" class="btn btn-light" id="list"
					onclick="location.href='replyui.do?num=${retrieve.num}'">답글
					쓰기</button>
				<button type="button" class="btn btn-info"
					onclick="location.href='list.do'">목록 보기</button>
			</center>

		</form>
	</div>
</body>

</html>