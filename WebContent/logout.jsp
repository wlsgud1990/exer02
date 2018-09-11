<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//쿠키지우는법(로그아웃시 쿠키삭제가안되면 다시접속하면 로그인되있음)
	Cookie c = new Cookie("freepass","dddd");
	c.setPath(application.getContextPath());
	c.setMaxAge(0); // maxAge 0 초로 설정해서 같은 이름으로 설정해서 보내서
	response.addCookie(c); // 기존의 쿠키를 무효화 시켜야한다.
	//--------------------------------------------------------

	System.out.println("접속한 세션:"+session.getId());
	session.invalidate(); // 세션종료
	Thread.sleep(2000);
	System.out.println(session.getId()+"세션종료하였습니다.");
	response.sendRedirect(application.getContextPath()+"/login.jsp");
%>    