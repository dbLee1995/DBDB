package projectVo;

import java.sql.Date;

public class NoticeVo {
	private int ntNum;
	private String ntTitle;
	private String ntContent;
	private Date ntDate;
	public NoticeVo() {}
	public NoticeVo(int ntNum, String ntTitle, String ntContent, Date ntDate) {
		super();
		this.ntNum = ntNum;
		this.ntTitle = ntTitle;
		this.ntContent = ntContent;
		this.ntDate = ntDate;
	}
	public int getNtNum() {
		return ntNum;
	}
	public void setNtNum(int ntNum) {
		this.ntNum = ntNum;
	}
	public String getNtTitle() {
		return ntTitle;
	}
	public void setNtTitle(String ntTitle) {
		this.ntTitle = ntTitle;
	}
	public String getNtContent() {
		return ntContent;
	}
	public void setNtContent(String ntContent) {
		this.ntContent = ntContent;
	}
	public Date getNtDate() {
		return ntDate;
	}
	public void setNtDate(Date ntDate) {
		this.ntDate = ntDate;
	}
	
}
