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
	
	/*메인검색페이지 이동*/
	@RequestMapping("findCoachList.do")  
		public ModelAndView gotoCoachList() {
		HashMap<String, List<MainCoachDTO>> map=dao.mainCoachList();
		ModelAndView mav=new ModelAndView();
		mav.addObject("map",map);
		mav.setViewName("coach/coachListView");
		return mav;
	}
	
	/*코치매칭이용안내 이동*/
	@RequestMapping("coachMatchingInfo.do")
	public String coachMatchingInfo() {
		return "coach/matchingInfoView";
	}
			
	/*코치검색했을때 */
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
		int listSize=4;
		int pageSize=5;
		String keywords="&location="+location+"&extype="+extype+"&category="+category;  //페이지이동시 검색키워드파라미터로보내기
		String pageStr=zipcok.page.CoachPageModule.makePage("searchCoach.do", totalCnt, cp, listSize, pageSize,keywords);
		
		
		
		List<MainCoachDTO> list=dao.searchCoachList(keywordMap, cp, listSize);
		ModelAndView mav=new ModelAndView();
		mav.addObject("list", list);	
		mav.addObject("keyword", keywordMap);
		mav.addObject("pageStr",pageStr);//페이지
		//mav.setViewName("jsonView");
		mav.setViewName("coach/searchCoachList");
		return mav;
	}
	
	/*코치등록안내 이동*/
	@RequestMapping("coachRegistInfoView.do")
		public String gotoCoachRegistInfo() {
		return "coach/coachRegistInfoView";
	}
		

	/*코치가입 이동*/
	@RequestMapping("coachRegistView.do")
		public String gotoCoachRegist() {
		return "coach/coachRegistView";
	}
	
	/*코치가입하기 기능*/
	@RequestMapping("coachJoin.do")
	public ModelAndView coachJoin(MainCoachDTO dto) {
		ModelAndView mav=new ModelAndView();
		if(dto.getCoach_mat().equals("")) {
			dto.setCoach_mat("없음");
		}
		
		int result=dao.coachJoin(dto);
		String msg=result>0?"코치로 등록되었습니다":"코치 등록실패";
		mav.addObject("msg", msg);
		mav.addObject("gopage", "index.do");
		mav.setViewName("coach/joinMsg");
		return mav;
	}
		
	
}
