<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html> 
<head> 
<meta name="viewport" content="width=device-width, height=device-height, minimum-scale=1.0, maximum-scale=1.0, initial-scale=1.0"> 
<link rel="stylesheet" href="../css/loginform.css">
</head> 
<body> 
<header> 
<h2>Login</h2> 
</header> 
<form action="login_ok.jsp" method="POST"> 
<div class="input-box"> 
<input id="username" type="text"  name="id" placeholder="아이디"> 
<label for="username">아이디</label> 
</div> 
<div class="input-box"> 
<input id="password" type="password" name="pw" placeholder="비밀번호"> 
<label for="password">비밀번호</label> 
</div> 
<br>
<input class="btn" type="submit" value="로그인"> 
 <button type="button" class="btn" onClick="location.href='../index.jsp'">Back</button>
</form> 
</body> 
</html>