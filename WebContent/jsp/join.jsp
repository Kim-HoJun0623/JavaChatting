<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>

<meta charset="utf-8">
<title>Insert title here</title>
<link rel="stylesheet" href="../css/loginform.css">
</head>
<body>

	<h2>회원가입</h2>
	
	<form action="join_ok.jsp" method="post">
	<div class="input-box"> 
		<input type="text" name="id"><br/>
		<label for="username">아이디</label> 
		</div>
	<div class="input-box"> 
		<input type="password" name="pw"><br/>
				<label for="username">패스워드</label> 
				</div>
					<div class="input-box"> 
		<input type="text" name="name"><br/>
		<label for="username">이름</label> 
		</div>

		전화번호:
		<select name="phone1">
			<option>010</option>
			<option>02</option>
			<option>031</option>
			<option>051</option>
		</select>
		</div>
		- <input type="text" name="phone2" size="4">
		- <input type="text" name="phone3" size="4">

		<br/><br/>

		
		<input class="btn" type="submit" value="가입">
		
	</form>

</body>
</html>