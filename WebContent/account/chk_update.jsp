<%@page import="beans.AccountDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//1.파라미터 전달받기
	String update_id = request.getParameter("id");
	String update_pw = request.getParameter("pass");
	String update_name = request.getParameter("name");
	String update_gender = request.getParameter("gender");
	System.out.println(update_id+"/"+update_pw+"/"+update_name+"/"+update_gender);
	//2.객체생성
	AccountDao acd = new AccountDao();
	//3.객체에 import
	acd.updateLoginData(update_id, update_pw, update_name, update_gender);
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>【Welcome】</title>
</head>
<body style="text-align: center;">
	<h1> 수정되었습니다.</h1>
	<a href="home.jsp"><button>돌아가기</button></a>
</body>
</html>