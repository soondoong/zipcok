package zipcok.admin.controller;

import java.sql.Date;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

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
	
	//코치 프로필 활동지역 수정팝업띄우기
	@RequestMapping("flocUpdatePopup.do")
	public ModelAndView adminFlocUpdateForm(
			@RequestParam("coachidText")String coach_mem_id) {
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("coach_mem_id", coach_mem_id);
		mav.setViewName("admin/admin_coachMatch/adminAddrUpdate");
		return mav;
	}
	//코치프로필 활동지역 실제 수정하기
	@RequestMapping("flocUpdate.do")
	public ModelAndView adminFlocUpdate(
			@RequestParam("coach_floc")String coach_floc,
			@RequestParam("coach_sloc")String coach_sloc,
			@RequestParam("coach_mem_id")String coach_mem_id) {
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("coach_floc", coach_floc);
		map.put("coach_sloc", coach_sloc);
		map.put("coach_mem_id", coach_mem_id);
		
		int result = adminCoachMatchDao.adminCoachFlocUpdate(map);
		String msg = result>0?"활동지역을 수정하였습니다	":"에베베베베베베";
		ModelAndView mav = new ModelAndView();
		mav.addObject("msg",msg);
		mav.setViewName("jsonView");
		return mav;
	}
	
	//코치 프로필 소개글 수정
	@RequestMapping("introUpdateSubmitAjax.do")
	public ModelAndView adminCoachIntroUpdate(
			@RequestParam("coach_intro_sub")String coach_intro_sub,
			@RequestParam("coach_intro_cont")String coach_intro_cont,
			@RequestParam("coach_mem_id")String coach_mem_id) {
		
		HashMap<String, Object> map=new HashMap<String, Object>();
		map.put("coach_intro_sub", coach_intro_sub);
		map.put("coach_intro_cont", coach_intro_cont);
		map.put("coach_mem_id", coach_mem_id);
		
		int result=adminCoachMatchDao.adminCoachIntroUpdate(map);
		System.out.println(coach_mem_id);
		String msg=result>0?"소개글을 수정하였습니다":"에베베베베베";
		ModelAndView mav=new ModelAndView();
		mav.addObject("msg",msg);
		mav.addObject("mem_id",coach_mem_id);
		
		mav.setViewName("jsonView");
		return mav;
	}
	
	//코치프로필 준비물 수정
	@RequestMapping("matUpdateSubmitAjax.do")
	public ModelAndView adminCoachMatUpdate(
			@RequestParam("coach_mem_id")String coach_mem_id,
			@RequestParam("coach_mat")String coach_mat) {
		
		HashMap<String, Object> map=new HashMap<String, Object>();
		map.put("coach_mat", coach_mat);
		map.put("coach_mem_id", coach_mem_id);
		
		int result=adminCoachMatchDao.adminCoachMatUpdate(map);
		String msg=result>0?"준비물을 수정하였습니다":"에베베베베베베";
		ModelAndView mav=new ModelAndView();
		mav.addObject("msg", msg);
		mav.addObject("mem_id", coach_mem_id);
		mav.setViewName("jsonView");
		return mav;
	}
	
	//코치프로필 강의유형 수정
	@RequestMapping("extypeUpdateSubmitAjax.do")
	public ModelAndView adminCoachExtypeUpdate(
			@RequestParam("coach_mem_id")String coach_mem_id,
			@RequestParam("coach_ex_type")String coach_ex_type) {
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("coach_mem_id", coach_mem_id);
		map.put("coach_ex_type", coach_ex_type);
		
		int result=adminCoachMatchDao.adminCoachExtypeUpdate(map);
		String msg = result>0?"강의유형을 수정하였습니다":"에베베베베베베";
		ModelAndView mav=new ModelAndView();
		mav.addObject("msg", msg);
		mav.addObject("mem_id", coach_mem_id);
		mav.setViewName("jsonView");
		return mav;
	}
	
	//코치프로필 경력 수정
	@RequestMapping("yearUpdateSubmitAjax.do")
	public ModelAndView adminCoachYearUpdate(
			@RequestParam("coach_year")int coach_year,
			@RequestParam("coach_mem_id")String coach_mem_id) {
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("coach_year", coach_year);
		map.put("coach_mem_id", coach_mem_id);
		int result = adminCoachMatchDao.adminCoachYearUpdate(map);
		String msg = result>0?"코치 경력을 수정하였습니다":"에베베베베베베";
		ModelAndView mav=new ModelAndView();
		mav.addObject("msg", msg);
		mav.addObject("mem_id", coach_mem_id);
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
