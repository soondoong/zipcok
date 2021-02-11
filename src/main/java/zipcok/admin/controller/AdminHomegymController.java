package zipcok.admin.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class AdminHomegymController {

	//홈짐관리 페이지이동
	@RequestMapping("admin_homeGymAdmin.do")
	public String adminHomeGymAdmin() {
		
		return "admin/admin_homeGym/admin_homeGymAdmin";
	}
	
	//홈짐리스트 페이지이동
	@RequestMapping("admin_homeGymList.do")
	public String adminHomeGymList() {
		
		return "admin/admin_homeGym/admin_homeGymList";
	}
	
	//홈짐 예약조회 페이지 이동
	@RequestMapping("admin_homeGymReservation.do")
	public ModelAndView adminHomeGymReservation() {
		
		ModelAndView mav=new ModelAndView();
		mav.setViewName("admin/admin_homeGym/admin_homeGymReservation");
		return mav;
	}
	
	//홈짐 예약취소내역 페이지이동
	@RequestMapping("admin_homeGymReserveCancel.do")
	public ModelAndView adminHomeGymReserveCancel() {
		
		ModelAndView mav=new ModelAndView();
		mav.setViewName("admin/admin_homeGym/admin_homeGymReserveCancel");
		return mav;
	}
}
