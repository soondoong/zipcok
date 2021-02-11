package zipcok.controller;

import java.util.*;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import zipcok.comm.model.CommManageDAO;
import zipcok.test.model.Payment_Request_TestDTO;
import zipcok.comm.model.CommunityDTO;
import zipcok.comm.model.Users_communityDTO;
import zipcok.member.model.MemberDTO;

@Controller
public class CommManageController {
	
	@Autowired
	private CommManageDAO commManageDao;
	
	//커뮤니티 관리 입장
	@RequestMapping("coachMyPageCommManage.do")
	public ModelAndView coachMyPageCommManage(HttpSession session) {
		String id=""+session.getAttribute("coachId");
		List<Payment_Request_TestDTO> list=commManageDao.paymentList(id);
		List<CommunityDTO> list2=commManageDao.manageCommList(id);
		ModelAndView mav=new ModelAndView();
		mav.addObject("paymentlist", list);
		mav.addObject("commlist", list2);
		mav.setViewName("coachMyPage/coachMypageCommManage");
		return mav;
	}
	
	//커뮤니티 추가 팝업
	@RequestMapping("coachMyPageCommPlusForm.do")
	public String coachMyPageCommPlusForm(String com_coach_id) {
		return "coachMyPage/coachMypageCommPlus";
	}
	
	//커뮤니티 만들기
	@RequestMapping("coachMyPageCommPlus.do")
	public ModelAndView coachMyPageCommPlus(String com_coach_id, String com_name) {
		int result=commManageDao.manageCommPlus(com_coach_id,com_name);
		String msg=result>0?"커뮤니티 개설 성공! 커뮤니티 관리 페이지에서 활성화해주세요!":"글쓰기 실패!";
		
		ModelAndView mav=new ModelAndView();
		mav.addObject("msg", msg);
		mav.addObject("gopage", "coachMyPageCommManage.do");
		mav.setViewName("comm/commManageMsg");
		return mav;
	}
	
	//커뮤니티 설정 진입
	@RequestMapping("coachMyPageCommSetting.do")
	public ModelAndView coachMyPageCommSetting(int uc_comm_idx) {
		List<Users_communityDTO> commlist=commManageDao.commUsersList(uc_comm_idx);
		for(int i = 0 ; i < commlist.size() ; i++) {
			String uc_mem_name=commManageDao.commUserGetName(commlist.get(i).getUc_mem_id());
			commlist.get(i).setUc_mem_name(uc_mem_name);
		}
		
		ModelAndView mav=new ModelAndView();
		mav.addObject("commlist", commlist);
		mav.addObject("uc_comm_idx", uc_comm_idx);
		mav.setViewName("coachMyPage/coachMypageCommSetting");
		return mav;
		
	}
	
	//수강생 추가 팝업
	@RequestMapping("coachMyPageMemPlusForm.do")
	public ModelAndView coachMyPagememPlusForm(HttpSession session, int uc_comm_idx) {
		String id=""+session.getAttribute("coachId");
		List<Payment_Request_TestDTO> list=commManageDao.paymentList_finish(id);
		
		ModelAndView mav=new ModelAndView();
		mav.addObject("paymentlist", list);
		mav.addObject("uc_comm_idx", uc_comm_idx);
		mav.setViewName("coachMyPage/coachMypageMemPlusForm");
		return mav;
	}
	
	//수강생 추가
	@RequestMapping("coachMyPageMemPlus.do")
	public ModelAndView coachMyPagememPlus(String uc_mem_id, int uc_comm_idx) {
		String com_name=commManageDao.getCommName(uc_comm_idx);
		int result=commManageDao.commMemPlus(uc_mem_id, uc_comm_idx, com_name);
		int sum=commManageDao.commMemSumPlus(uc_comm_idx);
		String msg=result>0?"수강생 추가가 완료되었습니다.":"수강생 추가 실패!";
		
		ModelAndView mav=new ModelAndView();
		mav.addObject("msg", msg);
		mav.setViewName("comm/commManageMsg");
		return mav;
		
	}

}
