<%@page import="java.util.Date"%>
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
	<a href="<%=request.getContextPath()%>/board/post_list.jsp">목록으로</a>
	
<%
String id = (String) session.getAttribute("ID");
String rPath = request.getContextPath();


if(id != null){
	out.print("<form action=\""+ rPath +"/board/post.jsp\"	method=\"post\" name=\"postForm\">");
	out.print("<table>");
	out.print("<tr><td>제목:</td><td><input type=\"text\" name=\"title\" /></td></tr>");
	out.print("<tr><td>내용:</td><td><textarea id =\"text\" name=\"text\" rows=\"\" cols=\"\"></textarea></td></tr>");
	out.print("<tr><td><input type=\"submit\" value=\"작성\"  />	<td><input type=\"reset\" value=\"취소\" /></td></tr>");
	out.print("</table>");
	out.print("</form>");
	
	
}else{
	out.print("<b>로그인한 사용자만 작성할수 있습니다.</b>");
	out.print("<a href=\""+ rPath + "/index.jsp\">로그인</a><br/>");
}
	



%>
		
			
				
			
			

			
			

		


	


</body>
</html>