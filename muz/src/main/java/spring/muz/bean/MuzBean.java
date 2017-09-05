package spring.muz.bean;

public class MuzBean implements DefaultBean {
	private String id;
	private String pw;
	private String name;
	private String nickname;
	private String tel;
	private String picture;

	public MuzBean() {
		super();
	}

	public MuzBean(String id, String pw, String name, String nickname, String tel, String picture) {
		super();
		this.id = id;
		this.pw = pw;
		this.name = name;
		this.nickname = nickname;
		this.tel = tel;
		this.picture = picture;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getPw() {
		return pw;
	}

	public void setPw(String pw) {
		this.pw = pw;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getNickname() {
		return nickname;
	}

	public void setNickname(String nickname) {
		this.nickname = nickname;
	}

	public String getTel() {
		return tel;
	}

	public void setTel(String tel) {
		this.tel = tel;
	}

	public String getPicture() {
		return picture;
	}

	public void setPicture(String picture) {
		this.picture = picture;
	}

	@Override
	public String toString() {
		return "MuzBean [id=" + id + ", pw=" + pw + ", name=" + name + ", nickname=" + nickname + ", tel=" + tel
				+ ", picture=" + picture + "]";
	}

}
