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

import zipcok.admin.model.AdminPaymentDetailsDTO;

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
	
	@RequestMapping("admin_homeGymList.do")
	public String adminHomeGymList() {
		
		return "admin/admin_homeGym/admin_homeGymList";
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
		int listSize=5;
	    int pageSize=5;
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

	
	
	
	
	//////////// 예약관리 병모 /////////////

	//관리자 예약조회 페이지이동
	@RequestMapping("admin_homeGymReservation.do")
	public ModelAndView adminHomeGymReservation(@RequestParam(value="cp",defaultValue = "1")int cp) {
		
		ModelAndView mav= new ModelAndView();
		HashMap<String, Object> map = new HashMap<String, Object>();
	
	    int listSize=5;
	    int pageSize=5;
	    int start=(cp-1)*listSize+1;
		int end=cp*listSize;
		map.put("start", start);
		map.put("end", end); 
		
		 List<HomeGymReservationDTO> list = dao.adminHomeGymReservationAll(map);
		 for(int i=0; i<list.size(); i++) {
				list.get(i).setReser_date(list.get(i).getReser_date().substring(0,10));
			}
		 int totalCnt = dao.adminHomeGymReservationAllTotalCnt(map)==0?1:dao.adminHomeGymReservationAllTotalCnt(map);
		 String pageStr=zipcok.page.MypagePageModule.makePage("admin_homeGymReservation.do", totalCnt, cp, listSize, pageSize);
		    
		 mav.addObject("pageStr", pageStr);
		 mav.addObject("list", list);
		
		 mav.setViewName("admin/admin_homeGym/admin_homeGymReservation");
		
		 return mav;
		
	}
	
	
		//관리자 예약조회 상태
		@RequestMapping("adminHomeGymReservationSelect.do")
		public ModelAndView adminHomeGymReservationSelect(
				@RequestParam(value="reservationSelect",defaultValue = "전체")String reservationSelect,
				@RequestParam(value="cp",defaultValue = "1")int cp) {
			
			
			ModelAndView mav=new ModelAndView();
			HashMap<String, Object> map = new HashMap<String, Object>();
			HashMap<String, Object> keywordMap = new HashMap<String, Object>();
			
			keywordMap.put("reservationSelect",reservationSelect);
			
			String keywords="&reservationSelect="+reservationSelect;
		    int listSize=5;
		    int pageSize=5;
		    int start=(cp-1)*listSize+1;
			int end=cp*listSize;
			map.put("reservationSelect", reservationSelect);
			map.put("start", start);
			map.put("end", end); 
			
			 List<HomeGymReservationDTO> list = dao.adminHomeGymReservationSelect(map);
			 for(int i=0; i<list.size(); i++) {
					list.get(i).setReser_date(list.get(i).getReser_date().substring(0,10));
				}
			 int totalCnt = dao.adminHomeGymReservationSelectTotalCnt(map)==0?1:dao.adminHomeGymReservationSelectTotalCnt(map);
			 String pageStr=zipcok.page.AdminMemberPageModule.makePage("adminHomeGymReservationSelect.do", totalCnt, cp, listSize, pageSize, keywords);
			    
			 mav.addObject("keyword", keywordMap);
			 mav.addObject("pageStr", pageStr);
			 mav.addObject("list", list);
			
			 mav.setViewName("admin/admin_homeGym/admin_homeGymReservation");
			
			 return mav;
		}
	
	
	//관리자 예약조회 리스트뽑기
	@RequestMapping("adminHomeGymReservationSearch.do")
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
	    int listSize=5;
	    int pageSize=5;
	    int start=(cp-1)*listSize+1;
		int end=cp*listSize;
		map.put("type", type);
		map.put("searchContent", searchContent);
		map.put("start", start);
		map.put("end", end); 
		
		 List<HomeGymReservationDTO> list = dao.adminHomeGymReservationSearch(map);
		 for(int i=0; i<list.size(); i++) {
				list.get(i).setReser_date(list.get(i).getReser_date().substring(0,10));
			}
		 int totalCnt = dao.adminHomeGymReservationSearchTotalCnt(map)==0?1:dao.adminHomeGymReservationSearchTotalCnt(map);
		 String pageStr=zipcok.page.AdminMemberPageModule.makePage("adminHomeGymReservationSearch.do", totalCnt, cp, listSize, pageSize, keywords);
		    
		 mav.addObject("keyword", keywordMap);
		 mav.addObject("pageStr", pageStr);
		 mav.addObject("list", list);
		
		 mav.setViewName("admin/admin_homeGym/admin_homeGymReservation");
		
		 return mav;
	}
	
	//날짜로 예약 목록 검색
	@RequestMapping("adminHomeGymReservationDate.do")
	public ModelAndView adminHomeGymReservationDate(
			@RequestParam("start_date")String start_date,
			@RequestParam("end_date")String end_date,
			@RequestParam(value = "cp", defaultValue = "1")int cp) {
		
		ModelAndView mav=new ModelAndView();
		HashMap<String, Object> map=new HashMap<String, Object>();
		HashMap<String, Object> keywordMap = new HashMap<String, Object>();
		
		keywordMap.put("keywordStart", start_date);
		keywordMap.put("keywordEnd", end_date);
		
		String keywords="&start_date="+start_date;
		keywords+="&end_date="+end_date;
	    int listSize=5;
	    int pageSize=5;
	    int start=(cp-1)*listSize+1;
		int end=cp*listSize;
		map.put("start_date", start_date);
		map.put("end_date", end_date);
		map.put("start", start);
		map.put("end", end); 
		
		List<HomeGymReservationDTO> list = dao.adminHomeGymReservationDate(map);
		for(int i=0; i<list.size(); i++) {
			list.get(i).setReser_date(list.get(i).getReser_date().substring(0,10));
		}
		int totalCnt = dao.adminHomeGymReservationDateTotalCnt(map)==0?1:dao.adminHomeGymReservationDateTotalCnt(map);
		String pageStr=zipcok.page.AdminMemberPageModule.makePage("adminHomeGymReservationDate.do", totalCnt, cp, listSize, pageSize, keywords);
		
		 mav.addObject("keyword", keywordMap);
		 mav.addObject("pageStr", pageStr);
		 mav.addObject("list", list);
		 mav.setViewName("admin/admin_homeGym/admin_homeGymReservation");
			
		 return mav;
	}
	
	//취소승인 상태변경
	@RequestMapping("reservationUpdateStatus.do")
	public ModelAndView reservationCancelStatus(
			@RequestParam("mem_id")String mem_id) {
		
		System.out.println(mem_id);
		ModelAndView mav = new ModelAndView();
		int result=dao.reservationCancelStatus(mem_id);
		
		mav.addObject("result",result);
		mav.addObject("mem_id",mem_id);
		mav.setViewName("jsonView");
		return mav;
	}
	
	
	////////////예약관리 병모 /////////////
	
	
	
	
	@RequestMapping("admin_homeGymReserveCancel.do")
	public String adminHomeGymReserveCancel() {
		
		return "admin/admin_homeGym/admin_homeGymReserveCancel";
	}
}
