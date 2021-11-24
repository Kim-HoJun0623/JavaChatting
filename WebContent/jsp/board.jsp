<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ page import="catting.BoardDAO" %>
<%@ page import="user.UserVO" %>
<%@ page import="java.util.ArrayList" %>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" type="text/css" href="../css/boardstyle.css" />
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<div class="di">
	<table class="type11">
  <thead>
  <tr>
    <th scope="cols">아이디</th>
    <th scope="cols">이름</th>
    <th scope="cols">번호</th>
        <th scope="cols">메신저</th>
  </tr>
  </thead>
  <tbody>
  <%
					BoardDAO boardDAO = new BoardDAO();
				ArrayList<UserVO> list = boardDAO.friendlist();
					for(int i=0; i<list.size(); i++){
				%>
  			<tr>
 		
			
			<td><%= list.get(i).getId() %></th>
    		<td><%= list.get(i).getName() %></th>
    		<td><%=list.get(i).getPhone1()+"-"+list.get(i).getPhone2()+"-"+list.get(i).getPhone3() %></th>
			<td><a>메세지</a></th>
				 
				
  </tr>
  	<%
								}
						%>

  </tbody>
</div>
					
</body>
</html>