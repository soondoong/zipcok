package zipcok.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Required;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;


import zipcok.notice.model.NoticeDAO;
import zipcok.notice.model.NoticeDTO;

import java.util.*;
@Controller
public class NoticeController {
	
	@Autowired
	private NoticeDAO noticeDao;

	//공지사항 리스트,페이징
	@RequestMapping("noticeList.do")
	public ModelAndView goNoticeList(
			@RequestParam(value="cp",defaultValue = "1")int cp) {
		int totalCnt=noticeDao.getTotalCnt();
		int listSize=10;
		int pageSize=10;
		String pageStr=zipcok.page.PageModule.makePage("noticeList.do", totalCnt, cp, listSize, pageSize);
		
		List list = noticeDao.noticeAllList(cp, listSize);
		ModelAndView mav=new ModelAndView();
		
		mav.addObject("pageStr",pageStr);
		mav.addObject("list",list);
		mav.setViewName("notice/noticeList");
		return mav;
	}
	
	//공지사항 글쓰기 페이지이동
	@RequestMapping("noticeWriteView.do")
	public String goNoticeWriteView() {
		return "notice/noticeWriteView";
	}
	
	//공지사항 글쓰기
	@RequestMapping("noticeWrite.do")
	public ModelAndView goNoticeWrite(NoticeDTO dto) {
		int result=noticeDao.noticeWrite(dto);
		String msg=result>0?"게시글 등록 성공":"게시글 등록 실패";
		
		ModelAndView mav=new ModelAndView();
		mav.addObject("msg",msg);
		mav.addObject("gopage","noticeList.do");
		mav.setViewName("notice/noticeMsg");
		return mav;
	}
	
	//컨텐츠보기
	@RequestMapping("noticeContent.do")
	public ModelAndView goNoticeContent(
			@RequestParam(value="bbs_idx",defaultValue = "0")int bbs_idx) {
		NoticeDTO dto=noticeDao.noticeContent(bbs_idx);
		noticeDao.noticeReadnum(bbs_idx);//조회수+1해주는 sql 실행
		
		int rnum=noticeDao.findRownum(bbs_idx);
		NoticeDTO prev=noticeDao.noticePrevNext(rnum-1);
		NoticeDTO next=noticeDao.noticePrevNext(rnum+1);
		
		
		ModelAndView mav=new ModelAndView();
		mav.addObject("dto",dto);
		mav.addObject("prev", prev);
		mav.addObject("next",next);
		mav.setViewName("notice/noticeContent");
		return mav;
	}
	
	//카테고리별 리스트검색
	@RequestMapping("noticeSearchList.do")
	public ModelAndView goNoticeSearchList(
			@RequestParam(value="bbs_category",required = false)String bbs_category,
			@RequestParam(value="cp",defaultValue = "1")int cp) {
		int totalCnt=noticeDao.getTotalCnt();
		int listSize=10;
		int pageSize=10;
		String pageStr=zipcok.page.PageModule.makePage("noticeSearchList.do", totalCnt, cp, listSize, pageSize);
		List list=noticeDao.noticeSearchList(cp, listSize, bbs_category);
		
		ModelAndView mav=new ModelAndView();
		mav.addObject("pageStr",pageStr);
		mav.addObject("list",list);
		mav.setViewName("notice/noticeList");
		return mav;
	}
	
	//수정페이지로 이동
	@RequestMapping("noticeUpdateView.do")
	public ModelAndView goNoticeUpdateView(
		@RequestParam(value="bbs_idx",defaultValue = "0")int bbs_idx) {
		NoticeDTO dto=noticeDao.noticeContent(bbs_idx);
		ModelAndView mav=new ModelAndView();
		mav.addObject("dto",dto);
		mav.setViewName("notice/noticeUpdateView");
		return mav;
	}
	
	//수정하기
	@RequestMapping("noticeUpdate.do")
	public ModelAndView goNoticeUpdate(NoticeDTO dto) {
			
			int result=noticeDao.noticeUpdate(dto);
			String msg=result>0?"게시글 수정 성공":"게시글 수정 실패";
			
			ModelAndView mav=new ModelAndView();
			mav.addObject("msg",msg);
			mav.addObject("gopage","noticeList.do");
			mav.setViewName("notice/noticeMsg");
			return mav;
			
	}
	@RequestMapping("noticeDelete.do")
	public ModelAndView goNoticeDelete(String bbs_idx) {
	      int bbs_idx2=Integer.parseInt(bbs_idx);
	      int result=noticeDao.noticeDelete(bbs_idx2);
	      String msg=result>0?"게시글 삭제 성공":"게시글 삭제 실패";
	      
	      ModelAndView mav=new ModelAndView();
	      mav.addObject("msg",msg);
	      mav.addObject("gopage", "noticeList.do");
	      mav.setViewName("notice/noticeMsg");
	      return mav;
	}
}
