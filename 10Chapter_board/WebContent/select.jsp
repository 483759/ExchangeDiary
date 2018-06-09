<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" integrity="sha384-WskhaSGFgHYWDcbwN70/dfYBj47jz9qbsMId/iRN3ewGhXQFZCSftd1LZCfmhktB" crossorigin="anonymous">
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>선택하기</title>

<style>
table {
text-align:center;
margin-left: auto;
margin-right: auto;
}
td{
padding:30% 0px;
margin:auto;
}

</style>
</head>

<body>

<div class="container">
<table width="900px">
<tbody>
<tr>
<td class ="img">
<a target="_self">
<img src ="calendar.png"onclick="location.href='Calendar.jsp'"  alt="photo" width="300px" height=auto>
<h3>Calendar</h3>
</a>
<div class="desc"></div></td>


<td class ="img">
<a target="_self">
<img src ="sketchbook.png" onclick="location.href='list.do'" alt="photo" width="300px" height=auto>
<h3>Sketchbook</h3>
</a>
<div class="desc"></div></td>
</tr>
</tbody>
</table>
</div>
</body>