<%@ page import="java.util.Calendar"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%
    request.setCharacterEncoding("UTF-8");

    //클라이언트에서 넘어온 정보 받기
    String y=request.getParameter("year");
    String m=request.getParameter("month");

    //현재 컴퓨터 시스템의 날짜 구하기
    Calendar cal = Calendar.getInstance();
    int year = cal.get(Calendar.YEAR);
    int month = cal.get(Calendar.MONTH)+1; //클라이언트에서 넘겨준 값이 없을때 표시하는 값
    int date = cal.get(Calendar.DATE);

    if(y!=null)
    year = Integer.parseInt(y);
    if(m!=null)
    month = Integer.parseInt(m);

    cal.set(year, month-1, 1);
    year = cal.get(Calendar.YEAR);
    month = cal.get(Calendar.MONTH)+1;
    
    int setDate(int i){
    	
    }

    // 1일은 무슨 요일?
    int w = cal.get(Calendar.DAY_OF_WEEK);

    // 달의 마지막 날짜는?
    int endDays = cal.getActualMaximum(Calendar.DATE);
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

<style type="text/css">
* {
	margin: 0px;
	padding: 0px;
	font-family: 돋움;
	font-size: 9pt;
}
</style>
</head>
<body>

	<br />
	<br />
	<center>
		<table width="210" cellpadding="0" cellspacing="1" bgcolor="#cccccc">
			<caption style="height: 25px">
				<a href="NewFile.jsp?year=<%=year%>&month=<%=month-1%>">◀</a>
				<%=year%>年<%=month%>月 <a
					href="NewFile.jsp?year=<%=year%>&month=<%=month+1%>">▶</a>
			</caption>
			<tr height="25" bgcolor="#e4e4e4">
				<td width="30" align="center">일</td>
				<td width="30" align="center">월</td>
				<td width="30" align="center">화</td>
				<td width="30" align="center">수</td>
				<td width="30" align="center">목</td>
				<td width="30" align="center">금</td>
				<td width="30" align="center">토</td>
			</tr>

			<%
            int line = 0;
            //앞의 공백처리
            out.print("<tr bgcolor='#ffffff' height='25'>");
            for(int i=1; i<w; i++) {
                out.print("<td> </td>");
                line+=1;
            }

            //1~마지막날까지 출력하기
            String fc;
            for(int i=1; i<=endDays; i++) {
                fc = line == 0 ? "red" : (line == 6 ? "blue" : "black");
                out.print("<td align='center' style='color:"+fc+";'>");
                out.print("<label onclick=''>"+i+"</label>");
                out.print("</td>");
                line+=1;
                if(line==7 && i!=endDays) {
                    out.print("</tr><tr height='25' bgcolor='#ffffff'>");
                    line = 0;
                }
            }

            //뒷부분 공백 처리
            while(line>0 && line<7) {
                out.print("<td> </td>");
                line++;
            }
            out.print("</tr>");
      %>
		</table>
	</center>
</body>
</html>