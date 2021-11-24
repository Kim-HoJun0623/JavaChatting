<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String id = (String)session.getAttribute("user_id");
	String name = (String)session.getAttribute("user_name");
	String phone1 = (String)session.getAttribute("user_phone1");
	String phone2 = (String)session.getAttribute("user_phone2");
	String phone3 = (String)session.getAttribute("user_phone3");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>내 정보 페이지입니다.</h1>
<%=id %>(<%=name %>)님 개인정보입니다. <br>
핸드폰 번호 : <%=phone1%> - <%=phone2%> - <%=phone3%>
<br>
<br>
	<a href="logout.jsp">로그아웃</a><br/>
</body>
</html>