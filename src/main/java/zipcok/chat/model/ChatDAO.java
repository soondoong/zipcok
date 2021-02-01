package zipcok.chat.model;

import java.util.List;

import zipcok.almom.domain.ChatRoomDTO;
import zipcok.almom.domain.MessageDTO;

public interface ChatDAO {

	public void createRoom(ChatRoomDTO dto)throws Exception;
	public ChatRoomDTO isRoom(ChatRoomDTO dto)throws Exception;
	public void insertMessage(MessageDTO dto)throws Exception;
	public String getPartner(ChatRoomDTO dto)throws Exception;
	public String getProfile(String str)throws Exception;
	public String getName(String str)throws Exception;
	public List<MessageDTO> getMessageList(String str)throws Exception;
	public List<ChatRoomDTO> getRoomList(String str)throws Exception;
	public List<ChatRoomDTO> getRoomList2(String str)throws Exception;
	public MessageDTO getRecentMessage(String str)throws Exception;
	//public String isGetMessageList(String str)throws Exception;
	
	public String getTutorId(String str)throws Exception;
	public List<ChatRoomDTO> getRoomListTutor(String str)throws Exception;
	public void updateReadTime(int req_idx , String user_id , String Coach_user_id)throws Exception;
	public void updateReadTimeTutor(int req_idx , String user_id , String  Coach_user_id)throws Exception;
	
	public int getUnReadCount(String  Coach_user_id, int req_idx, String user_id)throws Exception;
	public int getUnReadCountTutor(String Coach_user_id, int req_idx, String user_id)throws Exception;
	
	public int getAllCount(String str);
	
}