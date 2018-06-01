<%@ page contentType="text/html;charset=euc-kr" %>
<%@ page import="com.entity.PageTO" %>

<%
		PageTO to  = ( PageTO)request.getAttribute( "page" );		
		int curPage = to.getCurPage();
		int perPage = to.getPerPage();
		int totalCount  = to.getTotalCount();
		int totalPage = totalCount / perPage;  // 보여줄 페이지 번호개수
		if( totalCount  %  perPage  != 0 ) totalPage++;

		for( int i = 1 ; i <=  totalPage ; i++){

          if(  curPage == i ){
			 out.print( "<font size=10 color='red'>"+i +"</font>" );				
		  }else{
			out.print( "<a href='list.do?curPage="+i+"'>"+i  +"</a>&nbsp;" );
		  }//end if
		}
%>
		