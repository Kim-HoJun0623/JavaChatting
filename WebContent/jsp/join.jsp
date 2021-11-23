<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Insert title here</title>
</head>
<body>

	<h2>회원가입</h2>
	
	<form action="join_ok.jsp" method="post">
		아이디:<input type="text" name="id"><br/>
		비밀번호:<input type="password" name="pw"><br/>
		이름:<input type="text" name="name"><br/>
		전화번호:
		<select name="phone1">
			<option>010</option>
			<option>02</option>
			<option>031</option>
			<option>051</option>
		</select>
		- <input type="text" name="phone2" size="4">
		- <input type="text" name="phone3" size="4">
		
		<br/>

		
		<input type="submit" value="가입">
		
	</form>

</body>
</html>