<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ page import = "java.sql.*" %>
<%@ page import="java.util.*, studentListBean.*"%>
<!DOCTYPE html>
<html>
	<head><title>수강생 목록</title></head>
	<body>
		<%@ include file="top.jsp"%>
		<% if (session_id == null)	response.sendRedirect("login.jsp");	%>
		
		<table width="75%" align="center" border> <br>
			<tr>
				<th>과목번호</th>
				<th>분반</th>
				<th>과목명</th>
			</tr>
			<%
				String year = request.getParameter("year");
				String semester = request.getParameter("semester");
				int int_year = Integer.parseInt(year);
				int int_semester = Integer.parseInt(semester);
				String c_id = request.getParameter("c_id");
				String c_id_no = request.getParameter("c_id_no");

				Connection myConn = null;
				ResultSet myResultSet = null;
				String mySQL = "";
				String dburl = "jdbc:oracle:thin:@210.94.199.20:1521:dblab";
				String user = "ST2016111540"; 
				String passwd = "ST2016111540";
				String dbdriver = "oracle.jdbc.driver.OracleDriver";

				try {
					Class.forName(dbdriver);
					myConn = DriverManager.getConnection(dburl, user, passwd);
				} catch (SQLException ex) {
					System.err.println("SQLException: " + ex.getMessage());
				}
									
				mySQL = "select c_name from course where c_id='" + c_id + "'" + " and c_id_no='" + c_id_no + "'";

				Statement stmt = myConn.createStatement();

				myResultSet = stmt.executeQuery(mySQL);

				if (myResultSet != null) {
					while (myResultSet.next()) {
						String c_name = myResultSet.getString("c_name");
			%>
			<tr>
				<td align="center"><%=c_id%></td>
				<td align="center"><%=c_id_no%></td>
				<td align="center"><%=c_name%></td>
			</tr>
			<%
				}
				}
				stmt.close();
				myConn.close();
			%>
		</table>

		<br><br>

		<table width="75%" align="center" border>
			<tr>
				<th>학번</th>
				<th>이름</th>
				<th>학년</th>
				<th>단과대학</th>
				<th>전공</th>
			</tr>

			<jsp:useBean id="studentListMgr" class="studentListBean.StudentListMgr" />
			<%
				Vector vlist = null;
				vlist = studentListMgr.getStudentList(int_year, int_semester, c_id, c_id_no);

				for(int i = 0; i < vlist.size(); i++) {
					StudentList st = (StudentList)vlist.elementAt(i);
			%>
			
			<tr align="center">
				<td><%=st.getSId()%></td>
				<td><%=st.getSName()%></td>
				<td><%=st.getSYear()%></td>
				<td><%=st.getSCollege()%></td>
				<td><%=st.getSMajor()%></td>
			</tr>

			<%
				}
			%>
		</table>
		
	</body>
</html>