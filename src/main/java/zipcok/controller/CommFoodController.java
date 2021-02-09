package zipcok.controller;

import java.util.List;

import javax.servlet.ServletContext;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import zipcok.comm.model.BbsFileDAO;
import zipcok.comm.model.ExBbsDAO;
import zipcok.comm.model.ExBbsDTO;
import zipcok.comm.model.FoodBbsDAO;
import zipcok.comm.model.FoodBbsDTO;

@Controller
public class CommFoodController {
	
	@Autowired
	private FoodBbsDAO foodBbsDao;
	@Autowired
	private ExBbsDAO exBbsDao;
	@Autowired
	private BbsFileDAO bbsFileDao;

	@Autowired
	ServletContext c;
	
	//식단 일지 게시판 목록보기
	@RequestMapping("commFoodList.do")
	public ModelAndView foodList(@RequestParam(value="cp",defaultValue = "1")int cp) {
		int totalCnt=foodBbsDao.getTotalCnt();
		int listSize=5;
		int pageSize=5;
		String pageStr=zipcok.page.CommPageModule.makePage("commFoodList.do", totalCnt, cp, listSize, pageSize);
		List<FoodBbsDTO> list=foodBbsDao.foodList(cp, listSize);
		for(int i=0;i<list.size();i++) {
			int idx=list.get(i).getFood_idx();
			int recnt=foodBbsDao.foodGetTotalRe(idx);
			int count=foodBbsDao.foodSetTotalRe(recnt, idx);
		}
		ModelAndView mav=new ModelAndView();
		mav.addObject("list", list);
		mav.addObject("pageStr", pageStr);
		mav.setViewName("comm/commFoodList");
		return mav;
	}
	
	@RequestMapping(value="commFoodWrite.do", method=RequestMethod.GET)
	public String foodWriteForm() {
		return "comm/commFoodWrite";
	}
}
