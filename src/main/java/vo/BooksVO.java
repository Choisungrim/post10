package vo;

public class BooksVO {
	private int seq;
	private String codename;
	private String content;
	private String regdate;
	private String postitcode;
	
	public String getPostitcode() {
		return postitcode;
	}
	public void setPostitcode(String postitcode) {
		this.postitcode = postitcode;
	}
	public int getSeq() {
		return seq;
	}
	public void setSeq(int seq) {
		this.seq = seq;
	}
	public String getCodename() {
		return codename;
	}
	public void setCodename(String codename) {
		this.codename = codename;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getRegdate() {
		return regdate;
	}
	public void setRegdate(String regdate) {
		this.regdate = regdate;
	}
	@Override
	public String toString() {
		return "BooksVO [seq=" + seq + ", codename=" + codename + ", content=" + content + ", regdate=" + regdate
				+ ", postitcode=" + postitcode + "]";
	}
	
	
}
