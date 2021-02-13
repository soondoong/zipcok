package zipcok.chat.model;

import java.util.HashMap;
import java.util.List;

import zipcok.coach.model.RequestFormDTO;
import zipcok.cpayment.model.Payment_RequestDTO;
import zipcok.homegym.model.Payment_detailsDTO;

public interface ChatDAO {

	public int createRoom(ChatRoomDTO dto); //채팅방생성데이터등록
	public List<ChatRoomListDTO> allChatRoomList(String id,String sqlkey);   //채팅방목록불러오기
	public RequestFormDTO findRequestForm(int req_idx); //요청서1개정보가져오기 
	public ChatRoomDTO isRoom(ChatRoomDTO dto); //이미속해있는채팅방잇나보기
	public int roomDelete(int croom_idx); //채팅방나가기
	public ChatRoomDTO findRoomInfo(int req_idx); //상담요청서idx로 채팅방정보찾기
	
	public int insertMessage(MessageDTO dto)throws Exception;
	public List<MessageDTO> getMessageList(int croom_idx);
	public MessageDTO getRecentMessage(int croom_idx);
	//public String isGetMessageList(String str)throws Exception;
	
	
	
	/*결제요청서*/
	public int paymentReqInsert(Payment_RequestDTO prdto); //등록
	public int RecentPrMsgIdx(HashMap<String,Object> map); //방금등록된결제요청서msg idx 하나값
	public Payment_RequestDTO findOnePaymentRequest(Payment_RequestDTO prdto); //정보가져오기
	public int paymentOKListAdd(Payment_detailsDTO dto);//결제하고 내역등록
	public int prStatusChangetoOK(HashMap<String,Object> map);//요청서 상담중->결제완료로 바꾸기
	public Payment_RequestDTO isPaymentCount(Payment_RequestDTO prdto);//삭제하기전에 존재하는지부터확인
	public int deletePaymentrequest(Payment_RequestDTO prdto);//삭제
	
	
	public void updateReadTime(int req_idx , String user_id , String Coach_user_id)throws Exception;
	public void updateReadTimeTutor(int req_idx , String user_id , String  Coach_user_id)throws Exception;
	
	public int getUnReadCount(String  Coach_user_id, int req_idx, String user_id)throws Exception;
	public int getUnReadCountTutor(String Coach_user_id, int req_idx, String user_id)throws Exception;

}