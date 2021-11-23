<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> 
<!DOCTYPE html> 
<html lang="ko"> 
<head> 
<!-- meta 선언 --> 
<meta charset="UTF-8"> 
<meta name="viewport" content="width=device-width, initial-scale=1.0"> 
<!-- link 선언 --> 
<link rel="stylesheet" href="./css/style.css"> 
<link rel="stylesheet" href="./css/style_index.css"> 
<!-- script 선언 --> 
<script src="https://kit.fontawesome.com/e1bd1cb2a5.js"></script> 
<script src="https://code.jquery.com/jquery-3.4.1.js"></script> 
<script src="./js/script.js"></script> 
<title> Java Chatting </title>
 </head> 
<body> 

<header> 
<div class="header_container"> 
<div class="logo_container"> 
<img class="hhlofo" src="./img/hhlogo.png"  onclick="location.href='index.jsp';">
<a href="index.jsp" style="vertical-align: middle;">H H Chatting</a>
</div> 
<div class="nav_container" id="nav_menu"> 


</div> 
</div> 
</header> 
<div class="main_container"> 
<div class="conB"> 
<div class="conB_title"> 
<h3>Java Chatting / Jihwan / Hojun</h3> 
</div> 

<div class="conB_container"> 
<%if(session.getAttribute("user_id")==null){ %>
<div class="conB_small_container" onclick="location.href='http:./jsp/login.jsp';"> 
<div class="conB_icon"> 
<i class="fas fa-code icon">
</i> 
</div> 
<div class="conB_content"> 
<h3>로그인</h3> 
<p>Login</p> 
</div> 
</div> 
<div class="conB_small_container"  onclick="location.href='http:./jsp/join.jsp';"> 
<div class="conB_icon"> 
<i class="fas fa-cogs icon">
</i> </div> <div class="conB_content"> 
<h3>회원가입</h3> 
<p>Join</p> 
</div> </div> 
<%} else{%>
<div class="conB_small_container" onclick="location.href='./jsp/my.jsp';"> 
<div class="conB_icon"> 
<i class="fas fa-plane icon">
</i> 
</div> 

<div class="conB_content"> 
<h3>내 정보</h3> 
<p>My Home</p> 
</div> 
</div> 

<div class="conB_small_container" onclick="location.href='./jsp/logout.jsp';"> 
<div class="conB_icon"> 
<i class="fas fa-plane icon">
</i> 
</div> 

<div class="conB_content"> 
<h3>로그아웃</h3> 
<p>Log Out</p> 
</div> 
</div> 

<%} %>
</div> 
</div> 
</div> 
<footer> 
<div class="footer_container"> 
<div class="footA"> Hwan's Jun's </div> 
<div class="footB"> Copyright © Hwans and Jun All Rights Reserved. </div> 
</div> 
</footer> 
</body> 
</html>
