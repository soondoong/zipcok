package zipcok.controller;

import java.util.List;

import javax.servlet.ServletContext;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import zipcok.comm.model.ExBbsDAO;
import zipcok.comm.model.ExBbsDTO;
import zipcok.comm.model.FoodBbsDAO;

@Controller
public class CommFoodController {
	
	@Autowired
	private FoodBbsDAO foodBbsDao;
	private ExBbsDAO exBbsDao;

	@Autowired
	ServletContext c;
	
	//식단 일지 게시판 목록보기
	@RequestMapping("commFoodList.do")
	public ModelAndView foodList(@RequestParam(value="cp",defaultValue = "1")int cp) {
		int totalCnt=exBbsDao.getTotalCnt();
		int listSize=5;
		int pageSize=5;
		String pageStr=zipcok.page.CommPageModule.makePage("commFoodList.do", totalCnt, cp, listSize, pageSize);
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
	
	@RequestMapping(value="commFoodWrite.do", method=RequestMethod.GET)
	public String foodWriteForm() {
		return "comm/commFoodWrite";
	}
}
