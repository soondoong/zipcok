package zipcok.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class NoticeController {

	@RequestMapping("noticeList.do")
	public ModelAndView goNoticeList() {
		
		ModelAndView mav=new ModelAndView();
		mav.setViewName("notice/noticeList");
		return mav;
	}
}
