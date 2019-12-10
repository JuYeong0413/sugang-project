<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ page import = "java.sql.*" %>
<!DOCTYPE html>
<html>
	<head><title>InsertConfirm Test</title></head>
	<body>
	<%
		String c_id = request.getParameter("c_id");
		
		Connection myConn = null;
		String dburl = "jdbc:oracle:thin:@210.94.199.20:1521:DBLAB";
		String user = "ST2016111540";
		String passwd = "ST2016111540";
		String dbdriver = "oracle.jdbc.driver.OracleDriver";
		Statement stmt = null;
		String mySQL = null;

		int tmax = 0;
		int count = 0;
		int result = 0;
		
		try {
			Class.forName(dbdriver);
			myConn = DriverManager.getConnection(dburl, user, passwd);
			stmt = myConn.createStatement();
		} catch (SQLException ex) {
			System.err.println("SQLException : " + ex.getMessage());
		}
		
		CallableStatement cstmt = myConn.prepareCall("{ call tmax(?, ?) }");
		cstmt.setString(1, c_id);
		cstmt.registerOutParameter(2, java.sql.Types.NUMERIC);
		
		try {
			cstmt.execute();
			tmax = cstmt.getInt(2);
			
			mySQL = "Select COUNT(*) as cnt from Enroll where c_id = '" + c_id + "'";
			
			ResultSet myResultSet = stmt.executeQuery(mySQL);
			if (myResultSet.next()) {
				count = myResultSet.getInt("cnt");
			}
			
			result = tmax - count;
	%>
	<script>
	    alert("모집인원은 <%= tmax %>명이며, 현재 수강 신청을 할 수 있는 인원은 <%= result %>명 입니다.");
                location.href = "insert.jsp";
	</script>
	<%
		} catch (SQLException ex) {
			System.err.println("SQLException : " + ex.getMessage());
		} finally {
			if (cstmt != null)
				try {
					myConn.commit();
					cstmt.close();
					myConn.close();
				} catch (SQLException ex) {
				
				}
		}
	%>
	</body>
</html>