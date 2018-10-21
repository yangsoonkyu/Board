<%@page import="member.PostInfo"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>제목없음</title>
</head>
<body>

	<jsp:useBean id="post" class="member.PostInfo" scope="page" />


	<jsp:setProperty name="post" property="id"
		value="<%=session.getAttribute(\"ID\")%>" />
	<jsp:setProperty name="post" property="title" param="title" />
	<jsp:setProperty name="post" property="text"
		value="<%=request.getParameter(\"text\")%>" />
	<jsp:setProperty name="post" property="post_num" value="${corenum }" />


	<jsp:useBean id="data" class="member.DataManager" scope="page" />
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

	<%
		//int num = post.getPost_num();
		

		String rPath = request.getContextPath();
		if (data.updatePost(post) != 0) {
			out.print(" 글이 수정되었습니다.");
			out.print("<a href=\"" + rPath + "/board/post_list.jsp\">목록으로</a><br/>");

		} else {
			out.print("수정하기 실패");
			out.print("<a href=\"" + rPath + "/board/post_list.jsp\">목록으로</a><br/>");
		}
	%>
</body>
</html>