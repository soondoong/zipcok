package zipcok.admin.controller;

import java.util.*;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import zipcok.admin.model.AdminMemberDAO;
import zipcok.member.model.MemberDTO;

@Controller
public class AdminMemberController {

	@Autowired
	private AdminMemberDAO dao;
	
	@RequestMapping("admin_memberList.do")
	public String adminMemberList() {
		
		return "admin/admin_member/admin_memberList";
	}
	
	
	@RequestMapping("adminMemberListAction.do")
	public ModelAndView adminMemberListAction(
			@RequestParam(value = "name") String name,
			@RequestParam(value = "type", defaultValue = "전체") String type,
			@RequestParam(value = "cp", defaultValue = "1")int cp) {
		if(name.equals("") || name.length()==0) {
			name = "";
		}

		ModelAndView mav=new ModelAndView();
		HashMap<String, Object> map = new HashMap<String, Object>();
		HashMap<String, Object> keywordMap = new HashMap<String, Object>();
		
		keywordMap.put("keywordName",name);
		keywordMap.put("keywordType",type);
		
		String keywords="&type="+type;
		keywords+="&name="+name;
	    int listSize=3;
	    int pageSize=3;
	    int start=(cp-1)*listSize+1;
		int end=cp*listSize;
		map.put("type", type);
		map.put("name", name);
		map.put("start", start);
		map.put("end", end); 
	    
	    List<MemberDTO> list = dao.adminMemberList(map);
	    int totalCnt = dao.adminMemberTotalCnt(map)==0?1:dao.adminMemberTotalCnt(map);
	    String pageStr=zipcok.page.AdminMemberPageModule.makePage("adminMemberListAction.do", totalCnt, cp, listSize, pageSize, keywords);
	    
	    mav.addObject("keyword", keywordMap);
	    mav.addObject("totalCnt", totalCnt);
		mav.addObject("pageStr", pageStr);
		mav.addObject("list", list);
	
		mav.setViewName("admin/admin_member/admin_memberList");
		return mav;
	}
	
	
	@RequestMapping("adminMemberManage.do")
	public ModelAndView adminMemberManage(@RequestParam("mem_id") String mem_id) {
		
		ModelAndView mav=new ModelAndView();
		MemberDTO dto2=dao.adminMemberManage(mem_id);
		
		mav.addObject("dto2", dto2);
		mav.setViewName("jsonView");
		
		return mav;
	}
	
	@RequestMapping("adminMemberPwdUpdate.do")
	public ModelAndView adminMemberPwdUpdate(
			@RequestParam("mem_id") String mem_id,
			@RequestParam("mem_pwd") String mem_pwd) {
		
		ModelAndView mav=new ModelAndView();
		String msg="";
		if(mem_pwd!="") {
			int result=dao.adminMemberPwdUpdate(mem_id);
			if(result>0){
				msg="관리자님이 회원님의 비밀번호를 수정하였습니다.";			
			}else {
				msg="뭐하냐 똑디해라";		
			}		
		}else{
			msg="관리자님 비밀번호에 공백은 안돼요~.";		
		}
		
		mav.addObject("msg", msg);
		mav.addObject("gourl", "adminMemberManage.do");
		mav.setViewName("admin/admin_member/admin_memberMsg");
		return mav;
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
