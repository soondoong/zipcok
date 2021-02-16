package zipcok.admin.controller;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import zipcok.admin.model.AdminHomeGymDAO;
import zipcok.admin.model.AdminPaymentDetailsDTO;
import zipcok.homegym.model.HomeGymReservationDTO;
import zipcok.member.model.MemberDTO;

@Controller
public class AdminHomeGymController {
	
	@Autowired
	private AdminHomeGymDAO dao;
	
	@RequestMapping("admin_homeGymAdmin.do")
	public String adminHomeGymAdmin() {
		
		return "admin/admin_homeGym/admin_homeGymAdmin";
	}
	
	@RequestMapping("admin_homeGymList.do")
	public String adminHomeGymList() {
		
		return "admin/admin_homeGym/admin_homeGymList";
	}
	
	//관리자 예약조회 페이지이동
	@RequestMapping("admin_homeGymReservation.do")
	public String adminHomeGymReservation() {
		
		return "admin/admin_homeGym/admin_homeGymReservation";
	}
	
		@RequestMapping("adminHomeGymReservationSelect.do")
		public ModelAndView adminHomeGymReservationSelect(
				@RequestParam(value="reservationSelect",defaultValue = "전체")String reservationSelect,
				@RequestParam(value="cp",defaultValue = "1")int cp) {
			
			
			ModelAndView mav=new ModelAndView();
			HashMap<String, Object> map = new HashMap<String, Object>();
			HashMap<String, Object> keywordMap = new HashMap<String, Object>();
			
			keywordMap.put("reservationSelect",reservationSelect);
			
			String keywords="&reservationSelect="+reservationSelect;
		    int listSize=3;
		    int pageSize=3;
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
	    int listSize=3;
	    int pageSize=3;
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
	    int listSize=3;
	    int pageSize=3;
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
	
	
	
	
	
	@RequestMapping("admin_homeGymReserveCancel.do")
	public String adminHomeGymReserveCancel() {
		
		return "admin/admin_homeGym/admin_homeGymReserveCancel";
	}
}
