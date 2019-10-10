package projectVo;

public class AccountVo {
	private String id;
	private String pwd;
	private String email;
	private int point;
	public AccountVo() {}
	public AccountVo(String id, String pwd, String email, int point) {
		super();
		this.id = id;
		this.pwd = pwd;
		this.email = email;
		this.point = point;
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
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public int getPoint() {
		return point;
	}
	public void setPoint(int point) {
		this.point = point;
	}
	
}
