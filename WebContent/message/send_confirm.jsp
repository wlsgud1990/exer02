<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.*"%>
<%@page import="beans.*"%>
<%@page import="java.sql.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%> 
<%
	Date receive= new Date(System.currentTimeMillis()); // 편지함확인시간
	String receiver = (String)session.getAttribute("login_id"); //접속한사람
	System.out.println(receiver);
	AccountDao dao = new AccountDao();
	
	List<Map<String,Object>> info = dao.receiveMessage(receiver);
	SimpleDateFormat sdf = new SimpleDateFormat("YYYY-MM-dd HH:mm:ss");
%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>【Welcome】</title>
</head>
<body style="text-align: center;">
	<h1> W E L C O M E</h1>
	<p style="text-align: right;">
		<b><%=session.getAttribute("login_id") %></b> 님 어서오세요!!<br/><br/>
	</p>
	
	<p style="text-align: right;">
		<a href="<%=application.getContextPath()%>/board/board.jsp"><button type="button">게시판</button></a>	
		<a href="<%=application.getContextPath()%>/message/send.jsp"><button type="button">쪽지보내기</button></a>	
		<a href="<%=application.getContextPath()%>/message/send_confirm.jsp"><button type="button">쪽지확인</button></a>	
		<a href="<%=application.getContextPath()%>/account/pw_update.jsp"><button>회원정보수정</button></a>
		<a href="<%=application.getContextPath()%>/logout.jsp"><button>로그아웃</button></a>
	</p>
	<hr>
	<p>
	<% 
		if(info == null){
	%>
		<h2>받은쪽지가없습니다.</h2>
	<%		
		}else{
			for(int i=0; i<info.size(); i++){
				String code = (String)info.get(i).get("code");
				String sender = (String)info.get(i).get("sender");
				String receiver_2 = (String)info.get(i).get("receiver");
				String content = (String)info.get(i).get("content");
				Date senddate = (Date)info.get(i).get("senddate");
				Date receivedate = (Date)info.get(i).get("receivedate");
				if(receivedate == null){
					dao.receiveDate(code, receive);
				}
			
	%>
		보낸사람:<%=sender %> ,내용:<%=content %>, 보낸시간:<%=senddate %>, 읽은시간:<%=sdf.format(receivedate) %> <br/>	
	<%		
			}
		}
	%>
	</p>

</body>
</html>