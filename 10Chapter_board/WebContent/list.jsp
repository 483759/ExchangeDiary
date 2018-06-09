<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" integrity="sha384-WskhaSGFgHYWDcbwN70/dfYBj47jz9qbsMId/iRN3ewGhXQFZCSftd1LZCfmhktB" crossorigin="anonymous">
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>목록보기</title>

<style>
#namebar {
display : inline-block;
float : right;
margin-bottom : 10px;
margin-right : 2px;
}
</style>
</head>


<body>
<%
		String id = (String) session.getAttribute("id");
		String name = (String) session.getAttribute("name");
		String logout = request.getParameter("logout");

		if (logout != null && logout.equals("yes")) {
			session.removeAttribute("id");
			session.removeAttribute("login");
		}
	%>
	<br>
	<br>
<h1 class="text-center">게시판 목록 보기</h1>
<div class="container" >
<div class="row" id="namebar">
<form class="form-inline">
	<p> 안녕하세요! <%=name%> 님! </p>

</form>
</div>
</div>
	<br>
	<br>

<div class="container">	
	   <div>
	   <table class="table table-board text-center">
	   	<thead>
	   		<tr>
	   			<th style="width:7%">글 번호</th>
	   			<th style="width:40%">제목</th>
	   			<th style="width:15%">작성자</th>
	   			<th style="width:10%">작성일</th>
	   			<th style="width:7%">조회수</th>
	   		</tr>
	   		</thead>
	   		<tbody>
	   	<c:forEach items="${list}" var="dto">
	   		<tr>
	  		<td>${dto.num}</td>
	   		<td>
	   		<c:forEach begin="1" end="${dto.repIndent }">
	    	<%= "&nbsp;&nbsp;" %>
	   		</c:forEach>  
	   		
	   		<a href="retrieve.do?num=${dto.num}">${dto.title}</a>
	   		</td>
	  		 <td>${dto.author}</td>
	  		 <td>${dto.writeday}</td>
	   		<td>${dto.readcnt}</td>
			</tr>
		</c:forEach>
	   	</tbody>
	   </table>
	   	   </div>
	  <div class="text-center">
	  
		<button class="btn btn-light" id="insert" onclick="location.href='writeui.do'">글쓰기</button>
		<!-- <button class="btn btn-light" id="insert" onclick="location.href='list.do'">목록보기</button>-->	
		
</div>
	</div>
	
	

<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.3/umd/popper.min.js" integrity="sha384-vFJXuSJphROIrBnz7yo7oB41mKfc8JzQZiCq4NCceLEaO4IHwicKwpJf9c9IpFgh" crossorigin="anonymous"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta/js/bootstrap.min.js" integrity="sha384-h0AbiXch4ZDo7tp9hKZ4TsHbi047NrKGLO3SEJAg45jXxnGIfYzk4Si90RDIqNm1" crossorigin="anonymous"></script>	
</body>
</html>