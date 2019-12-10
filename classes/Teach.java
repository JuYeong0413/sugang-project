
package teachBean;

public class Teach {
	private String c_id;
	private int c_id_no;
	private String c_name;

	public Teach() {
		c_id = null;
		c_id_no = 0;
		c_name = null;
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

	public String getCId() {
		return c_id;
	}

	public int getCIdNo() {
		return c_id_no;
	}

	public String getCName() {
		return c_name;
	}

}
