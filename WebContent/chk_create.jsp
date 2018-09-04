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
	
	//0. 정규식 체크
	boolean regex;
	String id_regex = "^[a-zA-Z0-9]{3,11}"; //영문숫자4~12
	String name_regex = "^[가-힣]+$";

	//1.맵에담기
	Map<String,String> param = new HashMap<>();
	param.put("id", id);
	param.put("pass", pass);
	param.put("name", name);
	param.put("gender", gender);
	
	//2.객체생성
	AccountDao acd = new AccountDao();
	//3.객체에 map insert
	//acd.addData(param);
	
	
%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>【Welcome】</title>
</head>
<body style="text-align: center;">
	<%if(id.matches(id_regex) && name.matches(name_regex)){ 
		acd.addData(param);%>
		<h1> 가입되었습니다.</h1>
		<a href="<%=application.getContextPath()%>/login.jsp"><button>로그인 하러가기</button></a>
	<%}else{ %>
		<h1> 규칙<br/> -id: 영문+숫자(4~12) <br/>-이름: 한글만 공백불가능 (무제한)</h1>
		<a href="<%=application.getContextPath()%>/create.jsp"><button>돌아가기</button></a>
	<%} %>
</body>
</html>