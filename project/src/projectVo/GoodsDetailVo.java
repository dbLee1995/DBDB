package projectVo;

public class GoodsDetailVo {
	private int GDListNum;
	private int GDNum;
	private String GDName;
	private int GDPrice;
	private int GDStock;
	private String GDDetail;
	public GoodsDetailVo() {}
	public GoodsDetailVo(int gDListNum, int gDNum, String gDName, int gDPrice, int gDStock, String gDDetail) {
		super();
		GDListNum = gDListNum;
		GDNum = gDNum;
		GDName = gDName;
		GDPrice = gDPrice;
		GDStock = gDStock;
		GDDetail = gDDetail;
	}
	public int getGDListNum() {
		return GDListNum;
	}
	public void setGDListNum(int gDListNum) {
		GDListNum = gDListNum;
	}
	public int getGDNum() {
		return GDNum;
	}
	public void setGDNum(int gDNum) {
		GDNum = gDNum;
	}
	public String getGDName() {
		return GDName;
	}
	public void setGDName(String gDName) {
		GDName = gDName;
	}
	public int getGDPrice() {
		return GDPrice;
	}
	public void setGDPrice(int gDPrice) {
		GDPrice = gDPrice;
	}
	public int getGDStock() {
		return GDStock;
	}
	public void setGDStock(int gDStock) {
		GDStock = gDStock;
	}
	public String getGDDetail() {
		return GDDetail;
	}
	public void setGDDetail(String gDDetail) {
		GDDetail = gDDetail;
	}
	
}
