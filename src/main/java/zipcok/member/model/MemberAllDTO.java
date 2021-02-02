package zipcok.member.model;

import java.sql.Date;

public class MemberAllDTO {

	private int mem_idx;
	private String mem_name;
	private String mem_birth;
	private String mem_id;
	private String mem_pwd;
	private String mem_email;
	private String mem_zipcode;
	private String mem_addr;
	private String mem_detailaddr;
	private String mem_gender;
	private String mem_phone;
	private Date mem_joindate;
	private Date mem_change;
	private String mem_joinway;
	private int mem_out;
	private Date mem_outdate;
	private String mem_type;
	private String mfile_upload;
	
	public MemberAllDTO() {
		// TODO Auto-generated constructor stub
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

	public String getMem_zipcode() {
		return mem_zipcode;
	}

	public void setMem_zipcode(String mem_zipcode) {
		this.mem_zipcode = mem_zipcode;
	}

	public String getMem_addr() {
		return mem_addr;
	}

	public void setMem_addr(String mem_addr) {
		this.mem_addr = mem_addr;
	}

	public String getMem_detailaddr() {
		return mem_detailaddr;
	}

	public void setMem_detailaddr(String mem_detailaddr) {
		this.mem_detailaddr = mem_detailaddr;
	}

	public String getMem_gender() {
		return mem_gender;
	}

	public void setMem_gender(String mem_gender) {
		this.mem_gender = mem_gender;
	}

	public String getMem_phone() {
		return mem_phone;
	}

	public void setMem_phone(String mem_phone) {
		this.mem_phone = mem_phone;
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

	public String getMfile_upload() {
		return mfile_upload;
	}

	public void setMfile_upload(String mfile_upload) {
		this.mfile_upload = mfile_upload;
	}

	public MemberAllDTO(int mem_idx, String mem_name, String mem_birth, String mem_id, String mem_pwd, String mem_email,
			String mem_zipcode, String mem_addr, String mem_detailaddr, String mem_gender, String mem_phone,
			Date mem_joindate, Date mem_change, String mem_joinway, int mem_out, Date mem_outdate, String mem_type,
			String mfile_upload) {
		super();
		this.mem_idx = mem_idx;
		this.mem_name = mem_name;
		this.mem_birth = mem_birth;
		this.mem_id = mem_id;
		this.mem_pwd = mem_pwd;
		this.mem_email = mem_email;
		this.mem_zipcode = mem_zipcode;
		this.mem_addr = mem_addr;
		this.mem_detailaddr = mem_detailaddr;
		this.mem_gender = mem_gender;
		this.mem_phone = mem_phone;
		this.mem_joindate = mem_joindate;
		this.mem_change = mem_change;
		this.mem_joinway = mem_joinway;
		this.mem_out = mem_out;
		this.mem_outdate = mem_outdate;
		this.mem_type = mem_type;
		this.mfile_upload = mfile_upload;
	}
	
	
	
	
}
