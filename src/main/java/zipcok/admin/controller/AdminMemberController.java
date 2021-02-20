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
	
	
	
	//관리자 회원 비밀번호 수정Ajax
		@RequestMapping("adminMemberPwdUpdateAjax.do")
		public ModelAndView adminMemberPwdUpdateAjax(
				MemberDTO dto,
				@RequestParam("mem_id") String mem_id,
				@RequestParam("mem_pwd") String mem_pwd) {
			
			ModelAndView mav=new ModelAndView();
			String msg="";
			if(mem_pwd!="") {
				int result=dao.adminMemberPwdUpdate(dto);
				if(result>0){
					msg="관리자님이 회원님의 비밀번호를 수정하였습니다.";			
				}else {
					msg="뭐하냐 똑디해라";		
				}		
			}else{
				msg="관리자님 비밀번호에 공백은 안돼요~.";		
			}
			
			mav.addObject("mem_id", mem_id);
			mav.addObject("msg", msg);		
			mav.setViewName("jsonView");
			return mav;
		}
	
	//관리자 회원 이름 수정
	@RequestMapping("adminMemberNameUpdateAjax.do")
	public ModelAndView adminMemberNameUpdateAjax(
			MemberDTO dto,
			@RequestParam("mem_id") String mem_id,
			@RequestParam("mem_name") String mem_name) {
		
		ModelAndView mav=new ModelAndView();
		String msg="";
		if(mem_name!="") {
			int result=dao.adminMemberNameUpdate(dto);
			if(result>0){
				msg="관리자님이 회원님의 이름을 수정하였습니다.";			
			}else {
				msg="뭐하냐 똑디해라";		
			}		
		}else{
			msg="관리자님 이름에 공백은 안돼요~.";		
		}
		
		mav.addObject("mem_id", mem_id);
		mav.addObject("msg", msg);		
		mav.setViewName("jsonView");
		return mav;
	}
	
	//관리자 회원 폰번호 수정
	@RequestMapping("adminMemberPhoneUpdateAjax.do")
	public ModelAndView adminMemberPhoneUpdateAjax(
			MemberDTO dto,
			@RequestParam("mem_id") String mem_id,
			@RequestParam("mem_phone") String mem_phone) {
		
		ModelAndView mav=new ModelAndView();
		String msg="";
		if(mem_phone!="") {
			int result=dao.adminMemberPhoneUpdate(dto);
			if(result>0){
				msg="관리자님이 회원님의 휴대폰번호를 수정하였습니다.";			
			}else {
				msg="뭐하냐 똑디해라";		
			}		
		}else{
			msg="관리자님 휴대폰번호에 공백은 안돼요~.";		
		}
		
		mav.addObject("mem_id", mem_id);
		mav.addObject("msg", msg);
		mav.setViewName("jsonView");
		return mav;
	}
	
	//관리자 회원 이메일 수정
	@RequestMapping("adminMemberEmailUpdateAjax.do")
	public ModelAndView adminMemberEmaulUpdateAjax(
			MemberDTO dto,
			@RequestParam("mem_id") String mem_id,
			@RequestParam("mem_email") String mem_email) {
		
		ModelAndView mav = new ModelAndView();
		String msg="";
		if(mem_email!="") {
			int result=dao.adminMemberEmailUpdate(dto);
			if(result>0){
				msg="관리자님이 회원님의 이메일을 수정하였습니다.";			
			}else {
				msg="뭐하냐 똑디해라";
			}		
		}else{
			msg="관리자님 이메일에 공백은 안돼요~.";		
		}
		
		mav.addObject("mem_id", mem_id);
		mav.addObject("msg", msg);
		mav.setViewName("jsonView");
		return mav;
	}
	
	
	//관리자 회원 타입 수정
	@RequestMapping("adminMemberTypeUpdateAjax.do")
	public ModelAndView adminMemberTypeUpdateAjax(
			MemberDTO dto,
			@RequestParam("mem_id") String mem_id,
			@RequestParam("mem_type") String mem_type) {
		
		ModelAndView mav=new ModelAndView();
		String msg="";
		
			int result=dao.adminMemberTypeUpdate(dto);
			
			msg="관리자님이 회원님의 회원타입을 수정하였습니다.";			
		
		mav.addObject("mem_id", mem_id);
		mav.addObject("msg", msg);
		mav.setViewName("jsonView");
		return mav;
	}
	
	
	//관리자 주소 수정 팝업띄우기
	@RequestMapping("adminAddrUpdateForm.do")
	public ModelAndView adminAddrUpdateForm(
			@RequestParam("mem_id")String mem_id) {
			
		ModelAndView mav = new ModelAndView();
		
		mav.addObject("mem_id", mem_id);
		mav.setViewName("admin/admin_member/adminAddrUpdatePopup");
		return mav;
	}
	

	//관리자 회원 타입 수정 아작스
	@RequestMapping("adminMemberAddrUpdateAjax.do")
	public ModelAndView adminMemberAddrUpdateAjax(
			@RequestParam("mem_id") String mem_id,
			@RequestParam("mem_zipcode") String mem_zipcode,
			@RequestParam("mem_addr") String mem_addr,
			@RequestParam("mem_detailaddr") String mem_detailaddr) {
		
		ModelAndView mav=new ModelAndView();
		HashMap<String, Object> map = new HashMap<String, Object>();
		String msg="";
		map.put("mem_id", mem_id);
		map.put("mem_zipcode", mem_zipcode);
		map.put("mem_addr", mem_addr);
		map.put("mem_detailaddr", mem_detailaddr);

		
		int result=dao.adminMemberAddrUpdate(map);
			
		msg="관리자님이 회원님의 주소를 수정하였습니다.";			
		
		mav.addObject("mem_id", mem_id);
		mav.addObject("msg", msg);
		mav.setViewName("jsonView");
		return mav;
	}
	

	//관리자 탈퇴회원관리 페이지 이동
	@RequestMapping("admin_delMemberList.do")
	public String adminDelMemberList() {
		
		return "admin/admin_member/admin_delMemberList";
	}
	
	//관리자 탈퇴회원관리 검색리스트 뽑기
	@RequestMapping("adminDelMemberListAction.do")
	public ModelAndView adminDelMemberListAction(
			@RequestParam(value = "searchContent") String searchContent,
			@RequestParam(value = "type", defaultValue = "전체" ) String type,
			@RequestParam(value = "cp", defaultValue = "1")int cp) {
		
	
		ModelAndView mav=new ModelAndView();
		HashMap<String, Object> map = new HashMap<String, Object>();
		HashMap<String, Object> keywordMap = new HashMap<String, Object>();
		
		keywordMap.put("keywordText",searchContent);
		keywordMap.put("keywordType",type);
		
		String keywords="&type="+type;
		keywords+="&searchContent="+searchContent;
	    int listSize=3;
	    int pageSize=3;
	    int start=(cp-1)*listSize+1;
		int end=cp*listSize;
		map.put("type", type);
		map.put("searchContent", searchContent);
		map.put("start", start);
		map.put("end", end); 
	    
	    List<MemberDTO> list = dao.adminDelMemberList(map);
	    int totalCnt = dao.adminDelMemberTotalCnt(map)==0?1:dao.adminDelMemberTotalCnt(map);
	    String pageStr=zipcok.page.AdminMemberPageModule.makePage("adminDelMemberListAction.do", totalCnt, cp, listSize, pageSize, keywords);
	    
	    mav.addObject("keyword", keywordMap);
		mav.addObject("pageStr", pageStr);
		mav.addObject("list", list);
	
		mav.setViewName("admin/admin_member/admin_delMemberList");
		return mav;
	}
	
	//관리자 탈퇴회원 날짜 조건검색
	@RequestMapping("adminDelMemberDate.do")
	public ModelAndView adminDelMemberDate(
			@RequestParam("start_date")String start_date,
			@RequestParam("end_date")String end_date,
			@RequestParam(value = "cp", defaultValue = "1")int cp) {
		
		System.out.println(start_date);
		System.out.println(end_date);
		
		ModelAndView mav=new ModelAndView();
		HashMap<String, Object> map = new HashMap<String, Object>();
		HashMap<String, Object> keywordMap = new HashMap<String, Object>();
		
		keywordMap.put("keywordStart", start_date);
		keywordMap.put("keywordEnd", end_date);
		
		String keywords="&start_date="+start_date;
		keywords+="&end_date="+end_date;
	    int listSize=3;
	    int pageSize=3;
	    int start=(cp-1)*listSize+1;
		int end=cp*listSize;
		map.put("start_date", start_date);
		map.put("end_date", end_date);
		map.put("start", start);
		map.put("end", end); 
		
		List<MemberDTO> list = dao.adminDelMemberDate(map);
		int totalCnt = dao.adminDelMemberDateTotalCnt(map)==0?1:dao.adminDelMemberDateTotalCnt(map);
		String pageStr=zipcok.page.AdminMemberPageModule.makePage("adminDelMemberDate.do", totalCnt, cp, listSize, pageSize, keywords);
		 
	    mav.addObject("keyword", keywordMap);
		mav.addObject("pageStr", pageStr);
		mav.addObject("list", list);
		mav.setViewName("admin/admin_member/admin_delMemberList");
		
		return mav;
	}

	
}
