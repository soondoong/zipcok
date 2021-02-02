package zipcok.controller;

import java.util.List;

import org.apache.catalina.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import zipcok.almom.domain.ChatRoomDTO;
import zipcok.chat.model.ChatDAO;
import zipcok.coach.model.CoachDAO;
import zipcok.coachmypage.model.CoachMypageDAO;
import zipcok.member.model.MemberDTO;
import zipcok.mypage.model.MypageDAO;

@Controller
public class ChatController {
	@Autowired
	private CoachDAO coachdao;
	@Autowired
	private MypageDAO myPagedao;
	@Autowired
	private CoachMypageDAO cpagedao;
	@Autowired
	private ChatDAO chatdao;


	
	
	@RequestMapping("startToChat.do")
	public ModelAndView startToChat (@RequestParam("userid")String userid,
			@RequestParam("coachid")String coachid,@RequestParam("req_idx")int req_idx) {
		ModelAndView mav=new ModelAndView();
		
		int count=cpagedao.requestStatusChange(req_idx);
		
		ChatRoomDTO newRoomdto = new ChatRoomDTO();
		newRoomdto.setCroom_userid(userid);
		newRoomdto.setCroom_coachid(coachid);
		newRoomdto.setCroom_req_idx(req_idx);
		
			int result=chatdao.createRoom(newRoomdto);
			if(result>0 && count >0) {System.out.println("--채팅방생성및status전환성공!--");}	
		
			ChatRoomDTO cdto = chatdao.findRoomInfo(req_idx);
			
			mav.addObject("gopage", "gotoChat.do?croom_idx="+cdto.getCroom_idx()+"&req_idx="+req_idx);
			
			mav.setViewName("coach/chat/chatMSG");
		return mav;
	}
	
	
	
	@RequestMapping("gotoChat.do")
	public ModelAndView gotoChat (@RequestParam("croom_idx")int croom_idx,@RequestParam("req_idx")int req_idx) {
		ModelAndView mav= new ModelAndView();
		//채팅방idx로 등록된 메시지들을 전송일 순으로 전부출력.
		
		//채팅방정보
		ChatRoomDTO cdto = chatdao.findRoomInfo(req_idx);	
		mav.addObject("croomDTO", cdto);
		mav.setViewName("coach/chat/chat2");	
		return mav;
	}
	
	
	
		@RequestMapping("chatRoomList.do")
	   public ModelAndView chatRoomList(@RequestParam("mem_id")String id) {
			ModelAndView mav=new ModelAndView();
			
			MemberDTO mdto=myPagedao.memberProfile(id); //코치회원인지 일반회원인지 판단		
			if(mdto.getMem_type().equals("일반회원")) { //일반회원용 채팅방목록
						
				List<ChatRoomDTO> list= chatdao.allChatRoomList(id,"nomalChatRoomListSQL");
				mav.addObject("chatList", list);
				mav.setViewName("mypage/chatRoomList");
			}else { //코치회원용 채팅방목록
									
		
				List<ChatRoomDTO> list = chatdao.allChatRoomList(id,"coachChatRoomListSQL");
				
				mav.addObject("chatList", list);
				mav.setViewName("coachMyPage/chatList");
			}
		
			return mav;
		}
		
		
		
		/*채팅방 선택삭제하기*/
		@RequestMapping("roomDelete.do")
		public ModelAndView requestDelete(@RequestParam("croom_idx")int croom_idx,@RequestParam("id")String id) {
			
			int result=chatdao.roomDelete(croom_idx);
			String msg=result>0?"채팅방에서 퇴장하셨습니다":"퇴장실패";
			System.out.println("-----채팅방퇴장기능수행------");
			ModelAndView mav=new ModelAndView();
			mav.addObject("msg", msg);
			mav.addObject("gopage", "chatRoomList.do?mem_id="+id);
			mav.setViewName("coach/joinMsg");
			return mav;
		}
	
}
