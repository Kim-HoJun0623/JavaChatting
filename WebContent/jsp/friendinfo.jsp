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
<link rel="stylesheet" type="text/css" href="../css/boardstyle.css" />
<meta charset="utf-8">
<title>Insert title here</title>
</head>
<body>


 <table border = "1" class="type11">
      <tr>
            <th scope="cols">친구 ID</th>
            <th scope="cols">친구 이름</th>
            <th scope="cols">친구 전화번호</th>
      </tr>
 
<%
	 String aid = request.getParameter("aid");
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

           
          String query = "select * from chat_members where id like ?";
         
          
            // 2. 데이터베이스 커넥션 생성
            conn = DriverManager.getConnection(jdbcDriver, dbUser, dbPass);
   
            // 3. Statement 생성
            pstmt = conn.prepareStatement(query);
    		pstmt.setString(1, aid);

            // 4. 쿼리 실행
            rs = pstmt.executeQuery();
   
            // 5. 쿼리 실행 결과 출력
            while(rs.next())
            {
%>

        <tr>
          <td><%= rs.getString("id") %></td>
          <td><%= rs.getString("name") %></td>
          <td><%= rs.getString("phone1") %> - <%= rs.getString("phone2")%> - <%= rs.getString("phone3") %></td>
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