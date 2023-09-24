package model;

public class calendarDTO {
	
	private String cal_id;
	private String cal_title;
	private String cal_start;
	private String cal_end;
	private String cal_description; //설명
	private String cal_type;
	private String cal_user; // 멤버테이블 참조한 아이디
	private String cal_color;
	private String cal_textColor;
	
	
	public calendarDTO(String cal_id, String cal_title, String cal_start, String cal_end, String cal_description,
			String cal_type, String cal_user, String cal_color, String cal_textColor) {
		this.cal_id = cal_id;
		this.cal_title = cal_title;
		this.cal_start = cal_start;
		this.cal_end = cal_end;
		this.cal_description = cal_description;
		this.cal_type = cal_type;
		this.cal_user = cal_user;
		this.cal_color = cal_color;
		this.cal_textColor = cal_textColor;
	}

	
	public calendarDTO(String cal_title, String cal_start, String cal_end, String cal_description,
			String cal_type, String cal_user, String cal_color) {
		this.cal_id = cal_id;
		this.cal_title = cal_title;
		this.cal_start = cal_start;
		this.cal_end = cal_end;
		this.cal_description = cal_description;
		this.cal_type = cal_type;
		this.cal_user = cal_user;
		this.cal_color = cal_color;
	}
	
	

	public String getCal_id() {
		return cal_id;
	}


	public void setCal_id(String cal_id) {
		this.cal_id = cal_id;
	}


	public String getCal_title() {
		return cal_title;
	}


	public void setCal_title(String cal_title) {
		this.cal_title = cal_title;
	}


	public String getCal_start() {
		return cal_start;
	}


	public void setCal_start(String cal_start) {
		this.cal_start = cal_start;
	}


	public String getCal_end() {
		return cal_end;
	}


	public void setCal_end(String cal_end) {
		this.cal_end = cal_end;
	}


	public String getCal_description() {
		return cal_description;
	}


	public void setCal_description(String cal_description) {
		this.cal_description = cal_description;
	}


	public String getCal_type() {
		return cal_type;
	}


	public void setCal_type(String cal_type) {
		this.cal_type = cal_type;
	}


	public String getCal_user() {
		return cal_user;
	}


	public void setCal_user(String cal_user) {
		this.cal_user = cal_user;
	}


	public String getCal_color() {
		return cal_color;
	}


	public void setCal_color(String cal_color) {
		this.cal_color = cal_color;
	}


	public String getCal_textColor() {
		return cal_textColor;
	}


	public void setCal_textColor(String cal_textColor) {
		this.cal_textColor = cal_textColor;
	}
	
	
	
	

}
