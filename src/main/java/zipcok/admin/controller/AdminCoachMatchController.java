package zipcok.admin.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class AdminCoachMatchController {

	//코치매칭 코치관리 페이지이동
	@RequestMapping("admin_coachMatchAdmin.do")
	public ModelAndView coachMatchAdmin() {
		
		ModelAndView mav=new ModelAndView();
		mav.setViewName("admin/admin_coachMatch/admin_coachMatchAdmin");
		return mav;
	}
	
	//코치매칭 매칭내역관리 페이지이동
	@RequestMapping("admin_coachMatchMatch.do")
	public ModelAndView coachMatchMatch() {
		
		ModelAndView mav=new ModelAndView();
		mav.setViewName("admin/admin_coachMatch/admin_coachMatchMatch");
		return mav;
	}
	
	
	//코치매칭 취소환불관리 페이지이동
	@RequestMapping("admin_coachMatchCancel.do")
	public ModelAndView coachMatchCancel() {
		
		ModelAndView mav=new ModelAndView();
		mav.setViewName("admin/admin_coachMatch/admin_coachMatchCancel");
		return mav;
	}
	
	//코치매칭 개설커뮤니티관리 페이지이동
	@RequestMapping("admin_coachMatchCommunity.do")
	public ModelAndView coachMatchCommunity() {
		
		ModelAndView mav=new ModelAndView();
		mav.setViewName("admin/admin_coachMatch/admin_coachMatchCommunity");
		return mav;
	}
}
