package updateProfessorBean;

public class UpdateProfessor
{
	private String p_name;
	private String p_pwd;
	private String p_college;
	private String p_major;
	
	public UpdateProfessor() {
		p_name = null;
		p_pwd = null;
		p_college = null;
		p_major = null;
	}
	
	public void setPName(String p_name) {
		this.p_name = p_name;
	}
	
	public void setPPwd(String p_pwd) {
		this.p_pwd = p_pwd;
	}
	
	public void setPCollege(String p_college) {
		this.p_college = p_college;
	}
	
	public void setPMajor(String p_major) {
		this.p_major = p_major;
	}
	
	public String getPName() {
		return p_name;
	}
	
	public String getPPwd() {
		return p_pwd;
	}
	
	public String getPCollege() {
		return p_college;
	}
	
	public String getPMajor() {
		return p_major;
	}
}
