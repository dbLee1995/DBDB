package projectVo;

import java.sql.Date;

public class CartInfoVo {
	private int gdnum;
	private int cnum;
	private String gdname;
	private int gdprice;
	private int count;
	private Date regdate;
	private String gdsumary;
	public CartInfoVo() {}
	public CartInfoVo(int gdnum, int cnum, String gdname, int gdprice, int count, Date regdate, String gdsumary) {
		super();
		this.gdnum = gdnum;
		this.cnum = cnum;
		this.gdname = gdname;
		this.gdprice = gdprice;
		this.count = count;
		this.regdate = regdate;
		this.gdsumary = gdsumary;
	}
	public int getGdnum() {
		return gdnum;
	}
	public void setGdnum(int gdnum) {
		this.gdnum = gdnum;
	}
	public int getCnum() {
		return cnum;
	}
	public void setCnum(int cnum) {
		this.cnum = cnum;
	}
	public String getGdname() {
		return gdname;
	}
	public void setGdname(String gdname) {
		this.gdname = gdname;
	}
	public int getGdprice() {
		return gdprice;
	}
	public void setGdprice(int gdprice) {
		this.gdprice = gdprice;
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
	public String getGdsumary() {
		return gdsumary;
	}
	public void setGdsumary(String gdsumary) {
		this.gdsumary = gdsumary;
	}

	
}
