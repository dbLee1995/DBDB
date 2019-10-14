package projectVo;

import java.sql.Date;

public class CartVo {
	private int cnum;
	private int gdNum;
	private Date regdate;
	public CartVo() {}
	public CartVo(int cnum, int gdNum, Date regdate) {
		super();
		this.cnum = cnum;
		this.gdNum = gdNum;
		this.regdate = regdate;
	}
	public int getCnum() {
		return cnum;
	}
	public void setCnum(int cnum) {
		this.cnum = cnum;
	}
	public int getGdNum() {
		return gdNum;
	}
	public void setGdNum(int gdNum) {
		this.gdNum = gdNum;
	}
	public Date getRegdate() {
		return regdate;
	}
	public void setRegdate(Date regdate) {
		this.regdate = regdate;
	}

	
}
