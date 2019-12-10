
package studentListBean;

public class StudentList {
	private int year;
	private int semester;
	private String s_id;
	private String s_name;
	private int s_year;
	private String s_college;
	private String s_major;

	public StudentList() {
		year = 0;
		semester = 0;
		s_id = null;
		s_name = null;
		s_year = 0;
		s_college = null;
		s_major = null;
	}
	
	public void setYear(int year) {
		this.year = year;
	}

	public void setSemester(int semester) {
		this.semester = semester;
	}

	public void setSId(String s_id) {
		this.s_id = s_id;
	}

	public void setSName(String s_name) {
		this.s_name = s_name;
	}

	public void setSYear(int s_year) {
		this.s_year = s_year;
	}

	public void setSCollege(String s_college) {
		this.s_college = s_college;
	}

	public void setSMajor(String s_major) {
		this.s_major = s_major;
	}

	public int getYear() {
		return year;
	}

	public int getSemester() {
		return semester;
	}

	public String getSId() {
		return s_id;
	}

	public String getSName() {
		return s_name;
	}

	public int getSYear() {
		return s_year;
	}

	public String getSCollege() {
		return s_college;
	}

	public String getSMajor() {
		return s_major;
	}
}
