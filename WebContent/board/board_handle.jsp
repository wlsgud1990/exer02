<%@page import="java.io.File"%>
<%@ page import="com.oreilly.servlet.multipart.Part"%>
<%@page import="com.oreilly.servlet.multipart.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String writer = (String)session.getAttribute("login_id"); // 로그인한아이디
	
	// arg , [0] : request , [1] : maxSize (byte) , [2] : buffer use, [3] : limit  , [4] : encoding
	// post의 기본 encoding과는 별도로 encodig 처리가 필요함.
	MultipartParser parser = new MultipartParser(request,1024*1024*100, true, true, "UTF-8");
	while(true) {
		Part part = parser.readNextPart();
		out.println(part+"<br/>");
		if(part == null){
			break;
		}else{
			String name = part.getName(); //파일이름
			boolean b1 = part.isFile();
			boolean b2 = part.isParam();
			out.println(name+".."+b1+"/"+b2+"<br/>");
			if(part.isFile()){ //첨부파일이면
				FilePart fp = (FilePart)part; //파일
				String fn = fp.getFileName(); // 파일이름
				
				String sav = application.getRealPath("/storage");
				File saveDir = new File(sav);
				fp.writeTo(saveDir);
				
				out.println("실제업로드한경로:"+sav+"<br/>");
				out.println("uri:"+application.getContextPath()+"/stroage/"+fn+"<br/>");
			}else if(part.isParam()){ // 아니면
				ParamPart pp = (ParamPart)part;
				String na = pp.getName();
				String val = pp.getStringValue();
				out.println("<h3>"+ na+"= " + val +"</h3>");
			}
		}
	}

%>     
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	로그인한아이디: <%=writer %>
	
</body>
</html>