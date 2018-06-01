<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>답변글 쓰기 화면</title>
<link rel="stylesheet" href="board.css" type="text/css" media="screen" />
</head>
<body>
<h1>답변글 쓰기 화면</h1>
 <form action="reply.do" method="post">
  <input type="hidden" name="num" value="${replyui.num}">
<input type="hidden" name="repRoot" value="${replyui.repRoot}">
<input type="hidden" name="repStep" value="${replyui.repStep}">
<input type="hidden" name="repIndent" value="${replyui.repIndent}">

  	원래글번호${replyui.num}&nbsp; 조회수${replyui.readcnt}<br />
	제목<input type="text" name="title" value="${replyui.title}"><br />
	작성자<input type="text" name="author" ><br />
	내용<textarea name="content" rows="10" >${replyui.content}></textarea><br />
	<input type="submit" value="답변달기">
  </form>
 <a href="list.do">목록보기</a>

</body>
</html>