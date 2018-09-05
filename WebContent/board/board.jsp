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
	<h2>게시판</h2>
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
				번호:<%=no %> 글쓴이:<%=writer %> 제목:<%=title %> 내용:<%=content %>
				<br/>
				<%
			}
		}
	%>

	<a href="board_create.jsp"><button>작성</button></a>
</body>
</html>