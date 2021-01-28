package zipcok.cs.model;

import java.sql.*;
public class CsDTO {

	private int bbs_idx;
	private String bbs_key;
	private String bbs_category;
	private String bbs_subject;
	private String bbs_content;
	private String bbs_mem_id;
	private int bbs_readnum;
	private Date bbs_writedate;
	private int bbs_ref;
	private int bbs_lev;
	private int bbs_sunbun;
	public CsDTO() {
		super();
	}
	public CsDTO(int bbs_idx, String bbs_key, String bbs_category, String bbs_subject, String bbs_content,
			String bbs_mem_id, int bbs_readnum, Date bbs_writedate, int bbs_ref, int bbs_lev, int bbs_sunbun) {
		super();
		this.bbs_idx = bbs_idx;
		this.bbs_key = bbs_key;
		this.bbs_category = bbs_category;
		this.bbs_subject = bbs_subject;
		this.bbs_content = bbs_content;
		this.bbs_mem_id = bbs_mem_id;
		this.bbs_readnum = bbs_readnum;
		this.bbs_writedate = bbs_writedate;
		this.bbs_ref = bbs_ref;
		this.bbs_lev = bbs_lev;
		this.bbs_sunbun = bbs_sunbun;
	}
	public int getBbs_idx() {
		return bbs_idx;
	}
	public void setBbs_idx(int bbs_idx) {
		this.bbs_idx = bbs_idx;
	}
	public String getBbs_key() {
		return bbs_key;
	}
	public void setBbs_key(String bbs_key) {
		this.bbs_key = bbs_key;
	}
	public String getBbs_category() {
		return bbs_category;
	}
	public void setBbs_category(String bbs_category) {
		this.bbs_category = bbs_category;
	}
	public String getBbs_subject() {
		return bbs_subject;
	}
	public void setBbs_subject(String bbs_subject) {
		this.bbs_subject = bbs_subject;
	}
	public String getBbs_content() {
		return bbs_content;
	}
	public void setBbs_content(String bbs_content) {
		this.bbs_content = bbs_content;
	}
	public String getBbs_mem_id() {
		return bbs_mem_id;
	}
	public void setBbs_mem_id(String bbs_mem_id) {
		this.bbs_mem_id = bbs_mem_id;
	}
	public int getBbs_readnum() {
		return bbs_readnum;
	}
	public void setBbs_readnum(int bbs_readnum) {
		this.bbs_readnum = bbs_readnum;
	}
	public Date getBbs_writedate() {
		return bbs_writedate;
	}
	public void setBbs_writedate(Date bbs_writedate) {
		this.bbs_writedate = bbs_writedate;
	}
	public int getBbs_ref() {
		return bbs_ref;
	}
	public void setBbs_ref(int bbs_ref) {
		this.bbs_ref = bbs_ref;
	}
	public int getBbs_lev() {
		return bbs_lev;
	}
	public void setBbs_lev(int bbs_lev) {
		this.bbs_lev = bbs_lev;
	}
	public int getBbs_sunbun() {
		return bbs_sunbun;
	}
	public void setBbs_sunbun(int bbs_sunbun) {
		this.bbs_sunbun = bbs_sunbun;
	}
	
	
}
