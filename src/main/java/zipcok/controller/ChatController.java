package zipcok.controller;

import org.apache.catalina.User;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class ChatController {
	
	
	
	@RequestMapping(value = "/chatting.do", method = RequestMethod.GET)
	public ModelAndView chat(ModelAndView mv) {
		mv.setViewName("chat/chattingview");
		
		//사용자 정보 출력(세션)//
		User user = (User) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		System.out.println("user name :" + user.getUsername());
				
		System.out.println("normal chat page");
		
		mv.addObject("userid", user.getUsername());
		
		return mv;
	}

}
