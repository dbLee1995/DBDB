package projectVo;

public class CompanyVo {
	private int cpNum;
	private String cpName;
	private String phone;
	public CompanyVo() {}
	public CompanyVo(int cpNum, String cpName, String phone) {
		super();
		this.cpNum = cpNum;
		this.cpName = cpName;
		this.phone = phone;
	}
	public int getCpNum() {
		return cpNum;
	}
	public void setCpNum(int cpNum) {
		this.cpNum = cpNum;
	}
	public String getCpName() {
		return cpName;
	}
	public void setCpName(String cpName) {
		this.cpName = cpName;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}

	
}
