package zipcok.coach.model;

import java.sql.Date;

public class ReviewDTO {

	private int rev_idx;
	private String rev_key;
	private String rev_mem_id;
	private String rev_target_id;
	private int rev_star;
	private String rev_sub;
	private String rev_cont;
	private Date rev_writedate;
	private Date rev_rewritedate;    
	private String rev_pd_idx;    
	
	
	public ReviewDTO() {
		// TODO Auto-generated constructor stub
	}

	public int getRev_idx() {
		return rev_idx;
	}

	public void setRev_idx(int rev_idx) {
		this.rev_idx = rev_idx;
	}

	public String getRev_key() {
		return rev_key;
	}

	public void setRev_key(String rev_key) {
		this.rev_key = rev_key;
	}

	public String getRev_mem_id() {
		return rev_mem_id;
	}

	public void setRev_mem_id(String rev_mem_id) {
		this.rev_mem_id = rev_mem_id;
	}

	public String getRev_target_id() {
		return rev_target_id;
	}

	public void setRev_target_id(String rev_target_id) {
		this.rev_target_id = rev_target_id;
	}

	public int getRev_star() {
		return rev_star;
	}

	public void setRev_star(int rev_star) {
		this.rev_star = rev_star;
	}

	public String getRev_sub() {
		return rev_sub;
	}

	public void setRev_sub(String rev_sub) {
		this.rev_sub = rev_sub;
	}

	public String getRev_cont() {
		return rev_cont;
	}

	public void setRev_cont(String rev_cont) {
		this.rev_cont = rev_cont;
	}

	public Date getRev_writedate() {
		return rev_writedate;
	}

	public void setRev_writedate(Date rev_writedate) {
		this.rev_writedate = rev_writedate;
	}

	public Date getRev_rewritedate() {
		return rev_rewritedate;
	}

	public void setRev_rewritedate(Date rev_rewritedate) {
		this.rev_rewritedate = rev_rewritedate;
	}

	public String getRev_pd_idx() {
		return rev_pd_idx;
	}

	public void setRev_pd_idx(String rev_pd_idx) {
		this.rev_pd_idx = rev_pd_idx;
	}

	public ReviewDTO(int rev_idx, String rev_key, String rev_mem_id, String rev_target_id, int rev_star, String rev_sub,
			String rev_cont, Date rev_writedate, Date rev_rewritedate, String rev_pd_idx) {
		super();
		this.rev_idx = rev_idx;
		this.rev_key = rev_key;
		this.rev_mem_id = rev_mem_id;
		this.rev_target_id = rev_target_id;
		this.rev_star = rev_star;
		this.rev_sub = rev_sub;
		this.rev_cont = rev_cont;
		this.rev_writedate = rev_writedate;
		this.rev_rewritedate = rev_rewritedate;
		this.rev_pd_idx = rev_pd_idx;
	}


	
	
	
}
