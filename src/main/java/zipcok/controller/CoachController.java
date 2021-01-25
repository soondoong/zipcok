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
			@RequestParam(value="extype")String extype,@RequestParam(value="category")String category	) {

		HashMap<String,String> keywordMap=new HashMap<String, String>();
	
		keywordMap.put("location",location);
		keywordMap.put("extype",extype);
		keywordMap.put("category",category);
		
		HashMap<String,String> map=new HashMap<String, String>();
		
		if(location.equals("전체지역")) {
			location="";
		}
		
		if(category.equals("모든카테고리")) {
			category="";
		}
		if(extype.equals("모든유형")) {
			extype="면";
		}
		map.put("location",location);
		map.put("extype",extype);
		map.put("category",category);
		
		List<MainCoachDTO> list=dao.searchCoachList(map);
		ModelAndView mav=new ModelAndView();
		mav.addObject("list", list);	
		mav.addObject("keyword", keywordMap);
		//mav.setViewName("jsonView");
		mav.setViewName("coach/searchCoachList");
		return mav;
	}
	

		
		
	
}
