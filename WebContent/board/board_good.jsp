<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@page import="beans.BoardDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	int no = Integer.parseInt(request.getParameter("no")); // 글번호
	String login_id = (String)session.getAttribute("login_id"); // 로그인한아이디

	BoardDao dao = new BoardDao();
	int r = dao.updateGood(no);
	
	if(r==1){
		Map param = new HashMap();
		param.put("actor", login_id);
		param.put("target",no);
		
		int log = dao.insertGoodlog(param);
		if(log==1){ // 로그찍기성공하면
			response.sendRedirect(application.getContextPath()+"/board/board_detail.jsp?no="+no+"&good=success");
		}else{
			response.sendRedirect(application.getContextPath()+"/board/board_detail.jsp?no="+no+"&good=fail");
		}
	}else{
		response.sendRedirect(application.getContextPath()+"/board/board_detail.jsp?no="+no+"&good=fail");
	}		
%>    
