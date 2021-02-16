package zipcok.comm.model;

import java.sql.*;

public class CommunityDTO {
	
	private int com_idx;
	private String com_coach_id;
	private String com_name;
	private int com_mem_sum;
	private String com_status;
	private Date com_opendate;
	private String com_coach_name;
	
	public CommunityDTO() {
		super();
		// TODO Auto-generated constructor stub
	}

	public CommunityDTO(int com_idx, String com_coach_id, String com_name, int com_mem_sum, String com_status,
			Date com_opendate,String com_coach_name) {
		super();
		this.com_idx = com_idx;
		this.com_coach_id = com_coach_id;
		this.com_name = com_name;
		this.com_mem_sum = com_mem_sum;
		this.com_status = com_status;
		this.com_opendate = com_opendate;
		this.com_coach_name = com_coach_name;
	}

	public int getCom_idx() {
		return com_idx;
	}

	public void setCom_idx(int com_idx) {
		this.com_idx = com_idx;
	}

	public String getCom_coach_id() {
		return com_coach_id;
	}

	public void setCom_coach_id(String com_coach_id) {
		this.com_coach_id = com_coach_id;
	}

	public String getCom_name() {
		return com_name;
	}

	public void setCom_name(String com_name) {
		this.com_name = com_name;
	}

	public int getCom_mem_sum() {
		return com_mem_sum;
	}

	public void setCom_mem_sum(int com_mem_sum) {
		this.com_mem_sum = com_mem_sum;
	}

	public String getCom_status() {
		return com_status;
	}

	public void setCom_status(String com_status) {
		this.com_status = com_status;
	}

	public Date getCom_opendate() {
		return com_opendate;
	}

	public void setCom_opendate(Date com_opendate) {
		this.com_opendate = com_opendate;
	}

	public String getCom_coach_name() {
		return com_coach_name;
	}

	public void setCom_coach_name(String com_coach_name) {
		this.com_coach_name = com_coach_name;
	}
	
	
	
	
	

}
