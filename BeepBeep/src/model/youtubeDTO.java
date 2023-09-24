package model;

public class youtubeDTO {
	
	private String category;
	private String link;
	private String part;
	private String gender;
	private String youtuber;
	
	public youtubeDTO(String category, String link, String part, String gender, String youtuber) {
		this.category = category;
		this.link = link;
		this.part = part;
		this.gender = gender;
		this.youtuber = youtuber;
	}
	
	
	
	public youtubeDTO(String part) {
		this.part = part;
	}

	public String getCategory() {
		return category;
	}

	public void setCategory(String category) {
		this.category = category;
	}

	public String getLink() {
		return link;
	}

	public void setLink(String link) {
		this.link = link;
	}

	public String getPart() {
		return part;
	}

	public void setPart(String part) {
		this.part = part;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public String getYoutuber() {
		return youtuber;
	}

	public void setYoutuber(String youtuber) {
		this.youtuber = youtuber;
	}
	

	
	
	

}
