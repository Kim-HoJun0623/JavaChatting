package catting;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class BoardDAO {
	private Connection con;
    private PreparedStatement pstmt;
    private DataSource dataFactory;
    
    public BoardDAO() {
    	 try {
             Context ctx = new InitialContext();
             Context envContext = (Context) ctx.lookup("java:/comp/env");
             dataFactory = (DataSource) envContext.lookup("jdbc/oracle");
          } catch (Exception e) {
             e.printStackTrace();
          }
    }
    public void friendlist() {
    	try {
    		con = dataFactory.getConnection();
            String query = "select id from chat_memever";
            pstmt = con.prepareStatement(query);
            ResultSet rs = pstmt.executeQuery();
            while(rs.next()) {
            	String id = rs.getString("id");
            	String pw = rs.getString("pw");
            	String name=rs.getString("name");
            	String phone1 =rs.getString("phone1");
            	String phone2 =rs.getString("phone2");
            	String phone3 =rs.getString("phone3");
            
            }
    	}catch(Exception e) {
    		e.printStackTrace();
    	}
    }
}
