package projectVo;

public class CompanyVo {
	private int CPNum;
	private String CPName;
	private int phone;
	public CompanyVo() {}
	public CompanyVo(int cPNum, String cPName, int phone) {
		super();
		CPNum = cPNum;
		CPName = cPName;
		this.phone = phone;
	}
	public int getCPNum() {
		return CPNum;
	}
	public void setCPNum(int cPNum) {
		CPNum = cPNum;
	}
	public String getCPName() {
		return CPName;
	}
	public void setCPName(String cPName) {
		CPName = cPName;
	}
	public int getPhone() {
		return phone;
	}
	public void setPhone(int phone) {
		this.phone = phone;
	}
	
}
