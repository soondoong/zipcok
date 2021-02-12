package zipcok.chat.handler;


import java.io.*;

import java.nio.ByteBuffer;
import java.nio.channels.FileChannel;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import java.util.concurrent.ConcurrentHashMap;

import javax.servlet.ServletContext;

import org.apache.commons.io.IOUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.socket.BinaryMessage;
import org.springframework.web.socket.CloseStatus;

import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketMessage;
import org.springframework.web.socket.WebSocketSession;

import org.springframework.web.socket.handler.TextWebSocketHandler;

import com.google.gson.Gson;
import zipcok.chat.model.*;
import zipcok.cpayment.model.Payment_RequestDTO;
import zipcok.member.model.MemberDTO;



public class Websocket extends TextWebSocketHandler {

	@Autowired
	private ChatDAO chatdao;
	@Autowired
	ServletContext c;
	private List<WebSocketSession> sessionList;
	private Map<String, Object> userMap = new ConcurrentHashMap<String, Object>();
	public Websocket() {
	      sessionList = new ArrayList<WebSocketSession>();
	   }
	
	
	

	// 클라이언트와 연결된 이후 호출되는 메소드
	@Override
	public void afterConnectionEstablished( WebSocketSession session) throws Exception {

		 userMap.put(session.getId(), session.getAttributes().get("realid")); //세션번호로 접속자아이디저장
		 sessionList.add(session);
		 System.out.println(userMap.get(session.getId())+"님이 연결되었습니다.");
		 
		 		//roomidx를 통해 디비에 저장된내역 미리 뿌려주기
			
		 
	}

	//연결종료시
	@Override
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {

		log(session.getId() + " 연결 종료됨");
		sessionList.remove(session);
		userMap.remove(session.getId()); //세션번호키 지워줌

	}

	
	
	
	   //메세지받아서 전송
		@Override
		   protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {


			System.out.println("textMsg:"+message.getPayload());

			  Map<String, Object> map = null;
		      MessageDTO msgdto = MessageDTO.convertMessage(message.getPayload()); //msg정보다들어있는 dto
		  
		      	      
		      if(msgdto.getMsg_type().equals("텍스트")) {
		    	  
		    	  
					    		//1단계		      
						      System.out.println("메세지 : " + msgdto.toString());
						      
						      int result =0;
								try {
									result = chatdao.insertMessage(msgdto);
								} catch (Exception e) {
								
									e.printStackTrace();
								}
								    if(result>0) {System.out.println("===일반msg저장성공====");}
								    
		    	  
		    	  
					    	  //2단계 메시지보내기
						      for (WebSocketSession websocketSession : sessionList) {
						        map = websocketSession.getAttributes(); //인터셉터에서 받은파라미터정보들
						    	
								        String realid= (String)map.get("realid"); //접속자아이디
								        int roomidx = (int)map.get("roomidx"); 		
								         //받는사람
								        if ( realid.equals(msgdto.getMsg_receiver()) && roomidx == msgdto.getMsg_croom_idx()) {
							
								            Gson gson = new Gson();
								            String msgJson = gson.toJson(msgdto);
								            websocketSession.sendMessage(new TextMessage(msgJson));
								        
								         }			
						      }
					    	  
						
		      }else if(msgdto.getMsg_type().equals("결제요청서")){
				  
		    	  
		    	  	//1단계 결제요청서타입인거 확인 후 메시지 저장후 채팅방에다시뿌려주기		      
								      System.out.println("메세지 : " + msgdto.toString());
								     
								      int result =0;
										try {
											result = chatdao.insertMessage(msgdto);
										} catch (Exception e) {
										
											e.printStackTrace();
										}
										    if(result>0) {System.out.println("===결제요청서msg저장성공====");}
					    	  //2단계  방금만들어진 메시지 idx를 넣어서 dto수정해야함
										HashMap<String, Object> prkeymap = new HashMap<String, Object>();
										int croom_idx = msgdto.getMsg_croom_idx();
										String type=msgdto.getMsg_type();
										prkeymap.put("msg_type",type);
										prkeymap.put("croom_idx",croom_idx);
										int prmsg_idx=chatdao.RecentPrMsgIdx(prkeymap);
				     	 
										int pr_msg_idx = prmsg_idx;
										int pr_req_idx = msgdto.getMsg_req_idx();
										String pr_price=msgdto.getMsg_file_upload();
										String pr_start = msgdto.getMsg_file_path();
										String pr_end = msgdto.getReceiver_user_name();
										String pr_content=msgdto.getMsg_content();
										String pr_sender = msgdto.getMsg_sender();
										String pr_receiver = msgdto.getMsg_receiver();
										Payment_RequestDTO prdto = new Payment_RequestDTO(0, pr_msg_idx, pr_req_idx, pr_price, pr_start, pr_end, pr_content, "d", "d", pr_sender, pr_receiver) ;
										
										int result22=chatdao.paymentReqInsert(prdto);
										
					      for (WebSocketSession websocketSession : sessionList) {
					        map = websocketSession.getAttributes(); //인터셉터에서 받은파라미터정보들
					    	
							        String realid= (String)map.get("realid"); //접속자아이디
							        int roomidx = (int)map.get("roomidx"); 		
							         //받는사람
							        if ( realid.equals(msgdto.getMsg_receiver()) && roomidx == msgdto.getMsg_croom_idx()) {
						
							            Gson gson = new Gson();
							            String msgJson = gson.toJson(msgdto);
							            websocketSession.sendMessage(new TextMessage(msgJson));
							           
							         }			
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
