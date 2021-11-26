<%@ page import = "java.sql.DriverManager" %>
<%@ page import = "java.sql.Connection" %>
<%@ page import = "java.sql.Statement" %>
<%@ page import = "java.sql.ResultSet" %>
<%@ page import = "java.sql.SQLException" %>
<%@page import="java.sql.PreparedStatement"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");

	String id = (String)session.getAttribute("user_id");
	String rid = request.getParameter("rfriend");
    // DB연결에 필요한 변수 선언
	String url = "jdbc:oracle:thin:@localhost:1521/XE";
	String uid = "scott";
	String upw = "tiger";
	
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
	String sql = "select * from chat_members where id = ? and pw = ?";
	
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
  		  pstmt.setString(1, "flozzang");
  		  pstmt.setString(2, id);
          // 4. 쿼리 실행
          rs = pstmt.executeQuery();
 
          // 5. 쿼리 실행 결과 출력
          while(rs.next())
          {
%>

      <tr>
        <td><%= rs.getString("rfriend") %></td>
        <td><a href="acfriend_ok.jsp <%= rs.getString("rfriend") %>">친구 수락</a></td>
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


</body>
</html>