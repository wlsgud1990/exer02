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
	
	<h1>글 작 성</h1>
	<form action="board_handle.jsp" method="post" enctype="multipart/form-data">
		<label><b style="color: red">*</b> 제 목 :</label><input type="text" name="title" style="width: 500px;"/><br/><br/>
		<label><b style="color: red">*</b> 내 용  :</label><input type="text" name="content" style="width: 500px; height: 300px;"/><br/><br/>
		<label><b style="color: red">*</b> 첨 부  :</label><input type="file" name="attach" style="width: 500px;"/><br/><br/>
		<button type="submit">등록</button>
	</form>
	<a href="../index.jsp"><button>이전</button></a>
</body>
</html>