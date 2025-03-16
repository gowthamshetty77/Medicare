package model;

public class Patient {
	
	private String patID;
	private String patName;
	private String patAge;
	private String patGender;
	private String patPhone;
	private String patEmail;
	private String patPassword;
	public String getPatID() {
		return patID;
	}
	public void setPatID(String string) {
		this.patID = string;
	}
	public String getPatName() {
		return patName;
	}
	public void setPatName(String patName) {
		this.patName = patName;
	}
	public String getPatAge() {
		return patAge;
	}
	public void setPatAge(String patAge) {
		this.patAge = patAge;
	}
	public String getPatPhone() {
		return patPhone;
	}
	public void setPatPhone(String patPhone) {
		this.patPhone = patPhone;
	}
	public String getPatGender() {
		return patGender;
	}
	public void setPatGender(String patGender) {
		this.patGender = patGender;
	}
	public String getPatEmail() {
		return patEmail;
	}
	public void setPatEmail(String patEmail) {
		this.patEmail = patEmail;
	}
	public String getPatPassword() {
		return patPassword;
	}
	public void setPatPassword(String patPassword) {
		this.patPassword = patPassword;
	}
	
	
}
