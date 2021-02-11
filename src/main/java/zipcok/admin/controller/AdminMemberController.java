package zipcok.admin.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class AdminMemberController {

	@RequestMapping("admin_memberList.do")
	public String memberList() {
		
		return "admin/admin_member/admin_memberList";
	}
	
	
	@RequestMapping("admin_delMemberList.do")
	public String adminDelMemberList() {
		
		return "admin/admin_member/admin_delMemberList";
	}
	
	@RequestMapping("admin_memberStats.do")
	public String adminMemberStats() {
		
		return "admin/admin_member/admin_memberStats";
	}
	
	
	
	
}
