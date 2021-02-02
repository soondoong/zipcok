package zipcok.chat.handler;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;

import java.util.concurrent.ConcurrentHashMap;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.socket.CloseStatus;

import org.springframework.web.socket.TextMessage;

import org.springframework.web.socket.WebSocketSession;

import org.springframework.web.socket.handler.TextWebSocketHandler;

import com.google.gson.Gson;

import zipcok.almom.domain.ChatRoomDTO;
import zipcok.almom.domain.MessageDTO;
import zipcok.chat.model.ChatDAO;
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

		System.out.println(session.getId() + " 연결 됨!!");

		users.put(session.getId(), session);
		connectedUsers.add(session);
	}

	@Override

	public void afterConnectionClosed(

			WebSocketSession session, CloseStatus status) throws Exception {

		System.out.println(session.getId() + " 연결 종료됨");
		connectedUsers.remove(session);
		users.remove(session.getId());

	}


	@Override
	   protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {

	
		System.out.println(message.getPayload());

		  Map<String, Object> map = null;

	      MessageDTO msgdto = MessageDTO.convertMessage(message.getPayload());

	      System.out.println("1 : " + msgdto.toString());


	      ChatRoomDTO roomdto  = new ChatRoomDTO();
	      roomdto.setCroom_req_idx(msgdto.getMsg_req_idx()); //요청서
	      roomdto.setCroom_coachid(msgdto.getMsg_coachid()); //코치
	      roomdto.setCroom_userid(msgdto.getMsg_userid()); //유저

	      ChatRoomDTO croom =null;
	      if(!msgdto.getMsg_userid().equals(msgdto.getMsg_coachid())) {
	    	  			System.out.println("--msg보내는이가 고객이라면--");

			    	  if(dao.isRoom(roomdto) == null ) {
			    		  System.out.println("b");
			    		  dao.createRoom(roomdto);
			    		  System.out.println("---채팅방 생성됨!---");
			    		  croom = dao.isRoom(roomdto);
		
			    	  }else {
			    		  System.out.println("--이미채팅방 존재함--");
			    		  croom = dao.isRoom(roomdto);
			    	  }
			    	  
			    	  
	      }else {
	    	  System.out.println("--msg보내는이가 코치라면");
    		  croom = dao.isRoom(roomdto);
    		  
    	  }

	      msgdto.setMsg_croom_idx(croom.getCroom_idx());
	      if(croom.getCroom_userid().equals(msgdto.getMsg_sender())) {

	    	  msgdto.setMsg_receiver(roomdto.getCroom_coachid());
	      }else {
	    	  msgdto.setMsg_receiver(roomdto.getCroom_userid());
	      }



/*로그인부분 설정 해주기*/
	      for (WebSocketSession websocketSession : connectedUsers) {
	         map = websocketSession.getAttributes();
	         
	         if(map.get("sid")==null) {
	        	 
	         }
	         MemberDTO login = (MemberDTO) map.get("login"); //접속자 세션정보

	         //받는사람
	         if (login.getMem_id().equals(msgdto.getMsg_sender())) {

	            Gson gson = new Gson();
	            String msgJson = gson.toJson(msgdto);
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