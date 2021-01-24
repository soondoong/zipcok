package zipcok.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class ZipcokController {

	@RequestMapping("zipcokView.do")
	public String zipcokView() {
		return "zipcok/zipcokView";
	}
}
