package zipcok.admin.model;

public class AdminCoachTongGyeDTO {

	private String startDate;
	private String endDate;
	
	private int sumAllMatch; //총매칭수
	private int sumAllSell; //총매출액
	private int sumAllCancel; //총취소액
	private int sumResultSell; //총순수익
	private int sumAllIngCancell; //총취소요청중액
	
	
	public AdminCoachTongGyeDTO() {
		// TODO Auto-generated constructor stub
	}



	public AdminCoachTongGyeDTO(String startDate, String endDate, int sumAllMatch, int sumAllSell, int sumAllCancel,
			int sumResultSell, int sumAllIngCancell) {
		super();
		this.startDate = startDate;
		this.endDate = endDate;
		this.sumAllMatch = sumAllMatch;
		this.sumAllSell = sumAllSell;
		this.sumAllCancel = sumAllCancel;
		this.sumResultSell = sumResultSell;
		this.sumAllIngCancell = sumAllIngCancell;
	}



	public int getSumAllIngCancell() {
		return sumAllIngCancell;
	}



	public void setSumAllIngCancell(int sumAllIngCancell) {
		this.sumAllIngCancell = sumAllIngCancell;
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
