package zipcok.admin.model;

public class GraphDTO {
	
	private String y;
	private int sumAllMatch; //총매칭수
	private int sumAllSell; //총매출액
	private int sumResultSell; //총순수익
	
	public GraphDTO() {
		// TODO Auto-generated constructor stub
	}

	public String gety() {
		return y;
	}

	public void sety(String y) {
		this.y = y;
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

	public int getSumResultSell() {
		return sumResultSell;
	}

	public void setSumResultSell(int sumResultSell) {
		this.sumResultSell = sumResultSell;
	}

	public GraphDTO(String y, int sumAllMatch, int sumAllSell, int sumResultSell) {
		super();
		this.y = y;
		this.sumAllMatch = sumAllMatch;
		this.sumAllSell = sumAllSell;
		this.sumResultSell = sumResultSell;
	}
	
	
	
}
