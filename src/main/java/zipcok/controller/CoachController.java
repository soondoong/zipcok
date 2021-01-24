package zipcok.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class CoachController {
	
	
	@RequestMapping("findCoachList.do")
		public ModelAndView gotoCoachList() {
		
		ModelAndView mav=new ModelAndView();
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
