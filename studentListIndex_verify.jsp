<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%@ page import="java.sql.*" %>

<html>
<head><title> 수강생 조회 </title></head>
<body>

<%
	String year = request.getParameter("year");
	String semester = request.getParameter("semester");
	
	String url = "studentListIndex.jsp?year="+ year + "&semester=" + semester;
	
	response.sendRedirect(url);
%>
</body></html>

