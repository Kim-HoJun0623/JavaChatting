
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
  		UserVO uv = new UserVO();
  			String user_id =(String) session.getAttribute("user_id");
					BoardDAO boardDAO = new BoardDAO();
					String name=boardDAO.getName(user_id);//유저 이름 가져오기
			System.out.println(user_id);
				ArrayList<UserVO> list = boardDAO.friendlist();
					for(int i=0; i<list.size(); i++){
						if(session.getAttribute("user_id").equals(list.get(i).getId())){
						}else{
		%>
  			<tr>			
			<td><%= list.get(i).getId() %></th>
    		<td><%= list.get(i).getName() %></th>
    		<td><%=list.get(i).getPhone1()+"-"+list.get(i).getPhone2()+"-"+list.get(i).getPhone3() %></th>
			
			<td><a href="../jsp/websocat.jsp?user_id=<%=user_id%>&id2=<%=list.get(i).getId()%>&name=<%=name%>">메세지</a></th>
				 
				
  </tr>
  	<%
						}
								}
						%>

  </tbody>
</div>
					
</body>
</html>