package projectVo;

public class GoodsVo {
	private int CPNum;
	private int GDListNum;
	private String GDList;
	public GoodsVo() {}
	public GoodsVo(int cPNum, int gDListNum, String gDList) {
		super();
		CPNum = cPNum;
		GDListNum = gDListNum;
		GDList = gDList;
	}
	public int getCPNum() {
		return CPNum;
	}
	public void setCPNum(int cPNum) {
		CPNum = cPNum;
	}
	public int getGDListNum() {
		return GDListNum;
	}
	public void setGDListNum(int gDListNum) {
		GDListNum = gDListNum;
	}
	public String getGDList() {
		return GDList;
	}
	public void setGDList(String gDList) {
		GDList = gDList;
	}
	
}
