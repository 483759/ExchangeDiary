<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet"
   href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css"
   integrity="sha384-WskhaSGFgHYWDcbwN70/dfYBj47jz9qbsMId/iRN3ewGhXQFZCSftd1LZCfmhktB"
   crossorigin="anonymous">
   <link rel="stylesheet" href="board.css">
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<style>
body{
	font-family:HS가을생각체;
	text-align: center;
}
</style>
</head>
<body>
<br><br>
<div class="container text-center">
   <div class="text-center">
      <form method="post" action="Join.jsp">
         <input type=hidden name="action" value="insert">
         <fieldset><br>
            <legend>Sign UP</legend>
            <label for="id">ID : </label> <input type="text" class="btn btn-dark" name="id" />
           
            <br /> <br /> <label for="pwd">PASSWORD : </label> <input
               type="password" class="btn btn-dark" name="pwd" /><br /> <br /> <label
               for="password2">PASSWORD CHECK : </label> <input type="password"
               name="password2" class="btn btn-dark"><br /> <br /> <label for="name">NAME
               : </label> <input type="text" name="name" class="btn btn-dark"><br /> <br /> <label
               for="tel">PHONE NUM : </label> <input type="tel" class="btn btn-dark" name="tel"
               pattern="[0-9]{2,3}-[0-9]{3,4}-[0-9]{3,4}" /><br /> <br /> <label
               for="dob">BIRTH : </label> <input type="date" name="birth" class="btn btn-dark"><br />
            <br />
         </fieldset>
         <br /> <input type="submit" name="submit" value="JOIN" class="btn btn-dark"> <input
            type="button" name="reset" onclick="location.href='main.jsp'" value="뒤로가기" class="btn btn-light">
      </form>
   </div>
   </div>
</body>
</html>