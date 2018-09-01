<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String access_id = (String)session.getAttribute("access_id");
%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>【Welcome】</title>
</head>
<body style="text-align: center;">
	
	<b><%=access_id %></b> 님 어서오세요!!<br/><br/>
	
	<a href="pw_update.jsp"><button>회원정보수정</button></a>
	<a href="logout.jsp"><button>로그아웃</button></a>
	
</body>
</html>