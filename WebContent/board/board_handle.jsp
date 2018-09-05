<%@page import="beans.BoardDao"%>
<%@page import="java.util.*"%>
<%@page import="java.io.File"%>
<%@ page import="com.oreilly.servlet.multipart.Part"%>
<%@page import="com.oreilly.servlet.multipart.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	BoardDao dao = new BoardDao(); //객체생성
	String writer = (String)session.getAttribute("login_id"); // 로그인한아이디
	
	// arg , [0] : request , [1] : maxSize (byte) , [2] : buffer use, [3] : limit  , [4] : encoding
	// post의 기본 encoding과는 별도로 encodig 처리가 필요함.
	MultipartParser parser = new MultipartParser(request,1024*1024*100, true, true, "UTF-8");
	//1.part뽑기
	String realpath=""; //절대경로
	String param=""; //파라미터
	String value=""; //값
	
	while(true){
		Part part = parser.readNextPart();
		out.println(part+"<br/>");
		if(part == null){
			break; //뽑는걸멈춤
		}else{
			//String name = part.getName(); //파라미터명
			//String name = part.getName();
			//boolean b1 = part.isFile();
			//boolean b2 = part.isParam();
			if(part.isFile()){
				out.println("파일입니다.<br/>");
				FilePart fp = (FilePart)part; //part를 fp에 
				//String fn = fp.getFileName();파일이름
				realpath = application.getRealPath("/storage"); //경로
				File saveDir = new File(realpath); // file로 변경
				fp.writeTo(saveDir);				
			}else if(part.isParam()){
				out.println("파일이아닙니다.<br/>");
				ParamPart pp = (ParamPart)part;
				param = pp.getName();  //파라미터
				value = pp.getStringValue(); //값				
				//out.println("<h3>"+ param+"= " + c_value +"</h3>");
			}
		}
	}
	Map info = new HashMap<>();
	info.put("writer", writer);
	info.put("title", value);
	info.put("content", value); // value따로뽑는법	
	info.put("attach", realpath);
	
	int r = dao.addBoard(info); 

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		if(r==1){
	%>
		<b>저장되었습니다.</b>
	<%	
		}else{
	%>
		<b>저장실패</b>
	<%		
		}
	%>

</body>
</html>