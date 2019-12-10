<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ page import="java.util.*, updateProfessorBean.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>사용자 정보 수정</title>
</head>
<body>
<%@ include file="top.jsp" %>
<% if (session_id==null) response.sendRedirect("login.jsp"); %>

<jsp:useBean id="updateProfessorMgr" class="updateProfessorBean.UpdateProfessorMgr" />
<%
	Vector vlist = null;
	vlist = updateProfessorMgr.getUpdateList(session_id);

	for (int i = 0; i < vlist.size(); i++) {
		UpdateProfessor up = (UpdateProfessor)vlist.elementAt(i);
%>
<form method="post" action="professorUpdate_verify.jsp">
  <input type="hidden" name="p_id" size="30" value="<%=session_id %>">
  <table width="75%" align="center" border> <br>
  	 <tr><th>이름</th>
         <td><input type="text" name="p_name" size="50" value="<%=up.getPName() %>"> </td>
     </tr>
   	 <tr><th>단과대학</th>
         <td><input type="text" name="p_college" size="50" value="<%=up.getPCollege() %>"> </td>
     </tr>
   	 <tr><th>전공</th>
         <td><input type="text" name="p_major" size="50" value="<%=up.getPMajor() %>"> </td>
     </tr>
     <tr><th>패스워드</th>
        <td><input type="password" name="p_pwd" size="20"  value="<%=up.getPPwd() %>"></td>
    </tr>
<tr>
	<td colspan="2" align="center">
	<input type="submit" value="수정">
	</td> 
</tr>
</table></form>
<%
	}
%>
</body></html>
