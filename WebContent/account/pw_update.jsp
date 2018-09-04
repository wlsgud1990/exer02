<%@page import="java.util.Map"%>
<%@page import="beans.AccountDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	response.setStatus(200);
	String mode = request.getParameter("mode"); // 비밀번호변경상태
	
	String login_id = (String)session.getAttribute("login_id");
	AccountDao acd = new AccountDao();
	Map<String,Object> user = acd.getLoginData(login_id); // 로그인한유저정보
	String get_id = (String)user.get("id");
	String get_pw = (String)user.get("pass");
	String get_name = (String)user.get("name");
	String get_gender = (String)user.get("gender");
	
%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>【Welcome】</title>
</head>
<body style="text-align: center;">
	<h1> 회 원 가 입 </h1>
	<form action="chk_update.jsp" method="post">
		<label><b style="color: red">*</b> I D :</label><input type="text" name="id" value=<%=get_id%> style="color: gray" readonly/><br/><br/>
		<label><b style="color: red">*</b> 현재  비밀번호 :</label><input type="text" name="pass" value=<%=get_pw%> /><br/><br/>
		<label><b style="color: red">*</b> 변경 비밀번호 :</label><input type="text" name="change_pass"  /><br/><br/>
		<label><b style="color: red">*</b> 비밀번호 확인 :</label><input type="text" name="confirm_pass"  /><br/><br/>
		<label><b style="color: red">*</b> 이름 :</label><input type="text" name="name" value=<%=get_name%> /><br/><br/>
		<label><b style="color: red">*</b> 성별 :</label>
			
			<input type="radio" name="gender"   value="M" 
				<%if("M".equals(get_gender)){%>
					checked="checked"
				<% }%>/>남자
				
			<input type="radio" name="gender" value="F" 
				<%if("F".equals(get_gender)){%>
					checked="checked"
				<% }%>/>여자<br/><br/>
				
		<button type="submit">수정</button>	
	</form>
	<a href="<%=application.getContextPath()%>/"><button>돌아가기</button></a>
	
	<%
		if(mode!= null && mode.equals("updatefail")){
	%>
		<p style="color: red; font-size: small;">
			기본비밀번호가 다르거나, 변경비밀번호를 다시확인해주세요.
		</p>
	<%
		}
	%>
</form>

</body>
</html>