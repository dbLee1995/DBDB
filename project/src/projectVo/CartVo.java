package projectVo;

import java.sql.Date;

public class CartVo {
	private int cnum;
	private int gdNum;
	private int count;
	private Date regdate;
	public CartVo() {}
	public CartVo(int cnum, int gdNum, int count, Date regdate) {
		super();
		this.cnum = cnum;
		this.gdNum = gdNum;
		this.count = count;
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
	public int getCount() {
		return count;
	}
	public void setCount(int count) {
		this.count = count;
	}
	public Date getRegdate() {
		return regdate;
	}
	public void setRegdate(Date regdate) {
		this.regdate = regdate;
	}


	
}
