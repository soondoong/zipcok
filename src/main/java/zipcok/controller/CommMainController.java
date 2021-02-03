package zipcok.controller;

import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import zipcok.comm.model.CommunityDTO;
import zipcok.comm.model.CommunityDAO;
import zipcok.comm.model.ExBbsDTO;

@Controller
public class CommMainController {
	
	@Autowired
	private CommunityDAO communityDao;
	
	@Autowired
	ServletContext c;
	
	//커뮤니티 메인 입장
	@RequestMapping("commMain.do")
	public ModelAndView mainView(HttpSession session) {
		String mem_id=(String)session.getAttribute("sid");
		String mem_type="";
		if(mem_id==null) {
			mem_type="코치회원";
			mem_id=(String)session.getAttribute("coachId");
		}else {
			mem_type="일반회원";
		}
		CommunityDTO dto=communityDao.commList(mem_id,mem_type);
		String coachname=communityDao.getCaochName(dto.getCom_coach_id());
		session.setAttribute("com_idx",dto.getCom_idx());
		session.setAttribute("com_coach_id",dto.getCom_coach_id());
		session.setAttribute("com_name",dto.getCom_name());
		session.setAttribute("com_mem_sum",dto.getCom_mem_sum());
		session.setAttribute("com_status",dto.getCom_status());
		session.setAttribute("com_opendate",dto.getCom_opendate());
		session.setAttribute("coach_name",coachname);
		ModelAndView mav=new ModelAndView();
		mav.addObject("comminfo", dto);
		mav.addObject("mem_name",coachname);
		mav.setViewName("comm/commMainView");
		return mav;
	}

}
