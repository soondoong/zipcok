package zipcok.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class HomeGymController {

	@RequestMapping("HomeGymMain.do")
	public String HomeGymMainForm() {
		return "homegym/hgMain";
	}
	
	@RequestMapping("HomeGymAdd.do")
	public String HomeGymAddForm() {
		return "homegym/hgAddView";
	}
	
	
	@RequestMapping("HomeGymCardAdd.do")
	public String HomeGymCardAddForm() {
		return "homegym/hgCardAddForm";
	}
	
	@RequestMapping("HomeGymList.do")
	public String HomeGymList() {
		return "homegym/hgList";
	}
	
	@RequestMapping("HomeGymContent.do")
	public String HomeGymContent() {
		return "homegym/hgContent";
	}
}
