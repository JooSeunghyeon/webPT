package model;

public class foodDTO {
	
	private String product_name;
	private int product_cal;
	private int product_carb;
	private int product_prot;
	private int product_fat;
	
	
	public foodDTO(String product_name, int product_cal, int product_carb, int product_prot, int product_fat) {
		this.product_name = product_name;
		this.product_cal = product_cal;
		this.product_carb = product_carb;
		this.product_prot = product_prot;
		this.product_fat = product_fat;
	}


	public String getProduct_name() {
		return product_name;
	}


	public void setProduct_name(String product_name) {
		this.product_name = product_name;
	}


	public int getProduct_cal() {
		return product_cal;
	}


	public void setProduct_cal(int product_cal) {
		this.product_cal = product_cal;
	}


	public int getProduct_carb() {
		return product_carb;
	}


	public void setProduct_carb(int product_carb) {
		this.product_carb = product_carb;
	}


	public int getProduct_prot() {
		return product_prot;
	}


	public void setProduct_prot(int product_prot) {
		this.product_prot = product_prot;
	}


	public int getProduct_fat() {
		return product_fat;
	}


	public void setProduct_fat(int product_fat) {
		this.product_fat = product_fat;
	}
	
	
	

}
