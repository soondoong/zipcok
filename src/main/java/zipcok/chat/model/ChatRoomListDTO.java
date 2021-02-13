package zipcok.chat.model;

import java.sql.Date;

public class ChatRoomListDTO {

	//채팅방
	private int croom_idx;  
	private String croom_userid;
	private String croom_coachid;
	private int croom_req_idx; //상담요청서 
	private Date croom_opendate;
    
	private String mfile_upload; //현재유저플필사진 완전 현재사진임
	private String mem_name; //상대이름
   

	public ChatRoomListDTO() {
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


	public String getMfile_upload() {
		return mfile_upload;
	}


	public void setMfile_upload(String mfile_upload) {
		this.mfile_upload = mfile_upload;
	}


	public String getMem_name() {
		return mem_name;
	}


	public void setMem_name(String mem_name) {
		this.mem_name = mem_name;
	}


	public ChatRoomListDTO(int croom_idx, String croom_userid, String croom_coachid, int croom_req_idx,
			Date croom_opendate, String mfile_upload, String mem_name) {
		super();
		this.croom_idx = croom_idx;
		this.croom_userid = croom_userid;
		this.croom_coachid = croom_coachid;
		this.croom_req_idx = croom_req_idx;
		this.croom_opendate = croom_opendate;
		this.mfile_upload = mfile_upload;
		this.mem_name = mem_name;
	}

	

	
	
}
