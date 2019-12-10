<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ page import="java.sql.*"%>
<html>
	<head><title>점수 입력</title></head>
	<body>
<%
	String s_id = request.getParameter("s_id");
	String str_score = request.getParameter("score");
	String str_year = request.getParameter("year");
	String str_semester = request.getParameter("semester");
	String c_id = request.getParameter("c_id");
	String c_id_no = request.getParameter("c_id_no");
	int score = Integer.parseInt(str_score);
	int year = Integer.parseInt(str_year);
	int semester = Integer.parseInt(str_semester);

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
	
	mySQL = "update enroll set e_score = " + score + " where e_year=" + year + " and e_semester=" + semester + " and c_id='" + c_id + "' and c_id_no='" + c_id_no + "' and s_id='" + s_id + "'";
	System.out.println(mySQL);

	try {
		stmt.executeQuery(mySQL);
%>

<script>
	alert("점수가 저장되었습니다.");
	location.href = "scoreList.jsp?year=<%=year%>&semester=<%=semester%>&c_id=<%=c_id%>&c_id_no=<%=c_id_no%>";
</script>
<%
	} catch(SQLException ex) {
		String sMessage;
		if (ex.getErrorCode() == 20002) sMessage="암호는 4자리 이상이어야 합니다";
		else if (ex.getErrorCode() == 20003) sMessage="암호에 공란은 입력되지 않습니다.";
		else sMessage="점수를 다시 입력해주세요";
%>
<script>
	alert("<%= sMessage %>");
	location.href = "scoreList.jsp?year=<%=year%>&semester=<%=semester%>&c_id=<%=c_id%>&c_id_no=<%=c_id_no%>";
</script>
<%
	} finally {
		if (stmt != null) try { stmt.close(); myConn.close(); }
		catch(SQLException ex) { }
	}
%>
</body></html>