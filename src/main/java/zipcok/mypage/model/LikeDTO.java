package zipcok.mypage.model;

import java.sql.*;

public class LikeDTO {

	private int like_idx;
	private String like_key;
	private String like_mem_id;
	private String like_target_id;
	private Date like_date;

	
	public LikeDTO() {
		super();
	}

	public LikeDTO(int like_idx, String like_key, String like_mem_id, String like_target_id, Date like_date) {
		super();
		this.like_idx = like_idx;
		this.like_key = like_key;
		this.like_mem_id = like_mem_id;
		this.like_target_id = like_target_id;
		this.like_date = like_date;
	}

	public int getLike_idx() {
		return like_idx;
	}

	public void setLike_idx(int like_idx) {
		this.like_idx = like_idx;
	}

	public String getLike_key() {
		return like_key;
	}

	public void setLike_key(String like_key) {
		this.like_key = like_key;
	}

	public String getLike_mem_id() {
		return like_mem_id;
	}

	public void setLike_mem_id(String like_mem_id) {
		this.like_mem_id = like_mem_id;
	}

	public String getLike_target_id() {
		return like_target_id;
	}

	public void setLike_target_id(String like_target_id) {
		this.like_target_id = like_target_id;
	}

	public Date getLike_date() {
		return like_date;
	}

	public void setLike_date(Date like_date) {
		this.like_date = like_date;
	}
	
	
	
}
