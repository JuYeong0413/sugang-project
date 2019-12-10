<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%@ page import="java.sql.*" %>

<html>
<head><title> 점수 입력 </title></head>
<body>

<%
	String year = request.getParameter("year");
	String semester = request.getParameter("semester");
	
	String url = "scoreListIndex.jsp?year="+ year + "&semester=" + semester;
	
	response.sendRedirect(url);
%>
</body></html>

