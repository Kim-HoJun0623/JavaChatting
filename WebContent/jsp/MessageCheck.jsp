
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter" %>
<%@page import="catting.BoardDAO"%>
<%@page import="catting.BoardVO"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

</head>
<body>
	<%
		BoardDAO dao = new BoardDAO();
	   	BoardVO vo = new BoardVO();
		String message = request.getParameter("messageWindow");
		PrintWriter ou = response.getWriter();
		System.out.println("메세지받기완료");
		ou.print(message);
		String user_id="jun";//내아이디
		String id="ho";//상대아이디
		String name="hojun";
		dao.setMessage(name, message, user_id, id);
		
	%>
</body>
</html>