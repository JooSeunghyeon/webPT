package model;

public class memberDTO {
	
	private String category;
	private String id;
	private String pw;
	private String name;
	private int age;
	private String gender;
	private String target;
	private String tel;
	private float height;
	private float weight;
	// 프로필 사진 추가를 위한 필드 생성
	private String profile;
	
	public memberDTO(String category, String id, String pw, String name, int age, String gender, String target, String tel,
			float height, float weight, String profile) {
		this.category = category;
		this.id = id;
		this.pw = pw;
		this.name = name;
		this.age = age;
		this.gender = gender;
		this.target = target;
		this.tel = tel;
		this.height = height;
		this.weight = weight;
		this.profile = profile;
	}

	public String getCategory() {
		return category;
	}

	public void setCategory(String category) {
		this.category = category;
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

	public int getAge() {
		return age;
	}

	public void setAge(int age) {
		this.age = age;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public String getTarget() {
		return target;
	}

	public void setTarget(String target) {
		this.target = target;
	}

	public String getTel() {
		return tel;
	}

	public void setTel(String tel) {
		this.tel = tel;
	}

	public float getHeight() {
		return height;
	}

	public void setHeight(float height) {
		this.height = height;
	}

	public float getWeight() {
		return weight;
	}

	public void setWeight(float weight) {
		this.weight = weight;
	}

	// 프로필 사진 추가를 위한 setter, getter 생성
	public void setProfile(String profile) {
		this.profile = profile;
	}
	
	public String getProfile() {
		return profile;
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}

