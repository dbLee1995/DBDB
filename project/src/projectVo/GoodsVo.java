package projectVo;

public class GoodsVo {
	private int cpNum;
	private int gdListNum;
	private String gdList;
	public GoodsVo() {}
	public GoodsVo(int cPNum, int gDListNum, String gDList) {
		super();
		cpNum = cPNum;
		gdListNum = gDListNum;
		gdList = gDList;
	}
	public int getCPNum() {
		return cpNum;
	}
	public void setCPNum(int cPNum) {
		cpNum = cPNum;
	}
	public int getGDListNum() {
		return gdListNum;
	}
	public void setGDListNum(int gDListNum) {
		gdListNum = gDListNum;
	}
	public String getGDList() {
		return gdList;
	}
	public void setGDList(String gDList) {
		gdList = gDList;
	}
	
}
