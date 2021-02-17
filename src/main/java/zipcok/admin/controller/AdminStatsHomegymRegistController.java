package zipcok.admin.controller;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import zipcok.admin.model.AdminStatsHomegymRegistDAO;

@Controller
public class AdminStatsHomegymRegistController {
	
	@Autowired
	private AdminStatsHomegymRegistDAO adminStatsHomegymRegistdao;
	
	//홈짐 등록 통계 화면 진입
	@RequestMapping("admin_statHomegymRegist.do")
	public ModelAndView statHomeGymRegist() {
		
		ModelAndView mav=new ModelAndView();
		mav.setViewName("admin/admin_stat/admin_statHomegymRegist");
		return mav;
	}
	
	//홈짐 등록 통계 검색 결과
	@RequestMapping("admin_statHomegymRegistSubmit.do")
	public ModelAndView statHomeGymRegistSubmit(String startDate, String endDate) throws ParseException {
		
		//시작 날짜, 끝 날짜로 배열 만들기
		final String DATE_PATTERN = "yyyy-MM-dd";
		SimpleDateFormat sdf = new SimpleDateFormat(DATE_PATTERN);
		Date startDate_d = sdf.parse(startDate);
		Date endDate_d = sdf.parse(endDate);
		ArrayList<String> dates = new ArrayList<String>();
		Date currentDate = startDate_d;
		while (currentDate.compareTo(endDate_d) <= 0) {
			dates.add(sdf.format(currentDate));
			Calendar c = Calendar.getInstance();
			c.setTime(currentDate);
			c.add(Calendar.DAY_OF_MONTH, 1);
			currentDate = c.getTime();
		}
		List<String> datelist=new ArrayList<String>();
		for (String date : dates) {
			datelist.add(date);
		}
		
		//날짜별로 신규 등록 홈짐 수 구하기
		List<Integer> dateJoinCount=new ArrayList<Integer>();
		for(int i=0;i<datelist.size();i++) {
			dateJoinCount.add(adminStatsHomegymRegistdao.GetNewHomeGymCount(datelist.get(i)));
		}
		
		//날짜별로 그날 활성화 된 홈짐 수 구하기
		List<Integer> dateStatusOnCount=new ArrayList<Integer>();
		for(int i=0;i<datelist.size();i++) {
			dateStatusOnCount.add(adminStatsHomegymRegistdao.GetStatusOnHomeGymCount(datelist.get(i)));
		}
		
		//날짜별로 그날 거래된 홈짐 수 구하기
		List<Integer> datePaymentCount=new ArrayList<Integer>();
		for(int i=0;i<datelist.size();i++) {
			datePaymentCount.add(adminStatsHomegymRegistdao.GetPaymentHomegymCount(datelist.get(i)));
		}
		
		ModelAndView mav=new ModelAndView();
		mav.addObject("datelist", datelist);//시작날짜 ~ 끝날짜 리스트
		mav.addObject("dateJoinCount", dateJoinCount);//홈짐 등록 갯수
		mav.addObject("dateStatusOnCount", dateStatusOnCount);//활성화 된 홈짐 등록 갯수
		mav.addObject("datePaymentCount", datePaymentCount);//거래된 홈짐 갯수
		mav.setViewName("admin/admin_stat/admin_statHomegymRegistSubmit");
		return mav;
	}

}
