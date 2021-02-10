package zipcok.admin.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class AdminMemberController {

	@RequestMapping("admin_memberList.do")
	public String memberList() {
		
		return "admin/admin_member/admin_memberList";
	}
}
