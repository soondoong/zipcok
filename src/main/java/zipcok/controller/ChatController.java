package zipcok.controller;

import org.apache.catalina.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import zipcok.chat.model.ChatDAO;
import zipcok.coach.model.CoachDAO;
import zipcok.member.model.MemberDTO;
import zipcok.mypage.model.MypageDAO;

@Controller
public class ChatController {
	@Autowired
	private CoachDAO coachdao;
	@Autowired
	private MypageDAO myPagedao;
	@Autowired
	private ChatDAO chatdao;

	@RequestMapping("startToChat.do")
	public ModelAndView gotoChat (@RequestParam("mem_id")String id,@RequestParam("req_idx")String req_idx) {
		ModelAndView mav=new ModelAndView();
	
		
		mav.setViewName("coach/chat/chat2");
		return mav;
	}
	
	
	
	
		@RequestMapping("chatRoomList.do")
	   public ModelAndView chatRoomList(@RequestParam("mem_id")String id,@RequestParam("req_idx")String req_idx) {
			ModelAndView mav=new ModelAndView();
			
			MemberDTO mdto=myPagedao.memberProfile(id); //코치회원인지 일반회원인지 판단		
			if(mdto.getMem_type().equals("일반회원")) { //일반회원용 채팅방목록
				
				
				
				mav.setViewName("mypage/chatList");
			}else { //코치회원용 채팅방목록
				
				mav.setViewName("coachMyPage/chatroomList");
			}
		
			return mav;
		}
	
}
