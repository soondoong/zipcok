package zipcok.admin.controller;

import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import zipcok.admin.model.AdminCoachTongGyeDTO;
import zipcok.admin.model.AdminTongGyeDAO;

@Controller
public class AdminStatsController {
		@Autowired
		AdminTongGyeDAO tonggyyedao;
	
	@RequestMapping("admin_statHomegymSales.do")
	public ModelAndView statHomegymSales() {
		
		ModelAndView mav=new ModelAndView();
		mav.setViewName("admin/admin_stat/admin_statHomegymSales");
		return mav;
	}
	/*코치매출통계-============================*코치매출통계*/
	@RequestMapping("admin_statCoachSales.do")
	public ModelAndView statCoachSales() {
		
		ModelAndView mav=new ModelAndView();
		mav.setViewName("admin/admin_stat/admin_statCoachSales");
		return mav;
	}
	
	@RequestMapping("searchCoachTongGye.do")
	public ModelAndView searchCoachTongGye(@RequestParam("startDate") String startDate,
			@RequestParam("endDate") String endDate) {
		ModelAndView mav=new ModelAndView();
		HashMap<String,Object> map = new 	HashMap<String,Object>();
		map.put("startDate",startDate);
		map.put("endDate",endDate);
		AdminCoachTongGyeDTO acdto=  tonggyyedao.searchCoachTongGye(map);
		
		mav.setViewName("jsonView");
		return mav;
	}
	
	/*코치매출통계-============================*코치매출통계*/
	@RequestMapping("admin_statMemberRegist.do")
	public ModelAndView statMemberRegist() {
		
		ModelAndView mav=new ModelAndView();
		mav.setViewName("admin/admin_stat/admin_statMemberRegist");
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
