package zipcok.admin.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import zipcok.admin.model.AdminCommDAO;
import zipcok.admin.model.AdminStatsMemberDAO;

@Controller
public class AdminStatsMemberRegistController {
	
	@Autowired
	private AdminStatsMemberDAO adminStatsMemberdao;
	
	//회원 등록 통계 화면 진입
	@RequestMapping("admin_statMemberRegist.do")
	public ModelAndView adminStatMemberRegist() {
		//일반회원, 코치회원 비율
		int sidCount=adminStatsMemberdao.GetMemTypeCount("일반회원");
		int coachIdCount=adminStatsMemberdao.GetMemTypeCount("코치회원");
		
		
		ModelAndView mav=new ModelAndView();
		mav.addObject("sidCount", sidCount);
		mav.addObject("coachIdCount", coachIdCount);
		mav.setViewName("admin/admin_stat/admin_statMemberRegist");
		return mav;
	}

}
