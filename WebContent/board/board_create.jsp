<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<body style="text-align: center;">
</head>
<body>
	<h1>글 작 성</h1>
	<form action="board_handle.jsp" method="post" enctype="multipart/form-data">
		<label><b style="color: red">*</b> 제 목 :</label><input type="text" name="title" style="width: 500px;"/><br/><br/>
		<label><b style="color: red">*</b> 내 용  :</label><input type="text" name="content" style="width: 500px; height: 300px;"/><br/><br/>
		<label><b style="color: red">*</b> 첨 부  :</label><input type="file" name="attach" style="width: 500px;"/><br/><br/>
		<button type="submit">등록</button>
	</form>
	<a href="../index.jsp"><button>이전</button></a>
</body>
</html>