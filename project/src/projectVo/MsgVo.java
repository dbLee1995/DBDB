package projectVo;

import java.sql.Date;

public class MsgVo {
	private String id;
	private int msgNum;
	private String msgTitle;
	private String msgContent;
	private Date msgDate;
	public MsgVo() {}
	public MsgVo(String id, int msgNum, String msgTitle, String msgContent, Date msgDate) {
		super();
		this.id = id;
		this.msgNum = msgNum;
		this.msgTitle = msgTitle;
		this.msgContent = msgContent;
		this.msgDate = msgDate;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public int getMsgNum() {
		return msgNum;
	}
	public void setMsgNum(int msgNum) {
		this.msgNum = msgNum;
	}
	public String getMsgTitle() {
		return msgTitle;
	}
	public void setMsgTitle(String msgTitle) {
		this.msgTitle = msgTitle;
	}
	public String getMsgContent() {
		return msgContent;
	}
	public void setMsgContent(String msgContent) {
		this.msgContent = msgContent;
	}
	public Date getMsgDate() {
		return msgDate;
	}
	public void setMsgDate(Date msgDate) {
		this.msgDate = msgDate;
	}
	
}
