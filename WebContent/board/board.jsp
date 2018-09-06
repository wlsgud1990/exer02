<%@page import="java.util.*"%>
<%@page import="beans.BoardDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	BoardDao dao = new BoardDao();
	List<Map> list = dao.getBoard();
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
	<%
		if (list == null || list.size() == 0) {
	%>
	현재등록된 데이터가 없습니다.
	<%
		} else {
			for (int i = 0; i < list.size(); i++) {
				Map map = list.get(i);
				Number no = (Number)map.get("NO");
				String writer = (String)map.get("WRITER");
				String title = (String)map.get("TITLE");
				Date leftdate = (Date)map.get("LEFTDATE");
				String content = (String)map.get("CONTENT");
				Number good = (Number)map.get("GOOD");
				String attach = (String)map.get("ATTACH");
				%>
				번호:<%=no %> 
				제목:<a href="<%=application.getContextPath()%>/board/board_detail.jsp?no=<%=map.get("NO")%>"><b><%=title %></b></a> 
				글쓴이:<%=writer %> (추천:<%=good %>)
				<br/>
				<%
			}
		}
	%>

	<a href="board_create.jsp"><button>작성</button></a>
	<a href="../index.jsp"><button>이전</button></a>
</body>
</html>