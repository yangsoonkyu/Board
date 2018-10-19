package member;

import java.sql.Timestamp;

public class PostInfo {
	private Integer post_num;
	private String id;
	private String title;
	private String text;
	private Timestamp created_date;
	private Timestamp published_date;
	public Integer getPost_num() {
		return post_num;
	}
	public void setPost_num(Integer post_num) {
		this.post_num = post_num;
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
	public String getText() {
		return text;
	}
	public void setText(String text) {
		this.text = text;
	}
	public Timestamp getCreated_date() {
		return created_date;
	}
	public void setCreated_date(Timestamp created_date) {
		this.created_date = created_date;
	}
	public Timestamp getPublished_date() {
		return published_date;
	}
	public void setPublished_date(Timestamp published_date) {
		this.published_date = published_date;
	}

}
