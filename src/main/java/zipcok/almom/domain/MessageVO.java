package zipcok.almom.domain;

import java.util.Date;

import com.google.gson.Gson;

public class MessageVO {
	/*
	private String message_id;
	private String message_sender;
	private String message_receiver;
	private String message_content;
	private Date message_sendTime;
	private Date message_readTime;
	private String CHATROOM_chatroom_id;
	private String USER_user_id;
	private String TUTOR_USER_user_id;
	private int CLASS_class_id;
	private String user_profileImagePath;
	private String receiver_user_profileImagePath;
	private String user_name;
	private String receiver_user_name;
	private String class_name;
	private int class_id;
	private String TUTOR_tutor_id;
	private String tutor_name;
	private String tuti_id;
	private int unReadCount;*/
	
	
	private int msg_idx; //message_id
	private int msg_croom_idx; //CHATROOM_chatroom_id
	private int msg_req_idx; //CLASS_class_id
	private String msg_sender; //message_sender
	private String msg_reciever; //message_receiver
	private String msg_content; //message_content
	private Date msg_sendtime; //message_sendTime
	private Date msg_readtime; //message_readTime
	private String msg_userid; //USER_user_id;
	private String msg_coachid; //TUTOR_USER_user_id;
	private String user_mfile_upload;//user_profileImagePath
	private String receiver_mfile_upload;//receiver_user_profileImagePath
	private String user_name; // user_name;
	private String receiver_user_name; //receiver_user_name;
	private int unReadCount;
	
	public MessageVO() {
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

	public String getMsg_reciever() {
		return msg_reciever;
	}

	public void setMsg_reciever(String msg_reciever) {
		this.msg_reciever = msg_reciever;
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

	@Override
	public String toString() {
		return "MessageVO [msg_idx=" + msg_idx + ", msg_croom_idx=" + msg_croom_idx + ", msg_req_idx=" + msg_req_idx
				+ ", msg_sender=" + msg_sender + ", msg_reciever=" + msg_reciever + ", msg_content=" + msg_content
				+ ", msg_sendtime=" + msg_sendtime + ", msg_readtime=" + msg_readtime + ", msg_userid=" + msg_userid
				+ ", msg_coachid=" + msg_coachid + ", user_mfile_upload=" + user_mfile_upload
				+ ", receiver_mfile_upload=" + receiver_mfile_upload + ", user_name=" + user_name
				+ ", receiver_user_name=" + receiver_user_name + ", unReadCount=" + unReadCount + "]";
	}
	
	
	public static MessageVO convertMessage(String source) {
		MessageVO message = new MessageVO();
		Gson gson = new Gson();
		message = gson.fromJson(source,  MessageVO.class);
		return message;
	}
	
	
}

