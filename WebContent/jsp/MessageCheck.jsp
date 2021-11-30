
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
	   	
	    String user_id =(String)  session.getAttribute("user_id"); //본인아이디
		 String id2 = request.getParameter("id2"); //친구아이디
		 String name = request.getParameter("name");
		 dao.ResetMessage(user_id, id2);//메세지 초기화
		 
		String message = request.getParameter("messageWindow");
		System.out.println("메세지받기완료");
		
		dao.setMessage(name, message, user_id, id2);//메세지 다시저장
		
	%>
</body>
</html>