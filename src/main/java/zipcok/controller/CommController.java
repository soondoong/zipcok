package zipcok.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class CommController {
	
	@RequestMapping("commMain.do")
	public String mainView() {
		return "comm/commMainView";
	}

}
