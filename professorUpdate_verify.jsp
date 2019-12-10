<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ page import="java.sql.*"%>
<html>
	<head><title>사용자 정보 수정</title></head>
	<body>
<%
	String p_id = request.getParameter("p_id");
	
	String p_name = new String(request.getParameter("p_name").getBytes("8859_1"), "utf-8");
	String p_pwd = new String(request.getParameter("p_pwd"));
	String p_college = new String(request.getParameter("p_college").getBytes("8859_1"), "utf-8");
	String p_major = new String(request.getParameter("p_major").getBytes("8859_1"), "utf-8");

	Connection myConn = null;
	Statement stmt = null;
	String mySQL = null;

	String dburl = "jdbc:oracle:thin:@210.94.199.20:1521:dblab";
	String user = "ST2016111540";
	String passwd = "ST2016111540";
	String dbdriver = "oracle.jdbc.OracleDriver";
	
	try {
		Class.forName(dbdriver);
		myConn = DriverManager.getConnection(dburl, user, passwd);
		stmt = myConn.createStatement();
	} catch(SQLException ex) {
		System.err.println("SQLException: " + ex.getMessage());
	}
	
	mySQL = "update professor";
	mySQL = mySQL + " set p_name = '" + p_name + "' ,";
	mySQL = mySQL + " p_pwd = '" + p_pwd + "', p_college = '" + p_college + "', p_major = '" + p_major + "' where p_id='" + p_id + "' "; 
	try {
		stmt.executeQuery(mySQL);
%>

<script>
	alert("교수 정보가 수정되었습니다.");
	location.href = "professorUpdate.jsp";
</script>
<%
	} catch(SQLException ex) {
		String sMessage;
		if (ex.getErrorCode() == 20002) sMessage="암호는 4자리 이상이어야 합니다";
		else if (ex.getErrorCode() == 20003) sMessage="암호에 공란은 입력되지 않습니다.";
		else sMessage="잠시 후 다시 시도하십시오";
%>
<script>
	alert("<%= sMessage %>");
	location.href = "professorUpdate.jsp";
</script>
<%
	} finally {
		if (stmt != null) try { stmt.close(); myConn.close(); }
		catch(SQLException ex) { }
	}
%>
</body></html>