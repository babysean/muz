package spring.muz.bean;

public class BoardReplyBean {
	private int no;
	private String nickname;
	private String contents;
	private String regdate;
	private String picture;
	private int pnum;

	public BoardReplyBean() {
		super();
	}

	public BoardReplyBean(int no, String nickname, String contents, String regdate, String picture, int pnum) {
		super();
		this.no = no;
		this.nickname = nickname;
		this.contents = contents;
		this.regdate = regdate;
		this.picture = picture;
		this.pnum = pnum;
	}

	public int getNo() {
		return no;
	}

	public void setNo(int no) {
		this.no = no;
	}

	public String getNickname() {
		return nickname;
	}

	public void setNickname(String nickname) {
		this.nickname = nickname;
	}

	public String getContents() {
		return contents;
	}

	public void setContents(String contents) {
		this.contents = contents;
	}

	public String getRegdate() {
		return regdate;
	}

	public void setRegdate(String regdate) {
		this.regdate = regdate;
	}

	public String getPicture() {
		return picture;
	}

	public void setPicture(String picture) {
		this.picture = picture;
	}

	public int getPnum() {
		return pnum;
	}

	public void setPnum(int pnum) {
		this.pnum = pnum;
	}

	@Override
	public String toString() {
		return "BoardReplyBean [no=" + no + ", nickname=" + nickname + ", contents=" + contents + ", regdate=" + regdate
				+ ", picture=" + picture + ", pnum=" + pnum + "]";
	}

}
