package zipcok.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import zipcok.notice.model.NoticeDAO;
import zipcok.notice.model.NoticeDTO;

@Controller
public class NoticeController {
	
	@Autowired
	private NoticeDAO noticeDao;

	@RequestMapping("noticeList.do")
	public ModelAndView goNoticeList() {
		
		ModelAndView mav=new ModelAndView();
		mav.setViewName("notice/noticeList");
		return mav;
	}
	
	@RequestMapping("noticeWriteView.do")
	public String goNoticeWriteView() {
		return "notice/noticeWriteView";
	}
	
	@RequestMapping("noticeWrite.do")
	public ModelAndView goNoticeWrite(NoticeDTO dto) {
		int result=noticeDao.noticeWrite(dto);
		String msg=result>0?"게시물 등록 성공":"게시물 등록 실패";
		
		ModelAndView mav=new ModelAndView();
		mav.addObject("msg",msg);
		mav.addObject("gopage","noticeList.do");
		mav.setViewName("notice/noticeMsg");
		return mav;
	}
}
