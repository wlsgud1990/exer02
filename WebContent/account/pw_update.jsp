<%@page import="java.util.Map"%>
<%@page import="beans.AccountDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String access_id = (String)session.getAttribute("access_id");
	AccountDao acd = new AccountDao();
	Map<String,Object> user = acd.getLoginData(access_id); // 로그인한유저정보
	String get_id = (String)user.get("id");
	String get_pw = (String)user.get("pass");
	String get_name = (String)user.get("name");
	String get_gender = (String)user.get("gender");
	
	if("M".equals(get_gender)){
		
	}
	
%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>【Welcome】</title>
</head>
<body style="text-align: center;">
	<h1> 회 원 정 보 수 정 </h1>
	<form action="chk_update.jsp" method="post">
		<label><b style="color: red">*</b> I D :</label><input type="text" name="id" value=<%=get_id%> style="color: gray" readonly/><br/><br/>
		<label><b style="color: red">*</b> P W :</label><input type="text" name="pass" value=<%=get_pw%> /><br/><br/>
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

</body>
</html>