package zipcok.controller;

import java.util.*;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import zipcok.coach.model.CoachDAO;
import zipcok.coach.model.CurriDTO;
import zipcok.coach.model.RequestFormDTO;
import zipcok.coachmypage.model.CoachMypageDAO;
import zipcok.member.model.MemberDTO;
import zipcok.mypage.model.MypageDAO;

@Controller
public class CoachMypageController {

	@Autowired
	private CoachMypageDAO cdao;
	
	@Autowired
	private CoachDAO dao;
	@Autowired
ServletContext c;
	
	@RequestMapping("/coachMyPage.do")
	public ModelAndView coachMypageProfile(@RequestParam("id")String id) {
		ModelAndView mav=new ModelAndView();
		
		HashMap<String, Object> resultMap = dao.coachProfile(id);
		
		//커리큘럼 2개면 분할해서 보내주기
		if(resultMap.get("curriList") !=null ) {   //등록한 커리큘럼이 있다면
		List<CurriDTO> cr=(List<CurriDTO>)resultMap.get("curriList");
			
			if(cr !=null && cr.size() > 0) {   //등록한 커리큘럼이 있다면
			String one= cr.get(0).getCurri_catename(); //카테고리구분값
	
			List<CurriDTO> oneCurri=new ArrayList<CurriDTO>();
			List<CurriDTO> twoCurri=new ArrayList<CurriDTO>();
					for( int i=0; i<cr.size(); i++){
						String catename=cr.get(i).getCurri_catename();
						if(one.equals(catename)) {
							
							oneCurri.add(cr.get(i)); //curri dto 넣기
							System.out.println("카테하나임");
						}else if(! one.equals(catename)) {
												
							twoCurri.add(cr.get(i)); //curri dto 넣기
							System.out.println("카테두개임");
						}
					}
				mav.addObject("oneCurriList",oneCurri);
				if(twoCurri != null && twoCurri.size() >0) { //다른카테고리가 존재한다면
				mav.addObject("twoCurriList",twoCurri);			
				}
				
		}
		
	}
		mav.addObject("resultMap", resultMap);	
		mav.setViewName("coachMyPage/coachMyPageView");
		
		return mav;
	}
	
	
	
	/*받은요청서 목록가져오기*/
	@RequestMapping("checkRequest.do")
	public ModelAndView checkRequest(@RequestParam("id")String id,
			@RequestParam(value="cp", defaultValue = "1")int cp) {
		
		ModelAndView mav=new ModelAndView();
		
		HashMap<String, Object> map=new HashMap<String, Object>();
		map.put("id", id);
		map.put("methodKey","checkRequest");
		
		/*페이지설정*/
		int totalCnt=dao.getTotalCnt(map); //테이블명써주기
		int listSize=4;
		int pageSize=5;
		String keywords="";  //페이지이동시 검색키워드파라미터로보내기
		String pageStr=zipcok.page.CoachPageModule.makePage("checkRequest.do", totalCnt, cp, listSize, pageSize,keywords);
		
			
		List<RequestFormDTO> list=	dao.searchRequestList(map, cp,listSize); //받은요청서목록정보
		mav.addObject("requestList", list);
	
		mav.setViewName("coachMyPage/checkRequestList");
		return mav;		
	}
	
	
	/*받은요청서 선택삭제하기*/
	@RequestMapping("requestDelete.do")
	public ModelAndView requestDelete(@RequestParam("req_idx")int req_idx,@RequestParam("id")String id) {
		
		int result=cdao.requestDelete(req_idx);
		String msg=result>0?"상담요청서가 삭제되었습니다":"삭제실패";
		System.out.println("-----기능수행------");
		ModelAndView mav=new ModelAndView();
		mav.addObject("msg", msg);
		mav.addObject("gopage", "checkRequest.do?id="+id);
		mav.setViewName("coach/joinMsg");
		return mav;
	}
	
	
		//코치 마이페이지 홈짐 좋아요 목록
		@RequestMapping("/coachMypageHomeGymLikeList.do")
		public ModelAndView mypageHomeGymLikeList(HttpSession session,
				@RequestParam(value = "cp", defaultValue = "1")int cp) {
			
			int totalCnt=cdao.coachMypageHomeGymLikeListTotalCnt((String)session.getAttribute("coachId"));
			int listSize=3;
			int pageSize=3;
			String pageStr=zipcok.page.MypagePageModule.makePage("coachMypageHomeGymLikeList.do", totalCnt, cp, listSize, pageSize);
			List list=cdao.coachMypageHomeGymLikeList(cp, listSize, (String)session.getAttribute("coachId"));
			ModelAndView mav = new ModelAndView();
			mav.addObject("list", list);
			mav.addObject("pageStr", pageStr);
			mav.setViewName("coachMyPage/coachMypageHomeGymLikeList");

			
			return mav;
		}
	
		
		//코치마이페이지 F&A/고객센터 작성글 목록
		@RequestMapping("/coachMypageWriteList.do")
		public ModelAndView mypageWriteList(HttpSession session,
				@RequestParam(value = "cp", defaultValue = "1")int cp) {
			
			int totalCnt=cdao.coachMypageHomeGymLikeListTotalCnt((String)session.getAttribute("coachId"));
			int listSize=3;
			int pageSize=3;
			String pageStr=zipcok.page.MypagePageModule.makePage("coachMypageWriteList.do", totalCnt, cp, listSize, pageSize);
			List list = cdao.coachMypageWriteList(cp, listSize, (String)session.getAttribute("coachId"));
			ModelAndView mav = new ModelAndView();
			mav.addObject("list", list);
			mav.addObject("pageStr", pageStr);
			mav.setViewName("coachMyPage/coachMypageWriteList");
			
			return mav;
		}
	
	
	
}
