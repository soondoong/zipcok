package zipcok.member.model;

import java.sql.*;

public class MemberDTO {

	private int mem_idx;
	private String mem_name;
	private String mem_birth;
	private String mem_id;
	private String mem_pwd;
	private String mem_email;
	private String mem_email2;
	private String mem_faddr;
	private String mem_saddr;
	private String mem_sex;
	private String mem_tel;
	private Date mem_joindate;
	private Date mem_change;
	private String mem_joinway;
	private int mem_out;
	private Date mem_outdate;
	private String mem_type;
	
	
	public MemberDTO() {
		super();
	}


	public MemberDTO(int mem_idx, String mem_name, String mem_birth, String mem_id, String mem_pwd, String mem_email,
			String mem_email2, String mem_faddr, String mem_saddr, String mem_sex, String mem_tel, Date mem_joindate,
			Date mem_change, String mem_joinway, int mem_out, Date mem_outdate, String mem_type) {
		super();
		this.mem_idx = mem_idx;
		this.mem_name = mem_name;
		this.mem_birth = mem_birth;
		this.mem_id = mem_id;
		this.mem_pwd = mem_pwd;
		this.mem_email = mem_email;
		this.mem_email2 = mem_email2;
		this.mem_faddr = mem_faddr;
		this.mem_saddr = mem_saddr;
		this.mem_sex = mem_sex;
		this.mem_tel = mem_tel;
		this.mem_joindate = mem_joindate;
		this.mem_change = mem_change;
		this.mem_joinway = mem_joinway;
		this.mem_out = mem_out;
		this.mem_outdate = mem_outdate;
		this.mem_type = mem_type;
	}


	public int getMem_idx() {
		return mem_idx;
	}


	public void setMem_idx(int mem_idx) {
		this.mem_idx = mem_idx;
	}


	public String getMem_name() {
		return mem_name;
	}


	public void setMem_name(String mem_name) {
		this.mem_name = mem_name;
	}


	public String getMem_birth() {
		return mem_birth;
	}


	public void setMem_birth(String mem_birth) {
		this.mem_birth = mem_birth;
	}


	public String getMem_id() {
		return mem_id;
	}


	public void setMem_id(String mem_id) {
		this.mem_id = mem_id;
	}


	public String getMem_pwd() {
		return mem_pwd;
	}


	public void setMem_pwd(String mem_pwd) {
		this.mem_pwd = mem_pwd;
	}


	public String getMem_email() {
		return mem_email;
	}


	public void setMem_email(String mem_email) {
		this.mem_email = mem_email;
	}


	public String getMem_email2() {
		return mem_email2;
	}


	public void setMem_email2(String mem_email2) {
		this.mem_email2 = mem_email2;
	}


	public String getMem_faddr() {
		return mem_faddr;
	}


	public void setMem_faddr(String mem_faddr) {
		this.mem_faddr = mem_faddr;
	}


	public String getMem_saddr() {
		return mem_saddr;
	}


	public void setMem_saddr(String mem_saddr) {
		this.mem_saddr = mem_saddr;
	}


	public String getMem_sex() {
		return mem_sex;
	}


	public void setMem_sex(String mem_sex) {
		this.mem_sex = mem_sex;
	}


	public String getMem_tel() {
		return mem_tel;
	}


	public void setMem_tel(String mem_tel) {
		this.mem_tel = mem_tel;
	}


	public Date getMem_joindate() {
		return mem_joindate;
	}


	public void setMem_joindate(Date mem_joindate) {
		this.mem_joindate = mem_joindate;
	}


	public Date getMem_change() {
		return mem_change;
	}


	public void setMem_change(Date mem_change) {
		this.mem_change = mem_change;
	}


	public String getMem_joinway() {
		return mem_joinway;
	}


	public void setMem_joinway(String mem_joinway) {
		this.mem_joinway = mem_joinway;
	}


	public int getMem_out() {
		return mem_out;
	}


	public void setMem_out(int mem_out) {
		this.mem_out = mem_out;
	}


	public Date getMem_outdate() {
		return mem_outdate;
	}


	public void setMem_outdate(Date mem_outdate) {
		this.mem_outdate = mem_outdate;
	}


	public String getMem_type() {
		return mem_type;
	}


	public void setMem_type(String mem_type) {
		this.mem_type = mem_type;
	}

	
	
}
