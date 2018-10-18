<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page session="true"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>글쓰기</title>
</head>
<body>
	<h2>새글작성하기</h2>
	<form action="<%=request.getContextPath()%>/board/post.jsp" method="post">

		<table>
			<tr>
				<td>작성자:</td>
				<td><%=session.getAttribute("ID") %></td>
			</tr>
			<tr>
				<td>제목:</td>
				<td><input type="text" name="title" /></td>
			</tr>
			<tr><td>내용:</td><td><textarea name="text" rows="" cols=""></textarea></td></tr>
			
			<tr><td>작성일:</td><td><input type="date" name="created_date" /></td></tr>
			<tr><td><input type="submit" value="작성" /><td><input type="reset" value="취소" /></td></tr>

		</table>


	</form>



</body>
</html>