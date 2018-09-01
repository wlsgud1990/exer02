<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@page import="beans.AccountDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String id = request.getParameter("id"); //아이디
	String pass = request.getParameter("pass"); //비번
	String name = request.getParameter("name"); // 이름
	String gender = request.getParameter("gender"); // 성별
	System.out.println(id+"/"+pass+"/"+name+"/"+gender);
	
	//1.맵에담기
	Map<String,String> param = new HashMap<>();
	param.put("id", id);
	param.put("pass", pass);
	param.put("name", name);
	param.put("gender", gender);
	
	//2.객체생성
	AccountDao acd = new AccountDao();
	//3.객체에 map insert
	acd.addData(param);
	
	
%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>【Welcome】</title>
</head>
<body style="text-align: center;">
	<h1> 가입되었습니다.</h1>
	<a href="/exer02/index.jsp"><button>로그인 하러가기</button></a>

</body>
</html>