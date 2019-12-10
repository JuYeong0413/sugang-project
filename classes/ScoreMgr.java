package scoreBean;

import java.sql.*;
import java.util.*;
import javax.sql.*;
import oracle.jdbc.driver.*;
import oracle.jdbc.pool.*;
import scoreBean.*;

public class ScoreMgr {

	private OracleConnectionPoolDataSource ocpds = null;
	private PooledConnection pool = null;

	public ScoreMgr() {
		try {

			ocpds = new OracleConnectionPoolDataSource();

			ocpds.setURL("jdbc:oracle:thin:@210.94.199.20:1521:dblab");
			ocpds.setUser("ST2016111540");
			ocpds.setPassword("ST2016111540");

			pool = ocpds.getPooledConnection();
		} catch (Exception e) {
			System.out.println("Error : Connection Failed");
		}
	}

	public Vector getScoreList(int year, int semester, String c_id, String c_id_no) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		Vector vecList = new Vector();

		try {
			conn = pool.getConnection();

			String mySQL = "select s.s_id sid, s.s_college college, s.s_major major, s.s_year year, s.s_name sname, e.e_score score from enroll e, student s where  e.s_id=s.s_id and e.e_year=? and e.e_semester=? and e.c_id=? and e.c_id_no=?";
			pstmt = conn.prepareStatement(mySQL);
			pstmt.setInt(1, year);
			pstmt.setInt(2, semester);
			pstmt.setString(3, c_id);
			pstmt.setString(4, c_id_no);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				Score sc = new Score();
				sc.setSId(rs.getString("sid"));
				sc.setSCollege(rs.getString("college"));
				sc.setSMajor(rs.getString("major"));
				sc.setSYear(rs.getInt("year"));
				sc.setSName(rs.getString("sname"));
				sc.setEScore(rs.getInt("score"));
				vecList.add(sc);
			}
			pstmt.close();
			conn.close();

		} catch (Exception ex) {
			System.out.println("Exception" + ex);
		}

		return vecList;
	}

}