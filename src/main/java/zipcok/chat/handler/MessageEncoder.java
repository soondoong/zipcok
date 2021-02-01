package zipcok.chat.handler;

import javax.websocket.EncodeException;
import javax.websocket.Encoder;
import javax.websocket.EndpointConfig;

import com.google.gson.Gson;

import zipcok.almom.domain.MessageDTO;

public class MessageEncoder implements Encoder.Text<MessageDTO> {
	
	private static Gson gson = new Gson();

	@Override
	public String encode(MessageDTO message) throws EncodeException {
		return gson.toJson(message);
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