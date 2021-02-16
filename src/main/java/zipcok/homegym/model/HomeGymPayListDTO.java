package zipcok.homegym.model;

public class HomeGymPayListDTO {
	private int pd_idx;
	private String pd_payment_date;
	private String pd_target_id;
	private String hg_nickname;
	private String reser_date;
	private int pd_price;
	private String pd_status;
	private boolean reviewCheck;
	public HomeGymPayListDTO() {
		// TODO Auto-generated constructor stub
	}
	
	public int getPd_idx() {
		return pd_idx;
	}

	public void setPd_idx(int pd_idx) {
		this.pd_idx = pd_idx;
	}

	public String getPd_payment_date() {
		return pd_payment_date;
	}
	public void setPd_payment_date(String pd_payment_date) {
		this.pd_payment_date = pd_payment_date;
	}
	
	public String getPd_target_id() {
		return pd_target_id;
	}

	public void setPd_target_id(String pd_target_id) {
		this.pd_target_id = pd_target_id;
	}

	public String getHg_nickname() {
		return hg_nickname;
	}
	public void setHg_nickname(String hg_nickname) {
		this.hg_nickname = hg_nickname;
	}
	public String getReser_date() {
		return reser_date;
	}
	public void setReser_date(String reser_date) {
		this.reser_date = reser_date;
	}
	public int getPd_price() {
		return pd_price;
	}
	public void setPd_price(int pd_price) {
		this.pd_price = pd_price;
	}
	public String getPd_status() {
		return pd_status;
	}
	public void setPd_status(String pd_status) {
		this.pd_status = pd_status;
	}
	public boolean isReviewCheck() {
		return reviewCheck;
	}
	public void setReviewCheck(boolean reviewCheck) {
		this.reviewCheck = reviewCheck;
	}

	public HomeGymPayListDTO(int pd_idx, String pd_payment_date, String pd_target_id, String hg_nickname,
			String reser_date, int pd_price, String pd_status, boolean reviewCheck) {
		super();
		this.pd_idx = pd_idx;
		this.pd_payment_date = pd_payment_date;
		this.pd_target_id = pd_target_id;
		this.hg_nickname = hg_nickname;
		this.reser_date = reser_date;
		this.pd_price = pd_price;
		this.pd_status = pd_status;
		this.reviewCheck = reviewCheck;
	}


	
}
