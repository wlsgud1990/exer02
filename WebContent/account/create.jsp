<%@page import="beans.AccountDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>【Welcome】</title>
</head>
<body style="text-align: center;">
	<h1> 회 원 가 입 </h1>
	<form action="chk_create.jsp" method="get">
		<label><b style="color: red">*</b> I D :</label><input type="text" name="id"/><br/><br/>
		<label><b style="color: red">*</b> P W :</label><input type="text" name="pass"/><br/><br/>
		<label><b style="color: red">*</b> 이름 :</label><input type="text" name="name"/><br/><br/>
		<label><b style="color: red">*</b> 성별 :</label>
			<input type="radio" name="gender" value="M"/>남자
			<input type="radio" name="gender" value="F"/>여자<br/><br/>
		<button type="submit">가입</button>	
	</form>

</body>
</html>