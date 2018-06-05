<%@ page contentType="text/html;charset=euc-kr" %>
<%@ page import="com.entity.PageTO" %>

<%
		PageTO to  = ( PageTO)request.getAttribute( "page" );		
		int curPage = to.getCurPage();
		int perPage = to.getPerPage();
		int totalCount  = to.getTotalCount();
		int totalPage = totalCount / perPage;  // 보여줄 페이지 번호개수
		if( totalCount  %  perPage  != 0 ) totalPage++;

%>	
		

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" integrity="sha384-WskhaSGFgHYWDcbwN70/dfYBj47jz9qbsMId/iRN3ewGhXQFZCSftd1LZCfmhktB" crossorigin="anonymous">
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
</head>
<body>
 <nav aria-label="Page navigation example">
		<ul class="pagination justify-content-center">
		<li class="page-item disabled">
		<a class="page-link" href="#" tabindex="-1">Previous</a>
		</li>
		<li class="page-item">
		<%
				
		
				 for (int i=1; i<=totalPage; i++){
			 if( curPage ==i){
				 out.print("<a class='page-link' href='list.do?curPage="+i+"'>"+i+"</a></li>");
			 }
			 else{
				 out.print("<a class='page-link' href='list.do?curPage="+i+"'>"+i+"</a></li>");
			 }
		 }
		%>
		</li>
	
		<li class="page-item">
		<a class="page-link" href="#">Next</a>
		</li>
		</ul>
		</nav>
		
		<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.3/umd/popper.min.js" integrity="sha384-vFJXuSJphROIrBnz7yo7oB41mKfc8JzQZiCq4NCceLEaO4IHwicKwpJf9c9IpFgh" crossorigin="anonymous"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta/js/bootstrap.min.js" integrity="sha384-h0AbiXch4ZDo7tp9hKZ4TsHbi047NrKGLO3SEJAg45jXxnGIfYzk4Si90RDIqNm1" crossorigin="anonymous"></script>	
		</body>
</html>
		