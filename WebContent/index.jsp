<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page errorPage="/login.jsp" %>    
<%
	if(session.getAttribute("login_condition")==null){ //1.로그인상태가아니면 login.jsp로 보냄
		throw new RuntimeException();
	}
	String login_id = (String)session.getAttribute("login_id"); //로그인아이디
	SimpleDateFormat sdf = new SimpleDateFormat("YYYY-MM-dd HH:mm:ss");//포맷형식
	
%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>【Welcome】</title>
</head>
<body style="text-align: center;">
	
	<b><%=login_id %></b> 님 어서오세요!!<br/><br/>
	<a href="<%=application.getContextPath()%>/board/board.jsp"><button type="button">게시판</button></a>	
	<a href="<%=application.getContextPath()%>/message/send.jsp"><button type="button">쪽지보내기</button></a>	
	<a href="<%=application.getContextPath()%>/message/send_confirm.jsp"><button type="button">쪽지확인</button></a>	
	<a href="<%=application.getContextPath()%>/account/pw_update.jsp"><button>회원정보수정</button></a>
	<a href="<%=application.getContextPath()%>/logout.jsp"><button>로그아웃</button></a>
</body>
</html>