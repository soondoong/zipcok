package zipcok.chat.handler;
import java.io.IOException;
import java.util.Collections;
import java.util.HashSet;
import java.util.Set;

import javax.websocket.OnClose;
import javax.websocket.OnMessage;
import javax.websocket.OnOpen;
import javax.websocket.Session;
import javax.websocket.server.ServerEndpoint;

import org.springframework.beans.factory.annotation.Autowired;

import zipcok.almom.persistence.ChatDAO;

@ServerEndpoint("/broadcasting")
public class Broadsocket  {

	
	@Autowired
	private ChatDAO dao;
	
	
	private static Set<Session> clients = Collections  //세션에접속해있는 유저들
			.synchronizedSet(new HashSet<Session>());

	
	@OnMessage
	public void onMessage(String message, Session session) 
			throws IOException {
		System.out.println("onmessage단:"+message);
		
		synchronized (clients) {
			// Iterate over the connected sessions
			// and broadcast the received message
			for (Session client : clients) {
				if (!client.equals(session)) {
					client.getBasicRemote().sendText(message);
				}
			}
		}
	}

	@OnOpen
	public void onOpen(Session session) {
		// Add session to the connected sessions set
		System.out.println("onOpen단:"+session);
		clients.add(session);
	}

	@OnClose
	public void onClose(Session session) {
		// Remove session from the connected sessions set
		System.out.println("onclose단:"+session);
		clients.remove(session);
	}
}
