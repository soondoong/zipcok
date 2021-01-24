package zipcok.coach.model;

import java.util.Date;

public class CoachDTO {

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
	
	public CoachDTO() {
		// TODO Auto-generated constructor stub
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

	public CoachDTO(String coach_mem_id, String coach_intro_sub, String coach_intro_cont, int coach_year,
			String coach_floc, String coach_sloc, String coach_ex_type, String coach_mat, Date coach_joindate,
			Date coach_change) {
		super();
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
	}
	
	
}
