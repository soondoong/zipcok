package zipcok.controller;

import java.util.*;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import zipcok.coach.model.CoachFileDTO;
import zipcok.member.model.MemberDAO;
import zipcok.member.model.MemberDTO;
import zipcok.mypage.model.LikeDTO;
import zipcok.mypage.model.MypageDAO;

@Controller
public class MypageController {
	
	@Autowired
	private MypageDAO dao;
	
	@Autowired
	ServletContext c;
	
	//마이페이지 내프로필
	@RequestMapping("/memberProfileForm.do")
	public ModelAndView memberProfileForm(
			HttpSession session) {
		ModelAndView mav= new ModelAndView();
		MemberDTO dto=dao.memberProfile((String)session.getAttribute("sid"));
		CoachFileDTO cdto=dao.memberProfilePhoto((String)session.getAttribute("sid"));
	
		mav.addObject("dto", dto);
		mav.addObject("cdto", cdto);
		mav.setViewName("mypage/memberProfile");
		return mav;
	}
	
	@RequestMapping("/mypagePwdUpdateForm.do")
	public String mypagePwdUpdateForm() {
		
		return "mypage/mypagePwdUpdate";
	}
	
	
	//비밀번호 변경
	@RequestMapping("/mypagePwdUpdate.do")
	public ModelAndView mypagePwdUpdate(MemberDTO dto,
			@RequestParam("mem_pwd")String mem_pwd,
			@RequestParam("mem_pwd2")String mem_pwd2,
			@RequestParam("mem_id")String mem_id) {
		
		ModelAndView mav=new ModelAndView();

		if(mem_pwd.equals(mem_pwd2)) {
			int result=dao.mypagePwdUpdate(dto);
			mav.addObject("mem_id", mem_id);
			mav.addObject("msg", "비밀번호 수정 완료!");
			mav.addObject("gourl", "memberProfileForm.do");
			mav.setViewName("mypage/mypageMsg");
		}else {
			mav.addObject("msg", "잘못된 정보입니다 고객센터에 문의해주세요.");
			mav.addObject("gourl", "memberProfileForm.do");
			mav.setViewName("mypage/mypageMsg");
		}
		return mav;
	}
	
	@RequestMapping("/mypageAddrUpdateForm.do")
	public String mypageAddrUpdateForm() {
		
		return "mypage/mypageAddrUpdate";
	}
	
	
	//주소 변경
	@RequestMapping("/mypageAddrUpdate.do")
	public ModelAndView mypageAddrUpdate(MemberDTO dto,
			HttpSession session,
			@RequestParam("mem_zipcode")String mem_zipcode,
			@RequestParam("mem_addr")String mem_addr,
			@RequestParam("mem_detailaddr")String mem_detailaddr) {
		ModelAndView mav = new ModelAndView();
		dto.setMem_id((String)session.getAttribute("sid"));
		int result = dao.mypageAddrUpdate(dto);
		String msg=result>0?"주소변경 성공!":"주소변경 실패!";
		mav.addObject("msg", msg);
		mav.addObject("gourl", "memberProfileForm.do");
		mav.setViewName("mypage/mypagePopupMsg");
		return mav;
	}
	
	@RequestMapping("/mypageEmailUpdateForm.do")
	public String mypageEmailUpdateForm() {
		
		return "mypage/mypageEmailUpdate";
	}
	
	
	//이메일 변경
	@RequestMapping("/mypageEmailUpdate.do")
	public ModelAndView mypageEmailUpdate(
			MemberDTO dto,
			HttpSession session,
			@RequestParam("mem_email") String mem_email) {
		
		ModelAndView mav= new ModelAndView();
		dto.setMem_id((String)session.getAttribute("sid"));
		int result = dao.mypageEmailUpdate(dto);
		String msg=result>0?"이메일 변경 성공!":"이메일 변경 실패!";
		mav.addObject("msg", msg);
		mav.addObject("gourl", "memberProfileForm.do");
		mav.setViewName("mypage/mypagePopupMsg");
		return mav;
		
	}
	
	@RequestMapping("/mypagePhoneUpdateForm.do")
	public String mypagePhoneUpdateForm() {
		
		return "mypage/mypagePhoneUpdate";
	}
	
	
	//전화번호 변경
	@RequestMapping("/mypagePhonUpdate.do")
	public ModelAndView mypagePhoneUpdate(
			MemberDTO dto,
			HttpSession session,
			@RequestParam("mem_phone") String mem_phone) {
		
		ModelAndView mav= new ModelAndView();
		dto.setMem_id((String)session.getAttribute("sid"));
		int result = dao.mypagePhoneUpdate(dto);
		String msg=result>0?"전화번호 변경 성공!":"전화번호 변경 실패!";
		mav.addObject("msg", msg);
		mav.addObject("gourl", "memberProfileForm.do");
		mav.setViewName("mypage/mypagePopupMsg");
		return mav;
		
	}
	
	@RequestMapping("mypageHomeGymLikeList.do")
	public String mypageHomeGymLikeList() {
		
		return "mypage/mypageHomeGymLikeList";
	}
	
	@RequestMapping("mypageCoachMatchLikeList.do")
	public String mypageCoachMatchLikeList() {
		
		return "mypage/mypageCoachMatchLikeList";
	}
	
	@RequestMapping("mypageHomeGymPayList.do")
	public String mypageHomeGymPayList() {
		
		return "mypage/mypageHomeGymPayList";
	}
	
	@RequestMapping("mypageCoachMatchPayList.do")
	public String mypageCoachMatchPayList() {
		
		return "mypage/mypageCoachMatchPayList";
	}
	
	//마이페이지 F&A/고객센터 작성글 목록
	@RequestMapping("/mypageWriteList.do")
	public ModelAndView mypageWriteList(HttpSession session,
			@RequestParam(value = "cp", defaultValue = "1")int cp) {
		
		int totalCnt=dao.mypageWriteListTotalCnt();
		int listSize=3;
		int pageSize=3;
		String pageStr=zipcok.page.MypagePageModule.makePage("mypageWriteList.do", totalCnt, cp, listSize, pageSize);
		List list = dao.mypageWriteList(cp, listSize, (String)session.getAttribute("sid"));
		ModelAndView mav = new ModelAndView();
		mav.addObject("list", list);
		mav.addObject("pageStr", pageStr);
		mav.setViewName("mypage/mypageWriteList");
		
		return mav;
	}
	
	@RequestMapping("/mypageCommWriteList.do")
	public String mypageCommWriteList() {
		
		return "mypage/mypageCommWriteList";
	}
	
	
	//마이페이지 홈짐 좋아요 목록
	@RequestMapping("/mypageHomeGymLikeList.do")
	public ModelAndView mypageHomeGymLikeList(
			HttpSession session,
			@RequestParam(value = "cp", defaultValue = "1")int cp) {
		
		int totalCnt=dao.mypageHomeGymLikeListTotalCnt();
		int listSize=3;
		int pageSize=3;
		String result = dao.likeListKey((String)session.getAttribute("sid"));
		String pageStr=zipcok.page.MypagePageModule.makePage("mypageHomeGymLikeList.do", totalCnt, cp, listSize, pageSize);
		List list = dao.mypageHomeGymLikeList(cp, listSize, (String)session.getAttribute("sid"));
			ModelAndView mav = new ModelAndView();
			mav.addObject("list", list);
			mav.addObject("pageStr", pageStr);
			mav.setViewName("mypage/mypageHomeGymLikeList");

		
		return mav;
	}
	
}
