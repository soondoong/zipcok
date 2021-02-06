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

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.socket.BinaryMessage;
import org.springframework.web.socket.CloseStatus;

import org.springframework.web.socket.TextMessage;

import org.springframework.web.socket.WebSocketSession;

import org.springframework.web.socket.handler.TextWebSocketHandler;

import com.google.gson.Gson;
import zipcok.chat.model.*;
import zipcok.member.model.MemberDTO;



public class Websocket extends TextWebSocketHandler {

	@Autowired
	private ChatDAO chatdao;
	@Autowired
	ServletContext c;
	private List<WebSocketSession> sessionList;
	private Map<String, Object> userMap = new ConcurrentHashMap<String, Object>();
	static int fileUploadIdx = 0;
	static String fileUploadSession = "";
	
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


		System.out.println(message.getPayload());

		  Map<String, Object> map = null;
	      MessageDTO msgdto = MessageDTO.convertMessage(message.getPayload()); //msg정보다들어있는 dto
	      
	      
	      
	      if(msgdto.getMsg_type().equals("텍스트")) {
					      
				      System.out.println("메세지 : " + msgdto.toString());
				      
				      int result =0;
						try {
							result = chatdao.insertMessage(msgdto);
						} catch (Exception e) {
						
							e.printStackTrace();
						}
						    if(result>0) {System.out.println("===msg저장성공====");}
					 
				    
			
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
	      }	else if(msgdto.getMsg_type().equals("사진")) {
	    	  
	    	  
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
	
	
	@Override
	protected void handleBinaryMessage(WebSocketSession session, BinaryMessage message) {
		// 파일메세지
		//바이너리 메시지 발송
				ByteBuffer byteBuffer = message.getPayload();
				String fileName = "temp.jpg";
				String file_path=c.getRealPath("/upload/coach/");
				File dir = new File(file_path);
				if(!dir.exists()) {
					dir.mkdirs();
				}
				
				File file = new File(file_path, fileName);
				FileOutputStream out = null;
				FileChannel outChannel = null;
				try {
					byteBuffer.flip(); //byteBuffer를 읽기 위해 세팅
					out = new FileOutputStream(file, true); //생성을 위해 OutputStream을 연다.
					outChannel = out.getChannel(); //채널을 열고
					byteBuffer.compact(); //파일을 복사한다.
					outChannel.write(byteBuffer); //파일을 쓴다.
				}catch(Exception e) {
					e.printStackTrace();
				}finally {
					try {
						if(out != null) {
							out.close();
						}
						if(outChannel != null) {
							outChannel.close();
						}
					}catch (IOException e) {
						e.printStackTrace();
					}
				}
				
				byteBuffer.position(0); //파일을 저장하면서 position값이 변경되었으므로 0으로 초기화한다.
				//파일쓰기가 끝나면 이미지를 발송한다.
				 Map<String, Object> map = null;
			      MessageDTO msgdto = MessageDTO.convertMessage(message.getPayload()); //msg정보다들어있는 dto
				   for (WebSocketSession websocketSession : sessionList) {
				        map = websocketSession.getAttributes(); //인터셉터에서 받은파라미터정보들
				    	
				        String realid= (String)map.get("realid"); //접속자아이디
				        int roomidx = (int)map.get("roomidx"); 		
				         //받는사람
				         if ( realid.equals(msgdto.getMsg_receiver()) && roomidx == msgdto.getMsg_croom_idx()) {
			
				            Gson gson = new Gson();
				            String msgJson = gson.toJson(msgdto);
				            websocketSession.sendMessage(new BinaryMessage(byteBuffer)); //초기화된 버퍼를 발송한다.
				         }
			
			
				
				
			
	}
	
}
