<%@page import="member.PostInfo"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%request.setCharacterEncoding("utf-8"); %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
    <jsp:useBean id="data" class="member.DataManager" scope="page" />
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
글 번호 : ${corenum} 

<% 
PostInfo post = new PostInfo();
int num = Integer.parseInt(request.getParameter("num"));
String rPath = request.getContextPath();
post = data.getPost(num);

out.print("<form action=\""+ rPath +"/board/editpost_ing.jsp\"	method=\"post\" name=\"postForm\">");
out.print("<table>");
out.print("<tr><td>제목:</td><td><input type=\"text\" name=\"title\"  value=\""+post.getTitle() +"\"/></td></tr>");
out.print("<tr><td>내용:</td><td><textarea id =\"text\" name=\"text\" rows=\"\" cols=\"\">"+post.getText()+"</textarea></td></tr>");
out.print("<tr><td><input type=\"submit\" value=\"수정\"  />	<td><input type=\"button\" value=\"취소\" onclick=\"history.back(-1);\"/></td></tr>");
out.print("</table>");
out.print("</form>");
%>




</form>
</body>
</html>