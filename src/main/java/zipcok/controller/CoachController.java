package zipcok.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class CoachController {
	
	@RequestMapping("coachMatchingInfo.do")
	public String gotoInfo() {
		return "coach/matchingInfoView";
	}
		
	
	@RequestMapping("findCoachList.do")
		public ModelAndView gotoCoachList() {
		
		ModelAndView mav=new ModelAndView();
		return mav;
	}
	
	

		
		
	
}
