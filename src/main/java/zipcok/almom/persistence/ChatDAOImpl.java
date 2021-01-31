package zipcok.almom.persistence;

import java.util.Arrays;
import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.stereotype.Service;

import zipcok.almom.domain.ChatRoomVO;
import zipcok.almom.domain.MessageVO;
@Service
@Repository
public class ChatDAOImpl implements ChatDAO{
	
	@Autowired
	private SqlSessionTemplate sqlMap;
	
	/*채팅방생성*/
	@Override
	public void createRoom(ChatRoomVO vo) throws Exception {
		// TODO Auto-generated method stub
		System.out.println("---create Room----");
		sqlMap.insert("createRoom" , vo);
		System.out.println("시팔");
	}


	/*이미만들어진채팅방이 있는지*/
	@Override
	public ChatRoomVO isRoom(ChatRoomVO vo) throws Exception {
		// TODO Auto-generated method stub
		
		ChatRoomVO roomvo = null;
		roomvo = sqlMap.selectOne("isRoom", vo);
		System.out.println("isRoom");
		System.out.println(roomvo);
		
		return roomvo;
	}



	@Override
	public void insertMessage(MessageVO vo) throws Exception {
		// TODO Auto-generated method stub
		
		sqlMap.insert("insertMessage" , vo);
	}



	@Override
	public String getPartner(ChatRoomVO vo) throws Exception {
		// TODO Auto-generated method stub
		
		List<MessageVO> mvo = sqlMap.selectList("getPartner", vo);
		
		return mvo.get(0).getMsg_userid();
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
	public List<MessageVO> getMessageList(String str) throws Exception {
		// TODO Auto-generated method stub

			return sqlMap.selectList("getMessageList" , str);
		
		
	}



	@Override
	public List<ChatRoomVO> getRoomList(String str) throws Exception {
		// TODO Auto-generated method stub
		return sqlMap.selectList("getRoomList",str);
	}



	@Override
	public List<ChatRoomVO> getRoomList2(String str) throws Exception {
		// TODO Auto-generated method stub
		return sqlMap.selectList("getRoomList2" , str);
	}



	@Override
	public MessageVO getRecentMessage(String str) throws Exception {
		// TODO Auto-generated method stub
		return sqlMap.selectOne("getRecentMessage" , str);
	}



	@Override
	public String getTutorId(String str) throws Exception {
		// TODO Auto-generated method stub
		return sqlMap.selectOne("getTutorId" , str) ;
	}



	@Override
	public List<ChatRoomVO> getRoomListTutor(String str) throws Exception {
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
