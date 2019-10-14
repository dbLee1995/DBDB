package projectVo;

import java.sql.Date;

public class ReviewVo {
	private int revnum;
	private int gdNum;
	private String id;
	private String title;
	private String content;
	private Date regdate;
	private int score;
	public ReviewVo() {}
	public ReviewVo(int revnum, int gdNum, String id, String title, String content, Date regdate, int score) {
		super();
		this.revnum = revnum;
		this.gdNum = gdNum;
		this.id = id;
		this.title = title;
		this.content = content;
		this.regdate = regdate;
		this.score = score;
	}
	public int getRevnum() {
		return revnum;
	}
	public void setRevnum(int revnum) {
		this.revnum = revnum;
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
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public Date getRegdate() {
		return regdate;
	}
	public void setRegdate(Date regdate) {
		this.regdate = regdate;
	}
	public int getScore() {
		return score;
	}
	public void setScore(int score) {
		this.score = score;
	}

	
}
