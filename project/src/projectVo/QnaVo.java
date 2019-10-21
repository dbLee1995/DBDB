package projectVo;

import java.sql.Date;

public class QnaVo {
	private int qnum;
	private String id;
	private String category;
	private String title;
	private String content;
	private Date regdate;
	private String answer;
	private Date answerdate;
	private int answerstate;
	public QnaVo() {}
	
	public QnaVo(int qnum, String id, String category, String title, String content, Date regdate, String answer,
			Date answerdate, int answerstate) {
		super();
		this.qnum = qnum;
		this.id = id;
		this.category = category;
		this.title = title;
		this.content = content;
		this.regdate = regdate;
		this.answer = answer;
		this.answerdate = answerdate;
		this.answerstate = answerstate;
	}
	public int getQnum() {
		return qnum;
	}

	public void setQnum(int qnum) {
		this.qnum = qnum;
	}

	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
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
	public String getAnswer() {
		return answer;
	}
	public void setAnswer(String answer) {
		this.answer = answer;
	}
	public Date getAnswerdate() {
		return answerdate;
	}
	public void setAnswerdate(Date answerdate) {
		this.answerdate = answerdate;
	}
	public int getAnswerstate() {
		return answerstate;
	}
	public void setAnswerstate(int answerstate) {
		this.answerstate = answerstate;
	}
	
}
