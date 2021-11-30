<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String id = (String)session.getAttribute("user_id");
%>




<!DOCTYPE html>
<%@ page import = "java.sql.DriverManager" %>
<%@ page import = "java.sql.Connection" %>
<%@ page import = "java.sql.Statement" %>
<%@ page import = "java.sql.ResultSet" %>
<%@ page import = "java.sql.SQLException" %>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="user.friendVO" %>
<html>
<head>
<link rel="stylesheet" href="../css/hwanstyle.css">
<meta charset="utf-8">
<title>Insert title here</title>
</head>
<body>


 <table class="type09">
      <tr>
            <th colspan="3">나에게 친구 요청을 보낸 친구</th>
      </tr>
 
<%
      // 1. JDBC 드라이버 로딩
     Class.forName("oracle.jdbc.driver.OracleDriver");
  
      Connection conn = null; // DBMS와 Java연결객체
  	  PreparedStatement pstmt = null;
      ResultSet rs = null; // SQL구문의 실행결과를 저장
      friendVO fvo = new friendVO();
  
      try
      {
            String jdbcDriver = "jdbc:oracle:thin:@localhost:1521/XE";
            String dbUser = "scott";
            String dbPass = "tiger";
           // String query = "select * from friendrequest where rfriend like ? and dist = 1";
           // String query = "select * from friendrequest where (rfriend like ? and dist = 1) or (afriend like ? and dist = 1)";
           
          String query = "select rfriend from friendrequest where afriend like ? and dist = 0";
         
          
            // 2. 데이터베이스 커넥션 생성
            conn = DriverManager.getConnection(jdbcDriver, dbUser, dbPass);
   
            // 3. Statement 생성
            pstmt = conn.prepareStatement(query);
    		pstmt.setString(1, id);

            // 4. 쿼리 실행
            rs = pstmt.executeQuery();
   
            // 5. 쿼리 실행 결과 출력
            while(rs.next())
            {
%>

        <tr>
          <td><%= rs.getString("rfriend") %></td>
          <%fvo.setRfriend(rs.getString("rfriend"));%>
          <td><a href="acfriend_ok.jsp?rid=<%=fvo.getRfriend()%>">친구 수락</a></td>
          <td><a href="acfriend_no.jsp?rid=<%=fvo.getRfriend()%>">친구 거절</a></td>
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
      <br><br><br>
       <table class="type09 type10">
      <tr>
            <th colspan="3">내가 친구 요청을 보낸 친구</th>
      </tr>
 
<%
      // 1. JDBC 드라이버 로딩
     Class.forName("oracle.jdbc.driver.OracleDriver");
  
      try
      {
            String jdbcDriver = "jdbc:oracle:thin:@localhost:1521/XE";
            String dbUser = "scott";
            String dbPass = "tiger";
           
          String query = "select afriend from friendrequest where rfriend like ? and dist = 0";
         
          
            // 2. 데이터베이스 커넥션 생성
            conn = DriverManager.getConnection(jdbcDriver, dbUser, dbPass);
   
            // 3. Statement 생성
            pstmt = conn.prepareStatement(query);
    		pstmt.setString(1, id);

            // 4. 쿼리 실행
            rs = pstmt.executeQuery();
   
            // 5. 쿼리 실행 결과 출력
            while(rs.next())
            {
%>

        <tr>
          <td><%= rs.getString("afriend") %></td>
          <%fvo.setRfriend(rs.getString("afriend"));%>
          <td><a href="acfriend_no2.jsp?rid=<%=fvo.getRfriend()%>">친구 요청 취소</a></td>
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
            <br><br><br>


</body>
</html>