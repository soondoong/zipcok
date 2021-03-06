package zipcok.admin.controller;

import java.sql.Date;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.swing.ListModel;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import zipcok.admin.model.AdminCoachMatchDAO;
import zipcok.admin.model.AdminPaymentDetailsDTO;
import zipcok.admin.model.PyoAdDTO;

import zipcok.coach.model.CoachDAO;

import zipcok.admin.model.ReqFormMemberDTO;
import zipcok.chat.model.ChatDAO;
import zipcok.chat.model.MessageDTO;
import zipcok.coach.model.CoachDTO;
import zipcok.coach.model.RequestFormDTO;
import zipcok.coachmypage.model.CoachMypageDAO;
import zipcok.cpayment.model.Payment_RequestDTO;
import zipcok.homegym.model.Pd_AllDTO;
import zipcok.member.model.MemberAllDTO;
import zipcok.mypage.model.MypageDAO;


@Controller
public class AdminCoachMatchController {

	@Autowired
	private AdminCoachMatchDAO adminCoachMatchDao;
	@Autowired
	private CoachDAO coachdao;
	@Autowired
	private CoachMypageDAO coachmpdao;
	@Autowired
	private MypageDAO myPagedao;
	@Autowired
	private ChatDAO chatdao;
	
	//코치매칭 코치관리 페이지이동
	@RequestMapping("admin_coachMatchAdmin.do")
	public ModelAndView coachMatchAdmin() {
		
		ModelAndView mav=new ModelAndView();
		mav.setViewName("admin/admin_coachMatch/admin_coachMatchAdmin");
		return mav;
	}
	
	//이기능안쓰기로함
	@RequestMapping("searchPdByid.do")
	public ModelAndView searchPdByid(@RequestParam("mem_id")String mem_id,
			@RequestParam(value="cp", defaultValue = "1")int cp) {
		ModelAndView mav=new ModelAndView();
		int listSize=5;
		int pageSize=5;
	      HashMap<String,Object> map = new HashMap<String, Object>();
	      map.put("mem_id",mem_id);
	      map.put("cp",cp);
	      map.put("ls",listSize);
	      map.put("methodKey","CmPaymentListTotal");
		/*페이지설정*/
		int totalCnt=coachdao.getTotalCnt(map);

		String pageStr=zipcok.page.AjaxPagingModuleSY.makePage(totalCnt, cp, listSize, pageSize,"Pdpageclick");
		 
		List<Pd_AllDTO> pdList=coachmpdao.CmPaymentList(map);
	
		//후기존재하는지여부체크
		map.put("pdSenderKey","pd_target_id");
		map.put("pdKey","코치");
		List review_idxList= myPagedao.reviewExistCheck(map);
		mav.addObject("review_idxList", review_idxList);
		mav.addObject("pdList", pdList);
		mav.addObject("pageStr", pageStr);
		mav.setViewName("jsonView");
		return mav;
	}
	
	
	
	/*코치채팅방 메시지내역불러오기*/
	@RequestMapping("searchMessages.do")
	public ModelAndView searchMessages(@RequestParam("req_idx")int req_idx,
			@RequestParam(value ="sunseo", defaultValue = "최신순")String sunseo,
			@RequestParam(value="cp", defaultValue = "1")int cp) {
		ModelAndView mav=new ModelAndView();
		
		int listSize=5;
		int pageSize=5;
	      HashMap<String,Object> map = new HashMap<String, Object>();
	      map.put("req_idx",req_idx);
	      map.put("sunseo",sunseo);
	      map.put("cp",cp);
	      map.put("ls",listSize);
	      map.put("methodKey","searchMessagesTotal");
	  	/*페이지설정*/
			int totalCnt=coachdao.getTotalCnt(map);
		//req_idx 로 채팅방메시지전부찾기
		List<MessageDTO> msglist= adminCoachMatchDao.searchAllMessagesByReqIdx(map);
	
		String pageStr=zipcok.page.AjaxPagingModuleSY.makePage(totalCnt, cp, listSize, pageSize,"msgpageclick");
		 

		mav.addObject("MsgList", msglist);
		mav.addObject("pageStr", pageStr);
		mav.setViewName("jsonView");
		return mav;
	}
	
	
	
	/*관리자가 메시지 제어하기*/
	@RequestMapping("messageManage.do")
	public ModelAndView messageManage(@RequestParam("type")String type,
			@RequestParam("msg_idx")int msg_idx) {
		ModelAndView mav=new ModelAndView();
		 HashMap<String,Object> map = new HashMap<String, Object>();
	      String newcont="관리자에 의해 내용이 삭제되었습니다.";
		if(type.equals("텍스트")) {
			map.put("msg_idx",msg_idx);
		    map.put("type",type);
		    map.put("newcontent",newcont);
		    int count =  adminCoachMatchDao.MessagesManage(map);
		    String msg =count>0?"메시지를 수정처리하였습니다.":"메시지수정실패";
		    String okcheck = count>0?"성공":"실패";
		    mav.addObject("okcheck", okcheck);
		    mav.addObject("msg", msg);
			mav.setViewName("jsonView");
		
		}else {
			//결제요청서 상태가 상담중일때만 가능
				map.put("msg_idx",msg_idx);
			    map.put("type",type);
			    map.put("newcontent",newcont);
				Payment_RequestDTO prdto = adminCoachMatchDao.findPaymentReqByMsgIdx(map);
				if(prdto.getPr_status().equals("상담중")) {
					
				   int count = adminCoachMatchDao.MessagesManage(map);
				   count+= adminCoachMatchDao.MessagesPaymentReqManage(map);
				    String msg =count>0?"메시지와 요청서를 수정처리하였습니다.":"메시지수정실패";
				    String okcheck = count>0?"성공":"실패";
				    mav.addObject("okcheck", okcheck);
				    mav.addObject("msg", msg);
					mav.setViewName("jsonView");
					
				}else {
				   
				    mav.addObject("okcheck", "실패");
				    mav.addObject("msg", "결제완료된 요청서는 처리할수없습니다.");
					mav.setViewName("jsonView");
					
				}
			
			
			
		}
	
		return mav;  
	}
	
	
	
	
	//코치검색했을 때 나오는 리스트
	@RequestMapping("admin_coachMatchAdminSearch.do")
	public ModelAndView coachSearchList(
			@RequestParam(value="cp",defaultValue = "1")int cp,
			@RequestParam(value="choice",defaultValue = "")String choice,
			@RequestParam(value="mem_gender",defaultValue = "남")String mem_gender,
			@RequestParam(value="searchText", defaultValue = "")String searchText) {
		
		HashMap<String, Object> map=new HashMap<String, Object>();
		ModelAndView mav=new ModelAndView();
//		if(choice.equals("번호")) {
//			int searchText_i=Integer.parseInt(searchText);
//			map.put("searchText", searchText_i);
//		}else {
//			map.put("searchText", searchText);
//		}
		int listSize=5;
	    int pageSize=5;
	    int start=(cp-1)*listSize+1;
		int end=cp*listSize;
		
		String keywords="";
		if(choice.equals("")) {
			
		}
		else if(choice.equals("번호")) {
			keywords="&mem_idx="+searchText+"&mem_gender="+mem_gender;
		}else if(choice.equals("id")) {
			keywords="&mem_id="+searchText+"&mem_gender="+mem_gender;
		}else if(choice.equals("이름")) {
			keywords="&mem_name="+searchText+"&mem_gender="+mem_gender;
		}
		map.put("start", start);
		map.put("end", end);
		map.put("selectoption", choice);
		map.put("mem_gender", mem_gender);
		map.put("searchText", searchText);
		int totalCnt = adminCoachMatchDao.coachMatchTotalCnt(map)==0?1:adminCoachMatchDao.coachMatchTotalCnt(map);
		
		List<MemberAllDTO> List=adminCoachMatchDao.coachMatchSearch(map);
		String pageStr=zipcok.page.AdminMemberPageModule.makePage("admin_coachMatchAdminSearch.do", totalCnt, cp, listSize, pageSize, keywords);
		mav.addObject("selectoption",choice);
		mav.addObject("pageStr", pageStr);
		mav.addObject("List", List);
		
		mav.setViewName("admin/admin_coachMatch/admin_coachMatchAdmin");
		return mav;
	}
	
	
	//코치 아이디 눌렀을때 코치프로필 나오게 하기
	@RequestMapping("adminCoachProfile.do")
	public ModelAndView adminCoachProfile(String coach_mem_id) {
		PyoAdDTO dto2=adminCoachMatchDao.adminToCharDate(coach_mem_id);
		
		CoachDTO dto=adminCoachMatchDao.adminCoachProfile(coach_mem_id);
		MemberAllDTO dto3=adminCoachMatchDao.coachNameCall(coach_mem_id);
		
		
		/*수연추가*/
		HashMap<String, Object> coachmap =   coachdao.coachProfile(coach_mem_id); //기본정보,카테고리,후기,사진까지
		
		ModelAndView mav=new ModelAndView();
		mav.addObject("dto2",dto2);
		mav.addObject("coachdto",dto);
		mav.addObject("dto3",dto3);
		
		mav.addObject("coachmap", coachmap);
		mav.setViewName("jsonView");
		return mav;
	}
	
	//코치 프로필 활동지역 수정팝업띄우기
	@RequestMapping("flocUpdatePopup.do")
	public ModelAndView adminFlocUpdateForm(
			@RequestParam("coachidText")String coach_mem_id) {
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("coach_mem_id", coach_mem_id);
		mav.setViewName("admin/admin_coachMatch/adminAddrUpdate");
		return mav;
	}
	
	
	//코치프로필 활동지역 실제 수정하기
	@RequestMapping("flocUpdate.do")
	public ModelAndView adminFlocUpdate(
			@RequestParam("coach_floc")String coach_floc,
			@RequestParam("coach_sloc")String coach_sloc,
			@RequestParam("coach_mem_id")String coach_mem_id) {

		
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("coach_floc", coach_floc);
		map.put("coach_sloc", coach_sloc);
		map.put("coach_mem_id", coach_mem_id);
		
		int result = adminCoachMatchDao.adminCoachFlocUpdate(map);
		String msg = result>0?"활동지역을 수정하였습니다	":"에베베베베베베";
		ModelAndView mav = new ModelAndView();
		mav.addObject("msg",msg);
		mav.setViewName("jsonView");
		return mav;
	}
	
	//코치 프로필 소개글 수정
	@RequestMapping("introUpdateSubmitAjax.do")
	public ModelAndView adminCoachIntroUpdate(
			@RequestParam("coach_intro_sub")String coach_intro_sub,
			@RequestParam("coach_intro_cont")String coach_intro_cont,
			@RequestParam("coach_mem_id")String coach_mem_id) {
		
		HashMap<String, Object> map=new HashMap<String, Object>();
		map.put("coach_intro_sub", coach_intro_sub);
		map.put("coach_intro_cont", coach_intro_cont);
		map.put("coach_mem_id", coach_mem_id);
		
		int result=adminCoachMatchDao.adminCoachIntroUpdate(map);
		System.out.println(coach_mem_id);
		String msg=result>0?"소개글을 수정하였습니다":"에베베베베베";
		ModelAndView mav=new ModelAndView();
		mav.addObject("msg",msg);
		mav.addObject("mem_id",coach_mem_id);
		
		mav.setViewName("jsonView");
		return mav;
	}
	
	//코치프로필 준비물 수정
	@RequestMapping("matUpdateSubmitAjax.do")
	public ModelAndView adminCoachMatUpdate(
			@RequestParam("coach_mem_id")String coach_mem_id,
			@RequestParam("coach_mat")String coach_mat) {
		
		HashMap<String, Object> map=new HashMap<String, Object>();
		map.put("coach_mat", coach_mat);
		map.put("coach_mem_id", coach_mem_id);
		
		int result=adminCoachMatchDao.adminCoachMatUpdate(map);
		String msg=result>0?"준비물을 수정하였습니다":"에베베베베베베";
		ModelAndView mav=new ModelAndView();
		mav.addObject("msg", msg);
		mav.addObject("mem_id", coach_mem_id);
		mav.setViewName("jsonView");
		return mav;
	}
	
	//코치프로필 강의유형 수정
	@RequestMapping("extypeUpdateSubmitAjax.do")
	public ModelAndView adminCoachExtypeUpdate(
			@RequestParam("coach_mem_id")String coach_mem_id,
			@RequestParam("coach_ex_type")String coach_ex_type) {
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("coach_mem_id", coach_mem_id);
		map.put("coach_ex_type", coach_ex_type);
		
		int result=adminCoachMatchDao.adminCoachExtypeUpdate(map);
		String msg = result>0?"강의유형을 수정하였습니다":"에베베베베베베";
		ModelAndView mav=new ModelAndView();
		mav.addObject("msg", msg);
		mav.addObject("mem_id", coach_mem_id);
		mav.setViewName("jsonView");
		return mav;
	}
	
	//코치프로필 경력 수정
	@RequestMapping("yearUpdateSubmitAjax.do")
	public ModelAndView adminCoachYearUpdate(
			@RequestParam("coach_year")int coach_year,
			@RequestParam("coach_mem_id")String coach_mem_id) {
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("coach_year", coach_year);
		map.put("coach_mem_id", coach_mem_id);
		int result = adminCoachMatchDao.adminCoachYearUpdate(map);
		String msg = result>0?"코치 경력을 수정하였습니다":"에베베베베베베";
		ModelAndView mav=new ModelAndView();
		mav.addObject("msg", msg);
		mav.addObject("mem_id", coach_mem_id);
		mav.setViewName("jsonView");
		return mav;
	}
	
	////////////////////////////////////////
	

	//코치매칭 매칭내역관리 페이지이동
	@RequestMapping("admin_coachMatchMatch.do")
	public ModelAndView coachMatchMatch() {
		
		ModelAndView mav=new ModelAndView();
		mav.setViewName("admin/admin_coachMatch/admin_coachMatchMatch");
		return mav;
	}
	
	//코치매칭 매칭회원 목록 가져오기
	@RequestMapping("coachMatchingMemInfo.do")
	public ModelAndView coachMatchingInfo(
			@RequestParam(value="req_receive_id")String req_receive_id,
			@RequestParam(value="cp",defaultValue = "1")int cp) {
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		if(req_receive_id.equals("") || req_receive_id == null) {
			req_receive_id ="전체";
		}
		int listSize=4;
		int pageSize=5;
		int start=(cp-1)*listSize+1;
		int end=cp*listSize;
		map.put("start", start);
		map.put("end", end);
		map.put("req_receive_id", req_receive_id);	
		int totalCnt = adminCoachMatchDao.ajaxCmTotalCnt(map);
		List<ReqFormMemberDTO> list = adminCoachMatchDao.reqFormData(map);
		
		String pageStr = zipcok.page.AjaxCoachPageModule.makePage(totalCnt, cp, listSize, pageSize);
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("pageStr",pageStr);
		mav.addObject("reqMemList", list);
		mav.setViewName("jsonView");
		return mav;
	}
	///////////////////////////////////////
	
	
	//코치매칭 취소환불관리 페이지이동
	@RequestMapping("admin_coachMatchCancel.do")
	public ModelAndView coachMatchCancel() {
		
		ModelAndView mav=new ModelAndView();
		mav.setViewName("admin/admin_coachMatch/admin_coachMatchCancel");
		return mav;
	}
	
	//셀렉트박스값으로 리스트 뽑기
	@RequestMapping("coachListSearch.do")
	public ModelAndView coachMatchCancelList(
			@RequestParam(value="cancelSelect",defaultValue = "")String cancelSelect,
			@RequestParam(value="cp",defaultValue = "1")int cp) {
		
		
		int listSize=5;
	    int pageSize=5;
	    int start=(cp-1)*listSize+1;
		int end=cp*listSize;
		
		
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		
		map.put("cancelSelect", cancelSelect);
		map.put("start", start);
		map.put("end", end);
		String keywords="&cancelSelect="+cancelSelect;
		int totalCnt = adminCoachMatchDao.CanTotalCnt(map);
		List<AdminPaymentDetailsDTO> paymentlist=adminCoachMatchDao.coachMatchCancelList(map);
		
		String pageStr = zipcok.page.CoachPageModule.makePage("coachListSearch.do", totalCnt, cp, listSize, pageSize, keywords);
		
		ModelAndView mav=new ModelAndView();
		mav.addObject("pageStr",pageStr);
		mav.addObject("paymentlist", paymentlist);
		mav.addObject("cancelSelect",cancelSelect);
		mav.setViewName("admin/admin_coachMatch/admin_coachMatchCancel");
		return mav;
	}
	
	//코치검색으로 리스트 뽑기
	@RequestMapping("coachCancelSearch.do")
	public ModelAndView coachMatchCancelSearch(
			@RequestParam(value="searchCon",defaultValue = "코치아이디")String searchCon,
			@RequestParam(value="cp",defaultValue = "1")int cp,
			@RequestParam("searchT")String searchT) {
		
		
		int listSize=5;
	    int pageSize=5;
	    int start=(cp-1)*listSize+1;
		int end=cp*listSize;
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("searchCon", searchCon);
		map.put("searchT", searchT);
		map.put("start", start);
		map.put("end", end);
		List<AdminPaymentDetailsDTO> paymentlist = adminCoachMatchDao.adminCoachCancelSearchPd(map);
		int totalCnt=adminCoachMatchDao.CanSearchTotalCnt(map);
		System.out.println(searchT);
		String keywords = "&searchCon="+searchCon+"&searchT="+searchT;
		String pageStr = zipcok.page.CoachPageModule.makePage("coachCancelSearch.do", totalCnt, cp, listSize, pageSize, keywords);
		
		ModelAndView mav=new ModelAndView();
		mav.addObject("paymentlist",paymentlist);
		mav.addObject("searchCon",searchCon);
		mav.addObject("pageStr",pageStr);
		mav.setViewName("admin/admin_coachMatch/admin_coachMatchCancel");
		return mav;
	}
	
	//결제정보 바꿔주기
	@RequestMapping("updateStatus.do")
	public ModelAndView adminCoachCancelUpdateStatus(
			@RequestParam("pd_idx")int pd_idx) {
		//결제내역서상태바꿔주기
		
		int result=adminCoachMatchDao.adminCoachCancelUpdateStatus(pd_idx);

		RequestFormDTO reqdto= adminCoachMatchDao.findRequestByPd_idx(pd_idx);
		int reqcount=coachmpdao.reqStatusChangetoOk(reqdto.getReq_idx(),"결제취소완료");//상담요청서상태를 결제완료로 바꿔주기
		 System.out.println("상담요청서상태결제취소완료로:"+reqcount);

		
		//coachmpdao.reqStatusChangetoOk(pr_req_idx,"결제취소완료");//상담요청서상태를 결제완료로 바꿔주기
		 

		ModelAndView mav=new ModelAndView();
		mav.addObject("result",result);
		mav.addObject("pd_idx",pd_idx);
		mav.setViewName("jsonView");
		return mav;
	}
	
	

	 /*마이페이지!!!!결제내역서 상태정보 취소요청중으로바꾸기-수연*/
	@RequestMapping("pdStatusChangetoCancelplz.do")
	public ModelAndView pdStatusChangetoCancelplz(
			@RequestParam("pd_idx")int pd_idx,HttpSession session) {
		//결제내역서상태바꿔주기
		
		int result=adminCoachMatchDao.adminCoachPlzCancelUpdateStatus(pd_idx); //결제내역서를 취소요청중으로
		RequestFormDTO reqdto= adminCoachMatchDao.findRequestByPd_idx(pd_idx);
		int reqcount=coachmpdao.reqStatusChangetoOk(reqdto.getReq_idx(),"취소요청중");//상담요청서상태를 결제완료로 바꿔주기
		 System.out.println("상담요청서 취소요청중으로:"+reqcount);
		ModelAndView mav=new ModelAndView();
		String msg=reqcount>0?"결제취소가 요청되었습니다.":"취소요청실패";
		mav.addObject("msg", msg);
		mav.addObject("gopage", "mypageCoachMatchPayList.do?mem_id="+(String)session.getAttribute("sid"));
		mav.setViewName("coach/joinMsg");

		return mav;
	}
	
		/*마이페이지!!!!결제내역서 상태정보 취소요청중으로바꾸기-수연
		@RequestMapping("pdStatusChangetoCancelplz.do")
		public ModelAndView pdStatusChangetoCancelplz(
				@RequestParam("pd_idx")int pd_idx,HttpSession session) {
			//결제내역서상태바꿔주기
			
			int result=adminCoachMatchDao.adminCoachPlzCancelUpdateStatus(pd_idx); //결제내역서를 취소요청중으로
			RequestFormDTO reqdto= adminCoachMatchDao.findRequestByPd_idx(pd_idx);
			int reqcount=coachmpdao.reqStatusChangetoOk(reqdto.getReq_idx(),"취소요청중");//상담요청서상태를 결제완료로 바꿔주기
			 System.out.println("상담요청서상태결제취소완료로:"+reqcount);
			ModelAndView mav=new ModelAndView();
			String msg=reqcount>0?"결제취소가 요청되었습니다.":"취소요청실패";
			mav.addObject("msg", msg);
			mav.addObject("gopage", "mypageCoachMatchPayList.do?mem_id="+(String)session.getAttribute("sid"));
			mav.setViewName("coach/joinMsg");

			return mav;
		}*/
		
	
	
	///////////////////////////////////////
	//코치매칭 개설커뮤니티관리 페이지이동
	@RequestMapping("admin_coachMatchCommunity.do")
	public ModelAndView coachMatchCommunity() {
		
		ModelAndView mav=new ModelAndView();
		mav.setViewName("admin/admin_coachMatch/admin_coachMatchCommunity");
		return mav;
	}
}
