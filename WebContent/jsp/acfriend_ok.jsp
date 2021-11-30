<%@ page import = "java.sql.DriverManager" %>
<%@ page import = "java.sql.Connection" %>
<%@ page import = "java.sql.Statement" %>
<%@ page import = "java.sql.ResultSet" %>
<%@ page import = "java.sql.SQLException" %>
<%@page import="java.sql.PreparedStatement"%>
<%@ page import="user.friendVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	request.setCharacterEncoding("UTF-8");

	String id = (String)session.getAttribute("user_id");

    // DB연결에 필요한 변수 선언
	String url = "jdbc:oracle:thin:@localhost:1521/XE";
	String uid = "scott";
	String upw = "tiger";
	String rid = request.getParameter("rid");
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	friendVO fvo = new friendVO();

	
	try
    {
          String jdbcDriver = "jdbc:oracle:thin:@localhost:1521/XE";
          String dbUser = "scott";
          String dbPass = "tiger";
      
        String query = "update friendrequest set dist = 1 where rfriend like ? and afriend like ?";
          // 2. 데이터베이스 커넥션 생성
          conn = DriverManager.getConnection(jdbcDriver, dbUser, dbPass);

          // 3. Statement 생성
          pstmt = conn.prepareStatement(query);
  		  pstmt.setString(1, rid);
  		  pstmt.setString(2, id);
  		  response.sendRedirect("acfriend.jsp");
          // 4. 쿼리 실행
          rs = pstmt.executeQuery();

        
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

</body>
</html>