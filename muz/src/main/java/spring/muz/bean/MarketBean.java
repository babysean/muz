package spring.muz.bean;

public class MarketBean {
	private int no;
	private String title;
	private String writer;
	private String contents;
	private String tel;
	private int price;
	private String location;
	private int hit;
	private String state;
	private String picture;
	private String regdate;

	public MarketBean() {
		super();
	}

	public MarketBean(int no, String title, String writer, String contents, String tel, int price, String location,
			int hit, String state, String picture, String regdate) {
		super();
		this.no = no;
		this.title = title;
		this.writer = writer;
		this.contents = contents;
		this.tel = tel;
		this.price = price;
		this.location = location;
		this.hit = hit;
		this.state = state;
		this.picture = picture;
		this.regdate = regdate;
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

	public String getTel() {
		return tel;
	}

	public void setTel(String tel) {
		this.tel = tel;
	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}

	public String getLocation() {
		return location;
	}

	public void setLocation(String location) {
		this.location = location;
	}

	public int getHit() {
		return hit;
	}

	public void setHit(int hit) {
		this.hit = hit;
	}

	public String getState() {
		return state;
	}

	public void setState(String state) {
		this.state = state;
	}

	public String getPicture() {
		return picture;
	}

	public void setPicture(String picture) {
		this.picture = picture;
	}

	public String getRegdate() {
		return regdate;
	}

	public void setRegdate(String regdate) {
		this.regdate = regdate;
	}

	@Override
	public String toString() {
		return "MarketBean [no=" + no + ", title=" + title + ", writer=" + writer + ", contents=" + contents + ", tel="
				+ tel + ", price=" + price + ", location=" + location + ", hit=" + hit + ", state=" + state
				+ ", picture=" + picture + ", regdate=" + regdate + "]";
	}

}
