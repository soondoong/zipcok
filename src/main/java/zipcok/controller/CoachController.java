package zipcok.controller;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
import zipcok.coach.*;
import zipcok.coach.model.CoachDAO;
import zipcok.coach.model.MainCoachDTO;

@Controller
public class CoachController {
	@Autowired
	CoachDAO dao;
	
	@RequestMapping("findCoachList.do")
		public ModelAndView gotoCoachList() {
		HashMap<String, List<MainCoachDTO>> map=dao.mainCoachList();
		ModelAndView mav=new ModelAndView();
		mav.addObject("map",map);
		mav.setViewName("coach/coachListView");
		return mav;
	}
	
	
	@RequestMapping("coachMatchingInfo.do")
	public String coachMatchingInfo() {
		return "coach/matchingInfoView";
	}
		
	
	
	@RequestMapping("coachSignInfo.do")
	public String coachSignInfo() {
		return "coach/coachSignInfoView";
	}
		

	

		
		
	
}
