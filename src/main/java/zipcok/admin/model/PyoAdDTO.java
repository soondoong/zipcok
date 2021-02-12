package zipcok.admin.model;

public class PyoAdDTO {

	private String joindate;
	private String change;
	public PyoAdDTO() {
		super();
	}
	public PyoAdDTO(String joindate, String change) {
		super();
		this.joindate = joindate;
		this.change = change;
	}
	public String getJoindate() {
		return joindate;
	}
	public void setJoindate(String joindate) {
		this.joindate = joindate;
	}
	public String getChange() {
		return change;
	}
	public void setChange(String change) {
		this.change = change;
	}
	
	
	
}
