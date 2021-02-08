package zipcok.coach.model;

import java.sql.Date;

public class MainCoachDTO {
	
	private String mem_name;
	private String mfile_upload;
	private String coach_mem_id;
	private String coach_intro_sub;
	private String coach_intro_cont;
	private int coach_year;
	private String coach_floc;
	private String coach_sloc;
	private String coach_ex_type;
	private String coach_mat;
	private Date coach_joindate;
	private Date coach_change;
	private int cate_idx;
	private String cate_mem_id;
	private String cate_name;
	private double avg;
	private int starcnt;
	private int lknum;
	
public MainCoachDTO() {
	// TODO Auto-generated constructor stub
}

public String getMem_name() {
	return mem_name;
}

public void setMem_name(String mem_name) {
	this.mem_name = mem_name;
}

public String getMfile_upload() {
	return mfile_upload;
}

public void setMfile_upload(String mfile_upload) {
	this.mfile_upload = mfile_upload;
}

public String getCoach_mem_id() {
	return coach_mem_id;
}

public void setCoach_mem_id(String coach_mem_id) {
	this.coach_mem_id = coach_mem_id;
}

public String getCoach_intro_sub() {
	return coach_intro_sub;
}

public void setCoach_intro_sub(String coach_intro_sub) {
	this.coach_intro_sub = coach_intro_sub;
}

public String getCoach_intro_cont() {
	return coach_intro_cont;
}

public void setCoach_intro_cont(String coach_intro_cont) {
	this.coach_intro_cont = coach_intro_cont;
}

public int getCoach_year() {
	return coach_year;
}

public void setCoach_year(int coach_year) {
	this.coach_year = coach_year;
}

public String getCoach_floc() {
	return coach_floc;
}

public void setCoach_floc(String coach_floc) {
	this.coach_floc = coach_floc;
}

public String getCoach_sloc() {
	return coach_sloc;
}

public void setCoach_sloc(String coach_sloc) {
	this.coach_sloc = coach_sloc;
}

public String getCoach_ex_type() {
	return coach_ex_type;
}

public void setCoach_ex_type(String coach_ex_type) {
	this.coach_ex_type = coach_ex_type;
}

public String getCoach_mat() {
	return coach_mat;
}

public void setCoach_mat(String coach_mat) {
	this.coach_mat = coach_mat;
}

public Date getCoach_joindate() {
	return coach_joindate;
}

public void setCoach_joindate(Date coach_joindate) {
	this.coach_joindate = coach_joindate;
}

public Date getCoach_change() {
	return coach_change;
}

public void setCoach_change(Date coach_change) {
	this.coach_change = coach_change;
}

public int getCate_idx() {
	return cate_idx;
}

public void setCate_idx(int cate_idx) {
	this.cate_idx = cate_idx;
}

public String getCate_mem_id() {
	return cate_mem_id;
}

public void setCate_mem_id(String cate_mem_id) {
	this.cate_mem_id = cate_mem_id;
}

public String getCate_name() {
	return cate_name;
}

public void setCate_name(String cate_name) {
	this.cate_name = cate_name;
}

public double getAvg() {
	return avg;
}

public void setAvg(double avg) {
	this.avg = avg;
}

public int getStarcnt() {
	return starcnt;
}

public void setStarcnt(int starcnt) {
	this.starcnt = starcnt;
}

public int getLknum() {
	return lknum;
}

public void setLknum(int lknum) {
	this.lknum = lknum;
}

public MainCoachDTO(String mem_name, String mfile_upload, String coach_mem_id, String coach_intro_sub,
		String coach_intro_cont, int coach_year, String coach_floc, String coach_sloc, String coach_ex_type,
		String coach_mat, Date coach_joindate, Date coach_change, int cate_idx, String cate_mem_id, String cate_name,
		double avg, int starcnt, int lknum) {
	super();
	this.mem_name = mem_name;
	this.mfile_upload = mfile_upload;
	this.coach_mem_id = coach_mem_id;
	this.coach_intro_sub = coach_intro_sub;
	this.coach_intro_cont = coach_intro_cont;
	this.coach_year = coach_year;
	this.coach_floc = coach_floc;
	this.coach_sloc = coach_sloc;
	this.coach_ex_type = coach_ex_type;
	this.coach_mat = coach_mat;
	this.coach_joindate = coach_joindate;
	this.coach_change = coach_change;
	this.cate_idx = cate_idx;
	this.cate_mem_id = cate_mem_id;
	this.cate_name = cate_name;
	this.avg = avg;
	this.starcnt = starcnt;
	this.lknum = lknum;
}




	
}
