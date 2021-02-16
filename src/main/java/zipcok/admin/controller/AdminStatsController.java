package zipcok.admin.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class AdminStatsController {

	@RequestMapping("admin_statHomegymSales.do")
	public ModelAndView statHomegymSales() {
		
		ModelAndView mav=new ModelAndView();
		mav.setViewName("admin/admin_stat/admin_statHomegymSales");
		return mav;
	}
	
	@RequestMapping("admin_statCoachSales.do")
	public ModelAndView statCoachSales() {
		
		ModelAndView mav=new ModelAndView();
		mav.setViewName("admin/admin_stat/admin_statCoachSales");
		return mav;
	}
	
	@RequestMapping("admin_statCoachRegist.do")
	public ModelAndView statCoachRegist() {
		
		ModelAndView mav=new ModelAndView();
		mav.setViewName("admin/admin_stat/admin_statCoachRegist");
		return mav;
	}
	
	@RequestMapping("admin_statHomegymRegist.do")
	public ModelAndView statHomeGymRegist() {
		
		ModelAndView mav=new ModelAndView();
		mav.setViewName("admin/admin_stat/admin_statHomegymRegist");
		return mav;
	}
}
