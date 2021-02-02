package zipcok.chat.model;
import java.util.Date;

import com.google.gson.Gson;
public class MessageDTO {
	
	private int msg_idx; //메세지idx
	private int msg_croom_idx; //채팅방idx
	private int msg_req_idx; //요청서idx
	private String msg_sender; //세션기준되는아이디
	private String msg_receiver; //세션기준되는아이디
	private String msg_content; //메세지내용
	private Date msg_sendtime; //메세지보낸시간
	private Date msg_readtime; //메세지읽은시간
	private String msg_userid; //고객아이디;
	private String msg_coachid; //코치아이디;
	private String user_mfile_upload;//보내는이프로필사진이름
	private String receiver_mfile_upload;//받는이프로필사진이름
	private String user_name; // 보내는이 이름;
	private String receiver_user_name; //받는이 이름;
	private int unReadCount; //default=0;load되면 1이되게
	
	public MessageDTO() {
		// TODO Auto-generated constructor stub
	}
	
	
	
	public int getMsg_idx() {
		return msg_idx;
	}
	public void setMsg_idx(int msg_idx) {
		this.msg_idx = msg_idx;
	}
	public int getMsg_croom_idx() {
		return msg_croom_idx;
	}
	public void setMsg_croom_idx(int msg_croom_idx) {
		this.msg_croom_idx = msg_croom_idx;
	}
	public int getMsg_req_idx() {
		return msg_req_idx;
	}
	public void setMsg_req_idx(int msg_req_idx) {
		this.msg_req_idx = msg_req_idx;
	}
	public String getMsg_sender() {
		return msg_sender;
	}
	public void setMsg_sender(String msg_sender) {
		this.msg_sender = msg_sender;
	}
	public String getMsg_receiver() {
		return msg_receiver;
	}
	public void setMsg_receiver(String msg_receiver) {
		this.msg_receiver = msg_receiver;
	}
	public String getMsg_content() {
		return msg_content;
	}
	public void setMsg_content(String msg_content) {
		this.msg_content = msg_content;
	}
	public Date getMsg_sendtime() {
		return msg_sendtime;
	}
	public void setMsg_sendtime(Date msg_sendtime) {
		this.msg_sendtime = msg_sendtime;
	}
	public Date getMsg_readtime() {
		return msg_readtime;
	}
	public void setMsg_readtime(Date msg_readtime) {
		this.msg_readtime = msg_readtime;
	}
	public String getMsg_userid() {
		return msg_userid;
	}
	public void setMsg_userid(String msg_userid) {
		this.msg_userid = msg_userid;
	}
	public String getMsg_coachid() {
		return msg_coachid;
	}
	public void setMsg_coachid(String msg_coachid) {
		this.msg_coachid = msg_coachid;
	}
	public String getUser_mfile_upload() {
		return user_mfile_upload;
	}
	public void setUser_mfile_upload(String user_mfile_upload) {
		this.user_mfile_upload = user_mfile_upload;
	}
	public String getReceiver_mfile_upload() {
		return receiver_mfile_upload;
	}
	public void setReceiver_mfile_upload(String receiver_mfile_upload) {
		this.receiver_mfile_upload = receiver_mfile_upload;
	}
	public String getUser_name() {
		return user_name;
	}
	public void setUser_name(String user_name) {
		this.user_name = user_name;
	}
	public String getReceiver_user_name() {
		return receiver_user_name;
	}
	public void setReceiver_user_name(String receiver_user_name) {
		this.receiver_user_name = receiver_user_name;
	}
	public int getUnReadCount() {
		return unReadCount;
	}
	public void setUnReadCount(int unReadCount) {
		this.unReadCount = unReadCount;
	}
	public MessageDTO(int msg_idx, int msg_croom_idx, int msg_req_idx, String msg_sender, String msg_receiver,
			String msg_content, Date msg_sendtime, Date msg_readtime, String msg_userid, String msg_coachid,
			String user_mfile_upload, String receiver_mfile_upload, String user_name, String receiver_user_name,
			int unReadCount) {
		super();
		this.msg_idx = msg_idx;
		this.msg_croom_idx = msg_croom_idx;
		this.msg_req_idx = msg_req_idx;
		this.msg_sender = msg_sender;
		this.msg_receiver = msg_receiver;
		this.msg_content = msg_content;
		this.msg_sendtime = msg_sendtime;
		this.msg_readtime = msg_readtime;
		this.msg_userid = msg_userid;
		this.msg_coachid = msg_coachid;
		this.user_mfile_upload = user_mfile_upload;
		this.receiver_mfile_upload = receiver_mfile_upload;
		this.user_name = user_name;
		this.receiver_user_name = receiver_user_name;
		this.unReadCount = unReadCount;
	}
	@Override
	public String toString() {
		return "MessageDTO [msg_idx=" + msg_idx + ", msg_croom_idx=" + msg_croom_idx + ", msg_req_idx=" + msg_req_idx
				+ ", msg_sender=" + msg_sender + ", msg_receiver=" + msg_receiver + ", msg_content=" + msg_content
				+ ", msg_sendtime=" + msg_sendtime + ", msg_readtime=" + msg_readtime + ", msg_userid=" + msg_userid
				+ ", msg_coachid=" + msg_coachid + ", user_mfile_upload=" + user_mfile_upload
				+ ", receiver_mfile_upload=" + receiver_mfile_upload + ", user_name=" + user_name
				+ ", receiver_user_name=" + receiver_user_name + ", unReadCount=" + unReadCount + "]";
	}
	
	public static MessageDTO convertMessage(String source) {
		MessageDTO message = new MessageDTO();
		Gson gson = new Gson();
		message = gson.fromJson(source,  MessageDTO.class);
		return message;
	}
	
	
	
}
