package dto;

public class Order {
	private Integer order_id;
	private String id;
	private String order_address;
	private String order_phone;
	private String order_requests;
	private String order_date;
	private Integer order_total_price;
	
	
	public Integer getOrder_id() {
		return order_id;
	}
	public void setOrder_id(Integer order_id) {
		this.order_id = order_id;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getOrder_address() {
		return order_address;
	}
	public void setOrder_address(String order_address) {
		this.order_address = order_address;
	}
	public String getOrder_phone() {
		return order_phone;
	}
	public void setOrder_phone(String order_phone) {
		this.order_phone = order_phone;
	}
	public String getOrder_requests() {
		return order_requests;
	}
	public void setOrder_requests(String order_requests) {
		this.order_requests = order_requests;
	}
	public String getOrder_date() {
		return order_date;
	}
	public void setOrder_date(String order_date) {
		this.order_date = order_date;
	}
	public Integer getOrder_total_price() {
		return order_total_price;
	}
	public void setOrder_total_price(Integer order_total_price) {
		this.order_total_price = order_total_price;
	}
	
	
}
