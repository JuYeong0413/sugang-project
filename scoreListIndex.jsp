<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%@ page import="java.util.*, teachBean.*"%>
<html>
<head>
<title>점수 입력</title><head>
<body>

<%@ include file="top.jsp" %>
<% if (session_id==null) response.sendRedirect("login.jsp"); %>

<table width="75%" align="center" border>
<tr><th>과목번호</th><th>분반</th><th>과목명</th></tr>
<br>
<jsp:useBean id="teachMgr" class="teachBean.TeachMgr" />
<%
	Vector vlist = null;
	int year, semester;

	if (request.getParameter("year") == null && request.getParameter("semester") == null) {
		year = teachMgr.getCurrentYear();
		semester = teachMgr.getCurrentSemester();
	} else if (request.getParameter("year") == "" || request.getParameter("semester") == "") {
		year = teachMgr.getCurrentYear();
		semester = teachMgr.getCurrentSemester();
	} else {
		year = Integer.parseInt(request.getParameter("year"));
		semester = Integer.parseInt(request.getParameter("semester"));
	}

	vlist = teachMgr.getTeachList(session_id, year, semester);
	int counter = vlist.size();
	int totUnit = 0;

	for(int i=0; i<vlist.size(); i++) {
		Teach te = (Teach)vlist.elementAt(i);
%>

<tr>
<td align="center"><%=te.getCId()%></td>
<td align="center"><%=te.getCIdNo()%></td>
<td align="center"><a href="scoreList.jsp?year=<%=year%>&semester=<%=semester%>&c_id=<%=te.getCId()%>&c_id_no=<%=te.getCIdNo()%>"><%=te.getCName()%></a></td>

<%	}  %>

</tr>
</table>
<br>

<table width="30%" align="center">
	<FORM method="post" action="scoreListIndex_verify.jsp" >
		<tr> <td>
			<input type="text" name="year" value=<%= year %> size=4> 년도
			<input type="text" name="semester" value=<%= semester %> size=1> 학기
			<INPUT TYPE="SUBMIT" NAME="Submit" VALUE="조회">
		</td></tr>
	</FORM>
</table></body></html>