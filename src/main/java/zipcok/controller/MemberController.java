package zipcok.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MemberController {

	@RequestMapping("/memberJoin.do")
	public String memberJoinForm() {
		return "member/memberJoin";
	}
}
