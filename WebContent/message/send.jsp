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
	
	<form action="sended.jsp">
	<p>
		받을사람(*)<br/>
		<input type="text" name="receiver" placeholder="write a receiver" autocomplete="off" style="width: 220px; padding: 5px; ">	
	</p>
	<p>
		보낼내용(*)<br/>
		<textarea name="content" style="height: 300px; width: 220px; padding: 5px; resize: none; font-family: inherit;" 
			placeholder="write a message" ></textarea>
	</p>
	<button type="submit">메세지 전송</button>
	</form>
	<a href="../index.jsp"><button>이전</button></a>
</body>
</html>