<%@page import="java.util.Map"%>
<%@page import="beans.AccountDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//0.로그인한 아이디 
	String login_id = (String)session.getAttribute("login_id"); // 로그인된아이디
	//1.파라미터 전달받기
	String update_id = request.getParameter("id");
	String pass = request.getParameter("pass");//현재비밀번호
	String update_pass = request.getParameter("change_pass"); //변경할비밀번호
	String confirm_pass = request.getParameter("confirm_pass"); //변경할비밀번호 확인	
	String update_name = request.getParameter("name");
	String update_gender = request.getParameter("gender");
	
	//2.객체생성
	AccountDao dao = new AccountDao();
	Map info = dao.getLoginData(login_id);
	//3.객체에 import
	 
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>【Welcome】</title>
</head>
<body style="text-align: center;">

<%
	if(pass.equals(info.get("pass"))==true && update_pass.equals(confirm_pass)==true){
		dao.updateLoginData(update_id, update_pass, update_name, update_gender);
%>
	<h1> 수정되었습니다.</h1>
	<a href="<%=application.getContextPath()%>/"><button>돌아가기</button></a>
	<%}else{ 
		response.sendRedirect(application.getContextPath()+"/account/pw_update.jsp?mode=updatefail");
	}%>
</body>
</html>