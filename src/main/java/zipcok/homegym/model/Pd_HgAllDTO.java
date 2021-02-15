package zipcok.homegym.model;

public class Pd_HgAllDTO {
	
	/*결제내역서정보*/
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
	
	/*홈짐등록정보*/
	private String hg_nickname;
	private String hg_saddr;
	/*홈짐예약정보*/
	private int reser_idx;
	private String mem_id;
	private String hg_mem_id;
	private String reser_date;
	private int reser_start_time;
	private int reser_end_time;
	private int reser_person_count;
	private String reser_regist_date;
	private String reser_status;
	private int reser_price;
	
	public Pd_HgAllDTO() {
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

	public String getHg_nickname() {
		return hg_nickname;
	}

	public void setHg_nickname(String hg_nickname) {
		this.hg_nickname = hg_nickname;
	}

	public String getHg_saddr() {
		return hg_saddr;
	}

	public void setHg_saddr(String hg_saddr) {
		this.hg_saddr = hg_saddr;
	}

	public int getReser_idx() {
		return reser_idx;
	}

	public void setReser_idx(int reser_idx) {
		this.reser_idx = reser_idx;
	}

	public String getMem_id() {
		return mem_id;
	}

	public void setMem_id(String mem_id) {
		this.mem_id = mem_id;
	}

	public String getHg_mem_id() {
		return hg_mem_id;
	}

	public void setHg_mem_id(String hg_mem_id) {
		this.hg_mem_id = hg_mem_id;
	}

	public String getReser_date() {
		return reser_date;
	}

	public void setReser_date(String reser_date) {
		this.reser_date = reser_date;
	}

	public int getReser_start_time() {
		return reser_start_time;
	}

	public void setReser_start_time(int reser_start_time) {
		this.reser_start_time = reser_start_time;
	}

	public int getReser_end_time() {
		return reser_end_time;
	}

	public void setReser_end_time(int reser_end_time) {
		this.reser_end_time = reser_end_time;
	}

	public int getReser_person_count() {
		return reser_person_count;
	}

	public void setReser_person_count(int reser_person_count) {
		this.reser_person_count = reser_person_count;
	}

	public String getReser_regist_date() {
		return reser_regist_date;
	}

	public void setReser_regist_date(String reser_regist_date) {
		this.reser_regist_date = reser_regist_date;
	}

	public String getReser_status() {
		return reser_status;
	}

	public void setReser_status(String reser_status) {
		this.reser_status = reser_status;
	}

	public int getReser_price() {
		return reser_price;
	}

	public void setReser_price(int reser_price) {
		this.reser_price = reser_price;
	}

	public Pd_HgAllDTO(int pd_idx, int pd_req_idx, String pd_key, String pd_code, String pd_target_id, String pd_mem_id,
			String pd_method, String pd_payment_date, String pd_status, int pd_price, String hg_nickname,
			String hg_saddr, int reser_idx, String mem_id, String hg_mem_id, String reser_date, int reser_start_time,
			int reser_end_time, int reser_person_count, String reser_regist_date, String reser_status,
			int reser_price) {
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
		this.hg_nickname = hg_nickname;
		this.hg_saddr = hg_saddr;
		this.reser_idx = reser_idx;
		this.mem_id = mem_id;
		this.hg_mem_id = hg_mem_id;
		this.reser_date = reser_date;
		this.reser_start_time = reser_start_time;
		this.reser_end_time = reser_end_time;
		this.reser_person_count = reser_person_count;
		this.reser_regist_date = reser_regist_date;
		this.reser_status = reser_status;
		this.reser_price = reser_price;
	}
	
	
	
	
}
