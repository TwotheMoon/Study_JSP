package dto;

public class Product {

	private String productID; // 상품아이디
	private String pname;				// 상품명
	private Integer pprice;				// 상품가격
	private String description;			// 상품설명
	private String	manufacturer;		// 상품 제조사
	private String category;			// 상품 분류
	private Integer pinstock;			// 상품 재고수
	private String conditions;			// 신제품 or 기존제품
	private String filename;			// 상품 이미지
	private Integer activation; 		// 상품 활성화 여부
	
	public Product() {
		
	}
	public Product(String productID, String pname, Integer pprice) {
		this.productID = productID;
		this.pname = pname;
		this.pprice = pprice;
	}
	
	public String getProductID() {
		return productID;
	}
	public void setProductID(String productID) {
		this.productID = productID;
	}
	public String getPname() {
		return pname;
	}
	public void setPname(String pname) {
		this.pname = pname;
	}
	public Integer getPprice() {
		return pprice;
	}
	public void setPprice(Integer pprice) {
		this.pprice = pprice;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public String getManufacturer() {
		return manufacturer;
	}
	public void setManufacturer(String manufacturer) {
		this.manufacturer = manufacturer;
	}
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}
	public Integer getPinstock() {
		return pinstock;
	}
	public void setPinstock(Integer pinstock) {
		this.pinstock = pinstock;
	}
	public String getconditions() {
		return conditions;
	}
	public void setconditions(String conditions) {
		this.conditions = conditions;
	}
	public String getFilename() {
		return filename;
	}
	public void setFilename(String filename) {
		this.filename = filename;
	}
	public Integer getActivation() {
		return activation;
	}
	public void setActivation(Integer activation) {
		this.activation = activation;
	}


}
