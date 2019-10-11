package projectVo;

public class GoodsDetailVo {
	private int gdlistnum;
	private int gdnum;
	private String gdname;
	private int gdprice;
	private int gdstock;
	private String gddetail;
	private String gdsumary;
	public GoodsDetailVo() {}
	public GoodsDetailVo(int gdlistnum, int gdnum, String gdname, int gdprice, int gdstock, String gddetail,
			String gdsumary) {
		super();
		this.gdlistnum = gdlistnum;
		this.gdnum = gdnum;
		this.gdname = gdname;
		this.gdprice = gdprice;
		this.gdstock = gdstock;
		this.gddetail = gddetail;
		this.gdsumary = gdsumary;
	}
	public int getGdlistnum() {
		return gdlistnum;
	}
	public void setGdlistnum(int gdlistnum) {
		this.gdlistnum = gdlistnum;
	}
	public int getGdnum() {
		return gdnum;
	}
	public void setGdnum(int gdnum) {
		this.gdnum = gdnum;
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
	public int getGdstock() {
		return gdstock;
	}
	public void setGdstock(int gdstock) {
		this.gdstock = gdstock;
	}
	public String getGddetail() {
		return gddetail;
	}
	public void setGddetail(String gddetail) {
		this.gddetail = gddetail;
	}
	public String getGdsumary() {
		return gdsumary;
	}
	public void setGdsumary(String gdsumary) {
		this.gdsumary = gdsumary;
	}

	
}
