package zipcok.admin.controller;

import java.util.*;
import java.text.*;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import zipcok.admin.model.AdminCommDAO;
import zipcok.admin.model.AdminStatsMemberDAO;

@Controller
public class AdminStatsMemberRegistController {
	
	@Autowired
	private AdminStatsMemberDAO adminStatsMemberdao;
	
	//회원 등록 통계 화면 진입
	@RequestMapping("admin_statMemberRegist.do")
	public ModelAndView adminStatMemberRegist() {
		//일반회원, 코치회원 비율
		int sidCount=adminStatsMemberdao.GetMemTypeCount("일반회원");
		int coachIdCount=adminStatsMemberdao.GetMemTypeCount("코치회원");
		
		
		ModelAndView mav=new ModelAndView();
		mav.addObject("sidCount", sidCount);
		mav.addObject("coachIdCount", coachIdCount);
		mav.setViewName("admin/admin_stat/admin_statMemberRegist");
		return mav;
	}
	
	//회원 등록 통계 화면 진입
	@RequestMapping("admin_statMemberRegistSubmit.do")
	public ModelAndView adminStatMemberRegistSubmit(String startDate, String endDate) throws ParseException {
		//일반회원, 코치회원 비율
		int sidCount=adminStatsMemberdao.GetMemTypeCount("일반회원");
		int coachIdCount=adminStatsMemberdao.GetMemTypeCount("코치회원");
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
		
		//날짜별로 가입자 수 구하기
		List<Integer> dateJoinCount=new ArrayList<Integer>();
		for(int i=0;i<datelist.size();i++) {
			dateJoinCount.add(adminStatsMemberdao.GetMemJoinDate(datelist.get(i)));
		}

		//기간 사이 일반 가입자 수 구하기
		//int mem_joindatecountsum=adminStatsMemberdao.GetMemJoinDateCountSum(startDate, endDate);
		
		//날짜별로 탈퇴 회원 수 구하기
		List<Integer> dateOutCount=new ArrayList<Integer>();
		for(int i=0;i<datelist.size();i++) {
			dateOutCount.add(adminStatsMemberdao.GetMemOutDate(datelist.get(i)));
		}
		
		//기간 사이 탈퇴 회원 수 구하기
		//int mem_outdatecountsum=adminStatsMemberdao.GetMemOutDateCountSum(startDate, endDate);
		
		//날짜별로 코치 전환 수 구하기
		List<Integer> coachJoinCount=new ArrayList<Integer>();
		for(int i=0;i<datelist.size();i++) {
			coachJoinCount.add(adminStatsMemberdao.GetCoachJoinDate(datelist.get(i)));
		}
		
		ModelAndView mav=new ModelAndView();
		mav.addObject("sidCount", sidCount);//일반멤버 회원수
		mav.addObject("coachIdCount", coachIdCount);//코치멤버 회원수
		mav.addObject("datelist", datelist);//시작날짜 ~ 끝날짜 리스트
		mav.addObject("dateJoinCount", dateJoinCount);//날짜별 회원 가입 수
		mav.addObject("dateOutCount", dateOutCount);//날짜별 탈퇴 가입 수
		mav.addObject("coachJoinCount", coachJoinCount);//날짜별 코치 전환 수
		//mav.addObject("mem_outdatecountsum", mem_outdatecountsum);//기간 사이 총 탈퇴 수
		//mav.addObject("mem_joindatecountsum", mem_joindatecountsum);//기간 사이 총 가입자 수
		mav.setViewName("admin/admin_stat/admin_statMemberRegistSubmit");
		return mav;
	}

}
