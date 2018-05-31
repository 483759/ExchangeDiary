<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
<meta charset="UTF-8">
<title>자바스크립트 - 달력 만들기 예제</title>

<!-- 자바스크립트 - 달력 만들기 예제 -->
<!-- 설명 : 자바 스크립트를 활용하여 달력을 만드는 예제 -->

<script type="text/javascript">
window.onload = function() {
	//document.getElementById("btnShow").onclick = func; : 아래 이벤트 리스너도 동일하게 작용
	document.getElementById("btnShow").addEventListener("click", func, false);
}


function func() {
	var now = new Date();
	var year = now.getFullYear();
	var month = now.getMonth();
	var day = now.getDate();
	//alert(year + "." + month + 1 + "." + day); // month는 0부터 시작하기 때문에 +1을 해야됨
	
	//해당 달의 1일은 무슨 요일이냐
	var setDate = new Date(year, month, 1);
	var firstDay = setDate.getDate();
	var yoil = setDate.getDay();
	//alert(yoil); // 일:0, 월:1 ~ 토:6
	
	var nalsu = new Array(31,28,31,30,31,30,31,31,30,31,30,31);
	
	//2월은 윤년 체크
	if(year % 4 === 0 % year % 100 !== 0 || year % 400 === 0 ){
		nalsu[1] = 28;
	}
	
	makeCalendar(yoil, nalsu[month],year,month+1, day)
	document.getElementById("disp").innerHTML = str;
	
	// 버튼 보이기
	document.getElementById("etc").style.display = "";
	
}
var str= "";
function makeCalendar(yoil, nalsu, year, month, day) {
	str = "<table border ='0'>";
	str += "<tr><th colspan='7' width='400'>" + year + "년" + month + "월</th></tr>";
	str += "<tr>";
	var week = new Array("일", "월", "화", "수", "목", "금", "토");
	for(var i = 0; i < week.length; i++){
		str += "<th>" + week[i] + "</th>";
	}
	str += "</tr>";
	
	// 날 수 채우기
	var no = 1;
	var currentCell = 0;
	var ju = Math.ceil((nalsu + yoil) / 7);
	//alert("이번달은 " + ju + " 주 동안 계속됩니다");
	for(var r=0; r < ju; r++){
		str += "<tr style='text-align:center'>";
		for(var col=0; col < 7; col++){
			if(currentCell < yoil || no > nalsu){
				str += "<td>&nbsp;</td>";
				currentCell++;
			}else{
				str += "<td>" + no + "</td>";
				no++;
			}
			
		}
		str += "<td>&nbsp;</td>";
		
		str += "</tr>";
	}
	
	str += "</table>";
}

//--------------

function func1() {
	var now = new Date();
	var year = now.getFullYear();
	var month = now.getMonth();
	var day = now.getDate();
	//alert(year + "." + month + 1 + "." + day); // month는 0부터 시작하기 때문에 +1을 해야됨
	
	//해당 달의 1일은 무슨 요일이냐
	var setDate = new Date(year, month, 1);
	var firstDay = setDate.getDate();
	var yoil = setDate.getDay();
	//alert(yoil); // 일:0, 월:1 ~ 토:6
	
	var nalsu = new Array(31,28,31,30,31,30,31,31,30,31,30,31);
	
	//2월은 윤년 체크
	if(year % 4 === 0 % year % 100 !== 0 || year % 400 === 0 ){
		nalsu[1] = 28;
	}
	
	makeCalendar(yoil, nalsu[month],year,month+1, day)
	document.getElementById("disp").innerHTML = str;
	
	// 버튼 보이기
	document.getElementById("etc").style.display = "";
	
}
var str= "";
function makeCalendar(yoil, nalsu, year, month, day) {
	str = "<table border ='0'>";
	str += "<tr><th colspan='7' width='400'>" + year + "년" + month + "월</th></tr>";
	str += "<tr>";
	var week = new Array("일", "월", "화", "수", "목", "금", "토");
	for(var i = 0; i < week.length; i++){
		str += "<th>" + week[i] + "</th>";
	}
	str += "</tr>";
	
	// 날 수 채우기
	var no = 1;
	var currentCell = 0;
	var ju = Math.ceil((nalsu + yoil) / 7);
	//alert("이번달은 " + ju + " 주 동안 계속됩니다");
	for(var r=0; r < ju; r++){
		str += "<tr style='text-align:center'>";
		for(var col=0; col < 7; col++){
			if(currentCell < yoil || no > nalsu){
				str += "<td>&nbsp;</td>";
				currentCell++;
			}else{
				str += "<td>" + no + "</td>";
				no++;
			}
			
		}
		str += "<td>&nbsp;</td>";
		
		str += "</tr>";
	}
	
	str += "</table>";
}

</script>

</head>
<body>
	<br>
	<div id="disp"></div>
	<br>

</body>
</html>