package zipcok.homegym.model;

public class PaymentDTO {
	private int pa_idx;
	private String hg_mem_id;
	private String pa_bankname;
	private String pa_no;
	private String pa_username;
	public int getPa_idx() {
		return pa_idx;
	}
	public void setPa_idx(int pa_idx) {
		this.pa_idx = pa_idx;
	}
	
	public String getHg_mem_id() {
		return hg_mem_id;
	}
	public void setHg_mem_id(String hg_mem_id) {
		this.hg_mem_id = hg_mem_id;
	}
	public String getPa_bankname() {
		return pa_bankname;
	}
	public void setPa_bankname(String pa_bankname) {
		this.pa_bankname = pa_bankname;
	}
	public String getPa_no() {
		return pa_no;
	}
	public void setPa_no(String pa_no) {
		this.pa_no = pa_no;
	}
	public String getPa_username() {
		return pa_username;
	}
	public void setPa_username(String pa_username) {
		this.pa_username = pa_username;
	}
	public PaymentDTO() {
		// TODO Auto-generated constructor stub
	}
	public PaymentDTO(int pa_idx, String hg_mem_id, String pa_bankname, String pa_no, String pa_username) {
		super();
		this.pa_idx = pa_idx;
		this.hg_mem_id = hg_mem_id;
		this.pa_bankname = pa_bankname;
		this.pa_no = pa_no;
		this.pa_username = pa_username;
	}

	
	
}
