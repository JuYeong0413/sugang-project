<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
 <% 
	String session_id = (String)session.getAttribute("user");
	String session_name = (String)session.getAttribute("name");
	String session_category = (String)session.getAttribute("category");
  	String log;
  	
  	if(session_id==null) log="<a href=login.jsp>로그인</a>";
  	else  				 log="<a href=logout.jsp>로그아웃</a>";
 %>

 <table width="75%" align="center" bgcolor="#FFFF99" border>
	<tr>
		<td align="center"><b><%=log%></b></td>
<%
	 if("professor".equals(session_category)) {

%>
		<td align="center"><b><a href="professorUpdate.jsp">사용자 정보 수정</b></td>
			<td align="center"><b><a href="selectTeach.jsp">강의 조회</b></td>
		<td align="center"><b><a href="studentListIndex.jsp">수강생 조회</b></td>
		<td align="center"><b><a href="scoreListIndex.jsp">점수 입력</b></td>
<%
	 } else {
%>
		<td align="center"><b><a href="studentUpdate.jsp">사용자 정보 수정</b></td>
		<td align="center"><b><a href="insert.jsp">수강신청 입력</b></td>
		<td align="center"><b><a href="delete.jsp">수강신청 삭제</b></td>
		<td align="center"><b><a href="select.jsp">수강신청 조회</b></td>
<%
	 }
%>
	</tr>
 </table>
</body>
</html>