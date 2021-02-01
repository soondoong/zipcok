package zipcok.almom.persistence;
import java.util.List;

import org.springframework.stereotype.Service;

import zipcok.almom.domain.ChatRoomVO;
import zipcok.almom.domain.MessageVO;

public interface ChatDAO {

	public void createRoom(ChatRoomVO vo)throws Exception;
	public ChatRoomVO isRoom(ChatRoomVO vo)throws Exception;
	public void insertMessage(MessageVO vo)throws Exception;
	public String getPartner(ChatRoomVO vo)throws Exception;
	public String getProfile(String str)throws Exception;
	public String getName(String str)throws Exception;
	public List<MessageVO> getMessageList(String str)throws Exception;
	public List<ChatRoomVO> getRoomList(String str)throws Exception;
	public List<ChatRoomVO> getRoomList2(String str)throws Exception;
	public MessageVO getRecentMessage(String str)throws Exception;
	//public String isGetMessageList(String str)throws Exception;
	
	public String getTutorId(String str)throws Exception;
	public List<ChatRoomVO> getRoomListTutor(String str)throws Exception;
	public void updateReadTime(int req_idx , String user_id , String Coach_user_id)throws Exception;
	public void updateReadTimeTutor(int req_idx , String user_id , String  Coach_user_id)throws Exception;
	
	public int getUnReadCount(String  Coach_user_id, int req_idx, String user_id)throws Exception;
	public int getUnReadCountTutor(String Coach_user_id, int req_idx, String user_id)throws Exception;
	
	public int getAllCount(String str);
	
}