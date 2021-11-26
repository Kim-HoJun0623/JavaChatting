<%@ page contentType = "text/html; charset=euc-kr" %>
<%@ page import = "java.sql.DriverManager" %>
<%@ page import = "java.sql.Connection" %>
<%@ page import = "java.sql.Statement" %>
<%@ page import = "java.sql.ResultSet" %>
<%@ page import = "java.sql.SQLException" %>
<%@page import="java.sql.PreparedStatement"%>


 
<%
	String id = (String)session.getAttribute("user_id");
%>
<html>
<head><title>ȸ�� ���</title></head>
<body>
      (<%=id %>)�� ģ�� ���̺��� ����
      <table width = "100%" border = "1">
      <tr>
            <td>ģ��</td>
      </tr>
 
<%
      // 1. JDBC ����̹� �ε�
     Class.forName("oracle.jdbc.driver.OracleDriver");
  
      Connection conn = null; // DBMS�� Java���ᰴü
  	  PreparedStatement pstmt = null;
      ResultSet rs = null; // SQL������ �������� ����
  
      try
      {
            String jdbcDriver = "jdbc:oracle:thin:@localhost:1521/XE";
            String dbUser = "scott";
            String dbPass = "tiger";
           // String query = "select * from friendrequest where rfriend like ? and dist = 1";
           // String query = "select * from friendrequest where (rfriend like ? and dist = 1) or (afriend like ? and dist = 1)";
           
          String query = "select afriend from friendrequest where (rfriend like ? and dist = 1) union select rfriend from friendrequest where (afriend like ? and dist = 1)";
            // 2. �����ͺ��̽� Ŀ�ؼ� ����
            conn = DriverManager.getConnection(jdbcDriver, dbUser, dbPass);
   
            // 3. Statement ����
            pstmt = conn.prepareStatement(query);
    		pstmt.setString(1, id);
    		pstmt.setString(2, id);
            // 4. ���� ����
            rs = pstmt.executeQuery();
   
            // 5. ���� ���� ��� ���
            while(rs.next())
            {
%>

        <tr>
          <td><%= rs.getString("afriend") %></td>
       </tr>
<%
            }
      }catch(SQLException ex){
            out.println(ex.getMessage());
            ex.printStackTrace();
      }finally{
            // 6. ����� Statement ����
            if(rs != null) try { rs.close(); } catch(SQLException ex) {}
            if(pstmt != null) try { pstmt.close(); } catch(SQLException ex) {}
   
            // 7. Ŀ�ؼ� ����
            if(conn != null) try { conn.close(); } catch(SQLException ex) {}
      }
%>
      </table>
</body>
</html>