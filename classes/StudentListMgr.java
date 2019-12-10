package studentListBean;
import java.sql.*;
import java.util.*;
import javax.sql.*;
import oracle.jdbc.driver.*;
import oracle.jdbc.pool.*;
import studentListBean.*;

public class StudentListMgr {
	
	private OracleConnectionPoolDataSource ocpds = null;
	private PooledConnection pool = null;
	
	public StudentListMgr() {
		try {
			
			ocpds = new OracleConnectionPoolDataSource();
			
			ocpds.setURL("jdbc:oracle:thin:@210.94.199.20:1521:DBLAB");
			ocpds.setUser("ST2016111540");
			ocpds.setPassword("ST2016111540");
			
			pool = ocpds.getPooledConnection();
		} catch(Exception e) {
			System.out.println("Error : Connection Failed");
		}
	}
	
	public Vector getStudentList(int year, int semester, String c_id, String c_id_no) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		Vector vecList = new Vector();
		
		try {
			conn = pool.getConnection();
			
			String mySQL = "select s.s_id id, s.s_name name, s.s_year year, s.s_college college, s.s_major major from student s, enroll e where s.s_id = e.s_id and e.c_id=? and e.c_id_no=? and e.e_year = ? and e.e_semester = ?";
			pstmt = conn.prepareStatement(mySQL);
			pstmt.setString(1, c_id);
			pstmt.setString(2, c_id_no);
			pstmt.setInt(3, year);
			pstmt.setInt(4, semester);
			rs = pstmt.executeQuery();
			
			while (rs.next()) {
				StudentList st = new StudentList();
				st.setSId(rs.getString("id"));
				st.setSName(rs.getString("name"));
				st.setSYear(rs.getInt("year"));
				st.setSCollege(rs.getString("college"));
				st.setSMajor(rs.getString("major"));
				vecList.add(st);
			}
			pstmt.close();
			conn.close();
		} catch (Exception ex) {
			System.out.println("Exception" + ex);
		}
		
		return vecList;
	}
}
