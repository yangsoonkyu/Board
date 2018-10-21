<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page session="true"%>
<%@page import="member.PostInfo"%>
<%
	request.setCharacterEncoding("utf-8");
%>





<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>게시판</title>
</head>
<body>
	<%
		PostInfo post = new PostInfo();
	%>
	<jsp:useBean id="data" class="member.DataManager" scope="page" />



	<%
		String id = (String) session.getAttribute("ID");
		String rPath = request.getContextPath();
		int len = data.getPostlen();
		if (id != null) {
			out.print("<b>로그인한 사용자입니다. </b>");
			out.print("<a href=\"" + rPath + "/user/logout.jsp\">로그아웃</a><br/>");
			out.print("<br><h2>게시판</h2>");
			out.print("<a href=\"" + rPath + "/board/newPost.jsp\">글쓰기</a>");
			out.print("<table>");
			out.print("<tr><td>글번호</td><td>제목</td><td>아이디</td><td>날짜</td></tr>");
			for (int i = 1; i <= len; i++) {
				post = data.getPost(i);

				if (post.getPost_num() != null) {
					out.print("<tr>");
					out.print("<td>" + post.getPost_num() + "</td>");
					//request.setAttribute("post_num", i);

					out.print(
							"<td><a href=\"" + rPath + "/board/postDetail.jsp?num=" + i + "\"> " + post.getTitle() + "</a></td>");
					out.print("<td>" + post.getId() + "</td>");
					out.print("<td>" + post.getCreated_date() + "</td>");
					out.print("</tr>");
				}
			}
			out.print("</table>");
		} else {
			out.print("<b>로그인한 사용자에게만 보입니다.</b>");
			out.print("<a href=\"" + rPath + "/index.jsp\">로그인</a><br/>");
		}
	%>



</body>
</html>