package projectVo;

import java.sql.Date;

public class ShoppinglistVo {
	private int snum;
	private int gdNum;
	private String id;
	private int orderNum;
	private int gdCount;
	private Date regdate;
	private String name;
	private String phone;
	private String addr;
	private String msg;
	private String buyway;
	private int state;
	private String gdname;
	public ShoppinglistVo() {}
	public ShoppinglistVo(int snum, int gdNum, String id, int orderNum, int gdCount, Date regdate, String name,
			String phone, String addr, String msg, String buyway, int state) {
		super();
		this.snum = snum;
		this.gdNum = gdNum;
		this.id = id;
		this.orderNum = orderNum;
		this.gdCount = gdCount;
		this.regdate = regdate;
		this.name = name;
		this.phone = phone;
		this.addr = addr;
		this.msg = msg;
		this.buyway = buyway;
		this.state = state;
	}
	public ShoppinglistVo(int snum, int gdNum, String id, int orderNum, int gdCount, Date regdate, String name,
			String phone, String addr, String msg, String buyway, int state, String gdname) {
		super();
		this.snum = snum;
		this.gdNum = gdNum;
		this.id = id;
		this.orderNum = orderNum;
		this.gdCount = gdCount;
		this.regdate = regdate;
		this.name = name;
		this.phone = phone;
		this.addr = addr;
		this.msg = msg;
		this.buyway = buyway;
		this.state = state;
		this.gdname = gdname;
	}
	public int getSnum() {
		return snum;
	}
	public void setSnum(int snum) {
		this.snum = snum;
	}
	public int getGdNum() {
		return gdNum;
	}
	public void setGdNum(int gdNum) {
		this.gdNum = gdNum;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public int getOrderNum() {
		return orderNum;
	}
	public void setOrderNum(int orderNum) {
		this.orderNum = orderNum;
	}
	public int getGdCount() {
		return gdCount;
	}
	public void setGdCount(int gdCount) {
		this.gdCount = gdCount;
	}
	public Date getRegdate() {
		return regdate;
	}
	public void setRegdate(Date regdate) {
		this.regdate = regdate;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getAddr() {
		return addr;
	}
	public void setAddr(String addr) {
		this.addr = addr;
	}
	public String getMsg() {
		return msg;
	}
	public void setMsg(String msg) {
		this.msg = msg;
	}
	public String getBuyway() {
		return buyway;
	}
	public void setBuyway(String buyway) {
		this.buyway = buyway;
	}
	public int getState() {
		return state;
	}
	public void setState(int state) {
		this.state = state;
	}
	public String getGdname() {
		return gdname;
	}
	public void setGdname(String gdname) {
		this.gdname = gdname;
	}

	
}
