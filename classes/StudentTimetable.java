
package studentTimetableBean;

public class StudentTimetable {
	private String c_id;
	private int c_id_no;
	private String c_name;
	private int t_time;
	private String t_where;

	public StudentTimetable() {
		c_id = null;
		c_id_no = 0;
		c_name = null;
		t_time = 0;
		t_where = null;
	}

	public void setCId(String c_id) {
		this.c_id = c_id;
	}

	public void setCIdNo(int c_id_no) {
		this.c_id_no = c_id_no;
	}

	public void setCName(String c_name) {
		this.c_name = c_name;
	}

	public void setTTime(int t_time) {
		this.t_time = t_time;
	}

	public void setTWhere(String t_where) {
		this.t_where = t_where;
	}

	public String getCId() {
		return c_id;
	}

	public int getCIdNo() {
		return c_id_no;
	}

	public String getCName() {
		return c_name;
	}

	public int getTTime() {
		return t_time;
	}

	public String getTWhere() {
		return t_where;
	}
}
