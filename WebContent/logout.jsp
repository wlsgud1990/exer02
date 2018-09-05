<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	System.out.println("접속한 세션:"+session.getId());
	session.invalidate(); // 세션종료
	Thread.sleep(2000);
	System.out.println(session.getId()+"세션종료하였습니다.");
	response.sendRedirect(application.getContextPath()+"/login.jsp");
%>    