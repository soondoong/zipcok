package zipcok.controller;

import java.util.ArrayList;
import java.util.List;
import java.util.Calendar;
import java.util.Map;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import zipcok.comm.model.CommunityDTO;
import zipcok.comm.model.ExBbsDAO;
import zipcok.comm.model.CommunityDAO;
import zipcok.comm.model.ExBbsDTO;
import zipcok.member.model.MemberAllDTO;
import zipcok.calendar.*;

@Controller
public class CommMainController {
	
	@Autowired
	private CommunityDAO communityDao;
	@Autowired
	private ExBbsDAO exBbsDao;
	
	@Autowired
	ServletContext c;
	
	//커뮤니티 선택 화면 입장
	@RequestMapping("commMainList.do")
	public ModelAndView mainViewList(HttpSession session) {
		String mem_id="";
		String mem_type="";
		String coachname="";
		ModelAndView mav=new ModelAndView();
		mem_id=(String)session.getAttribute("sid");
		//일반 or 코치 or 로그인 검사
		if((String)session.getAttribute("sid")!=null) {
			mem_type="일반회원";
		}else{
			mem_id=(String)session.getAttribute("coachId");
			mem_type="코치회원";
			if(mem_id==null) {
				mav.addObject("msg","로그인 후 이용해주세요!");
				mav.addObject("gopage","index.do");
				mav.setViewName("comm/commDailyMsg");
				return mav;
			}
		}
		List<Integer> com_idx=communityDao.commList(mem_id, mem_type);
		List<CommunityDTO> commInfo=new ArrayList<CommunityDTO>();
		for(int i = 0 ; i < com_idx.size() ; i++) {
			int com_idx_temp=com_idx.get(i);
			CommunityDTO dto=communityDao.getComInfo(com_idx_temp);
			commInfo.add(dto);
		}

		mav.addObject("commInfo",commInfo);
		mav.setViewName("comm/commMainViewList");
		return mav;
		
	}
	
	//커뮤니티 메인 입장
	
	@RequestMapping("commMain.do") 
	public ModelAndView mainView(HttpSession session, @RequestParam("com_idx")int com_idx, DateData dateData) {	 
	
	//커뮤니티 정보 가져와서 세션에 저장
	CommunityDTO dto=communityDao.getComInfo(com_idx);
	String coachname=communityDao.getCaochName(dto.getCom_coach_id());
	session.setAttribute("com_idx",dto.getCom_idx());
	session.setAttribute("com_coach_id",dto.getCom_coach_id());
	session.setAttribute("com_name",dto.getCom_name());
	session.setAttribute("com_mem_sum",dto.getCom_mem_sum());
	session.setAttribute("com_status",dto.getCom_status());
	session.setAttribute("com_opendate",dto.getCom_opendate());
	session.setAttribute("coach_name",coachname);
	
	//코치 가장 최신글 불러오기
	ExBbsDTO recentCnt=exBbsDao.recentCoachContent(dto.getCom_idx(), dto.getCom_coach_id());
	
	//커뮤니티 멤버 리스트 가져오기
	List<String> memberIdList=communityDao.getMemberId(com_idx);
	List<MemberAllDTO> memberList=new ArrayList<MemberAllDTO>();
	for(int i=0;i<memberIdList.size();i++) {
		String id=memberIdList.get(i);
		MemberAllDTO memberdto=communityDao.memberList(id);
		memberList.add(memberdto);
	}
	
	//달력
	Calendar cal = Calendar.getInstance();
	DateData calendarData;
	//검색 날짜
	if(dateData.getDate().equals("")&&dateData.getMonth().equals("")){
		dateData = new DateData(String.valueOf(cal.get(Calendar.YEAR)),String.valueOf(cal.get(Calendar.MONTH)),String.valueOf(cal.get(Calendar.DATE)),null);
	}
	//검색 날짜 end

	Map<String, Integer> today_info =  dateData.today_info(dateData);
	List<DateData> dateList = new ArrayList<DateData>();
	
	//실질적인 달력 데이터 리스트에 데이터 삽입 시작.
	//일단 시작 인덱스까지 아무것도 없는 데이터 삽입
	for(int i=1; i<today_info.get("start"); i++){
		calendarData= new DateData(null, null, null, null);
		dateList.add(calendarData);
	}
	
	//날짜 삽입
	for (int i = today_info.get("startDay"); i <= today_info.get("endDay"); i++) {
		if(i==today_info.get("today")){
			String day="";
			if(i<10) {
				day="0"+String.valueOf(i);
			}else {
				day=String.valueOf(i);
			}
			calendarData= new DateData(String.valueOf(dateData.getYear()), String.valueOf(dateData.getMonth()), day, "today");
		}else{
			String day="";
			if(i<10) {
				day="0"+String.valueOf(i);
			}else {
				day=String.valueOf(i);
			}
			calendarData= new DateData(String.valueOf(dateData.getYear()), String.valueOf(dateData.getMonth()), day, "normal_date");
		}
		dateList.add(calendarData);
	}

	//달력 빈곳 빈 데이터로 삽입
	int index = 7-dateList.size()%7;
	
	if(dateList.size()%7!=0){
		
		for (int i = 0; i < index; i++) {
			calendarData= new DateData(null, null, null, null);
			dateList.add(calendarData);
		}
	}
	
	//날짜에 맞는 게시물 찾기
	List<String> date=new ArrayList<String>();
	for(int i=0;i<dateList.size();i++) {
		String year=dateList.get(i).getYear();
		String month_p=dateList.get(i).getMonth();
		String day=dateList.get(i).getDate();
		String month="";
		if(!month_p.equals("")) {
			int month_i=Integer.parseInt(month_p);
			month_i=month_i+1;
			month=Integer.toString(month_i);
		}
		if(month.equals("1") || month.equals("2") || month.equals("3") || month.equals("4") || month.equals("5")
				 || month.equals("6") || month.equals("7") || month.equals("8") || month.equals("9")) {
			month="0"+month;
		}
		if(day.equals("1") || day.equals("2") || day.equals("3") || day.equals("4") || day.equals("5")
				 || day.equals("6") || day.equals("7") || day.equals("8") || day.equals("9")) {
			day="0"+day;
		}
		String commonMonth=year+month+day;
		if(!commonMonth.equals("")) {
			date.add(commonMonth);
		}
	}
	
	List<ExBbsDTO> dayContent=new ArrayList<ExBbsDTO>();
	ExBbsDTO dayContent_p=new ExBbsDTO();
	List<Integer> group=new ArrayList<Integer>();
	for(int i=0;i<date.size();i++) {
		dayContent_p=communityDao.getDayContent(dto.getCom_coach_id(), date.get(i), dto.getCom_idx());
		dayContent.add(dayContent_p);
		if(dayContent_p!=null) {
			group.add(dayContent_p.getEx_group());
		}
		
	}
	
	//그 날짜에 운동 했는지 안했는지 찾기
	String id="";
	id=(String)session.getAttribute("sid");
	System.out.println(id);
	List<Integer> getDayGroup=new ArrayList<Integer>();
	if(id!=null) {
		for(int i=0;i<group.size();i++) {
			System.out.println(group.get(i));
			getDayGroup.addAll(communityDao.getDayGroup(id, com_idx, group.get(0)));
		}	
	}
	
	System.out.println(getDayGroup.size());
	
	ModelAndView mav=new ModelAndView();
	mav.addObject("comminfo", dto); //커뮤니티 정보
	mav.addObject("recentCnt", recentCnt); //코치 가장 최신 게시물
	mav.addObject("mem_name",coachname); //코치 이름
	mav.addObject("com_idx",dto.getCom_idx()); //커뮤니티 번호
	mav.addObject("memberlist",memberList); //커뮤니티 소속 회원 정보 리스트
	mav.addObject("dateList",dateList); //달력정보
	mav.addObject("today_info",today_info); //오늘 날짜 정보
	mav.addObject("dayContent",dayContent);//날짜에 쓴 코치 게시글
	mav.addObject("getDayGroup",getDayGroup);//답글 남긴 날짜
	mav.setViewName("comm/commMainView"); 
	return mav; 
	}
	 

}
