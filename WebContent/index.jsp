<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>【Welcome】</title>
</head>
<body style="text-align: center;">
	<h1> W E L C O M E</h1>
	<form action="/exer02/account/home.jsp" method="post">
		<label>I D:</label><input type="text" name="loginId" placeholder="아이디를 입력해주세요" style="width: 230px;"><br/><br/>
		<label>PW:</label><input type="password" name="loginPw" placeholder="비밀번호를 입력해주세요" style="width: 230px;"><br/><br/>
		<button type="submit">로그인하기</button><br/><br/>
	</form>
	<a href="/exer02/account/membership.jsp"><button>회 원 가 입</button></a>
</body>
</html>