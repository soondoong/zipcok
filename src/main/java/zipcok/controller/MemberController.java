package zipcok.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import zipcok.member.model.MemberDAO;
import zipcok.member.model.MemberDTO;

import java.util.*;

@Controller
public class MemberController {

	@Autowired
	private MemberDAO mdao;
	
	@RequestMapping("/memberJoinForm.do")
	public String memberJoinForm() {
		return "member/memberJoin";
	}
	
	
	//memberJoinTest 보류
	//@RequestMapping("/memberJoinForm2.do")
	//public String memberJoinForm2() {
		//return "member/memberJoinTest";
	//}
	
	@RequestMapping("/memberJoin.do")
	public ModelAndView memberJoinSubmit(MemberDTO dto) {
		int result=mdao.memberJoinSubmit(dto);
		String msg=result>0?"회원가입 성공!":"회원가입 실패!";
		ModelAndView mav=new ModelAndView();
		mav.addObject("msg", msg);
		mav.setViewName("member/memberMsg");
		return mav;
	}
	
	@RequestMapping("/loginForm.do")
	public String loginForm() {
		
		return "member/login";
	}
	
	@RequestMapping("/login.do")
	public ModelAndView loginCheck(MemberDTO dto,
			@RequestParam("mem_id")String mem_id,
			@RequestParam("mem_pwd")String mem_pwd,
			HttpSession session) {
		
		ModelAndView mav=new ModelAndView();
		
		int result=mdao.loginCheck(dto);
		
		if(result>0) {
			if(dto.getMem_id().equals(mem_id)) {
				if(dto.getMem_pwd().equals(mem_pwd)) {
					
					mav.addObject("msg", mem_id+"님 환영합니다");
					mav.setViewName("member/login_ok");
					session.setAttribute("sid", mem_id);
				}
			}else {
				mav.addObject("msg", "아이디 또는 비밀번호가 잘못되었습니다");
				mav.addObject("gourl", "loginForm.do");
				mav.setViewName("member/loginMsg");
			}
			
		}else {
			mav.addObject("msg", "아이디 또는 비밀번호가 잘못되었습니다");
			mav.addObject("gourl", "loginForm.do");
			mav.setViewName("member/loginMsg");
		}
		return mav;
	}

	
	
	
	
	
	
	

	
	
}
