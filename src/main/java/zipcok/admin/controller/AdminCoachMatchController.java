package zipcok.admin.controller;

import java.sql.Date;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import zipcok.admin.model.AdminCoachMatchDAO;
import zipcok.admin.model.PyoAdDTO;
import zipcok.coach.model.CoachDTO;
import zipcok.member.model.MemberAllDTO;


@Controller
public class AdminCoachMatchController {

	@Autowired
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
			@RequestParam(value="cp",defaultValue = "1")int cp,
			@RequestParam(value="choice",defaultValue = "")String choice,
			@RequestParam(value="mem_gender",defaultValue = "남")String mem_gender,
			@RequestParam(value="searchText", defaultValue = "")String searchText) {
		
		HashMap<String, Object> map=new HashMap<String, Object>();
		ModelAndView mav=new ModelAndView();
//		if(choice.equals("번호")) {
//			int searchText_i=Integer.parseInt(searchText);
//			map.put("searchText", searchText_i);
//		}else {
//			map.put("searchText", searchText);
//		}
		int listSize=5;
	    int pageSize=5;
	    int start=(cp-1)*listSize+1;
		int end=cp*listSize;
		
		String keywords="";
		if(choice.equals("")) {
			
		}
		else if(choice.equals("번호")) {
			keywords="&mem_idx="+searchText+"&mem_gender="+mem_gender;
		}else if(choice.equals("id")) {
			keywords="&mem_id="+searchText+"&mem_gender="+mem_gender;
		}else if(choice.equals("이름")) {
			keywords="&mem_name="+searchText+"&mem_gender="+mem_gender;
		}
		map.put("start", start);
		map.put("end", end);
		map.put("selectoption", choice);
		map.put("mem_gender", mem_gender);
		map.put("searchText", searchText);
		int totalCnt = adminCoachMatchDao.coachMatchTotalCnt(map)==0?1:adminCoachMatchDao.coachMatchTotalCnt(map);
		
		List<MemberAllDTO> List=adminCoachMatchDao.coachMatchSearch(map);
		String pageStr=zipcok.page.AdminMemberPageModule.makePage("admin_coachMatchAdminSearch.do", totalCnt, cp, listSize, pageSize, keywords);
		mav.addObject("selectoption",choice);
		mav.addObject("pageStr", pageStr);
		mav.addObject("List", List);
		
		mav.setViewName("admin/admin_coachMatch/admin_coachMatchAdmin");
		return mav;
	}
	
	
	//코치 아이디 눌렀을때 코치프로필 나오게 하기
	@RequestMapping("adminCoachProfile.do")
	public ModelAndView adminCoachProfile(String coach_mem_id) {
		PyoAdDTO dto2=adminCoachMatchDao.adminToCharDate(coach_mem_id);
		
		CoachDTO dto=adminCoachMatchDao.adminCoachProfile(coach_mem_id);
		
		ModelAndView mav=new ModelAndView();
		mav.addObject("dto2",dto2);
		mav.addObject("coachdto",dto);
		mav.setViewName("jsonView");
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
