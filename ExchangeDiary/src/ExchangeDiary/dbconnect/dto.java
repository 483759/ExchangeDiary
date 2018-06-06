package ExchangeDiary.dbconnect;

public class dto {

	String id;
	String pwd;
	String name;
	String birth;
	String tel;

	public dto() {}
	public dto(String id, String pwd, String name, String birth, String tel) {
		this.id = id;
		this.pwd = pwd;
		this.name = name;
		this.birth = birth;
		this.tel = tel;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getPwd() {
		return pwd;
	}
	public void setPwd(String pwd) {
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
	public String getTel() {
		return tel;
	}
	public void setTel(String tel) {
		this.tel = tel;
	}

}