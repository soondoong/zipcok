package zipcok.chat.model;


import java.util.*;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import zipcok.coach.model.RequestFormDTO;
import zipcok.cpayment.model.Payment_RequestDTO;
import zipcok.homegym.model.Payment_detailsDTO;


@Service
public class ChatDAOImple implements ChatDAO{
	
	@Autowired
	private SqlSessionTemplate sqlMap;
	
	/*채팅방생성*/
	@Override
	public int createRoom(ChatRoomDTO dto) {		
		System.out.println("---create Room Imple----");
		int count = sqlMap.insert("createRoom" , dto);
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
	public List<ChatRoomListDTO> allChatRoomList(String id,String sqlkey) {
		 List<ChatRoomListDTO> list= sqlMap.selectList(sqlkey,id);
		 			
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
		count = sqlMap.delete("msgDelete",croom_idx);
		return count;
	}


	/*메세지 저장하기*/
	@Override
	public int insertMessage(MessageDTO dto)throws Exception {
		int count=sqlMap.insert("insertMessage" , dto);
		return count;
	}

	/* 상담요청서idx로 채팅방정보찾기 */
	@Override
	public ChatRoomDTO findRoomInfo(int req_idx) {
		ChatRoomDTO dto=sqlMap.selectOne("findRoomInfo",req_idx);
		return dto;
	}

	/*메세지리스트가져오기*/
	@Override
	public List<MessageDTO> getMessageList(int croom_idx) {
	
		      sqlMap.update("updateUnreadcount", croom_idx); //읽은카운트 바꿔주고
		      List<MessageDTO> dto = sqlMap.selectList("getMessageList" , croom_idx); //리스트가꼬오기
		      
			 return dto;
	}


/*최근메세지불러오기*/
	@Override
	public MessageDTO getRecentMessage(int croom_idx) {

		return sqlMap.selectOne("getRecentMessage" , croom_idx);
	}

/*결제요청서등록*/
@Override
public int paymentReqInsert(Payment_RequestDTO prdto) {
	int count = sqlMap.insert("paymentReqInsert",prdto);
	return count;
}
/*결제요청서 하나찾기*/
@Override
public Payment_RequestDTO findOnePaymentRequest(Payment_RequestDTO prdto) {
	Payment_RequestDTO dto = sqlMap.selectOne("findOnePaymentRequest", prdto);
	return dto;
}
/*결제요청서등록할때 이용한 msgidx가져오기*/
@Override
	public int RecentPrMsgIdx(HashMap<String, Object> map) {
		int prmsg_idx = sqlMap.selectOne("RecentPrMsgIdx", map);
		return prmsg_idx;
	}
/*결제하고 내역등록*/
@Override
	public int paymentOKListAdd(Payment_detailsDTO dto) {
		int count = sqlMap.insert("paymentOKListAdd",dto);
		return count;
	}	
/*결제요청서상태바꿔주기*/
@Override
public int prStatusChangetoOK(HashMap<String, Object> map) {
	int count=sqlMap.update("paymentRequestStatusChange",map); //상담중 ->결제완료로 수정
	return count;
}

/*존재하는지확인*/	
@Override
	public int isPaymentCount(Payment_RequestDTO prdto) {
	int count = sqlMap.insert("isPaymentCount",prdto);
	return count;
	}
/*삭제*/
	@Override
	public int deletePaymentrequest(Payment_RequestDTO prdto) {
		//상태가 결제완료이면 삭제할수 없게하기
		int count = sqlMap.insert("deletePaymentrequest",prdto);
		return count;
	}
	
	
	
	
	
	
	
	
	@Override
	public void updateReadTime(int req_idx, String user_id, String Coach_user_id) throws Exception {
		
		HashMap<String, Object> map = new HashMap<String, Object> ();
		
		map.put("Coach_user_id", Coach_user_id);
		map.put("user_id", user_id);
		map.put("req_idx", req_idx);
		sqlMap.update("updateReadTime" , map);
	}


	@Override
	public int getUnReadCount(String Coach_user_id, int croom_idx, String user_id) throws Exception {
		HashMap<String, Object> map = new HashMap<String, Object> ();
		
		map.put("Coach_user_id", Coach_user_id);
		map.put("user_id", user_id);
		map.put("req_idx", croom_idx);
		
		
		return sqlMap.selectOne("getUnReadCount" , map);
	}

@Override
public int getUnReadCountTutor(String Coach_user_id, int req_idx, String user_id) throws Exception {
	// TODO Auto-generated method stub
	return 0;
}
@Override
public void updateReadTimeTutor(int req_idx, String user_id, String Coach_user_id) throws Exception {
	// TODO Auto-generated method stub
	
}







	
}
