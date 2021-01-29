package zipcok.coach.model;


public class RequestFormDTO {
	
	private int req_idx;
	private String req_mem_id;
	private String req_receive_id;
	private String req_type;
	private String req_category;
	private String req_start_date; 
	private String req_cont;
	private String req_date;
	
	public RequestFormDTO() {
		// TODO Auto-generated constructor stub
	}

	public int getReq_idx() {
		return req_idx;
	}

	public void setReq_idx(int req_idx) {
		this.req_idx = req_idx;
	}

	public String getReq_mem_id() {
		return req_mem_id;
	}

	public void setReq_mem_id(String req_mem_id) {
		this.req_mem_id = req_mem_id;
	}

	public String getReq_receive_id() {
		return req_receive_id;
	}

	public void setReq_receive_id(String req_receive_id) {
		this.req_receive_id = req_receive_id;
	}

	public String getReq_type() {
		return req_type;
	}

	public void setReq_type(String req_type) {
		this.req_type = req_type;
	}

	public String getReq_category() {
		return req_category;
	}

	public void setReq_category(String req_category) {
		this.req_category = req_category;
	}

	public String getReq_start_date() {
		return req_start_date;
	}

	public void setReq_start_date(String req_start_date) {
		this.req_start_date = req_start_date;
	}

	public String getReq_cont() {
		return req_cont;
	}

	public void setReq_cont(String req_cont) {
		this.req_cont = req_cont;
	}

	public String getReq_date() {
		return req_date;
	}

	public void setReq_date(String req_date) {
		this.req_date = req_date;
	}

	public RequestFormDTO(int req_idx, String req_mem_id, String req_receive_id, String req_type, String req_category,
			String req_start_date, String req_cont, String req_date) {
		super();
		this.req_idx = req_idx;
		this.req_mem_id = req_mem_id;
		this.req_receive_id = req_receive_id;
		this.req_type = req_type;
		this.req_category = req_category;
		this.req_start_date = req_start_date;
		this.req_cont = req_cont;
		this.req_date = req_date;
	}

	
}
