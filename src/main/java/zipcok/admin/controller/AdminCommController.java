package zipcok.admin.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import zipcok.admin.model.AdminCommDAO;
import zipcok.comm.model.CommunityDTO;
import zipcok.member.model.MemberDTO;

@Controller
public class AdminCommController {
	
	@Autowired
	private AdminCommDAO adminCommDao;
	
	
	//커뮤니티만 검색후 커뮤니티 검색 결과 띄우기
	@RequestMapping("admin_coachMatchCommunityList.do")
	public ModelAndView adminCommSearchList(String com_name) {
		CommunityDTO commInfo=adminCommDao.searchComm(com_name);
		MemberDTO memInfo=adminCommDao.searchMember(commInfo.getCom_coach_id());
		
		ModelAndView mav=new ModelAndView();
		mav.addObject("commInfo", commInfo);
		mav.addObject("memInfo", memInfo);
		mav.setViewName("admin/admin_coachMatch/admin_coachMatchCommunityList");
		return mav;
	}
	
	//커뮤니티 선택 후 결과창
	@RequestMapping("admin_coachMatchCommunitySubmit.do")
	public ModelAndView adminCommSearch(String com_name) {
		CommunityDTO commInfo=adminCommDao.searchComm(com_name);
		String mem_id=commInfo.getCom_coach_id();
		MemberDTO memInfo=adminCommDao.searchMember(mem_id);
		
		ModelAndView mav=new ModelAndView();
		mav.addObject("commInfo", commInfo);
		mav.addObject("memInfo", memInfo);
		mav.setViewName("admin/admin_coachMatch/admin_coachMatchCommunitySubmit");
		return mav;
	}

}
