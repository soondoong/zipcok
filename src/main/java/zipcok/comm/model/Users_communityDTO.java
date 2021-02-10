package zipcok.comm.model;

import java.sql.*;

public class Users_communityDTO {
	
	private int uc_idx;
	private String uc_mem_id;
	private int uc_comm_idx;
	private String uc_name;
	private int uc_day_achiev;
	private String uc_status;
	
	public Users_communityDTO() {
		super();
		// TODO Auto-generated constructor stub
	}

	public Users_communityDTO(int uc_idx, String uc_mem_id, int uc_comm_idx, String uc_name, int uc_day_achiev,
			String uc_status) {
		super();
		this.uc_idx = uc_idx;
		this.uc_mem_id = uc_mem_id;
		this.uc_comm_idx = uc_comm_idx;
		this.uc_name = uc_name;
		this.uc_day_achiev = uc_day_achiev;
		this.uc_status = uc_status;
	}

	public int getUc_idx() {
		return uc_idx;
	}

	public void setUc_idx(int uc_idx) {
		this.uc_idx = uc_idx;
	}

	public String getUc_mem_id() {
		return uc_mem_id;
	}

	public void setUc_mem_id(String uc_mem_id) {
		this.uc_mem_id = uc_mem_id;
	}

	public int getUc_comm_idx() {
		return uc_comm_idx;
	}

	public void setUc_comm_idx(int uc_comm_idx) {
		this.uc_comm_idx = uc_comm_idx;
	}

	public String getUc_name() {
		return uc_name;
	}

	public void setUc_name(String uc_name) {
		this.uc_name = uc_name;
	}

	public int getUc_day_achiev() {
		return uc_day_achiev;
	}

	public void setUc_day_achiev(int uc_day_achiev) {
		this.uc_day_achiev = uc_day_achiev;
	}

	public String getUc_status() {
		return uc_status;
	}

	public void setUc_status(String uc_status) {
		this.uc_status = uc_status;
	}
	
	

}
