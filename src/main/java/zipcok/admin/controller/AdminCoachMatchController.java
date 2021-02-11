package zipcok.admin.controller;

import java.util.HashMap;
import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import zipcok.admin.model.AdminCoachMatchDAO;
import zipcok.member.model.MemberAllDTO;


@Controller
public class AdminCoachMatchController {

	private AdminCoachMatchDAO adminCoachMatchDao;
	
	//코치매칭 코치관리 페이지이동
	@RequestMapping("admin_coachMatchAdmin.do")
	public ModelAndView coachMatchAdmin() {
		
		ModelAndView mav=new ModelAndView();
		mav.setViewName("admin/admin_coachMatch/admin_coachMatchAdmin");
		return mav;
	}
	
	//코치검색했을 때 나오는 리스트
	@RequestMapping("admin_coachMatchAdminSearch.do")
	public ModelAndView coachSearchList(
			@RequestParam(value="choice",defaultValue = "번호")String choice,
			@RequestParam(value="mem_gender",defaultValue = "남")String mem_gender) {
		
		HashMap<String, Object> map=new HashMap<String, Object>();
		ModelAndView mav=new ModelAndView();
		map.put("choice", choice);
		map.put("mem_gender", mem_gender);
		
		List<MemberAllDTO> List=adminCoachMatchDao.coachMatchSearch(map);
		mav.addObject("List", List);
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
