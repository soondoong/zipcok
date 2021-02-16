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
		for(int i=0;i<commInfo.size();i++) {
			MemberDTO dto=adminCommDao.searchMember(commInfo.get(i).getCom_coach_id());
			commInfo.get(i).setCom_coach_name(dto.getMem_name());
			
			String actDate=adminCommDao.getActDate(commInfo.get(i).getCom_idx());
			commInfo.get(i).setCom_actdate(actDate);
		}
		
		//최근 활동날짜 구해서 넣기
		
		
		ModelAndView mav=new ModelAndView();
		mav.addObject("commInfo", commInfo);
		mav.addObject("com_name", com_name);
		mav.setViewName("admin/admin_coachMatch/admin_coachMatchCommunityList");
		return mav;
	}
	
	//커뮤니티 선택 후 결과창
	@RequestMapping("admin_coachMatchCommunitySubmit.do")
	public ModelAndView adminCommSearch(String com_name,int com_idx) {
		//위에 결과 유지하기
		List<CommunityDTO> commInfo=adminCommDao.searchComm(com_name);
		for(int i=0;i<commInfo.size();i++) {
			MemberDTO dto=adminCommDao.searchMember(commInfo.get(i).getCom_coach_id());
			commInfo.get(i).setCom_coach_name(dto.getMem_name());
			
			String actDate=adminCommDao.getActDate(commInfo.get(i).getCom_idx());
			commInfo.get(i).setCom_actdate(actDate);
		}
		
		//1. 코치정보
		//커뮤니티 idx로 코치정보 가져오기
		String com_coach_id=adminCommDao.adminGetCoachId(com_idx);
		//코치 아이디로 코치 정보 가져오기
		MemberDTO coach=adminCommDao.searchMember(com_coach_id);
		//관리회원수 가져오기
		int mem_sum=adminCommDao.getComMemSum(com_coach_id);
		
		
		//2. 회원정보
		//커뮤니티 번호로 멤버 리스트 아이디 가져오기
		List<String> memList=adminCommDao.getCommMember(com_idx);
		//아이디들로 회원정보 가져오기
		List<MemberDTO> commMembers=new ArrayList<MemberDTO>();
		for(int i=0;i<memList.size();i++) {
			commMembers.add(adminCommDao.searchMember(memList.get(i)));
		}
		//활동 시작일 가져오기
		List<String> startDate=new ArrayList<String>();
		for(int i=0;i<memList.size();i++) {
			startDate.addAll(adminCommDao.getStartDate(com_idx, memList.get(i)));
		}
		
		//3. 게시판정보
		//총 게시물 수 가져오기
		int allBbsCount=adminCommDao.getAllBbsCount(com_idx);
		//총 댓글 수 가져오기
		int allRepleCount=adminCommDao.getAllRepleCount(com_idx);
		
		//최근 작성일 가져오기
		String act_date=adminCommDao.getActDate(com_idx);
		//활동 회원 수 가져오기
		int act_mem_count=adminCommDao.getActMemSum(com_idx);
		
		ModelAndView mav=new ModelAndView();
		mav.addObject("commInfo", commInfo);
		mav.addObject("com_name", com_name);
		mav.addObject("com_idx", com_idx);
		mav.addObject("coach", coach);//코치정보
		mav.addObject("mem_sum", mem_sum);//코치정보
		mav.addObject("commMembers", commMembers);//커뮤니티 회원 정보
		mav.addObject("allBbsCount",allBbsCount);//총 게시물 수
		mav.addObject("allRepleCount",allRepleCount);//총 댓글 수
		mav.addObject("act_date",act_date);//최근 게시물 올린 날짜
		mav.addObject("act_mem_count",act_mem_count);//활동 회원 수
		mav.setViewName("admin/admin_coachMatch/admin_coachMatchCommunitySubmit");
		return mav;
	}

}
