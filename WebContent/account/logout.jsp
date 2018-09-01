<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	System.out.println("접속한 세션:"+session.getId());
	session.invalidate(); // 세션종료
	System.out.println(session.getId()+"세션종료하였습니다.");
	
	response.sendRedirect("/exer02/index.jsp");
%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>【Welcome】</title>
</head>
<body>
	
</body>
</html>