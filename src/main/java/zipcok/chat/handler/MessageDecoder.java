package zipcok.chat.handler;


import javax.websocket.DecodeException;
import javax.websocket.Decoder;
import javax.websocket.EndpointConfig;

import com.google.gson.Gson;

import zipcok.chat.model.*;

public class MessageDecoder implements Decoder.Text<MessageDTO> {

	private static Gson gson = new Gson();

	@Override
	public MessageDTO decode(String s) throws DecodeException {
		return gson.fromJson(s, MessageDTO.class);
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
