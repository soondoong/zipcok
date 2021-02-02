package zipcok.chat.handler;
import java.io.*;
import java.util.*;

import javax.websocket.EncodeException;
import javax.websocket.OnClose;
import javax.websocket.OnError;
import javax.websocket.OnMessage;
import javax.websocket.OnOpen;
import javax.websocket.RemoteEndpoint.Basic;
import javax.websocket.Session;
import javax.websocket.server.PathParam;
import javax.websocket.server.ServerEndpoint;

import org.springframework.beans.factory.annotation.Autowired;

import zipcok.almom.domain.MessageDTO;
import zipcok.chat.model.ChatDAO;
import zipcok.member.model.MemberDTO;


@ServerEndpoint(value = "/broadcasting/{id}/{name}", 
decoders = MessageDecoder.class, 
encoders = MessageEncoder.class) //value = "/echo/{name}" name은 채팅참여 유저이름"
public class Broadsocket  {


	
	private static List<Session> sessionList = new ArrayList<>();
	private static Map<String, String> userMap = new HashMap<>();

	
	  private static Set<Session> clients = Collections //세션에접속해있는 유저들
	  .synchronizedSet(new HashSet<Session>());

	
	// 클라이언트와 연결된 이후 호출되는 메소드
	@OnOpen
	public void onOpen(Session session, @PathParam("id") String id,@PathParam("name") String name) throws IOException  {
		// Add session to the connected sessions set
		 System.out.println("id:"+id+"/name:"+name + "(" + session.getId() + ")님이 접속했습니다."); //세션아이디 그냥아이디랑다름
		 
		 	sessionList.add(session);
			userMap.put(session.getId(), id);   //세션아이디로 진짜아이디저장
			userMap.put(session.getId()+1, name);   //세션아이디로 이름저장
			
			MessageDTO message = new MessageDTO();
			message.setUser_name(name); //이 메세지작성자
			message.setMsg_sender(session.getId());
			message.setMsg_content("님이 채팅방에 참여하였습니다.");
			
			//broadcast(session, message);
	}
	
	
	
	// 서버가 클라이언트로부터 메시지를 받았을때 호출되는 메소드
	@OnMessage
	public void onMessage(Session session, MessageDTO message) 
			throws IOException {
		System.out.println("onmessage단:"+message);
		String realid= userMap.get(session.getId()); //realid
		String realname = userMap.get(session.getId()+1); //realname
	    
	    System.out.println(realname + "(" + realid + ")로부터 " + message.getMsg_content());
		
	    message.setUser_name(realname);
	    message.setMsg_sender(realid);
	    
		broadcast(session, message);
		
		
	}
	
	
	
	
	@OnClose
	public void onClose(Session session) {
		// Remove session from the connected sessions set
		String realid= userMap.get(session.getId()); //realid
		String realname = userMap.get(session.getId()+1); //realname
		    System.out.println(realname + "(" + realid + ")와 연결이 끊어졌습니다.");
			
			MessageDTO message = new MessageDTO();
			message.setUser_name(realname); //이 메세지작성자
			message.setMsg_sender(realid);
			message.setMsg_content("님이 채팅방에서 나갔습니다.");
			
		//	broadcast(session, message);
			
			sessionList.remove(session);
			userMap.remove(session.getId());	 //맵에있던 아이디지우기
			userMap.remove(session.getId()+1);	//맵에있던 이름지우기
		    clients.remove(session);
	}
	
	@OnError
	public void onError(Session session, Throwable throwable) {
		// Do error handling here
	}
	
	
	
	// 모두에게 메시지 전송
		private synchronized static void broadcast(Session selfSession, MessageDTO message) {
		    
			for (Session session : sessionList) { //세션에접속한사용자중에
			    if (selfSession.getId().equals(session.getId())) {
			        continue; // 메시지 보낸 당사자에게는 전송 제외하기
			    }
			    
			   
			    if (message.getMsg_receiver() == null || message.getMsg_receiver().equals("")) {
	                // 귓속말 상대 toId 값이 없으면 모두에게 메시지 전송
			    	System.out.println("==getMsg_receiver");
	                Basic basic = session.getBasicRemote();
	                try {
	                    basic.sendObject(message);
	                } catch (IOException | EncodeException e) {
	                    e.printStackTrace();
	                }
	                
			    } else {
			    	 String realid= userMap.get(session.getId());
	                // 귓속말 상대인 toId 값이 있으면 해당 세션에만 메시지를 전송하고 빠져나옴
	                if (message.getMsg_receiver().equals(realid)) {
	                	System.out.println("==귓말상대잇어==");
	                    Basic basic = session.getBasicRemote();
	                    try {
	                        basic.sendObject(message);
	                    } catch (IOException | EncodeException e) {
	                        e.printStackTrace();
	                    }
	                    break; // for문 빠져나옴
	                }
			    }
			} // for
		}
	
	
	
	
	
	
	
	
	
	
	
}
