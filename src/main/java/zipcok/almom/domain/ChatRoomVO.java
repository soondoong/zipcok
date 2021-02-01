package zipcok.almom.domain;

import java.sql.Date;

public class ChatRoomVO {

	
	/*
	 * private String chatroom_id;
	 *  private String USER_user_id; 
	 *  private String TUTOR_USER_user_id; 
	 * private int CLASS_class_id;
	 */
	
	private int croom_idx;  // chatroom_id
	private String croom_name; //
	private String croom_userid; //USER_user_id
	private String croom_coachid;//TUTOR_USER_user_id
	private int croom_req_idx; //상담요청서 CLASS_class_id
	private Date croom_opendate;//
	
	public ChatRoomVO() {
		// TODO Auto-generated constructor stub
	}

	public int getCroom_idx() {
		return croom_idx;
	}

	public void setCroom_idx(int croom_idx) {
		this.croom_idx = croom_idx;
	}

	public String getCroom_name() {
		return croom_name;
	}

	public void setCroom_name(String croom_name) {
		this.croom_name = croom_name;
	}

	public String getCroom_userid() {
		return croom_userid;
	}

	public void setCroom_userid(String croom_userid) {
		this.croom_userid = croom_userid;
	}

	public String getCroom_coachid() {
		return croom_coachid;
	}

	public void setCroom_coachid(String croom_coachid) {
		this.croom_coachid = croom_coachid;
	}

	public int getCroom_req_idx() {
		return croom_req_idx;
	}

	public void setCroom_req_idx(int croom_req_idx) {
		this.croom_req_idx = croom_req_idx;
	}

	public Date getCroom_opendate() {
		return croom_opendate;
	}

	public void setCroom_opendate(Date croom_opendate) {
		this.croom_opendate = croom_opendate;
	}

	@Override
	public String toString() {
		return "ChatRoomVO [croom_idx=" + croom_idx + ", croom_name=" + croom_name + ", croom_userid=" + croom_userid
				+ ", croom_coachid=" + croom_coachid + ", croom_req_idx=" + croom_req_idx + ", croom_opendate="
				+ croom_opendate + "]";
	}

	
	
	
	
	/*
	 * @Override public String toString() { return "ChatRoomVO [chatroom_id=" +
	 * chatroom_id + ", USER_user_id=" + USER_user_id + ", TUTOR_USER_user_id=" +
	 * TUTOR_USER_user_id + ", CLASS_class_id=" + CLASS_class_id + "]"; }
	 * 
	 */
	

	
	
}