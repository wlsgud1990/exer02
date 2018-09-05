<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body style="text-align: center;">
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