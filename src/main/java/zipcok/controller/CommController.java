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
import zipcok.comm.model.ExReBbsDTO;


@Controller
public class CommController {
	
	@Autowired
	private ExBbsDAO exBbsDao;
	
	@RequestMapping("commMain.do")
	public String mainView() {
		return "comm/commMainView";
	}
	
	@RequestMapping("commDailyList.do")
	public ModelAndView dailyList(@RequestParam(value="cp",defaultValue = "1")int cp) {
		int totalCnt=exBbsDao.getTotalCnt();
		int listSize=5;
		int pageSize=5;
		String pageStr=zipcok.page.CommPageModule.makePage("commDailyList.do", totalCnt, cp, listSize, pageSize);
		List<ExBbsDTO> list=exBbsDao.dailyList(cp, listSize);
		for(int i=0;i<list.size();i++) {
			int idx=list.get(i).getEx_idx();
			int recnt=exBbsDao.dailyGetTotalRe(idx);
			int count=exBbsDao.dailySetTotalRe(recnt, idx);
		}
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
	
	@RequestMapping("commDailyContent.do")
	public ModelAndView dailyContent(int ex_idx) {
		int result=exBbsDao.dailyReadnum(ex_idx);
		ExBbsDTO dto=exBbsDao.dailyContent(ex_idx);
		List list=exBbsDao.dailyReList(ex_idx);
		int recnt=exBbsDao.dailyGetTotalRe(ex_idx);
		ModelAndView mav=new ModelAndView();
		mav.addObject("dto", dto);
		mav.addObject("list", list);
		mav.addObject("recnt", recnt);
		mav.setViewName("comm/commDailyContent");
		return mav;
	}
	
	@RequestMapping(value="commDailyUpdate.do", method=RequestMethod.GET)
	public ModelAndView dailyUpdateForm(int ex_idx) {
		ExBbsDTO dto=exBbsDao.dailyContent(ex_idx);
		ModelAndView mav=new ModelAndView();
		mav.addObject("dto", dto);
		mav.setViewName("comm/commDailyUpdate");
		return mav;
	}
	
	@RequestMapping(value="commDailyUpdate.do", method=RequestMethod.POST)
	public ModelAndView dailyUpdateSubmit(ExBbsDTO dto, @RequestParam(value="ex_idx")String idx_s) {
		int ex_idx=Integer.parseInt(idx_s);
		dto.setEx_idx(ex_idx);
		int result=exBbsDao.dailyUpdate(dto);
		String msg=result>0?"글수정 성공!":"글수정 실패!";
		ModelAndView mav=new ModelAndView();
		mav.addObject("msg", msg);
		mav.setViewName("comm/commDailyMsg");
		return mav;
	}
	
	@RequestMapping("commDailyDelete.do")
	public ModelAndView dailyDelete(String ex_idx) {
		int ex_idx2=Integer.parseInt(ex_idx);
		int result=exBbsDao.dailyDelete(ex_idx2);
		String msg=result>0?"글삭제 성공!":"글삭제 실패!";
		ModelAndView mav=new ModelAndView();
		mav.addObject("msg", msg);
		mav.setViewName("comm/commDailyMsg");
		return mav;	
	}
	
	@RequestMapping("commDailyReWrite.do")
	public ModelAndView dailyReWrite(int re_idx, int ex_idx, ExReBbsDTO dto) {
		if(re_idx==0) {
			dto.setRe_sunbun(1);
		}else {
			int max=exBbsDao.dailyGetMaxSunbun(re_idx);
			dto.setRe_sunbun(max);
		}
		dto.setRe_bbs_idx(ex_idx);
		int result=exBbsDao.dailyReWrite(dto);
		String msg=result>0?"댓글 작성 성공!":"댓글 작성 실패!";
		ModelAndView mav=new ModelAndView();
		mav.addObject("msg", msg);
		mav.setViewName("comm/commDailyMsg");
		return mav;
	}
	
	@RequestMapping("commDailyReDelete.do")
	public ModelAndView dailyReDelete(int re_idx) {
		int result=exBbsDao.dailyReDelete(re_idx);
		String msg=result>0?"댓글삭제 성공!":"댓글삭제 실패!";
		ModelAndView mav=new ModelAndView();
		mav.addObject("msg", msg);
		mav.setViewName("comm/commDailyMsg");
		return mav;
	}

}
