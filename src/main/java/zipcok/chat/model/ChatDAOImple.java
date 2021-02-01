package zipcok.chat.model;


import java.util.Arrays;
import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.stereotype.Service;

import zipcok.almom.domain.ChatRoomDTO;
import zipcok.almom.domain.MessageDTO;
import zipcok.coach.model.RequestFormDTO;
@Service
@Repository
public class ChatDAOImple implements ChatDAO{
	
	@Autowired
	private SqlSessionTemplate sqlMap;
	
	/*채팅방생성*/
	@Override
	public int createRoom(ChatRoomDTO dto) {		
		System.out.println("---create Room Imple----");
		int count = sqlMap.insert("createRoom" , dto);
		System.out.println("시팔");
		return count;
	}


	/*이미만들어진채팅방이 있는지*/
	@Override
	public ChatRoomDTO isRoom(ChatRoomDTO dto) {
		// TODO Auto-generated method stub
		
		ChatRoomDTO roomdto = null;
		roomdto = sqlMap.selectOne("isRoom", dto);
		System.out.println("isRoom");
		System.out.println(roomdto);
		
		return roomdto;
	}
	
	/*채팅방목록 뽑아오기*/
	@Override
	public List<ChatRoomDTO> allChatRoomList(String id,String sqlkey) {
		 List<ChatRoomDTO> list= sqlMap.selectList(sqlkey,id);
		 			
		return list;
	}
	
	/*요청서1개정보가져오기*/
	@Override
	public RequestFormDTO findRequestForm(int req_idx) {
		
		RequestFormDTO dto= sqlMap.selectOne("findRequestFormInfo",req_idx);
		return dto;
	}
	
	/*채팅방 나가기*/
	@Override
	public int roomDelete(int croom_idx) {
		int count = sqlMap.delete("roomDelete",croom_idx);
		return count;
	}



	@Override
	public void insertMessage(MessageDTO dto) {
		// TODO Auto-generated method stub
		
		sqlMap.insert("insertMessage" , dto);
	}



	@Override
	public String getPartner(ChatRoomDTO dto) throws Exception {
		// TODO Auto-generated method stub
		
		List<MessageDTO> mdto= sqlMap.selectList("getPartner", dto);
		
		return mdto.get(0).getMsg_userid();
	}



	@Override
	public String getProfile(String str) throws Exception {
		// TODO Auto-generated method stub
		return sqlMap.selectOne("getProfile" , str);
	}



	@Override
	public String getName(String str) throws Exception {
		// TODO Auto-generated method stub
		return sqlMap.selectOne("getName" , str);
	}



	@Override
	public List<MessageDTO> getMessageList(String str) throws Exception {
		// TODO Auto-generated method stub

			return sqlMap.selectList("getMessageList" , str);
		
		
	}



	@Override
	public List<ChatRoomDTO> getRoomList(String str) throws Exception {
		// TODO Auto-generated method stub
		return sqlMap.selectList("getRoomList",str);
	}



	@Override
	public List<ChatRoomDTO> getRoomList2(String str) throws Exception {
		// TODO Auto-generated method stub
		return sqlMap.selectList("getRoomList2" , str);
	}



	@Override
	public MessageDTO getRecentMessage(String str) throws Exception {
		// TODO Auto-generated method stub
		return sqlMap.selectOne("getRecentMessage" , str);
	}



	@Override
	public String getTutorId(String str) throws Exception {
		// TODO Auto-generated method stub
		return sqlMap.selectOne("getTutorId" , str) ;
	}



	@Override
	public List<ChatRoomDTO> getRoomListTutor(String str) throws Exception {
		// TODO Auto-generated method stub
		return sqlMap.selectList("getRoomListTutor" , str);
	}



	@Override
	public void updateReadTime(int req_idx, String user_id, String Coach_user_id) throws Exception {
		// TODO Auto-generated method stub
		
		HashMap<String, Object> map = new HashMap<String, Object> ();
		
		map.put("Coach_user_id", Coach_user_id);
		map.put("user_id", user_id);
		map.put("req_idx", req_idx);
		sqlMap.update("updateReadTime" , map);
	}



	@Override
	public int getUnReadCount(String Coach_user_id, int req_idx, String user_id) throws Exception {
		// TODO Auto-generated method stub
		HashMap<String, Object> map = new HashMap<String, Object> ();
		
		map.put("Coach_user_id", Coach_user_id);
		map.put("user_id", user_id);
		map.put("req_idx", req_idx);
		
		
		return sqlMap.selectOne("getUnReadCount" , map);
	}



	@Override
	public int getAllCount(String str) {
		// TODO Auto-generated method stub
		HashMap<String, Object> map = new HashMap<String, Object> ();
		
		map.put("USER_user_id", str);
		map.put("TUTOR_USER_user_id", str);
		if(sqlMap.selectOne("getAllCount" ,map) ==null) {
			return 0;
		}else {
			
			return sqlMap.selectOne("getAllCount" ,map);
		}
		
	}



	@Override
	public void updateReadTimeTutor(int req_idx , String user_id , String Coach_user_id) throws Exception {
		// TODO Auto-generated method stub
		HashMap<String, Object> map = new HashMap<String, Object> ();
		
		map.put("Coach_user_id", Coach_user_id);
		map.put("user_id", user_id);
		map.put("req_idx", req_idx);
		sqlMap.update("updateReadTimeTutor" , map);
	}



	@Override
	public int getUnReadCountTutor(String Coach_user_id, int req_idx, String user_id) throws Exception {
		// TODO Auto-generated method stub
		HashMap<String, Object> map = new HashMap<String, Object> ();
		
		map.put("Coach_user_id", Coach_user_id);
		map.put("user_id", user_id);
		map.put("req_idx", req_idx);
		
		
		return sqlMap.selectOne("getUnReadCountTutor" , map);
	}




	
}
