package zipcok.admin.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class AdminHomeGymController {

	
	@RequestMapping("admin_homeGymAdmin.do")
	public String adminHomeGymAdmin() {
		
		return "admin/admin_homeGym/admin_homeGymAdmin";
	}
	
	@RequestMapping("admin_homeGymList.do")
	public String adminHomeGymList() {
		
		return "admin/admin_homeGym/admin_homeGymList";
	}
	
	@RequestMapping("admin_homeGymReservation.do")
	public String adminHomeGymReservation() {
		
		return "admin/admin_homeGym/admin_homeGymReservation";
	}
	
	@RequestMapping("admin_homeGymReserveCancel.do")
	public String adminHomeGymReserveCancel() {
		
		return "admin/admin_homeGym/admin_homeGymReserveCancel";
	}
}
