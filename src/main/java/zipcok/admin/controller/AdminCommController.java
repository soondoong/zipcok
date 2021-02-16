package zipcok.admin.controller;

import java.util.*;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import zipcok.admin.model.AdminCommDAO;
import zipcok.comm.model.CommunityDTO;
import zipcok.member.model.MemberDTO;

@Controller
public class AdminCommController {
	
	@Autowired
	private AdminCommDAO adminCommDao;
	
	
	//커뮤니티만 검색후 커뮤니티 검색 결과 띄우기
	@RequestMapping("admin_coachMatchCommunityList.do")
	public ModelAndView adminCommSearchList(String com_name) {
		List<CommunityDTO> commInfo=adminCommDao.searchComm(com_name);
		List<MemberDTO> memInfo=new ArrayList();
		for(int i=0;i<commInfo.size();i++) {
			MemberDTO dto=adminCommDao.searchMember(commInfo.get(i).getCom_coach_id());
			commInfo.get(i).setCom_coach_name(dto.getMem_name());
		}
		
		ModelAndView mav=new ModelAndView();
		mav.addObject("commInfo", commInfo);
		mav.addObject("com_name", com_name);
		mav.addObject("memInfo", memInfo);
		mav.setViewName("admin/admin_coachMatch/admin_coachMatchCommunityList");
		return mav;
	}
	
	//커뮤니티 선택 후 결과창
	@RequestMapping("admin_coachMatchCommunitySubmit.do")
	public ModelAndView adminCommSearch(String com_name,String com_name_submit) {
		//위에 결과 유지하기
		List<CommunityDTO> commInfo=adminCommDao.searchComm(com_name);
		List<MemberDTO> memInfo=new ArrayList();
		for(int i=0;i<commInfo.size();i++) {
			MemberDTO dto=adminCommDao.searchMember(commInfo.get(i).getCom_coach_id());
			commInfo.get(i).setCom_coach_name(dto.getMem_name());
		}
		
		
		//커뮤니티 이름으로 커뮤니티 정보 가져오기
		//CommunityDTO commInfo=adminCommDao.searchComm(com_name);
		//아이디로 회원 정보 가져오기
		//String mem_id=commInfo.getCom_coach_id();
		//MemberDTO memInfo=adminCommDao.searchMember(mem_id);
		//커뮤니티 번호로 멤버 리스트 아이디 가져오기
		//int uc_comm_idx=commInfo.getCom_idx();
		//List<String> memList=adminCommDao.getCommMember(uc_comm_idx);
		//아이디들로 회원정보 가져오기
		//List<MemberDTO> commMembers=new ArrayList<MemberDTO>();
		//for(int i=0;i<memList.size();i++) {
		//	commMembers.add(adminCommDao.searchMember(memList.get(i)));
		//}
		
		ModelAndView mav=new ModelAndView();
		mav.addObject("commInfo", commInfo);
		mav.addObject("com_name", com_name);
		mav.addObject("memInfo", memInfo);
		//mav.addObject("commInfo", commInfo);//커뮤니티 정보
		//mav.addObject("memInfo", memInfo);//코치정보
		//mav.addObject("commMembers", commMembers);//커뮤니티 회원 정보
		mav.setViewName("admin/admin_coachMatch/admin_coachMatchCommunitySubmit");
		return mav;
	}

}
