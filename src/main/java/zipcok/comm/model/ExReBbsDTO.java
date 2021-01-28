package zipcok.comm.model;

import java.sql.*;

public class ExReBbsDTO {

	private int re_idx;
	private int re_bbs;
	private int re_comm_idx;
	private String re_id;
	private String re_content;
	private Date re_writedate;
	private int re_lev;
	private int re_sunbun;
	private int re_bbs_idx;
	private int re_group;
	
	public ExReBbsDTO() {
		super();
		// TODO Auto-generated constructor stub
	}

	public ExReBbsDTO(int re_idx, int re_bbs, int re_comm_idx, String re_id, String re_content, Date re_writedate,
			int re_lev, int re_sunbun, int re_bbs_idx, int re_group) {
		super();
		this.re_idx = re_idx;
		this.re_bbs = re_bbs;
		this.re_comm_idx = re_comm_idx;
		this.re_id = re_id;
		this.re_content = re_content;
		this.re_writedate = re_writedate;
		this.re_lev = re_lev;
		this.re_sunbun = re_sunbun;
		this.re_bbs_idx = re_bbs_idx;
		this.re_group = re_group;
	}

	public int getRe_idx() {
		return re_idx;
	}

	public void setRe_idx(int re_idx) {
		this.re_idx = re_idx;
	}

	public int getRe_bbs() {
		return re_bbs;
	}

	public void setRe_bbs(int re_bbs) {
		this.re_bbs = re_bbs;
	}

	public int getRe_comm_idx() {
		return re_comm_idx;
	}

	public void setRe_comm_idx(int re_comm_idx) {
		this.re_comm_idx = re_comm_idx;
	}

	public String getRe_id() {
		return re_id;
	}

	public void setRe_id(String re_id) {
		this.re_id = re_id;
	}

	public String getRe_content() {
		return re_content;
	}

	public void setRe_content(String re_content) {
		this.re_content = re_content;
	}

	public Date getRe_writedate() {
		return re_writedate;
	}

	public void setRe_writedate(Date re_writedate) {
		this.re_writedate = re_writedate;
	}

	public int getRe_lev() {
		return re_lev;
	}

	public void setRe_lev(int re_lev) {
		this.re_lev = re_lev;
	}

	public int getRe_sunbun() {
		return re_sunbun;
	}

	public void setRe_sunbun(int re_sunbun) {
		this.re_sunbun = re_sunbun;
	}

	public int getRe_bbs_idx() {
		return re_bbs_idx;
	}

	public void setRe_bbs_idx(int re_bbs_idx) {
		this.re_bbs_idx = re_bbs_idx;
	}

	public int getRe_group() {
		return re_group;
	}

	public void setRe_group(int re_group) {
		this.re_group = re_group;
	}
	
	
	
	
}
