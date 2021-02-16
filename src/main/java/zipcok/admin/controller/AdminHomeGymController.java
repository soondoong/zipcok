package zipcok.admin.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import zipcok.admin.model.AdminHomeGymDAO;
import zipcok.homegym.model.HomeGymDTO;
import zipcok.homegym.model.HomeGymReservationDTO;
import zipcok.member.model.MemberDTO;

@Controller
public class AdminHomeGymController {
	
	@Autowired
	private AdminHomeGymDAO dao;
	/*홈짐관리----------------------------------*/
	//관리자 홈짐관리 페이지이동
	@RequestMapping("admin_homeGymAdmin.do")
	public String adminHomeGymAdmin() {
		
		return "admin/admin_homeGym/admin_homeGymAdmin";
	}
	
	//관리자 홈짐관리 리스트출력
	@RequestMapping("adminHomeGymSearch.do")
	public ModelAndView adminHomeGymSearch(
			@RequestParam(value="cp",defaultValue = "1")int cp,
			@RequestParam(value="searchType",defaultValue = "전체")String searchType,
			@RequestParam(value="searchText")String searchText) {
		if(searchText.equals("") || searchText.length()==0) {
			searchText = "";
		}
		int listSize=1;
	    int pageSize=3;
	    int start=(cp-1)*listSize+1;
		int end=cp*listSize;
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("start", start);
		map.put("end", end);
		map.put("searchType", searchType);
		map.put("searchText", searchText);
		int totalCnt = dao.adminHomeGymSearchTotalCnt(map);
		List<HomeGymDTO> list = dao.adminHomeGymSearch(map);
		
		String keywords = "&searchType="+searchType+"&searchText="+searchText;
		String pageStr = zipcok.page.CoachPageModule.makePage("adminHomeGymSearch.do", totalCnt, cp, listSize, pageSize, keywords);
		
		ModelAndView mav=new ModelAndView();
		mav.addObject("list",list);
		mav.addObject("pageStr",pageStr);
		mav.addObject("searchType",searchType);
		mav.setViewName("admin/admin_homeGym/admin_homeGymAdmin");
		return mav;
	}
	
	/*홈짐관리----------------------------------*/
	
	@RequestMapping("admin_homeGymList.do")
	public String adminHomeGymList() {
		
		return "admin/admin_homeGym/admin_homeGymList";
	}
	
	//관리자 예약조회 페이지이동
	@RequestMapping("admin_homeGymReservation.do")
	public String adminHomeGymReservation() {
		
		return "admin/admin_homeGym/admin_homeGymReservation";
	}
	
	
	//관리자 예약조회 리스트뽑기
	public ModelAndView adminHomeGymReservationSearch(
			@RequestParam(value = "searchContent") String searchContent,
			@RequestParam(value = "type", defaultValue = "전체" ) String type,
			@RequestParam(value = "cp", defaultValue = "1")int cp) {
		
		if(searchContent.equals("") || searchContent.length()==0) {
			searchContent = "noInputMsg";
		}
	
		ModelAndView mav=new ModelAndView();
		HashMap<String, Object> map = new HashMap<String, Object>();
		HashMap<String, Object> keywordMap = new HashMap<String, Object>();
		
		keywordMap.put("keywordText",searchContent);
		keywordMap.put("keywordType",type);
		
		String keywords="&type="+type;
		keywords+="&searchContent="+searchContent;
	    int listSize=3;
	    int pageSize=3;
	    int start=(cp-1)*listSize+1;
		int end=cp*listSize;
		map.put("type", type);
		map.put("searchContent", searchContent);
		map.put("start", start);
		map.put("end", end); 
		
		 List<HomeGymReservationDTO> list = dao.adminHomeGymReservationSearch(map);
		 int totalCnt = dao.adminHomeGymReservationSearchTotalCnt(map)==0?1:dao.adminHomeGymReservationSearchTotalCnt(map);
		 String pageStr=zipcok.page.AdminMemberPageModule.makePage("adminHomeGymReservationSearch.do", totalCnt, cp, listSize, pageSize, keywords);
		    
		 mav.addObject("keyword", keywordMap);
		 mav.addObject("pageStr", pageStr);
		 mav.addObject("list", list);
		
		 mav.setViewName("admin/admin_homeGym/admin_homeGymReservation");
		
		 return mav;
	}
	
	
	
	
	
	
	
	@RequestMapping("admin_homeGymReserveCancel.do")
	public String adminHomeGymReserveCancel() {
		
		return "admin/admin_homeGym/admin_homeGymReserveCancel";
	}
}
