<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%@ page import="java.util.*, teachBean.*, timetableBean.*"%>
<html>
<head>
<title>강의 조회</title><head>
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
<td align="center"><%=te.getCName()%></td>

<%	}  %>

</tr> </table> <br>
<table width="75%" align="center" border>
	<tr><th>총담당과목수</th> <td align="center"><%= counter %></td></tr>
</table>

<br>

<table id="timetable" width="75%" align="center" border>
	<tr align="center">
		<th>강의 시간</th>
		<th>과목명</th>
		<th>강의실</th>
	</tr>
	<tr align="center">
		<th>1</th>
		<td></td>
		<td></td>
	</tr>
	<tr align="center">
		<th>2</th>
		<td></td>
		<td></td>
	</tr>
	<tr align="center">
		<th>3</th>
		<td></td>
		<td></td>
	</tr>
	<tr align="center">
		<th>4</th>
		<td></td>
		<td></td>
	</tr>
	<tr align="center">
		<th>5</th>
		<td></td>
		<td></td>
	</tr>
	<tr align="center">
		<th>6</th>
		<td></td>
		<td></td>
	</tr>
	<tr align="center">
		<th>7</th>
		<td></td>
		<td></td>
	</tr>
	<tr align="center">
		<th>8</th>
		<td></td>
		<td></td>
	</tr>
	<tr align="center">
		<th>9</th>
		<td></td>
		<td></td>
	</tr>
	<tr align="center">
		<th>10</th>
		<td></td>
		<td></td>
	</tr>

<jsp:useBean id="timetableMgr" class="timetableBean.TimetableMgr" />
<%
	Vector vlist_time = null;
	vlist_time = timetableMgr.getTimetableList(session_id, year, semester);

	for(int j=0; j<vlist_time.size(); j++) {
		Timetable time = (Timetable)vlist_time.elementAt(j);
%>

<script type="text/javascript">
	var table = document.getElementById("timetable");
	var t_time = `<%=time.getTTime()%>`;
	var c_name = `<%=time.getCName()%>`;
	var t_where = `<%=time.getTWhere()%>`;

	if (t_time==1) {
		table.rows[1].cells[1].innerHTML = c_name;
		table.rows[1].cells[2].innerHTML = t_where;
	}
	else if (t_time==2) {
		table.rows[2].cells[1].innerHTML = c_name;
		table.rows[2].cells[2].innerHTML = t_where;
	}
	else if (t_time==3) {
		table.rows[3].cells[1].innerHTML = c_name;
		table.rows[3].cells[2].innerHTML = t_where;
	}
	else if (t_time==4) {
		table.rows[4].cells[1].innerHTML = c_name;
		table.rows[4].cells[2].innerHTML = t_where;
	}
	else if (t_time==5) {
		table.rows[5].cells[1].innerHTML = c_name;
		table.rows[5].cells[2].innerHTML = t_where;
	}
	else if (t_time==6) {
		table.rows[6].cells[1].innerHTML = c_name;
		table.rows[6].cells[2].innerHTML = t_where;
	}
	else if (t_time==7) {
		table.rows[7].cells[1].innerHTML = c_name;
		table.rows[7].cells[2].innerHTML = t_where;
	}
	else if (t_time==8) {
		table.rows[8].cells[1].innerHTML = c_name;
		table.rows[8].cells[2].innerHTML = t_where;
	}
	else if (t_time==9) {
		table.rows[9].cells[1].innerHTML = c_name;
		table.rows[9].cells[2].innerHTML = t_where;
	}
	else if (t_time==10) {
		table.rows[10].cells[1].innerHTML = c_name;
		table.rows[10].cells[2].innerHTML = t_where;
	}
</script>

<%	
	}
%>
	
</table>

<br><br>
<table width="30%" align="center">
<FORM method="post" action="selectTeach_verify.jsp" >
	<tr> <td>
		<input type="text" name="year" value=<%= year %> size=4> 년도
		<input type="text" name="semester" value=<%= semester %> size=1> 학기
		<INPUT TYPE="SUBMIT" NAME="Submit" VALUE="조회">
	</td></tr>
</FORM></table></body></html>