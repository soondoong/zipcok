package zipcok.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class AdminMainController {

	@RequestMapping("adminMainPage.do")
	public String adminMainPageForm() {
		
		return "admin/adminMainPage";
	}
	
	
}
