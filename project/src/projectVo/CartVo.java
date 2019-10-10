package projectVo;

import java.sql.Date;

public class CartVo {
	private int GDNum;
	private Date regdate;
	public CartVo() {}
	public CartVo(int gDNum, Date regdate) {
		super();
		GDNum = gDNum;
		this.regdate = regdate;
	}
	public int getGDNum() {
		return GDNum;
	}
	public void setGDNum(int gDNum) {
		GDNum = gDNum;
	}
	public Date getRegdate() {
		return regdate;
	}
	public void setRegdate(Date regdate) {
		this.regdate = regdate;
	}
	
}
