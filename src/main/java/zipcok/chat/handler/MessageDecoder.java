package zipcok.chat.handler;


import javax.websocket.DecodeException;
import javax.websocket.Decoder;
import javax.websocket.EndpointConfig;

import com.google.gson.Gson;

import zipcok.almom.domain.MessageVO;

public class MessageDecoder implements Decoder.Text<MessageVO> {

	private static Gson gson = new Gson();

	@Override
	public MessageVO decode(String s) throws DecodeException {
		return gson.fromJson(s, MessageVO.class);
	}

	@Override
	public boolean willDecode(String s) {
		return (s != null);
	}
	
	@Override
	public void init(EndpointConfig endpointConfig) {
		// custom initialization logic
	}
	
	@Override
	public void destroy() {
		// close resources
	}
}
