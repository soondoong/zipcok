package zipcok.cpayment.model;

public class Payment_RequestDTO {

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
	
	
	public Payment_RequestDTO() {
		// TODO Auto-generated constructor stub
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


	public Payment_RequestDTO(int pr_idx, int pr_msg_idx, int pr_req_idx, String pr_price, String pr_start,
			String pr_end, String pr_content, String pr_senddate, String pr_status, String pr_sender,
			String pr_receiver) {
		super();
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
