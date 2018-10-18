<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>제목없음</title>
</head>
<body>

	<jsp:useBean id="post" class="member.PostInfo" scope="page" />
	
	
	<jsp:setProperty name="post" property="title" param="title"/>
	<jsp:setProperty name="post" property="text" value="<%=request.getParameter(\"text\") %>"/>
	
	<jsp:setProperty name="post" property="created_date" param="created_date"/>
	
	
	<jsp:useBean id="data" class="member.DataManager" scope="page" />

	<%
	out.print(request.getParameter("title"));
	out.print(request.getParameter("text"));
	
	out.print(post.getText());
	
	%>
</body>
</html>