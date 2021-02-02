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
		List<CommunityDTO> list=communityDao.commList(mem_id,mem_type);
		ModelAndView mav=new ModelAndView();
		mav.addObject("list", list);
		mav.setViewName("comm/commMainView");
		return mav;
	}

}
