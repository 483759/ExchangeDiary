<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.util.Calendar"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<%
	request.setCharacterEncoding("UTF-8");

	//클라이언트에서 넘어온 정보 받기
	String y = request.getParameter("year");
	String m = request.getParameter("month");
	String d = request.getParameter("date");

	//현재 컴퓨터 시스템의 날짜 구하기
	Calendar cal = Calendar.getInstance();
	int year = cal.get(Calendar.YEAR);
	int month = cal.get(Calendar.MONTH) + 1; //클라이언트에서 넘겨준 값이 없을때 표시하는 값
	int date = cal.get(Calendar.DATE);

	if (y != null)
		year = Integer.parseInt(y);
	if (m != null)
		month = Integer.parseInt(m);
	if (d != null)
		date = Integer.parseInt(d);

	cal.set(year, month - 1, 1);
	year = cal.get(Calendar.YEAR);
	month = cal.get(Calendar.MONTH) + 1;

	// 1일은 무슨 요일?
	int w = cal.get(Calendar.DAY_OF_WEEK);

	// 달의 마지막 날짜는?
	int endDays = cal.getActualMaximum(Calendar.DATE);
%>
<html>

<head>
<title>달력</title>
<style type="text/css">
td {
	width: 50px;
	height: 50px;
	text-align: center;
	font-size: 20px;
	border: 2px;
	border-color: #3333FF;
	border-radius: 8px;
	/*모서리 둥글게*/
}

#calender {
	float: left;
}

#cboard {
	float: right;
}
</style>
</head>

<body>
	<button type="button" value="게시판">게시판</button>
	<button type="button" value="달력">달력</button>
	<a href="#">로그아웃</a>
	<br />
	<div id="calendar">
		<table id="calendar" border="3">
			<tr>
				<!-- label은 마우스로 클릭을 편하게 해줌 -->
				<td><a
					href="Calendar.jsp?year=<%=year%>&month=<%=month - 1%>&date=<%=date%>">◁</a></td>
				<td align="center" id="tbCalendarYM" colspan="5"><%=year%>년 <%=month%>월</td>
				<td><a
					href="Calendar.jsp?year=<%=year%>&month=<%=month + 1%>&date=<%=date%>">▷</a></td>
			</tr>
			<tr>
				<td align="center"><font color="red">일</td>
				<td align="center">월</td>
				<td align="center">화</td>
				<td align="center">수</td>
				<td align="center">목</td>
				<td align="center">금</td>
				<td align="center"><font color="blue">토</td>
			</tr>
			<%
				int line = 0;
				//앞의 공백처리
				out.print("<tr bgcolor='#ffffff' height='25'>");
				for (int i = 1; i < w; i++) {
					out.print("<td> </td>");
					line += 1;
				}

				//1~마지막날까지 출력하기
				String fc;
				for (int i = 1; i <= endDays; i++) {
					fc = line == 0 ? "red" : (line == 6 ? "blue" : "black");
					out.print("<td align='center' style='color:" + fc + ";'>");
					out.print(
							"<a href=\"Calendar.jsp?year=" + year + "&month=" + month + "&date=" + i + "\">" + i + "</a>");
					out.print("</td>");
					line += 1;
					if (line == 7 && i != endDays) {
						out.print("</tr><tr height='25' bgcolor='#ffffff'>");
						line = 0;
					}
				}

				//뒷부분 공백 처리
				while (line > 0 && line < 7) {
					out.print("<td> </td>");
					line++;
				}
				out.print("</tr>");
			%>
		</table>
	</div>
	<div id="cboard">
		<fieldset border="1">
			<legend><%=year%>년
				<%=month%>월
				<%=date%>일
			</legend>
			<div class="container">
				<div>
					<table class="table table-board text-center">
						<thead>
							<tr>
								<th style="width: 7%">글 번호</th>
								<th style="width: 40%">제목</th>
								<th style="width: 15%">작성자</th>
								<th style="width: 10%">작성일</th>
								<th style="width: 7%">조회수</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach items="${list}" var="dto">
								<tr>
									<td>${dto.num}</td>
									<td><c:forEach begin="1" end="${dto.repIndent }">
											<%="&nbsp;&nbsp;"%>
										</c:forEach> <a href="retrieve.do?num=${dto.num}">${dto.title}</a></td>
									<td>${dto.author}</td>
									<td>${dto.writeday}</td>
									<td>${dto.readcnt}</td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>
		</fieldset>
	</div>
	<div>
		<p id="CurrentDate"></p>
	</div>
	<button>글쓰기</button>
</body>
</html>