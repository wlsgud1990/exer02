<%@page import="beans.BoardDao"%>
<%@page import="java.util.*"%>
<%@page import="java.io.File"%>
<%@ page import="com.oreilly.servlet.multipart.Part"%>
<%@page import="com.oreilly.servlet.multipart.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	BoardDao dao = new BoardDao(); //객체생성
	String writer = (String) session.getAttribute("login_id"); // 로그인한아이디

	// arg , [0] : request , [1] : maxSize (byte) , [2] : buffer use, [3] : limit  , [4] : encoding
	// post의 기본 encoding과는 별도로 encodig 처리가 필요함.
	MultipartParser parser = new MultipartParser(request, 1024 * 1024 * 100, true, true, "UTF-8");
	//0.Map만들기
	Map datas = new HashMap<>();
	datas.put("writer", writer); // [★map]작성자

	Part part;
	while ((part = parser.readNextPart()) != null) { // 읽을게 null이아니면
		if (part.isFile()) {
			out.println("파일입니다.<br/>");
			FilePart fp = (FilePart) part; //part를 fp에 
			String file_name = fp.getFileName();//파일이름
			long curr = System.currentTimeMillis(); // 현재시간

			String realpath = application.getRealPath("/storage"); //경로
			File saveDir = new File(realpath, String.valueOf(curr)); // file로 변경
			saveDir.mkdirs();//폴더만듬
			fp.writeTo(saveDir);

			String attach = "/storage/" + curr + "/" + file_name;
			datas.put("attach", attach); // [★map]content 내용

			//}else if(part.isParam()){
		} else {
			out.println("파일이아닙니다.<br/>");
			ParamPart pp = (ParamPart) part;

			if (pp.getName().equals("title")) { //getName(form 의 name값 이 title이면)
				//파라미터
				String title = pp.getStringValue(); //값	
				datas.put("title", title); // [★map]map 타이틀
			} else if (pp.getName().equals("content")) { //getName(form 의 name값 이 content이면)
				String content = pp.getStringValue();
				datas.put("content", content); // [★map]content 내용
			} else {

			}
		}
	}

	System.out.println(datas);
	int r = dao.addBoard(datas);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		if (r == 1) {
	%>
	<b>저장되었습니다.</b>
	<a href="../index.jsp"><button>이전</button></a>
	<%
		} else {
	%>
	<b>저장실패</b>
	<a href="../index.jsp"><button>이전</button></a>
	<%
		}
	%>

</body>
</html>