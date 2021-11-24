package catting;

import user.UserVO;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class BoardDAO {
	private Connection con;
    private PreparedStatement pstmt;
    private DataSource dataFactory;
    
    public BoardDAO() {
    	System.out.println("오류검출DB");
    	 try {
             Context ctx = new InitialContext();
             Context envContext = (Context) ctx.lookup("java:/comp/env");
             dataFactory = (DataSource) envContext.lookup("jdbc/oracle");
          } catch (Exception e) {
        	
             e.printStackTrace();
          }
    }
    public  ArrayList<UserVO> friendlist() {
		
        String query = "select * from chat_members";
        ArrayList<UserVO> list = new ArrayList<UserVO>();
    	try {
    		con = dataFactory.getConnection();
    		pstmt = con.prepareStatement(query);
            ResultSet rs = pstmt.executeQuery();
    
            while(rs.next()) {
 /*           	String id = rs.getString("id");
            	String pw = rs.getString("pw");
            	String name=rs.getString("name");
            	String phone1 =rs.getString("phone1");
            	String phone2 =rs.getString("phone2");
            	String phone3 =rs.getString("phone3");*/
            
            	UserVO vo = new UserVO();
            	vo.setId(rs.getString(1));
            	vo.setPw(rs.getString(2));
            	vo.setName(rs.getString(3));
            	vo.setPhone1(rs.getString(4));
            	vo.setPhone2(rs.getString(5));
            	vo.setPhone3(rs.getString(6));
            	list.add(vo);
            	
            }
    	}catch(Exception e) {
    	
    		e.printStackTrace();
    	}
    	return list;
    }
}
