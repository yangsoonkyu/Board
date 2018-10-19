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


	<jsp:useBean id="data" class="member.DataManager" scope="page" />



	<%
		String rPath = request.getContextPath();
		int post_num_param = data.getPostlen() +1;
		if (data.insertPost(post) != 0) {
			out.print("새글쓰기 성공");
			out.print("<a href=\"" + rPath + "/board/post_list.jsp\">목록으로</a><br/>");
			out.print("글번호 : "+ post_num_param);
			out.print("작성자:"+post.getId() + "<br>");
			out.print("제목:"+post.getTitle() + "<br>");
			out.print("내용:<br>"+post.getText() + "<br>");

		} else {
			out.print("새글쓰기 실패");
		}
	%>
</body>
</html>