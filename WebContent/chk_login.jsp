<%@page import="java.sql.Date"%>
<%@page import="java.util.*"%>
<%@page import="beans.AccountDao"%> 
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page errorPage="/error/default.jsp" %>    
<%
	//1.로그인했던 아이디 ,pw 파라미터값 받아오기
	String login_id = request.getParameter("loginId");
	String login_pw = request.getParameter("loginPw");
	System.out.println("login_id:"+login_id+"/ login_pw :"+login_pw);
	//2.객체생성
	AccountDao dao = new AccountDao();    
	//3.account 테이블에있는 전체데이터 datas에 담음
	List<Map<String,Object>> datas = dao.getAllDatas(); //null이면 정보없음,로그인비번다름
	
	//4.db에 account테이블의 id,pw 정보와 내가입력한 id,pw정보 비교후 로그인
	Map info = dao.getLoginData(login_id); //로그인한아이디정보 뽑아서 acc에저장
	if(info==null || !info.get("pass").equals(login_pw)){//★아이디로 맵조회했으니 비밀번호만비교하면됨
		response.sendRedirect(application.getContextPath()+"/login.jsp?mode=fail");//실패시 login.jsp에 넘어감
	}else{//패스워드가같으면
		Set<String> set = (Set)application.getAttribute("users");// 확인(다른브라우저에서도확인할수있으니)
		if(set.contains(login_id)){//아이디가 application에 등록되있으면
			throw new RuntimeException(login_id+" 는 이미 로그인되어있습니다."); 
		}else{
			set.add(login_id); // set에 login_id추가
			application.setAttribute("users", set);//application에 로그인id담음
			
			session.setAttribute("login_condition", true); //로그인확인 true
			session.setAttribute("login_id", login_id); //접속한 id 세션에저장
			
			Date date = new Date(System.currentTimeMillis());//현재시간update
			dao.addLoginData(login_id, date);//로그에 담음
			response.sendRedirect(application.getContextPath()+"/");//로그인되면 home으로 이동
		}
	}
%> 