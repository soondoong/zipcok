package zipcok.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import zipcok.member.model.MemberDAO;
import zipcok.member.model.MemberDTO;

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
	
	
	
	
}
