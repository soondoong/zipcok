package zipcok.almom.domain;

import java.sql.Date;

public class ChatRoomDTO {

	
	
	private int croom_idx;  // chatroom_id
	private String croom_userid; //USER_user_id
	private String croom_coachid;//TUTOR_USER_user_id
	private int croom_req_idx; //상담요청서 CLASS_class_id
	private Date croom_opendate;//
	
	public ChatRoomDTO() {
		// TODO Auto-generated constructor stub
	}
	
	
	public int getCroom_idx() {
		return croom_idx;
	}
	public void setCroom_idx(int croom_idx) {
		this.croom_idx = croom_idx;
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
	public ChatRoomDTO(int croom_idx, String croom_userid, String croom_coachid, int croom_req_idx,
			Date croom_opendate) {
		super();
		this.croom_idx = croom_idx;
		this.croom_userid = croom_userid;
		this.croom_coachid = croom_coachid;
		this.croom_req_idx = croom_req_idx;
		this.croom_opendate = croom_opendate;
	}
	@Override
	public String toString() {
		return "ChatRoomDTO [croom_idx=" + croom_idx + ", croom_userid=" + croom_userid + ", croom_coachid="
				+ croom_coachid + ", croom_req_idx=" + croom_req_idx + ", croom_opendate=" + croom_opendate + "]";
	}
	
	
   
	
}