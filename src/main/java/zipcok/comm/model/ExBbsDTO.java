package zipcok.comm.model;

import java.sql.*;

public class ExBbsDTO {
	
	private int ex_idx;
	private String ex_comm_idx;
	private String ex_id;
	private String ex_subject;
	private String ex_content;
	private String ex_cal;
	private Date ex_writedate;
	private Date ex_moddate;
	private String ex_head;
	private int ex_readnum;
	private String ex_name;
	private int ex_recnt;
	
	public ExBbsDTO() {
		super();
		// TODO Auto-generated constructor stub
	}

	public ExBbsDTO(int ex_idx, String ex_comm_idx, String ex_id, String ex_subject, String ex_content, String ex_cal,
			Date ex_writedate, Date ex_moddate, String ex_head, int ex_readnum, String ex_name, int ex_recnt) {
		super();
		this.ex_idx = ex_idx;
		this.ex_comm_idx = ex_comm_idx;
		this.ex_id = ex_id;
		this.ex_subject = ex_subject;
		this.ex_content = ex_content;
		this.ex_cal = ex_cal;
		this.ex_writedate = ex_writedate;
		this.ex_moddate = ex_moddate;
		this.ex_head = ex_head;
		this.ex_readnum = ex_readnum;
		this.ex_name = ex_name;
		this.ex_recnt = ex_recnt;
	}

	public int getEx_idx() {
		return ex_idx;
	}

	public void setEx_idx(int ex_idx) {
		this.ex_idx = ex_idx;
	}

	public String getEx_comm_idx() {
		return ex_comm_idx;
	}

	public void setEx_comm_idx(String ex_comm_idx) {
		this.ex_comm_idx = ex_comm_idx;
	}

	public String getEx_id() {
		return ex_id;
	}

	public void setEx_id(String ex_id) {
		this.ex_id = ex_id;
	}

	public String getEx_subject() {
		return ex_subject;
	}

	public void setEx_subject(String ex_subject) {
		this.ex_subject = ex_subject;
	}

	public String getEx_content() {
		return ex_content;
	}

	public void setEx_content(String ex_content) {
		this.ex_content = ex_content;
	}

	public String getEx_cal() {
		return ex_cal;
	}

	public void setEx_cal(String ex_cal) {
		this.ex_cal = ex_cal;
	}

	public Date getEx_writedate() {
		return ex_writedate;
	}

	public void setEx_writedate(Date ex_writedate) {
		this.ex_writedate = ex_writedate;
	}

	public Date getEx_moddate() {
		return ex_moddate;
	}

	public void setEx_moddate(Date ex_moddate) {
		this.ex_moddate = ex_moddate;
	}

	public String getEx_head() {
		return ex_head;
	}

	public void setEx_head(String ex_head) {
		this.ex_head = ex_head;
	}

	public int getEx_readnum() {
		return ex_readnum;
	}

	public void setEx_readnum(int ex_readnum) {
		this.ex_readnum = ex_readnum;
	}

	public String getEx_name() {
		return ex_name;
	}

	public void setEx_name(String ex_name) {
		this.ex_name = ex_name;
	}

	public int getEx_recnt() {
		return ex_recnt;
	}

	public void setEx_recnt(int ex_recnt) {
		this.ex_recnt = ex_recnt;
	}
	
	
	
	

}
