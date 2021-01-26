package zipcok.controller;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
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
	public ModelAndView loginCheck(
			HttpServletRequest req, HttpServletResponse resp,
			@RequestParam("mem_id")String mem_id,
			@RequestParam("mem_pwd")String mem_pwd,
			HttpSession session) {
		
		ModelAndView mav=new ModelAndView();
		
		String str=mdao.idCheck(mem_id);
		String str2=mdao.pwdCheck(mem_pwd);
		
		//String gourl="";
		//String msg="";
		
		if(str!=null) {
			if(str2.equals(mem_pwd)) {
				String dbname=mdao.getMemberName(mem_id);
				mav.addObject("msg", dbname+"님 환영합니다");
				mav.addObject("gourl", "index.do");
				mav.setViewName("member/loginMsg");
				session.setAttribute("sid", mem_id);
				session.setAttribute("sname", dbname);
				String saveid=req.getParameter("saveid");
				if(saveid==null) {
					Cookie ck=new Cookie("saveid", mem_id);
					ck.setMaxAge(0);
					resp.addCookie(ck);
				}else {
					Cookie ck=new Cookie("saveid", mem_id);
					ck.setMaxAge(60*60*24*30);
					resp.addCookie(ck);
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

	@RequestMapping("/logout.do")
	public String logout(HttpServletRequest req) {
		
		HttpSession session=req.getSession();
		session.invalidate();
		return "redirect:/index.do";
	}
	

	@RequestMapping("/idCheck.do")
	public ModelAndView idCheckSubmit(@RequestParam("mem_id") String mem_id) {
		boolean result=mdao.idCheckDo(mem_id);
		ModelAndView mav=new ModelAndView();
		if(result) {
			mav.addObject("msg", mem_id+"는 이미 가입되어있는 아이디입니다.");
		}else {
			mav.addObject("msg", mem_id+"는 사용가능한 아이디입니다.");
		}
		mav.setViewName("member/idCheck_ok");
		return mav;
	}

	
	
}
