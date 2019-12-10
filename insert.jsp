<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ page import="java.sql.*"%>
<!DOCTYPE html>

<html><head><title>수강신청 입력</title></head>
<body>

	<%@ include file="top.jsp"%>
	<% if (session_id == null)	response.sendRedirect("login.jsp");	%>
	
	<table width="75%" align="center" border>	<br>
		<tr>
			<th>과목번호</th>
			<th>분반</th>
			<th>과목명</th>
			<th>학점</th>
			<th>수강신청</th>
		</tr>
		<%
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
		                          
			mySQL = "select * from course where c_id not in" 
					+ "(select c_id from enroll where s_id = '" + session_id
					+ "' and e_year = '2020' and e_semester = '1')" + "and c_id in"
					+ "(select c_id from teach where t_year = '2020' and t_semester = '1' )";

			Statement stmt = myConn.createStatement();

			myResultSet = stmt.executeQuery(mySQL);

			if (myResultSet != null) {
				while (myResultSet.next()) {
					String c_id = myResultSet.getString("c_id");
					int c_id_no = myResultSet.getInt("c_id_no");
					String c_name = myResultSet.getString("c_name");
					int c_unit = myResultSet.getInt("c_unit");
		%>
		<tr>
			<td align="center"><%=c_id%></td>
			<td align="center"><%=c_id_no%></td>
			<td align="center"><a href="insert_confirm.jsp?c_id=<%=c_id%>"><%=c_name%></a></td>
			<td align="center"><%=c_unit%></td>
			<td align="center"><a href="insert_verify.jsp?c_id=<%=c_id%>&c_id_no=<%=c_id_no%>">신청</a></td>
		</tr>
		<%
			  }
			}
			stmt.close();
			myConn.close();
		%>
	</table>
</body>
</html>