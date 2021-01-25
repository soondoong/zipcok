package zipcok.homegym.model;

import java.sql.Date;

public class HomeGymReservationDTO {
	private int reser_idx;
	private String mem_id;
	private String reser_hg_id;
	private java.sql.Date reser_date;
	private int reser_time;//예약하려는 시간
	private int reser_person_count;
	private java.sql.Date reser_now;
	private String reser_status;
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
	public String getReser_hg_id() {
		return reser_hg_id;
	}
	public void setReser_hg_id(String reser_hg_id) {
		this.reser_hg_id = reser_hg_id;
	}
	public java.sql.Date getReser_date() {
		return reser_date;
	}
	public void setReser_date(java.sql.Date reser_date) {
		this.reser_date = reser_date;
	}
	public int getReser_time() {
		return reser_time;
	}
	public void setReser_time(int reser_time) {
		this.reser_time = reser_time;
	}
	public int getReser_person_count() {
		return reser_person_count;
	}
	public void setReser_person_count(int reser_person_count) {
		this.reser_person_count = reser_person_count;
	}
	public java.sql.Date getReser_now() {
		return reser_now;
	}
	public void setReser_now(java.sql.Date reser_now) {
		this.reser_now = reser_now;
	}
	public String getReser_status() {
		return reser_status;
	}
	public void setReser_status(String reser_status) {
		this.reser_status = reser_status;
	}
	public HomeGymReservationDTO() {
		// TODO Auto-generated constructor stub
	}
	public HomeGymReservationDTO(int reser_idx, String mem_id, String reser_hg_id, Date reser_date, int reser_time,
			int reser_person_count, Date reser_now, String reser_status) {
		super();
		this.reser_idx = reser_idx;
		this.mem_id = mem_id;
		this.reser_hg_id = reser_hg_id;
		this.reser_date = reser_date;
		this.reser_time = reser_time;
		this.reser_person_count = reser_person_count;
		this.reser_now = reser_now;
		this.reser_status = reser_status;
	}

	
}
