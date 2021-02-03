package zipcok.chat.handler;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.http.server.ServerHttpRequest;
import org.springframework.http.server.ServerHttpResponse;
import org.springframework.http.server.ServletServerHttpRequest;
import org.springframework.web.socket.WebSocketHandler;
import org.springframework.web.socket.server.support.HttpSessionHandshakeInterceptor;

public class HandshakeInterceptor extends HttpSessionHandshakeInterceptor {

	@Override
	public boolean beforeHandshake(ServerHttpRequest request, ServerHttpResponse response, WebSocketHandler wsHandler,
			Map<String, Object> attributes) throws Exception {
		
		// 위의 파라미터 중, attributes 에 값을 저장하면 웹소켓 핸들러 클래스의 WebSocketSession에 전달된다
        System.out.println("Before Handshake");
                   
        ServletServerHttpRequest ssreq = (ServletServerHttpRequest) request;
        System.out.println("URI:"+request.getURI());
        HttpServletRequest req =  ssreq.getServletRequest();
 
    	 //접속자아이디, 접속자이름, 채팅방번호
        String realid = req.getParameter("realid");
        attributes.put("realid", realid);
        String realname= req.getParameter("realname");
        attributes.put("realname", realname);
        String roomidx_s= req.getParameter("roomidx");
        int roomidx=Integer.parseInt(roomidx_s);
        attributes.put("roomidx", roomidx);
        
        
        System.out.println("HttpSession에 저장된 현재접속자id:"+realid);
         

//출처: https://micropilot.tistory.com/2768 []	
		return super.beforeHandshake(request, response, wsHandler, attributes);
	}
	
	@Override
	public void afterHandshake(ServerHttpRequest request, ServerHttpResponse response, WebSocketHandler wsHandler,
			Exception ex) {
		  System.out.println("After Handshake");

		super.afterHandshake(request, response, wsHandler, ex);
	}
	
}
