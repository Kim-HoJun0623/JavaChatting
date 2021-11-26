<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	String id = (String)session.getAttribute("user_id");
	String fri_id = request.getParameter("fri_id");
%>




<!DOCTYPE html>
<%@ page import = "java.sql.DriverManager" %>
<%@ page import = "java.sql.Connection" %>
<%@ page import = "java.sql.Statement" %>
<%@ page import = "java.sql.ResultSet" %>
<%@ page import = "java.sql.SQLException" %>
<%@page import="java.sql.PreparedStatement"%>
<%@ page import="user.friendVO"%>

<%


	
	// 1.변수선언
	String url = "jdbc:oracle:thin:@localhost:1521/XE";
	String uid = "scott";
	String upw = "tiger";
	String aid = request.getParameter("aid");
	
	Connection conn = null;
	PreparedStatement pstmt = null;
	
	String sql = "insert into friendrequest values(?, ?, ?)";
	
	try{
		// 1. 드라이버 로드
		Class.forName("oracle.jdbc.driver.OracleDriver");
		
		// 2. conn 생성
		conn = DriverManager.getConnection(url, uid, upw);
		int dist = 0;
		// 3. pstmt 생성
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, id);
		pstmt.setString(2, aid);
		pstmt.setInt(3,dist);

		response.sendRedirect("refriend_success.jsp"); // 페이지이동
		// 4. sql문 실행
		int result = pstmt.executeUpdate();
		

		
	} catch(Exception e){
		e.printStackTrace();
	} finally{
		try{
			if(conn != null) conn.close();
			if(pstmt != null) pstmt.close();
		} catch(Exception e){
			e.printStackTrace();
		}
	}
%>