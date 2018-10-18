<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>로그아웃</title>
</head>
<body>
<%
String id = (String) session.getAttribute("ID");
if (id != null)
	session.invalidate(); // 세션을 무효화 시킨다. 
	response.sendRedirect(request.getContextPath() + "/index.jsp");


%>
</body>
</html>