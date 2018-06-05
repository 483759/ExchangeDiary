package conn;

public class dto {

	String email;
	String pwd;
	String name;
	String birth;

	public dto() {}
	public dto(String email, String pwd, String name, String birth) {
		this.email = email;
		this.pwd = pwd;
		this.name = name;
		this.birth = birth;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getPassword() {
		return pwd;
	}
	public void setPassword(String email) {
		this.pwd = pwd;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getBirth() {
		return birth;
	}
	public void setBirth(String birth) {
		this.birth = birth;
	}

}