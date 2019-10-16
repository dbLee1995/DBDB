package projectVo;

public class OrdernumInfoVo {
	private int ordernum;
	private int count;
	public OrdernumInfoVo(int ordernum, int count) {
		super();
		this.ordernum = ordernum;
		this.count = count;
	}
	public int getOrdernum() {
		return ordernum;
	}
	public void setOrdernum(int ordernum) {
		this.ordernum = ordernum;
	}
	public int getCount() {
		return count;
	}
	public void setCount(int count) {
		this.count = count;
	}
	
}
