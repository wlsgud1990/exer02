<%@page import="java.util.*"%>
<%@page import="beans.AccountDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//1.객체생성
	AccountDao acd = new AccountDao();    
	//2.account 테이블에있는 전체데이터 datas에 담음
	List<Map<String,Object>> datas = acd.getAllDatas(); 
	
	//3.로그인했던 아이디 ,pw 파라미터값 받아오기
	String login_id = request.getParameter("loginId");
	String login_pw = request.getParameter("loginPw");
	
	System.out.println("login_id:"+login_id+"/ login_pw :"+login_pw);
	
	//4.db에 account테이블의 id,pw 정보와 내가입력한 id,pw정보 비교후 로그인
	
	boolean chk = false;//로그인체크
	for(int i=0; i<datas.size(); i++){ //가입된 db전부돌면서확인
		//datas.get(i) = datas의 list
		//datas.get(i).get("id") = list의 0번째 map의 id값
		if(datas.get(i).get("id").equals(login_id) 
				&& datas.get(i).get("pass").equals(login_pw)){
			chk=true;
			System.out.println("맞음");
		}else{
			//chk=false; // datas의 길이만큼체크하기떄문에  true였다가 다음꺼가틀리면 false가됨
			System.out.println("틀림");
		}
	}
	
	
%> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>【Welcome】</title>
</head>
<body style="text-align: center;">

<%if(chk==true){ %>
	<h1> 로그인되었습니다.</h1>
	<%
		session.setAttribute("access_id", login_id); //접속한 id 세션에저장
	%>
<%}else{
	response.sendRedirect("/exer02/index.jsp");
   }
%>

</body>
</html>