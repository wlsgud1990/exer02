<%@page import="beans.AccountDao"%>
<%@page import="java.util.*"%>
<%@page import="java.sql.Date"%>
<%@page import="java.util.UUID"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String receiver = request.getParameter("receiver");//1.받을사람
	String content = request.getParameter("content");//2.보낼내용
	String sender = (String)session.getAttribute("login_id");//3.보낸사람  
	//4.코드생성
	UUID uuid = UUID.randomUUID();
	String serial = uuid.toString().split("-")[0];
	
	//5.쪽지보낸시간
	Date senddate = new Date(System.currentTimeMillis()); 
	
	//6.map에담기
	Map<String,Object> param = new LinkedHashMap<>();
	param.put("code", serial);
	param.put("sender", sender);
	param.put("receiver", receiver);
	param.put("content", content);
	param.put("senddate", senddate);
	
	System.out.println("param:"+param);
	
	AccountDao dao = new AccountDao();
	int success = dao.sendMessage(param);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%if(success != -1){ %>
	<h2>메세지가 전송되었습니다.</h2>
	<a href="send.jsp"><button>돌아가기</button></a>
	<%}else{ %>
	<h2>메세지가 전송되지않았습니다.</h2>
	<%} %>
</body>
</html>