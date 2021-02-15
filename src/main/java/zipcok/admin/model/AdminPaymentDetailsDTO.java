package zipcok.admin.model;

public class AdminPaymentDetailsDTO {

	private int pd_idx;
	private int pd_req_idx;
	private String pd_key;
	private String pd_code;
	private String pd_target_id;
	private String pd_mem_id;
	private String pd_method;
	private String pd_payment_date;
	private String pd_status;
	private int pd_price;
	public AdminPaymentDetailsDTO() {
		super();
	}
	public AdminPaymentDetailsDTO(int pd_idx, int pd_req_idx, String pd_key, String pd_code, String pd_target_id,
			String pd_mem_id, String pd_method, String pd_payment_date, String pd_status, int pd_price) {
		super();
		this.pd_idx = pd_idx;
		this.pd_req_idx = pd_req_idx;
		this.pd_key = pd_key;
		this.pd_code = pd_code;
		this.pd_target_id = pd_target_id;
		this.pd_mem_id = pd_mem_id;
		this.pd_method = pd_method;
		this.pd_payment_date = pd_payment_date;
		this.pd_status = pd_status;
		this.pd_price = pd_price;
	}
	public int getPd_idx() {
		return pd_idx;
	}
	public void setPd_idx(int pd_idx) {
		this.pd_idx = pd_idx;
	}
	public int getPd_req_idx() {
		return pd_req_idx;
	}
	public void setPd_req_idx(int pd_req_idx) {
		this.pd_req_idx = pd_req_idx;
	}
	public String getPd_key() {
		return pd_key;
	}
	public void setPd_key(String pd_key) {
		this.pd_key = pd_key;
	}
	public String getPd_code() {
		return pd_code;
	}
	public void setPd_code(String pd_code) {
		this.pd_code = pd_code;
	}
	public String getPd_target_id() {
		return pd_target_id;
	}
	public void setPd_target_id(String pd_target_id) {
		this.pd_target_id = pd_target_id;
	}
	public String getPd_mem_id() {
		return pd_mem_id;
	}
	public void setPd_mem_id(String pd_mem_id) {
		this.pd_mem_id = pd_mem_id;
	}
	public String getPd_method() {
		return pd_method;
	}
	public void setPd_method(String pd_method) {
		this.pd_method = pd_method;
	}
	public String getPd_payment_date() {
		return pd_payment_date;
	}
	public void setPd_payment_date(String pd_payment_date) {
		this.pd_payment_date = pd_payment_date;
	}
	public String getPd_status() {
		return pd_status;
	}
	public void setPd_status(String pd_status) {
		this.pd_status = pd_status;
	}
	public int getPd_price() {
		return pd_price;
	}
	public void setPd_price(int pd_price) {
		this.pd_price = pd_price;
	}
	
	
}
