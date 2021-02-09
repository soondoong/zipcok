package zipcok.comm.model;

import java.sql.*;

public class FoodBbsDTO {
	
	private int food_idx;
	private int food_comm_idx;
	private String food_id;
	private String food_subject;
	private Date food_writedate;
	private Date food_moddate;
	private String food_head;
	private int food_readnum;
	private int food_goal;
	private int food_recnt;
	
	public FoodBbsDTO() {
		super();
		// TODO Auto-generated constructor stub
	}

	public FoodBbsDTO(int food_idx, int food_comm_idx, String food_id, String food_subject, Date food_writedate,
			Date food_moddate, String food_head, int food_readnum, int food_goal, int food_recnt) {
		super();
		this.food_idx = food_idx;
		this.food_comm_idx = food_comm_idx;
		this.food_id = food_id;
		this.food_subject = food_subject;
		this.food_writedate = food_writedate;
		this.food_moddate = food_moddate;
		this.food_head = food_head;
		this.food_readnum = food_readnum;
		this.food_goal = food_goal;
		this.food_recnt = food_recnt;
	}

	public int getFood_idx() {
		return food_idx;
	}

	public void setFood_idx(int food_idx) {
		this.food_idx = food_idx;
	}

	public int getFood_comm_idx() {
		return food_comm_idx;
	}

	public void setFood_comm_idx(int food_comm_idx) {
		this.food_comm_idx = food_comm_idx;
	}

	public String getFood_id() {
		return food_id;
	}

	public void setFood_id(String food_id) {
		this.food_id = food_id;
	}

	public String getFood_subject() {
		return food_subject;
	}

	public void setFood_subject(String food_subject) {
		this.food_subject = food_subject;
	}

	public Date getFood_writedate() {
		return food_writedate;
	}

	public void setFood_writedate(Date food_writedate) {
		this.food_writedate = food_writedate;
	}

	public Date getFood_moddate() {
		return food_moddate;
	}

	public void setFood_moddate(Date food_moddate) {
		this.food_moddate = food_moddate;
	}

	public String getFood_head() {
		return food_head;
	}

	public void setFood_head(String food_head) {
		this.food_head = food_head;
	}

	public int getFood_readnum() {
		return food_readnum;
	}

	public void setFood_readnum(int food_readnum) {
		this.food_readnum = food_readnum;
	}

	public int getFood_goal() {
		return food_goal;
	}

	public void setFood_goal(int food_goal) {
		this.food_goal = food_goal;
	}

	public int getFood_recnt() {
		return food_recnt;
	}

	public void setFood_recnt(int food_recnt) {
		this.food_recnt = food_recnt;
	}
	
	

}
