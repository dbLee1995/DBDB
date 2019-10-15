package projectVo;

public class UserInfoVo {
	private String id;
	private String fname;
	private String lname;
	private String addr;
	public UserInfoVo() {}
	public UserInfoVo(String id, String fname, String lname, String addr) {
		super();
		this.id = id;
		this.fname = fname;
		this.lname = lname;
		this.addr = addr;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getFname() {
		return fname;
	}
	public void setFname(String fname) {
		this.fname = fname;
	}
	public String getLname() {
		return lname;
	}
	public void setLname(String lname) {
		this.lname = lname;
	}
	public String getAddr() {
		return addr;
	}
	public void setAddr(String addr) {
		this.addr = addr;
	}
	
}
