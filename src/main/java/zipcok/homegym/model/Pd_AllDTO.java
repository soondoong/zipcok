package zipcok.homegym.model;

public class Pd_AllDTO {
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
	/*이름정보*/
	private String mem_name;
	private String catename;
	
	/*결제요청서정보*/
	private int pr_idx;
	private int pr_msg_idx;
	private int pr_req_idx;
	private String pr_price;
	private String pr_start;
	private String pr_end;
	private String pr_content;
	private String pr_senddate;
	private String pr_status;
	private String pr_sender;
	private String pr_receiver;
	
	public Pd_AllDTO() {
		// TODO Auto-generated constructor stub
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

	public String getMem_name() {
		return mem_name;
	}

	public void setMem_name(String mem_name) {
		this.mem_name = mem_name;
	}

	public String getCatename() {
		return catename;
	}

	public void setCatename(String catename) {
		this.catename = catename;
	}

	public int getPr_idx() {
		return pr_idx;
	}

	public void setPr_idx(int pr_idx) {
		this.pr_idx = pr_idx;
	}

	public int getPr_msg_idx() {
		return pr_msg_idx;
	}

	public void setPr_msg_idx(int pr_msg_idx) {
		this.pr_msg_idx = pr_msg_idx;
	}

	public int getPr_req_idx() {
		return pr_req_idx;
	}

	public void setPr_req_idx(int pr_req_idx) {
		this.pr_req_idx = pr_req_idx;
	}

	public String getPr_price() {
		return pr_price;
	}

	public void setPr_price(String pr_price) {
		this.pr_price = pr_price;
	}

	public String getPr_start() {
		return pr_start;
	}

	public void setPr_start(String pr_start) {
		this.pr_start = pr_start;
	}

	public String getPr_end() {
		return pr_end;
	}

	public void setPr_end(String pr_end) {
		this.pr_end = pr_end;
	}

	public String getPr_content() {
		return pr_content;
	}

	public void setPr_content(String pr_content) {
		this.pr_content = pr_content;
	}

	public String getPr_senddate() {
		return pr_senddate;
	}

	public void setPr_senddate(String pr_senddate) {
		this.pr_senddate = pr_senddate;
	}

	public String getPr_status() {
		return pr_status;
	}

	public void setPr_status(String pr_status) {
		this.pr_status = pr_status;
	}

	public String getPr_sender() {
		return pr_sender;
	}

	public void setPr_sender(String pr_sender) {
		this.pr_sender = pr_sender;
	}

	public String getPr_receiver() {
		return pr_receiver;
	}

	public void setPr_receiver(String pr_receiver) {
		this.pr_receiver = pr_receiver;
	}

	public Pd_AllDTO(int pd_idx, int pd_req_idx, String pd_key, String pd_code, String pd_target_id, String pd_mem_id,
			String pd_method, String pd_payment_date, String pd_status, int pd_price, String mem_name, String catename,
			int pr_idx, int pr_msg_idx, int pr_req_idx, String pr_price, String pr_start, String pr_end,
			String pr_content, String pr_senddate, String pr_status, String pr_sender, String pr_receiver) {
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
		this.mem_name = mem_name;
		this.catename = catename;
		this.pr_idx = pr_idx;
		this.pr_msg_idx = pr_msg_idx;
		this.pr_req_idx = pr_req_idx;
		this.pr_price = pr_price;
		this.pr_start = pr_start;
		this.pr_end = pr_end;
		this.pr_content = pr_content;
		this.pr_senddate = pr_senddate;
		this.pr_status = pr_status;
		this.pr_sender = pr_sender;
		this.pr_receiver = pr_receiver;
	}

	
	
	
	
}
