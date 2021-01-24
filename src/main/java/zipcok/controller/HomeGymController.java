package zipcok.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class HomeGymController {

	@RequestMapping("HomeGymList.do")
	public String HomeGymList() {
		return "homegym/hgList";
	}
	
	@RequestMapping("HomeGymContent.do")
	public String HomeGymContent() {
		return "homegym/hgContent";
	}
	
	@RequestMapping("HomeGymReservation.do")
	public String HomeGymReservation() {
		return "homegym/hgReservationView";
	}
	
	@RequestMapping("HomeGymUseNotice.do")
	public String HomeGymMainForm() {
		return "homegym/hgUseNotice";
	}
	
	@RequestMapping("HomeGymAddNotice.do")
	public String HomeGymAddNoticeForm() {
		return "homegym/hgAddNotice";
	}
	
	@RequestMapping("HomeGymAdd.do")
	public String HomeGymAddForm() {
		return "homegym/hgAddView";
	}
	
	@RequestMapping("HomeGymCardAdd.do")
	public String HomeGymCardAddForm() {
		return "homegym/hgCardAddView";
	}
}
