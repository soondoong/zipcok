package zipcok.homegym.model;

public class HomeGymReservationDTO {
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
	public HomeGymReservationDTO() {
		// TODO Auto-generated constructor stub
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
	public HomeGymReservationDTO(int reser_idx, String mem_id, String hg_mem_id, String reser_date,
			int reser_start_time, int reser_end_time, int reser_person_count, String reser_regist_date,
			String reser_status, int reser_price) {
		super();
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
