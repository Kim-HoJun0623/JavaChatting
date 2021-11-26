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
    
	public int getNext() {
		//현재 게시글을 내림차순으로 조회하여 가장 마지막 글의 번호를 구한다.
		String sql="select indexid from chatting order by indexid desc";
		try {
			con = dataFactory.getConnection();
			 pstmt=con.prepareStatement(sql);
			ResultSet rs = pstmt.executeQuery();
			if(rs.next()) {
				System.out.println("@@@@@@@@@@번호부여"+rs.getInt(1)+1);
				return rs.getInt(1)+1;
			
			}	
			System.out.println("번호부여실패");
			return 1;
		}catch(Exception e) {
			e.printStackTrace();
		}
		return -1;//데이터베이스 오류
	}
	public void setMessage(String name,String message,String user_id,String id) {
		String sql="insert into CHATTING values(?, ?, ?, ?, ?)";
		//String sql="insert into test values(?)";
		try {

			 con = dataFactory.getConnection();
			 pstmt = con.prepareStatement(sql);
			 
			pstmt.setInt(1, (Integer)getNext());
			 //pstmt.setInt(1, 100);
			System.out.println(getNext());
			System.out.println(name);
			
			pstmt.setString(2,"kim");
			pstmt.setString(3,"kim");
			pstmt.setString(4,"kim");
			pstmt.setString(5,"kim'");
			System.out.println("데이터입력");
			 pstmt.executeUpdate();
		}catch(Exception e) {
			e.printStackTrace();
		}
	
	}

 
}
