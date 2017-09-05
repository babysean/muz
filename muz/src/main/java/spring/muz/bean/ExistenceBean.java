package spring.muz.bean;

public class ExistenceBean {
	private int no;
	private String title;
	private String writer;
	private String contents;
	private String music;
	private String regdate;
	private int hit;
	private int likes;
	private int unlikes;
	private String likepeople;
	private String unlikepeople;

	public ExistenceBean() {
		super();
	}

	public ExistenceBean(int no, String title, String writer, String contents, String music, String regdate, int hit,
			int likes, int unlikes, String likepeople, String unlikepeople) {
		super();
		this.no = no;
		this.title = title;
		this.writer = writer;
		this.contents = contents;
		this.music = music;
		this.regdate = regdate;
		this.hit = hit;
		this.likes = likes;
		this.unlikes = unlikes;
		this.likepeople = likepeople;
		this.unlikepeople = unlikepeople;
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

	public String getMusic() {
		return music;
	}

	public void setMusic(String music) {
		this.music = music;
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

	public int getUnlikes() {
		return unlikes;
	}

	public void setUnlikes(int unlikes) {
		this.unlikes = unlikes;
	}

	public String getLikepeople() {
		return likepeople;
	}

	public void setLikepeople(String likepeople) {
		this.likepeople = likepeople;
	}

	public String getUnlikepeople() {
		return unlikepeople;
	}

	public void setUnlikepeople(String unlikepeople) {
		this.unlikepeople = unlikepeople;
	}

	@Override
	public String toString() {
		return "ExistenceBean [no=" + no + ", title=" + title + ", writer=" + writer + ", contents=" + contents
				+ ", music=" + music + ", regdate=" + regdate + ", hit=" + hit + ", likes=" + likes + ", unlikes="
				+ unlikes + ", likepeople=" + likepeople + ", unlikepeople=" + unlikepeople + "]";
	}

}
