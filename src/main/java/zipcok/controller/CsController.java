package zipcok.controller;

import java.util.List;

import javax.servlet.ServletContext;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import zipcok.cs.model.CsDAO;
import zipcok.cs.model.CsDTO;

@Controller
public class CsController {

	@Autowired
	private CsDAO csDao;
	
	@Autowired
	ServletContext c;
	
	@RequestMapping("csPlzLogin.do")
	public ModelAndView csPlzLogin() {
		ModelAndView mav=new ModelAndView();
		mav.addObject("msg","로그인 후 이용 가능합니다");
		mav.addObject("gopage","csList.do");
		mav.setViewName("cs/csMsg");
		return mav;
	}
	
	//고객센터 리스트뽑기
	@RequestMapping("csList.do")
	public ModelAndView csList(
			@RequestParam(value="cp",defaultValue = "1")int cp) {
		int totalCnt=csDao.getTotalCnt();
		int listSize=10;
		int pageSize=10;
		String pageStr=zipcok.page.PageModule.makePage("csList.do", totalCnt, cp, listSize, pageSize);
		
		List list = csDao.csAllList(cp, listSize);
		ModelAndView mav=new ModelAndView();
		
		mav.addObject("pageStr",pageStr);
		mav.addObject("list",list);
		mav.setViewName("cs/csList");
		return mav;
	}
	
		//고객센터 글쓰기 페이지이동
		@RequestMapping("csWriteView.do")
		public String goCsWriteView() {
			return "cs/csWriteView";
		}
		
		//고객센터 글쓰기
		@RequestMapping("csWrite.do")
		public ModelAndView goCsWrite(CsDTO dto) {
			int result=csDao.csWrite(dto);
			
			String msg=result>0?"문의가 등록되었습니다!":"등록 실패했습니다";
			ModelAndView mav=new ModelAndView();
			mav.addObject("msg",msg);
			mav.addObject("gopage","csList.do");
			mav.setViewName("cs/csMsg");
			return mav;
		}
}
