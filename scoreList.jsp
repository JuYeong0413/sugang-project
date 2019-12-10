<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ page import = "java.sql.*" %>
<%@ page import="java.util.*, scoreBean.*"%>
<!DOCTYPE html>
<html>
	<head><title>점수 입력</title></head>
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
				<th>단과대학</th>
				<th>전공</th>
				<th>학년</th>
				<th>학번</th>
				<th>이름</th>
				<th>점수</th>
				<th>점수저장</th>
			</tr>

			<jsp:useBean id="scoreMgr" class="scoreBean.ScoreMgr" />
			<%
				Vector vlist = null;
				vlist = scoreMgr.getScoreList(int_year, int_semester, c_id, c_id_no);
				
				int count = vlist.size();
				for(int i = 0; i < count; i++) {
					Score sc = (Score)vlist.elementAt(i);
			%>

			<form method="post" action="scoreUpdate_verify.jsp">
			<tr align="center">
				<td><%=sc.getSCollege()%></td>
				<td><%=sc.getSMajor()%></td>
				<td><%=sc.getSYear()%></td>
				<td><%=sc.getSId()%></td>
				<td><%=sc.getSName()%></td>
				<td><input type="text" size=2 name="score" value="<%=sc.getEScore()%>"></td>
				<td>
					<input type="hidden" name="s_id" value="<%=sc.getSId()%>">
					<input type="hidden" name="year" value="<%=int_year%>">
					<input type="hidden" name="semester" value="<%=int_semester%>">
					<input type="hidden" name="c_id" value="<%=c_id%>">
					<input type="hidden" name="c_id_no" value="<%=c_id_no%>">
					<input type="submit" value="입력">
				</td> 
			</tr>
			</form>

			<%
				}
			%>

		</table>
	
	</body>
</html>