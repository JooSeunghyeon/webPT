package model;

public class CommentDTO {
	
	private int community_num;
	private int comment_num;
	private String comment_id;
	private String comment_content;
	
	
	public CommentDTO(int community_num, String comment_id, String comment_content) {
		this.community_num = community_num;
		this.comment_id = comment_id;
		this.comment_content = comment_content;
	}
	
	public CommentDTO(int community_num, int comment_num, String comment_id, String comment_content,
			String comment_date) {
		this.community_num = community_num;
		this.comment_num = comment_num;
		this.comment_id = comment_id;
		this.comment_content = comment_content;
		this.comment_date = comment_date;
	}
	public int getCommunity_num() {
		return community_num;
	}
	public void setCommunity_num(int community_num) {
		this.community_num = community_num;
	}
	public int getComment_num() {
		return comment_num;
	}
	public void setComment_num(int comment_num) {
		this.comment_num = comment_num;
	}
	public String getComment_id() {
		return comment_id;
	}
	public void setComment_id(String comment_id) {
		this.comment_id = comment_id;
	}
	public String getComment_content() {
		return comment_content;
	}
	public void setComment_content(String comment_content) {
		this.comment_content = comment_content;
	}
	public String getComment_date() {
		return comment_date;
	}
	public void setComment_date(String comment_date) {
		this.comment_date = comment_date;
	}
	private String comment_date;
}
