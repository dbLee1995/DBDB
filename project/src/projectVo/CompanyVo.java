package projectVo;

public class CompanyVo {
	private int cpNum;
	private String cpName;
	private int phone;
	public CompanyVo() {}
	public CompanyVo(int cPNum, String cPName, int phone) {
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
	public int getPhone() {
		return phone;
	}
	public void setPhone(int phone) {
		this.phone = phone;
	}
	
}
