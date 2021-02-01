package zipcok.chat.handler;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;

import java.util.concurrent.ConcurrentHashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.socket.CloseStatus;

import org.springframework.web.socket.TextMessage;

import org.springframework.web.socket.WebSocketSession;

import org.springframework.web.socket.handler.TextWebSocketHandler;

import com.google.gson.Gson;

import zipcok.almom.domain.ChatRoomVO;
import zipcok.almom.domain.MessageVO;
import zipcok.almom.persistence.ChatDAO;
import zipcok.member.model.MemberDTO;

public class ChatWebSocketHandler extends TextWebSocketHandler {

	@Autowired
	private ChatDAO dao;

	private List<WebSocketSession> connectedUsers;

	public ChatWebSocketHandler() {
	      connectedUsers = new ArrayList<WebSocketSession>();
	   }

	private Map<String, WebSocketSession> users = new ConcurrentHashMap<String, WebSocketSession>();

	@Override

	public void afterConnectionEstablished(

			WebSocketSession session) throws Exception {

		log(session.getId() + " 연결 됨!!");

		users.put(session.getId(), session);
		connectedUsers.add(session);
	}

	@Override

	public void afterConnectionClosed(

			WebSocketSession session, CloseStatus status) throws Exception {

		log(session.getId() + " 연결 종료됨");
		connectedUsers.remove(session);
		users.remove(session.getId());

	}


	@Override
	   protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {


		System.out.println(message.getPayload());

		  Map<String, Object> map = null;

	      MessageVO messageVO = MessageVO.convertMessage(message.getPayload());

	      System.out.println("1 : " + messageVO.toString());


	      ChatRoomVO roomVO  = new ChatRoomVO();
	      roomVO.setCroom_req_idx(messageVO.getMsg_req_idx()); //요청서
	      roomVO.setCroom_coachid(messageVO.getMsg_coachid()); //코치
	      roomVO.setCroom_userid(messageVO.getMsg_userid()); //유저

	      ChatRoomVO croom =null;
	      if(!messageVO.getMsg_userid().equals(messageVO.getMsg_coachid())) {
	    	  System.out.println("--msg보내는이가 고객이라면--");



	    	  if(dao.isRoom(roomVO) == null ) {
	    		  System.out.println("b");
	    		  dao.createRoom(roomVO);
	    		  System.out.println("---채팅방 생성됨!---");
	    		  croom = dao.isRoom(roomVO);

	    	  }else {
	    		  System.out.println("--이미채팅방 존재함--");
	    		  croom = dao.isRoom(roomVO);
	    	  }
	      }else {
	    	  System.out.println("--msg보내는이가 코치라면");
    		  croom = dao.isRoom(roomVO);
    		  
    	  }

	      messageVO.setMsg_croom_idx(croom.getCroom_idx());
	      if(croom.getCroom_userid().equals(messageVO.getMsg_sender())) {

	    	  messageVO.setMsg_reciever(roomVO.getCroom_coachid());
	      }else {
	    	  messageVO.setMsg_reciever(roomVO.getCroom_userid());
	      }



/*로그인부분 설정 해주기*/
	      for (WebSocketSession websocketSession : connectedUsers) {
	         map = websocketSession.getAttributes();
	         
	         if(map.get("sid")==null) {
	        	 
	         }
	         MemberDTO login = (MemberDTO) map.get("login"); //접속자 세션정보

	         //받는사람
	         if (login.getMem_id().equals(messageVO.getMsg_sender())) {

	            Gson gson = new Gson();
	            String msgJson = gson.toJson(messageVO);
	            websocketSession.sendMessage(new TextMessage(msgJson));
	         }


	      }
	   }

	@Override

	public void handleTransportError(

			WebSocketSession session, Throwable exception) throws Exception {

		log(session.getId() + " 익셉션 발생: " + exception.getMessage());

	}

	private void log(String logmsg) {

		System.out.println(new Date() + " : " + logmsg);

	}

}