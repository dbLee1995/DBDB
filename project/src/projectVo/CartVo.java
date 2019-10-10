package projectVo;

import java.sql.Date;

public class CartVo {
	private int gdNum;
	private Date regdate;
	public CartVo() {}
	public CartVo(int gDNum, Date regdate) {
		super();
		gdNum = gDNum;
		this.regdate = regdate;
	}
	public int getGDNum() {
		return gdNum;
	}
	public void setGDNum(int gDNum) {
		gdNum = gDNum;
	}
	public Date getRegdate() {
		return regdate;
	}
	public void setRegdate(Date regdate) {
		this.regdate = regdate;
	}
	
}
