<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>제목없음</title>
</head>
<body>
포스트 디테일 
	<jsp:useBean id="data" class="member.DataManager" scope="page" />

<%

out.print(request.getAttribute("post_num"));

%>
</body>
</html>