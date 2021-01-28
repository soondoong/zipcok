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
	public ModelAndView memberProfileForm(HttpSession session) {
		ModelAndView mav= new ModelAndView();
		List list=dao.memberProfile((String)session.getAttribute("sid"));
		mav.addObject("list", list);
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
			mav.addObject("gourl", "index.do");
			mav.setViewName("mypage/mypageMsg");
		}else {
			mav.addObject("msg", "잘못된 정보입니다 고객센터에 문의해주세요.");
			mav.addObject("gourl", "index.do");
			mav.setViewName("mypage/mypageMsg");
		}
		return mav;
	}
	
	
}
