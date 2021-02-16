package zipcok.admin.model;

public class AdminCoachTongGyeDTO {

	private String startDate;
	private String endDate;
	
	private int sumAllMatch;
	private int sumAllSell;
	private int sumAllCancel;
	private int sumResultSell;
	
	public AdminCoachTongGyeDTO() {
		// TODO Auto-generated constructor stub
	}

	public AdminCoachTongGyeDTO(String startDate, String endDate, int sumAllMatch, int sumAllSell, int sumAllCancel,
			int sumResultSell) {
		super();
		this.startDate = startDate;
		this.endDate = endDate;
		this.sumAllMatch = sumAllMatch;
		this.sumAllSell = sumAllSell;
		this.sumAllCancel = sumAllCancel;
		this.sumResultSell = sumResultSell;
	}

	public String getStartDate() {
		return startDate;
	}

	public void setStartDate(String startDate) {
		this.startDate = startDate;
	}

	public String getEndDate() {
		return endDate;
	}

	public void setEndDate(String endDate) {
		this.endDate = endDate;
	}

	public int getSumAllMatch() {
		return sumAllMatch;
	}

	public void setSumAllMatch(int sumAllMatch) {
		this.sumAllMatch = sumAllMatch;
	}

	public int getSumAllSell() {
		return sumAllSell;
	}

	public void setSumAllSell(int sumAllSell) {
		this.sumAllSell = sumAllSell;
	}

	public int getSumAllCancel() {
		return sumAllCancel;
	}

	public void setSumAllCancel(int sumAllCancel) {
		this.sumAllCancel = sumAllCancel;
	}

	public int getSumResultSell() {
		return sumResultSell;
	}

	public void setSumResultSell(int sumResultSell) {
		this.sumResultSell = sumResultSell;
	}
	
		
}
