<%@page import="javax.swing.JOptionPane"%>
<%@page import="java.util.*"%>
<%@page import="beans.BoardDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	int no = Integer.parseInt(request.getParameter("no")); // 어떻게뽑지??....
	BoardDao dao = new BoardDao();
	Map detail = dao.getOneByNo(no);
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
	<h2>상세보기</h2>
	<%if(detail == null){ %>
		 <p>
		 	이미 삭제된 글이나, DB 장애로 인해 데이터를 불러올수 없습니다.
		 </p>
	<%}else{ %>
		작성자:<%=detail.get("WRITER") %><br/>
		제목:<%=detail.get("TITLE") %><br/>
		내용:<%=detail.get("CONTENT") %><br/>
		<%
			if(detail.get("ATTACH") != null){
		%>
		첨부파일:<a href="<%=application.getContextPath()%>/<%=detail.get("ATTACH")%>" download >다운로드</a>
		<%} %>
	<%} %>
	
	<p>
		<a href="<%=application.getContextPath()%>/board/board_good.jsp?no=<%=no%>"><button>추천</button></a>
		<a href="<%=application.getContextPath()%>/board/board.jsp"><button>목록</button></a>
	</p>
	
	<%
		String mode = request.getParameter("good");
		if(mode == null){
			//mode파라미터가 없으면
		}else{ // 파라미터가있으면
			if(mode.equals("fail")){
				//JOptionPane.showMessageDialog(null, "이미추천하였습니다.");
			}else if(mode.equals("success")){
				//JOptionPane.showMessageDialog(null, "추천하였습니다.");
			}
		}
	%>
</body>
</html>