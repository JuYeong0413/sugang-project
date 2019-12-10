package timetableBean;

import java.sql.*;
import java.util.*;
import javax.sql.*;
import oracle.jdbc.driver.*;
import oracle.jdbc.pool.*;
import timetableBean.*;

public class TimetableMgr {

	private OracleConnectionPoolDataSource ocpds = null;
	private PooledConnection pool = null;

	public TimetableMgr() {
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

	public Vector getTimetableList(String p_id) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		CallableStatement cstmt1 = null;
		CallableStatement cstmt2 = null;
		ResultSet rs = null;
		Vector vecList = new Vector();

		try {
			conn = pool.getConnection();

			cstmt1 = conn.prepareCall("{? = call Date2TeachYear(SYSDATE)}");
			cstmt1.registerOutParameter(1, java.sql.Types.INTEGER);
			cstmt1.execute();
			int nYear = cstmt1.getInt(1);

			cstmt2 = conn.prepareCall("{? = call Date2TeachSemester(SYSDATE)}");
			cstmt2.registerOutParameter(1, java.sql.Types.INTEGER);
			cstmt2.execute();
			int nSemester = cstmt2.getInt(1);

			String mySQL = "select t.c_id cid, t.c_id_no cid_no, c.c_name cname, t.t_time time, t.t_where place from teach t, course c where t.p_id=? and t.t_year=? and t.t_semester=? and t.c_id=c.c_id and t.c_id_no=c.c_id_no";
			pstmt = conn.prepareStatement(mySQL);
			pstmt.setString(1, p_id);
			pstmt.setInt(2, nYear);
			pstmt.setInt(3, nSemester);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				Timetable te = new Timetable();
				te.setCId(rs.getString("cid"));
				te.setCIdNo(rs.getInt("cid_no"));
				te.setCName(rs.getString("cname"));
				te.setTTime(rs.getInt("time"));
				te.setTWhere(rs.getString("place"));
				vecList.add(te);
			}
			cstmt1.close();
			cstmt2.close();
			pstmt.close();
			conn.close();

		} catch (Exception ex) {
			System.out.println("Exception" + ex);
		}

		return vecList;
	}

	public Vector getTimetableList(String p_id, int nYear, int nSemester) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		Vector vecList = new Vector();

		try {
			conn = pool.getConnection();

			String mySQL = "select t.c_id cid, t.c_id_no cid_no, c.c_name cname, t.t_time time, t.t_where place from teach t, course c where t.p_id=? and t.t_year=? and t.t_semester=? and t.c_id=c.c_id and t.c_id_no=c.c_id_no";
			pstmt = conn.prepareStatement(mySQL);
			pstmt.setString(1, p_id);
			pstmt.setInt(2, nYear);
			pstmt.setInt(3, nSemester);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				Timetable te = new Timetable();
				te.setCId(rs.getString("cid"));
				te.setCIdNo(rs.getInt("cid_no"));
				te.setCName(rs.getString("cname"));
				te.setTTime(rs.getInt("time"));
				te.setTWhere(rs.getString("place"));
				vecList.add(te);
			}
			pstmt.close();
			conn.close();
		} catch (Exception ex) {
			System.out.println("Exception" + ex);
		}

		return vecList;
	}

	public int getCurrentYear() {
		int nYear = 0;
		Connection conn = null;
		CallableStatement cstmt = null;
		try {
			conn = pool.getConnection();

			cstmt = conn.prepareCall("{? = call Date2TeachYear(SYSDATE)}");
			cstmt.registerOutParameter(1, java.sql.Types.INTEGER);
			cstmt.execute();
			nYear = cstmt.getInt(1);

			cstmt.close();
			conn.close();
		} catch (Exception ex) {
			System.out.println("Exception" + ex);
		}

		return nYear;
	}

	public int getCurrentSemester() {
		int nSemester = 0;
		Connection conn = null;
		CallableStatement cstmt = null;

		try {
			conn = pool.getConnection();

			cstmt = conn.prepareCall("{? = call Date2TeachSemester(SYSDATE)}");
			cstmt.registerOutParameter(1, java.sql.Types.INTEGER);
			cstmt.execute();
			nSemester = cstmt.getInt(1);

			cstmt.close();
			conn.close();
		} catch (Exception ex) {
			System.out.println("Exception" + ex);
		}

		return nSemester;
	}
}