package zipcok.chat.model;

import java.util.List;

import zipcok.almom.domain.ChatRoomDTO;
import zipcok.almom.domain.MessageDTO;
import zipcok.coach.model.RequestFormDTO;

public interface ChatDAO {

	public int createRoom(ChatRoomDTO dto); //채팅방생성데이터등록
	public List<ChatRoomDTO> allChatRoomList(String id,String sqlkey);   //채팅방목록불러오기
	public RequestFormDTO findRequestForm(int req_idx); //요청서1개정보가져오기 
	public ChatRoomDTO isRoom(ChatRoomDTO dto); //이미속해있는채팅방잇나보기
	public int roomDelete(int croom_idx); //채팅방나가기
	
	
	public void insertMessage(MessageDTO dto);
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