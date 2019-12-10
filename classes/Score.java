
package scoreBean;

public class Score {
	private String s_id;
	private String s_college;
	private String s_major;
	private int s_year;
	private String s_name;
	private int e_score;

	public Score() {
		s_id = null;
		s_college = null;
		s_major = null;
		s_year = 0;
		s_name = null;
		e_score = 0;
	}

	public void setSId(String s_id) {
		this.s_id = s_id;
	}

	public void setSCollege(String s_college) {
		this.s_college = s_college;
	}

	public void setSMajor(String s_major) {
		this.s_major = s_major;
	}

	public void setSYear(int s_year) {
		this.s_year = s_year;
	}

	public void setSName(String s_name) {
		this.s_name = s_name;
	}

	public void setEScore(int e_score) {
		this.e_score = e_score;
	}

	public String getSId() {
		return s_id;
	}

	public String getSCollege() {
		return s_college;
	}

	public String getSMajor() {
		return s_major;
	}

	public int getSYear() {
		return s_year;
	}

	public String getSName() {
		return s_name;
	}

	public int getEScore() {
		return e_score;
	}
}
