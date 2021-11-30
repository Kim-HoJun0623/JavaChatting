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
 <%@ page import="catting.BoardDAO" %>
<%@ page import="user.UserVO" %>
<%@ page import = "java.sql.DriverManager" %>
<%@ page import = "java.sql.Connection" %>
<%@ page import = "java.sql.Statement" %>
<%@ page import = "java.sql.ResultSet" %>
<%@ page import = "java.sql.SQLException" %>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="user.friendVO" %>

<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="../css/hwanstyle.css">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="../css/boardstyle.css" />
</head>
<body>

<h1>내 정보 페이지입니다.</h1>
<%=id %> (<%=name %>)님 개인정보입니다. <br>
핸드폰 번호 : <%=phone1%> - <%=phone2%> - <%=phone3%>
<br>
<br>
	<a href="logout.jsp">로그아웃</a>&nbsp;&nbsp;
	<a href="refriend.jsp" onclick="window.open(this.href, '_blank', 'width=1000px,height=500px,toolbars=no,scrollbars=no'); return false;">친구신청</a>&nbsp;&nbsp;
	<a href="acfriend.jsp" onclick="window.open(this.href, '_blank', 'width=1000px,height=500px,toolbars=no,scrollbars=no'); return false;">친구 요청 대기 목록</a><br><br>


      <table class="type09">

      <tr>
            <th colspan="4">친구</th> 

      </tr>

<%
		UserVO uv = new UserVO();
      // 1. JDBC 드라이버 로딩
     Class.forName("oracle.jdbc.driver.OracleDriver");
  
      Connection conn = null; // DBMS와 Java연결객체
  	  PreparedStatement pstmt = null;
      ResultSet rs = null; // SQL구문의 실행결과를 저장
  
      try
      {
            String jdbcDriver = "jdbc:oracle:thin:@localhost:1521/XE";
            String dbUser = "scott";
            String dbPass = "tiger";
            friendVO fvo = new friendVO();
           // String query = "select * from friendrequest where rfriend like ? and dist = 1";
           // String query = "select * from friendrequest where (rfriend like ? and dist = 1) or (afriend like ? and dist = 1)";
           
          String query = "select afriend from friendrequest where (rfriend like ? and dist = 1) union select rfriend from friendrequest where (afriend like ? and dist = 1)";
            // 2. 데이터베이스 커넥션 생성
            conn = DriverManager.getConnection(jdbcDriver, dbUser, dbPass);
   
            // 3. Statement 생성
            pstmt = conn.prepareStatement(query);
    		pstmt.setString(1, id);
    		pstmt.setString(2, id);
    		
            // 4. 쿼리 실행
            rs = pstmt.executeQuery();
   		
            // 5. 쿼리 실행 결과 출력
            while(rs.next())
            {
             	uv.setId((rs.getString(1)));
                if(uv.getId().equals(id)){
                	uv.setId(rs.getString(2));
                } 
%>

        <tr>
          <td><%= rs.getString("afriend") %></td>
          <%fvo.setAfriend(rs.getString("afriend"));%>
          <td><a href="delfriend.jsp?aid=<%=fvo.getAfriend()%>">친구 삭제</a></td>
          <td><a href="friendinfo.jsp?aid=<%=fvo.getAfriend()%>"  onclick="window.open(this.href, '_blank', 'width=1000px,height=500px,toolbars=no,scrollbars=no'); return false;">친구 정보</a></td>
		 <td><a href="../jsp/websocat.jsp?user_id=<%=id%>&id2=<%=uv.getId()%>&name=<%=name%>">메세지</a></th>
       </tr>
<%
            }
      }catch(SQLException ex){
            out.println(ex.getMessage());
            ex.printStackTrace();
      }finally{
            // 6. 사용한 Statement 종료
            if(rs != null) try { rs.close(); } catch(SQLException ex) {}
            if(pstmt != null) try { pstmt.close(); } catch(SQLException ex) {}
   
            // 7. 커넥션 종료
            if(conn != null) try { conn.close(); } catch(SQLException ex) {}
      }
%>
      </table>
	
</body>
</html>