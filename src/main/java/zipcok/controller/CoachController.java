package zipcok.controller;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import zipcok.coach.*;
import zipcok.coach.model.CoachDAO;
import zipcok.coach.model.MainCoachDTO;

@Controller
public class CoachController {
	@Autowired
	CoachDAO dao;
	
	@RequestMapping("findCoachList.do")
		public ModelAndView gotoCoachList() {
		HashMap<String, List<MainCoachDTO>> map=dao.mainCoachList();
		ModelAndView mav=new ModelAndView();
		mav.addObject("map",map);
		mav.setViewName("coach/coachListView");
		return mav;
	}
	
	
	@RequestMapping("coachMatchingInfo.do")
	public String coachMatchingInfo() {
		return "coach/matchingInfoView";
	}
		
	
	
	@RequestMapping("coachSignInfo.do")
	public String coachSignInfo() {
		return "coach/coachSignInfoView";
	}
		

	@RequestMapping("searchCoach.do")
	public ModelAndView searchCoach(@RequestParam(value="location")String location,
			@RequestParam(value="extype")String extype,@RequestParam(value="category")String category,
			@RequestParam(value="cp", defaultValue = "1")int cp) {
		/*키워드 담기*/
		HashMap<String,Object> keywordMap=new HashMap<String,Object>();
		
		keywordMap.put("location",location);
		keywordMap.put("extype",extype);
		keywordMap.put("category",category);
		
		
		
		/*페이지설정*/
		int totalCnt=dao.getTotalCnt(keywordMap); //테이블명써주기
		int listSize=3;
		int pageSize=5;
		String pageStr=zipcok.page.CoachPageModule.makePage("searchCoach.do", totalCnt, cp, listSize, pageSize);
		
		
		
		
		List<MainCoachDTO> list=dao.searchCoachList(keywordMap, cp, listSize);
		ModelAndView mav=new ModelAndView();
		mav.addObject("list", list);	
		mav.addObject("keyword", keywordMap);
		mav.addObject("pageStr",pageStr);//페이지
		//mav.setViewName("jsonView");
		mav.setViewName("coach/searchCoachList");
		return mav;
	}
	

		
		
	
}
