package zipcok.homegym.model;

import java.sql.Date;
import java.util.List;

public class HomeGymDTO {
	private int rnum;
	private String hg_mem_id;
	private String hg_nickname;
	private String hg_faddr;
	private String hg_saddr;
	private String hg_station;
	private String hg_comeinfo;
	private int hg_person_count;
	private String hg_info;
	private String hg_start_date;
	private String hg_end_date;
	private String hg_not_date;
	private int hg_start_time;
	private int hg_end_time;
	private int hg_price;
	private String hg_approved_check;
	private java.sql.Date hg_approved_date;
	private String hg_status;
	private String hg_eq;
	private List<HomeGymEquipmentDTO> hg_eq_list;
	private String hg_upload;
	private int hg_like;
	private int star_avg;
	private String hg_regist_date;
	public HomeGymDTO() {
		super();
	}
	public HomeGymDTO(int rnum, String hg_mem_id, String hg_nickname, String hg_faddr, String hg_saddr,
			String hg_station, String hg_comeinfo, int hg_person_count, String hg_info, String hg_start_date,
			String hg_end_date, String hg_not_date, int hg_start_time, int hg_end_time, int hg_price,
			String hg_approved_check, Date hg_approved_date, String hg_status, String hg_eq,
			List<HomeGymEquipmentDTO> hg_eq_list, String hg_upload, int hg_like, int star_avg, String hg_regist_date) {
		super();
		this.rnum = rnum;
		this.hg_mem_id = hg_mem_id;
		this.hg_nickname = hg_nickname;
		this.hg_faddr = hg_faddr;
		this.hg_saddr = hg_saddr;
		this.hg_station = hg_station;
		this.hg_comeinfo = hg_comeinfo;
		this.hg_person_count = hg_person_count;
		this.hg_info = hg_info;
		this.hg_start_date = hg_start_date;
		this.hg_end_date = hg_end_date;
		this.hg_not_date = hg_not_date;
		this.hg_start_time = hg_start_time;
		this.hg_end_time = hg_end_time;
		this.hg_price = hg_price;
		this.hg_approved_check = hg_approved_check;
		this.hg_approved_date = hg_approved_date;
		this.hg_status = hg_status;
		this.hg_eq = hg_eq;
		this.hg_eq_list = hg_eq_list;
		this.hg_upload = hg_upload;
		this.hg_like = hg_like;
		this.star_avg = star_avg;
		this.hg_regist_date = hg_regist_date;
	}
	public int getRnum() {
		return rnum;
	}
	public void setRnum(int rnum) {
		this.rnum = rnum;
	}
	public String getHg_mem_id() {
		return hg_mem_id;
	}
	public void setHg_mem_id(String hg_mem_id) {
		this.hg_mem_id = hg_mem_id;
	}
	public String getHg_nickname() {
		return hg_nickname;
	}
	public void setHg_nickname(String hg_nickname) {
		this.hg_nickname = hg_nickname;
	}
	public String getHg_faddr() {
		return hg_faddr;
	}
	public void setHg_faddr(String hg_faddr) {
		this.hg_faddr = hg_faddr;
	}
	public String getHg_saddr() {
		return hg_saddr;
	}
	public void setHg_saddr(String hg_saddr) {
		this.hg_saddr = hg_saddr;
	}
	public String getHg_station() {
		return hg_station;
	}
	public void setHg_station(String hg_station) {
		this.hg_station = hg_station;
	}
	public String getHg_comeinfo() {
		return hg_comeinfo;
	}
	public void setHg_comeinfo(String hg_comeinfo) {
		this.hg_comeinfo = hg_comeinfo;
	}
	public int getHg_person_count() {
		return hg_person_count;
	}
	public void setHg_person_count(int hg_person_count) {
		this.hg_person_count = hg_person_count;
	}
	public String getHg_info() {
		return hg_info;
	}
	public void setHg_info(String hg_info) {
		this.hg_info = hg_info;
	}
	public String getHg_start_date() {
		return hg_start_date;
	}
	public void setHg_start_date(String hg_start_date) {
		this.hg_start_date = hg_start_date;
	}
	public String getHg_end_date() {
		return hg_end_date;
	}
	public void setHg_end_date(String hg_end_date) {
		this.hg_end_date = hg_end_date;
	}
	public String getHg_not_date() {
		return hg_not_date;
	}
	public void setHg_not_date(String hg_not_date) {
		this.hg_not_date = hg_not_date;
	}
	public int getHg_start_time() {
		return hg_start_time;
	}
	public void setHg_start_time(int hg_start_time) {
		this.hg_start_time = hg_start_time;
	}
	public int getHg_end_time() {
		return hg_end_time;
	}
	public void setHg_end_time(int hg_end_time) {
		this.hg_end_time = hg_end_time;
	}
	public int getHg_price() {
		return hg_price;
	}
	public void setHg_price(int hg_price) {
		this.hg_price = hg_price;
	}
	public String getHg_approved_check() {
		return hg_approved_check;
	}
	public void setHg_approved_check(String hg_approved_check) {
		this.hg_approved_check = hg_approved_check;
	}
	public java.sql.Date getHg_approved_date() {
		return hg_approved_date;
	}
	public void setHg_approved_date(java.sql.Date hg_approved_date) {
		this.hg_approved_date = hg_approved_date;
	}
	public String getHg_status() {
		return hg_status;
	}
	public void setHg_status(String hg_status) {
		this.hg_status = hg_status;
	}
	public String getHg_eq() {
		return hg_eq;
	}
	public void setHg_eq(String hg_eq) {
		this.hg_eq = hg_eq;
	}
	public List<HomeGymEquipmentDTO> getHg_eq_list() {
		return hg_eq_list;
	}
	public void setHg_eq_list(List<HomeGymEquipmentDTO> hg_eq_list) {
		this.hg_eq_list = hg_eq_list;
	}
	public String getHg_upload() {
		return hg_upload;
	}
	public void setHg_upload(String hg_upload) {
		this.hg_upload = hg_upload;
	}
	public int getHg_like() {
		return hg_like;
	}
	public void setHg_like(int hg_like) {
		this.hg_like = hg_like;
	}
	public int getStar_avg() {
		return star_avg;
	}
	public void setStar_avg(int star_avg) {
		this.star_avg = star_avg;
	}
	public String getHg_regist_date() {
		return hg_regist_date;
	}
	public void setHg_regist_date(String hg_regist_date) {
		this.hg_regist_date = hg_regist_date;
	}
	
	
	
}