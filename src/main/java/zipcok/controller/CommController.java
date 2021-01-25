package zipcok.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import zipcok.comm.model.ExBbsDAO;
import zipcok.comm.model.ExBbsDTO;


@Controller
public class CommController {
	
	@Autowired
	private ExBbsDAO exBbsDao;
	
	@RequestMapping("commMain.do")
	public String mainView() {
		return "comm/commMainView";
	}
	
	@RequestMapping("commDailyList.do")
	public String dailyList() {
		return "comm/commDailyList";
	}
	
	@RequestMapping("commDailyList.do")
	public ModelAndView dailyList(@RequestParam(value="cp",defaultValue = "1")int cp) {
		int totalCnt=exBbsDao.getTotalCnt();
		int listSize=5;
		int pageSize=5;
		String pageStr=zipcok.page.PageModule.makePage("commDailyList.do", totalCnt, cp, listSize, pageSize);
		List list=exBbsDao.dailyList(cp, listSize);
		
		ModelAndView mav=new ModelAndView();
		mav.addObject("list", list);
		mav.addObject("pageStr", pageStr);
		mav.setViewName("comm/commDailyList");
		return mav;
	}
	
	@RequestMapping(value="commDailyWrite.do", method=RequestMethod.GET)
	public String dailyWriteForm() {
		return "comm/commDailyWrite";
	}
	
	@RequestMapping(value="commDailyWrite.do", method=RequestMethod.POST)
	public ModelAndView DailyWriteSubmit(ExBbsDTO dto) {
		int result=exBbsDao.dailyWrite(dto);
		String msg=result>0?"글쓰기 성공!":"글쓰기 실패!";
		ModelAndView mav=new ModelAndView();
		mav.addObject("msg", msg);
		mav.setViewName("comm/commDailyMsg");
		return mav;
	}

}
