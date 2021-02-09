package zipcok.controller;

import java.util.*;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import zipcok.comm.model.CommManageDAO;
import zipcok.test.model.Payment_Request_TestDTO;
import zipcok.comm.model.CommunityDTO;

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
		int result=commManageDao.manageCommPlus(com_coach_id);
		String msg=result>0?"커뮤니티 개설 성공! 커뮤니티 관리 페이지에서 활성화해주세요!":"글쓰기 실패!";
		
		ModelAndView mav=new ModelAndView();
		mav.addObject("msg", msg);
		mav.addObject("gopage", "coachMyPageCommManage.do");
		mav.setViewName("comm/commDailyMsg");
		return mav;
	}

}
