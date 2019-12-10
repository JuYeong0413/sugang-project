package updateProfessorBean;
import java.sql.*;
import java.util.*;
import javax.sql.*;
import oracle.jdbc.driver.*;
import oracle.jdbc.pool.*;
import updateProfessorBean.*;

public class UpdateProfessorMgr {
	
	private OracleConnectionPoolDataSource ocpds = null;
	private PooledConnection pool = null;
	
	public UpdateProfessorMgr() {
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
	
	public Vector getUpdateList(String p_id) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		Vector vecList = new Vector();
		
		try {
			conn = pool.getConnection();
			
			String mySQL = "select p_name name, p_pwd pwd, p_college college, p_major major from professor where p_id=?";
			pstmt = conn.prepareStatement(mySQL);
			pstmt.setString(1, p_id);
			rs = pstmt.executeQuery();
			
			while (rs.next()) {
				UpdateProfessor up = new UpdateProfessor();
				up.setPName(rs.getString("name"));
				up.setPPwd(rs.getString("pwd"));
				up.setPCollege(rs.getString("college"));
				up.setPMajor(rs.getString("major"));
				vecList.add(up);
			}
			pstmt.close();
			conn.close();
		} catch (Exception ex) {
			System.out.println("Exception" + ex);
		}
		
		return vecList;
	}
}
