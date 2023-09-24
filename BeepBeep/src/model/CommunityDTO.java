package model;

public class CommunityDTO {

	private int num;
	private String title;
	private String id;
	private String filename;
	private String content;
	private String day;
	
	
	//community write
	public CommunityDTO(String title, String id, String filename, String content) {
		this.title = title;
		this.id = id;
		this.filename = filename;
		this.content = content;
	}
	
	//ÀüÃ¼ ¹­À½
	public CommunityDTO(int num, String title, String id, String filename, String content, String day) {
		this.num = num;
		this.title = title;
		this.id = id;
		this.filename = filename;
		this.content = content;
		this.day = day;
	}


	public int getNum() {
		return num;
	}
	public String getTitle() {
		return title;
	}
	public String getId() {
		return id;
	}
	public String getFilename() {
		return filename;
	}
	public String getContent() {
		return content;
	}
	public String getDay() {
		return day;
	}


	
	
	
}
