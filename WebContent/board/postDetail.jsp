<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>제목없음</title>
</head>
<body>

	<%@page import="member.PostInfo"%>
	<jsp:useBean id="data" class="member.DataManager" scope="page" />
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>



	<%
		int num = Integer.parseInt(request.getParameter("num"));
		String rPath = request.getContextPath();
		String id = (String) session.getAttribute("ID");
		PostInfo post = data.getPost(num);

		out.print("<a href=\"" + rPath + "/board/post_list.jsp\">목록으로</a><br/>");
		out.print("글번호 : " + num + "<br>");
		out.print("작성자:" + post.getId() + "<br>");
		out.print("제목:" + post.getTitle() + "<br>");
		out.print("내용:<br>" + post.getText() + "<br>");
	%>

	<c:set var="corenum" value="<%=num %>" scope="session" />

	<%
		if (id.equals(post.getId())) {
			out.print("<a href=\"" + rPath + "/board/editPost.jsp?num=" + num + "\">수정하기</a><br/>");
			out.print("<a href=\"" + rPath + "/board/deletePost.jsp?num=" + num + "\">삭제하기</a><br/>");
		}
	%>




</body>
</html>