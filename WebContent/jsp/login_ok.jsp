<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");

	String id = request.getParameter("id");
	String pw = request.getParameter("pw");
    // DB연결에 필요한 변수 선언
	String url = "jdbc:oracle:thin:@localhost:1521/XE";
	String uid = "scott";
	String upw = "tiger";
	
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
	String sql = "select * from chat_members where id = ? and pw = ?";
	
	try{
		// 드라이버 호출
		Class.forName("oracle.jdbc.driver.OracleDriver");
		
		// conn 생성
		conn = DriverManager.getConnection(url, uid, upw);
		
		// pstmt 생성
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, id);
		pstmt.setString(2, pw);
		
		// sql실행
		rs = pstmt.executeQuery();
		
		if(rs.next()){ // 로그인 성공(인증의 수단 session)
			id = rs.getString("id");
			String name = rs.getString("name");
			String phone1 = rs.getString("phone1");
			String phone2 = rs.getString("phone2");
			String phone3 = rs.getString("phone3");
		
			session.setAttribute("user_id", id);
			session.setAttribute("user_name", name);
			session.setAttribute("user_phone1", phone1);
			session.setAttribute("user_phone2", phone2);
			session.setAttribute("user_phone3", phone3);
			
			response.sendRedirect("../index.jsp"); // 페이지이동
			
		} else{ // 로그인 실패
			response.sendRedirect("login_fail.jsp"); // 실패 페이지
		}
	} catch(Exception e){
		e.printStackTrace();
		response.sendRedirect("login.jsp"); // 에러가 난 경우도 리다이렉트
	} finally{
		try{
			if(conn != null) conn.close();
			if(pstmt != null) pstmt.close();
			if(rs != null) rs.close();
		} catch(Exception e){
			e.printStackTrace();
		}
	}
 %>