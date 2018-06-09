<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8" import="java.sql.*, java.util.Calendar, com.DiaryDB"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
   if (month / 10 == 0)
      m = "0" + m;
   if (date / 10 == 0)
      d = "0" + d;

   cal.set(year, month - 1, 1);
   year = cal.get(Calendar.YEAR);
   month = cal.get(Calendar.MONTH) + 1;

   // 1일은 무슨 요일?
   int w = cal.get(Calendar.DAY_OF_WEEK);

   // 달의 마지막 날짜는?
   int endDays = cal.getActualMaximum(Calendar.DATE);
   String days = year + "-" + month + "-" + date;
%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>

<head>
<link rel="stylesheet"
   href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css"
   integrity="sha384-WskhaSGFgHYWDcbwN70/dfYBj47jz9qbsMId/iRN3ewGhXQFZCSftd1LZCfmhktB"
   crossorigin="anonymous">
<title>달력</title>
<style type="text/css">
td {
   width: 50px;
   height: 50px;
   text-align: center;
   font-size: 20px;
   border: 2px;
   border-color: #3333FF;

}

#calendar {
   float: left;
   position: absolute;
}

#cboard {
   display: inline-block;
   float: right;
   width: 60%;
}

#a {
   position: absolute;
}
</style>
</head>

<body>
   <button type="button" value="게시판">게시판</button>
   <button type="button" value="달력">달력</button>
   <a href="#">로그아웃</a>
   <br />
   <div id="a">

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
                        <%
                           Connection conn = DiaryDB.connect();

                           String sql = "select * from board where writeday = ?";
                           PreparedStatement pstmt = conn.prepareStatement(sql);

                           pstmt.setString(1, days);
                           
                           ResultSet rs = pstmt.executeQuery();

                           while (rs.next()) {
                              int num = rs.getInt("num");
                              String title = rs.getString("title");
                              String author = rs.getString("author");
                              String writeday = rs.getString("writeday");
                              int readcnt = rs.getInt("readcnt");

                              
                              out.println("<tr>");
                              out.print("<td>" + num + "</td>");
                              out.print("<td><a href='retrieve.do?num=" + num + "'>" + title +"</a></td>");
                              out.print("<td>" + author + "</td>");
                              out.print("<td>" + writeday + "</td>");
                              out.print("<td>" + readcnt + "</td>");
                              out.println("</tr>");
                           }
                           
                           DiaryDB.disconnect(rs);
                           DiaryDB.disconnect(pstmt);
                           DiaryDB.disconnect(conn);
                        %>
                     </tbody>
                  </table>
               </div>
               <div class="text-center">

                  <button class="btn btn-light" id="insert"
                     onclick="location.href='writeui.do'">글쓰기</button>
                  <!--<button class="btn btn-light" id="insert" onclick="location.href='list.do'">목록보기</button>-->

               </div>
            </div>

         </fieldset>
      </div>
   </div>
</body>
</html>