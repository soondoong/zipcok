package zipcok.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import zipcok.comm.model.CommunityDTO;
import zipcok.comm.model.ExBbsDAO;
import zipcok.comm.model.CommunityDAO;
import zipcok.comm.model.ExBbsDTO;

@Controller
public class CommMainController {
	
	@Autowired
	private CommunityDAO communityDao;
	@Autowired
	private ExBbsDAO exBbsDao;
	
	@Autowired
	ServletContext c;
	
	//커뮤니티 선택 화면 입장
	@RequestMapping("commMainList.do")
	public ModelAndView mainViewList(HttpSession session) {
		String mem_id="";
		String mem_type="";
		String coachname="";
		ModelAndView mav=new ModelAndView();
		mem_id=(String)session.getAttribute("sid");
		//일반 or 코치 or 로그인 검사
		if((String)session.getAttribute("sid")!=null) {
			mem_type="일반회원";
		}else{
			mem_id=(String)session.getAttribute("coachId");
			mem_type="코치회원";
			if(mem_id==null) {
				mav.addObject("msg","로그인 후 이용해주세요!");
				mav.addObject("gopage","index.do");
				mav.setViewName("comm/commDailyMsg");
				return mav;
			}
		}
		List<Integer> com_idx=communityDao.commList(mem_id, mem_type);
		List<CommunityDTO> commInfo=new ArrayList<CommunityDTO>();
		for(int i = 0 ; i < com_idx.size() ; i++) {
			int com_idx_temp=com_idx.get(i);
			CommunityDTO dto=communityDao.getComInfo(com_idx_temp);
			commInfo.add(dto);
		}

		mav.addObject("commInfo",commInfo);
		mav.setViewName("comm/commMainViewList");
		return mav;
		
	}
	
	//커뮤니티 메인 입장
	
	@RequestMapping("commMain.do") 
	public ModelAndView mainView(HttpSession session, @RequestParam("com_idx")int com_idx) {	 
	
	CommunityDTO dto=communityDao.getComInfo(com_idx);
	String coachname=communityDao.getCaochName(dto.getCom_coach_id());
	session.setAttribute("com_idx",dto.getCom_idx());
	session.setAttribute("com_coach_id",dto.getCom_coach_id());
	session.setAttribute("com_name",dto.getCom_name());
	session.setAttribute("com_mem_sum",dto.getCom_mem_sum());
	session.setAttribute("com_status",dto.getCom_status());
	session.setAttribute("com_opendate",dto.getCom_opendate());
	session.setAttribute("coach_name",coachname);
	
	ExBbsDTO recentCnt=exBbsDao.recentCoachContent(dto.getCom_idx(), dto.getCom_coach_id());
	
	ModelAndView mav=new ModelAndView();
	mav.addObject("comminfo", dto);
	mav.addObject("recentCnt", recentCnt);
	mav.addObject("mem_name",coachname);
	mav.addObject("com_idx",dto.getCom_idx());
	
	mav.setViewName("comm/commMainView"); 
	return mav; 
	}
	 

}
