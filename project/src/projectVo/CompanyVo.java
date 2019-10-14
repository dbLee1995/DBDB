package projectVo;

public class CompanyVo {
	private int cpNum;
	private String cpName;
	private String phone;
	public CompanyVo() {}
	public CompanyVo(int cPNum, String cPName, String phone) {
		super();
		cpNum = cPNum;
		cpName = cPName;
		this.phone = phone;
	}
	public int getCPNum() {
		return cpNum;
	}
	public void setCPNum(int cPNum) {
		cpNum = cPNum;
	}
	public String getCPName() {
		return cpName;
	}
	public void setCPName(String cPName) {
		cpName = cPName;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	
}
