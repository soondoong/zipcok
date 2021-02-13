package zipcok.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.apache.catalina.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import zipcok.chat.model.*;
import zipcok.coach.model.CoachDAO;
import zipcok.coach.model.MainCoachDTO;
import zipcok.coach.model.RequestFormDTO;
import zipcok.coachmypage.model.CoachMypageDAO;
import zipcok.cpayment.model.Payment_RequestDTO;
import zipcok.homegym.model.PaymentDTO;
import zipcok.homegym.model.Payment_detailsDTO;
import zipcok.member.model.*;
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
			@RequestParam("coachid")String coachid,@RequestParam("req_idx")int req_idx,@RequestParam("type")String type) {
		ModelAndView mav=new ModelAndView();
		
		int count=cpagedao.requestStatusChange(req_idx);
		
		ChatRoomDTO newRoomdto = new ChatRoomDTO();
		newRoomdto.setCroom_userid(userid);
		newRoomdto.setCroom_coachid(coachid);
		newRoomdto.setCroom_req_idx(req_idx);
		
			int result=chatdao.createRoom(newRoomdto);
			if(result>0 && count >0) {System.out.println("--채팅방생성및status전환성공!--");}	
					
			
			ChatRoomDTO cdto = chatdao.findRoomInfo(req_idx);
			
			mav.addObject("gopage", "gotoChat.do?croom_idx="+cdto.getCroom_idx()+"&req_idx="+req_idx+"&type="+type);
			
			mav.setViewName("coach/chat/chatMSG");
		return mav;
	}
	
	
	
	@RequestMapping("gotoChat.do")
	public ModelAndView gotoChat (@RequestParam("croom_idx")int croom_idx,
			@RequestParam("req_idx")int req_idx, @RequestParam("type")String type) {
		ModelAndView mav= new ModelAndView();
		
				ChatRoomDTO cdto = chatdao.findRoomInfo(req_idx);	
				mav.addObject("croomDTO", cdto); //채팅방정보
				
				List<MessageDTO> msglist = chatdao.getMessageList(croom_idx);		
				mav.addObject("msglist", msglist);
				
				RequestFormDTO reqdto=coachdao.findOneRequest(req_idx);
				mav.addObject("reqdto", reqdto);
		
				
								
		/*채팅방에 들어올때  일반회원인지 코치회원인지 판단해서
		 * 상대방 정보 dto 뿌려주기 
		 * 그동안 메세지 뿌려주기
		 * */
		if(type.equals("일반회원")) { //일반회원일경우 코치정보도같이뿌려주자
			MemberAllDTO dto= myPagedao.memberAllProfile(cdto.getCroom_coachid());
			mav.addObject("receiveDTO", dto); //상대방정보dto
			
			HashMap<String, Object> coachMap=coachdao.coachProfile(dto.getMem_id());
			mav.addObject("coachMap", coachMap); //코치모든프로필정보
		}else { //코치회원
			MemberAllDTO dto= myPagedao.memberAllProfile(cdto.getCroom_userid());
			mav.addObject("receiveDTO", dto);//상대방정보dto
		}
		
		mav.setViewName("coach/chat/chat2");	
		return mav;
		
	}
	
	
		@RequestMapping("chatRoomList.do")
	   public ModelAndView chatRoomList(@RequestParam("mem_id")String id) {
			ModelAndView mav=new ModelAndView();
			
			List<ChatRoomListDTO> list=  null; //채팅방리스트
			MemberDTO mdto=myPagedao.memberProfile(id); //코치회원인지 일반회원인지 판단		
			if(mdto.getMem_type().equals("일반회원")) { //일반회원용 채팅방목록
						
				list= chatdao.allChatRoomList(id,"nomalChatRoomListSQL");
				mav.addObject("chatList", list);
				mav.setViewName("mypage/chatRoomList");		
				
			}else { //코치회원용 채팅방목록
									
				list = chatdao.allChatRoomList(id,"coachChatRoomListSQL");				
				mav.addObject("chatList", list);
				mav.setViewName("coachMyPage/chatList");
			}
				
			return mav;
		}
		
		
		
		/*채팅방 선택삭제하기*/
		@RequestMapping("roomDelete.do")
		public ModelAndView requestDelete(@RequestParam("croom_idx")int croom_idx,
				@RequestParam("id")String id,@RequestParam("req_idx")int req_idx) {
			//채팅방나가면 상담요청서 지우기.
			int result=cpagedao.requestDelete(req_idx);
					result+=chatdao.roomDelete(croom_idx);
			String msg=result>0?"채팅방에서 퇴장하셨습니다":"퇴장실패";
			System.out.println("-----채팅방퇴장기능수행------");
			ModelAndView mav=new ModelAndView();
			mav.addObject("msg", msg);
			mav.addObject("gopage", "chatRoomList.do?mem_id="+id);
			mav.setViewName("coach/joinMsg");
			return mav;
		}
	
		
		
		/*결제요청서 등록하기 ajax*/
		@RequestMapping("paymentReqInsert.do")
		public ModelAndView paymentReqInsert(Payment_RequestDTO prdto) {		
			System.out.println("-----결제요청컨트롤러진입------"+prdto.getPr_start());
			int result=chatdao.paymentReqInsert(prdto);
			String msg=result>0?"결제요청서가 전송되었습니다":"전송실패";
			System.out.println("-----기능수행------"+msg);
			ModelAndView mav=new ModelAndView();
			mav.addObject("msg", msg);
			mav.setViewName("jsonView");
			return mav;
		}
		
		
		/*고객 결제하는 화면으로이동*/
		@RequestMapping("gotoCoachPaymentView.do")
		public ModelAndView gotoCoachPaymentView(@RequestParam("msg_idx")int msg_idx,
				@RequestParam("req_idx")int req_idx,
				@RequestParam("coach_id")String coach_id,HttpSession session) {
			String mem_id=(String)session.getAttribute("sid");
			//1단계 결제요청서정보가져오기
			Payment_RequestDTO prdto = new Payment_RequestDTO();
			prdto.setPr_msg_idx(msg_idx);
			prdto.setPr_req_idx(req_idx);
			Payment_RequestDTO dto = chatdao.findOnePaymentRequest(prdto); //결제요청서정보
			//2단계 코치정보가져오기
			 HashMap<String, Object> coachmap=  coachdao.coachProfile(coach_id);
			 //3단계 고객정보가져오기
			 MemberAllDTO memdto = myPagedao.memberAllProfile(mem_id);
			ModelAndView mav=new ModelAndView();
			
			mav.addObject("prdto", dto);
			mav.addObject("coachmap", coachmap);
			mav.addObject("memdto", memdto);
			mav.setViewName("coach/coachPaymentView");
			return mav;
		}
		
		/*실제 결제하기*/
		@RequestMapping("CoachPayOKListAdd.do")
		public ModelAndView CoachPayOKListAdd(	Payment_detailsDTO dto,HttpSession session,
				@RequestParam("pr_msg_idx")int pr_msg_idx) {
			int pd_result = chatdao.paymentOKListAdd(dto);//결제내역서에 등록
			
			HashMap<String,Object> map = new HashMap<String, Object>();
			map.put("pr_msg_idx",pr_msg_idx);
			map.put("pr_req_idx",dto.getPd_req_idx());
			int count = chatdao.prStatusChangetoOK(map);//결제요청서상태를 상담중 -> 결제완료로 바꿔주기
			String msg=pd_result>0?msg="결제가 완료되었습니다.":"결제실패";
			ModelAndView mav = new ModelAndView();
			mav.addObject("msg", msg);
			mav.addObject("gopage", "mypageCoachMatchPayList.do?mem_id="+(String)session.getAttribute("sid"));
			mav.setViewName("coach/joinMsg");
			return mav;
		}
		
		@RequestMapping("gotoCoachPaymentDelete.do")
		public ModelAndView gotoCoachPaymentDelete(@RequestParam("msg_idx")int msg_idx,
				@RequestParam("croom_idx")int croom_idx,
				@RequestParam("req_idx")int req_idx,
				@RequestParam("coach_id")String coach_id,HttpSession session) {
			String msg="";
			Payment_RequestDTO prdto = new Payment_RequestDTO();
			prdto.setPr_msg_idx(msg_idx);
			prdto.setPr_req_idx(req_idx);
			int result = chatdao.isPaymentCount(prdto);
			if(result>0) {
				//존재하면 삭제가능
				result=chatdao.deletePaymentrequest(prdto);
				 msg=result>0?"결제요청서가 삭제되었습니다.":"결제 완료된 요청서는 삭제하실 수 없습니다!";
		
			}else {
			msg="이미 삭제된 결제요청서입니다.";
			}
			ModelAndView mav = new ModelAndView();
			mav.addObject("msg", msg);
			mav.addObject("gopage", "gotoChat.do?croom_idx="+croom_idx+"&req_idx="+req_idx+"&type=코치회원");
			mav.setViewName("coach/joinMsg");
			return mav;
			
		}
}
