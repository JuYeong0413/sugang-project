package updateBean;
import java.sql.*;
import java.util.*;
import javax.sql.*;
import oracle.jdbc.driver.*;
import oracle.jdbc.pool.*;
import updateBean.*;

public class UpdateMgr {
	
	private OracleConnectionPoolDataSource ocpds = null;
	private PooledConnection pool = null;
	
	public UpdateMgr() {
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
	
	public Vector getUpdateList(String s_id) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		Vector vecList = new Vector();
		
		try {
			conn = pool.getConnection();
			
			String mySQL = "select s_name name, s_addr addr, s_pwd pwd, s_college college, s_major major from student where s_id=?";
			pstmt = conn.prepareStatement(mySQL);
			pstmt.setString(1, s_id);
			rs = pstmt.executeQuery();
			
			while (rs.next()) {
				Update up = new Update();
				up.setSName(rs.getString("name"));
				up.setSAddr(rs.getString("addr"));
				up.setSPwd(rs.getString("pwd"));
				up.setSCollege(rs.getString("college"));
				up.setSMajor(rs.getString("major"));
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
