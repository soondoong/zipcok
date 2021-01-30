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

import zipcok.member.model.MemberDAO;
import zipcok.member.model.MemberDTO;
import zipcok.mypage.model.MypageDAO;

@Controller
public class MypageController {
	
	@Autowired
	private MypageDAO dao;
	
	@Autowired
	ServletContext c;
	
	@RequestMapping("/memberProfileForm.do")
	public ModelAndView memberProfileForm(
			HttpSession session) {
		ModelAndView mav= new ModelAndView();
		MemberDTO dto=dao.memberProfile((String)session.getAttribute("sid"));
		mav.addObject("dto", dto);
		mav.setViewName("mypage/memberProfile");
		return mav;
	}
	
	@RequestMapping("/mypagePwdUpdateForm.do")
	public String mypagePwdUpdateForm() {
		
		return "mypage/mypagePwdUpdate";
	}
	
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
	
	@RequestMapping("mypageLikeList.do")
	public String mypageLikeList() {
		
		return "mypage/mypageLikeList";
	}
	
	
}
