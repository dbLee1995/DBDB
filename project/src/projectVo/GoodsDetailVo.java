package projectVo;

public class GoodsDetailVo {
	private int gdListNum;
	private int gdNum;
	private String gdName;
	private int gdPrice;
	private int gdStock;
	private String gdDetail;
	public GoodsDetailVo() {}
	public GoodsDetailVo(int gDListNum, int gDNum, String gDName, int gDPrice, int gDStock, String gDDetail) {
		super();
		gdListNum = gDListNum;
		gdNum = gDNum;
		gdName = gDName;
		gdPrice = gDPrice;
		gdStock = gDStock;
		gdDetail = gDDetail;
	}
	public int getGDListNum() {
		return gdListNum;
	}
	public void setGDListNum(int gDListNum) {
		gdListNum = gDListNum;
	}
	public int getGDNum() {
		return gdNum;
	}
	public void setGDNum(int gDNum) {
		gdNum = gDNum;
	}
	public String getGDName() {
		return gdName;
	}
	public void setGDName(String gDName) {
		gdName = gDName;
	}
	public int getGDPrice() {
		return gdPrice;
	}
	public void setGDPrice(int gDPrice) {
		gdPrice = gDPrice;
	}
	public int getGDStock() {
		return gdStock;
	}
	public void setGDStock(int gDStock) {
		gdStock = gDStock;
	}
	public String getGDDetail() {
		return gdDetail;
	}
	public void setGDDetail(String gDDetail) {
		gdDetail = gDDetail;
	}
	
}
