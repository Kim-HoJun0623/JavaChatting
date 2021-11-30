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
  
    private DataSource dataFactory;
    UserVO uvo = new UserVO();
    BoardVO bvo = new BoardVO();
    
    public BoardDAO() {
    	 try {
             Context ctx = new InitialContext();
             Context envContext = (Context) ctx.lookup("java:/comp/env");
             dataFactory = (DataSource) envContext.lookup("jdbc/oracle");
          } catch (Exception e) {
        	
             e.printStackTrace();
          }
    }
    public String getName(String id) {//현유저 이름가져오기
    	PreparedStatement pstmt;
        String query = "select name from chat_members where id=?";
        try {
    		con = dataFactory.getConnection();
    		pstmt = con.prepareStatement(query);
    		pstmt.setString(1, id);
            ResultSet rs = pstmt.executeQuery();
            if(rs.next()) {
                return rs.getString(1);
              
                
            }
            
    	}catch(Exception e) {
    	
    		e.printStackTrace();
    	}
        return null;
    }
    public  ArrayList<UserVO> friendlist() {
    	 PreparedStatement pstmt;
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
            pstmt.close();
      	  con.close();
    	}catch(Exception e) {
    	
    		e.printStackTrace();
    	}
    	return list;
    }
    
	public int getNext() {
		 PreparedStatement pstmt;
		//현재 게시글을 내림차순으로 조회하여 가장 마지막 글의 번호를 구한다.
		String sql="select indexid from chatting order by indexid desc";
		try {
			 pstmt=con.prepareStatement(sql);
			ResultSet rs = pstmt.executeQuery();
			if(rs.next()) {
				
				return rs.getInt(1)+1;
			}	
			return 1;
		}catch(Exception e) {
			e.printStackTrace();
		}
		return -1;//데이터베이스 오류
	}
	public void setMessage(String name,String message,String user_id,String id) {
		 PreparedStatement pstmt;
		String sql="insert into CHATTING values(?, ?, ?, ?)";
		try {
				
			 con = dataFactory.getConnection();
			 pstmt = con.prepareStatement(sql);
			System.out.println(name);
			pstmt.setString(1,name);
			pstmt.setString(2,message);
			pstmt.setString(3,user_id);
			pstmt.setString(4,id);
			System.out.println("데이터입력");
			pstmt.executeUpdate();
			  pstmt.close();
        	  con.close();
		}catch(Exception e) {
			e.printStackTrace();
		}
	
	}
	public void ResetMessage(String id,String id2) {//메세지 지우고 다시저장
		PreparedStatement pstmt;
		 String query = "delete from chatting where id=? and id2=? or id=? and id2=?";
		 try {
	    		con = dataFactory.getConnection();
	    		pstmt = con.prepareStatement(query);
	    		pstmt.setString(1, id);
	    		pstmt.setString(2, id2);
	    		pstmt.setString(3, id2);
	    		pstmt.setString(4, id);
	    		pstmt.executeUpdate();
	             pstmt.close();
           	  con.close();
	    	}catch(Exception e) {
	    	
	    		e.printStackTrace();
	    	}
	}
	public BoardVO  getMessge(String id,String id2) {
		 PreparedStatement pstmt;
		 String query = "select * from chatting where id=? and id2=? or id=? and id2=?";
		try {
    		con = dataFactory.getConnection();
    		pstmt = con.prepareStatement(query);
    		pstmt.setString(1, id);
    		pstmt.setString(2, id2);
    		pstmt.setString(3, id2);
    		pstmt.setString(4, id);
            ResultSet rs = pstmt.executeQuery();
    
            if(rs.next()) {
            	bvo.setName(rs.getString(1));
            	bvo.setContext(rs.getString(2));
            	bvo.setId(rs.getString(3));
            	bvo.setId2(rs.getString(4));
            	  pstmt.close();
            	  con.close();
            	return bvo;
            	
            }
            pstmt.close();
      	  con.close();
    	}catch(Exception e) {
    	
    		e.printStackTrace();
    	}
		
		return bvo;
    	}

 
}
