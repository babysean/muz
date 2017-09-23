package spring.muz.bean;

public class BoardBean {
	private int no;
	private String title;
	private String writer;
	private String contents;
	private String regdate;
	private int hit;
	private int likes;
	private String likepeople;

	public BoardBean() {
		super();
		// TODO Auto-generated constructor stub
	}

	public BoardBean(int no, String title, String writer, String contents, String regdate, int hit, int likes,
			String likepeople) {
		super();
		this.no = no;
		this.title = title;
		this.writer = writer;
		this.contents = contents;
		this.regdate = regdate;
		this.hit = hit;
		this.likes = likes;
		this.likepeople = likepeople;
	}

	public int getNo() {
		return no;
	}

	public void setNo(int no) {
		this.no = no;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getWriter() {
		return writer;
	}

	public void setWriter(String writer) {
		this.writer = writer;
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

	public int getHit() {
		return hit;
	}

	public void setHit(int hit) {
		this.hit = hit;
	}

	public int getLikes() {
		return likes;
	}

	public void setLikes(int likes) {
		this.likes = likes;
	}

	public String getLikepeople() {
		return likepeople;
	}

	public void setLikepeople(String likepeople) {
		this.likepeople = likepeople;
	}

	@Override
	public String toString() {
		return "BoardBean [no=" + no + ", title=" + title + ", writer=" + writer + ", contents=" + contents
				+ ", regdate=" + regdate + ", hit=" + hit + ", likes=" + likes + ", likepeople=" + likepeople + "]";
	}

}
