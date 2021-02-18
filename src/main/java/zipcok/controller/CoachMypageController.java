package zipcok.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.*;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.commons.lang3.RandomStringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import zipcok.chat.model.ChatDAO;
import zipcok.coach.model.*;
import zipcok.coachmypage.model.CoachMypageDAO;
import zipcok.cpayment.model.Payment_RequestDTO;

import zipcok.homegym.model.PaymentDTO;
import zipcok.homegym.model.Payment_detailsDTO;
import zipcok.homegym.model.HomeGymDTO;
import zipcok.homegym.model.HomeGymEquipmentDTO;
import zipcok.homegym.model.HomeGymPayListDTO;
import zipcok.homegym.model.Pd_AllDTO;
import zipcok.homegym.model.Pd_HgAllDTO;
import zipcok.member.model.MemberAllDTO;
import zipcok.member.model.MemberDTO;
import zipcok.mypage.model.LikeDTO;
import zipcok.mypage.model.MypageDAO;


@Controller
public class CoachMypageController {

	@Autowired
	private CoachMypageDAO cdao;
	@Autowired
	private MypageDAO myPagedao;
	@Autowired
	private CoachDAO dao;
	@Autowired
	private ChatDAO chatdao;

	@Autowired
ServletContext c;
	
	@RequestMapping("CmHomeGymPayList.do")
	public ModelAndView HmPaymentList(@RequestParam("mem_id")String mem_id,
			@RequestParam(value = "cp1", defaultValue = "1")int cp1,
			@RequestParam(value = "cp2", defaultValue = "1")int cp2	) {
		int listSize=5;
		int pageSize=5;
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("mem_id", mem_id);
		map.put("cp1", cp1);
		map.put("cp2", cp2);
		map.put("ls", listSize);
		int totalCnt1 = cdao.coachmypageHomeGymPayListTotalCnt(map);//내 홈짐 결제 리스트 totalCnt
		int totalCnt2 = cdao.coachmypageMyPayListTotalCnt(map);
		String keywords = "&mem_id="+mem_id;
			
		String homegymPayListpageStr = zipcok.page.CoachMyPagePageModule1.makePage("CmHomeGymPayList.do", totalCnt1, cp1, listSize, pageSize, keywords);
		
		String myPayListpageStr = zipcok.page.CoachMyPagePageModule2.makePage("CmHomeGymPayList.do", totalCnt2, cp2, listSize, pageSize, keywords);
		List<Pd_HgAllDTO> list = cdao.coachmypageHomeGymPayList(map);
		if(list!=null) {
			for(int i = 0; i < list.size() ; i++) {
				boolean ck = cdao.coachmypageHomeGymReviewCheck(list.get(i).getPd_idx());
				list.get(i).setReviewCheck(ck);
				list.get(i).setReser_date(list.get(i).getReser_date().substring(0,10));
				list.get(i).setPd_payment_date(list.get(i).getPd_payment_date().substring(0,10));
			}
		}
		List<Pd_HgAllDTO> list2 = cdao.coachmypageMyPayList(map);
		if(list2!=null) {
			for(int i = 0 ; i < list2.size() ; i++) {
				list2.get(i).setReser_date(list2.get(i).getReser_date().substring(0,10));
				boolean ck = cdao.coachmypageMyReviewCheck(list2.get(i).getPd_idx());
				list2.get(i).setReviewCheck(ck);
				String hg_nickname = cdao.coachmypageHomeGymNickname(list2.get(i).getPd_target_id());
				list2.get(i).setHg_nickname(hg_nickname);
				list2.get(i).setPd_payment_date(list2.get(i).getPd_payment_date().substring(0,10));
			}
		}
		ModelAndView mav = new ModelAndView();
		mav.addObject("homegymPayList", list);
		mav.addObject("myPayList", list2);
		mav.addObject("homegymPayListpageStr", homegymPayListpageStr);
		mav.addObject("myPayListpageStr", myPayListpageStr);
		mav.setViewName("coachMyPage/CoachHomeGymPayList");
		return mav;
	}
	
	@RequestMapping("CmPaymentList.do")
	public ModelAndView CmPaymentList(@RequestParam("mem_id")String mem_id,
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
		int totalCnt=dao.getTotalCnt(map);

		String keywords="&mem_id="+mem_id;  //페이지이동시 검색키워드파라미터로보내기
		String pageStr=zipcok.page.CoachPageModule.makePage("CmPaymentList.do", totalCnt, cp, listSize, pageSize,keywords);
		 
		List<Pd_AllDTO> pdList=cdao.CmPaymentList(map);
		//후기존재하는지여부체크
		map.put("pdSenderKey","pd_target_id");
		map.put("pdKey","코치");
		List review_idxList= myPagedao.reviewExistCheck(map);
		mav.addObject("review_idxList", review_idxList);
		mav.addObject("pdList", pdList);
		mav.addObject("pageStr", pageStr);
		mav.setViewName("coachMyPage/CoachMatchPayList");
		return mav;
	}
	
	@RequestMapping("seePayreqPopup.do")
	public ModelAndView seePayreqPopup(@RequestParam("pr_idx")int pr_idx,
			@RequestParam("mem_name")String mem_name,@RequestParam("catename")String catename) {
				
		 ModelAndView mav= new ModelAndView();
		   HashMap<String, Object> map = new HashMap<String, Object>();
		   map.put("pr_idx", pr_idx);
		   map.put("mem_name",mem_name);
		   map.put("catename",catename);
		   Payment_RequestDTO prdto= chatdao.findOnePaymentRequestByPrIdx(pr_idx);
		  map.put("prdto", prdto);
		  
		  
		   mav.addObject("map", map);		
		   mav.setViewName("coachMyPage/CmPayreqViewPopup");
		
		return mav;
	}
	
	
	@RequestMapping("/coachMyPage.do")
	public ModelAndView coachMypageProfile(HttpSession session) {
		ModelAndView mav=new ModelAndView();
		
		MemberDTO mdto=cdao.coachMypageProfile((String)session.getAttribute("coachId"));
		PaymentDTO accdto=cdao.getCoachAccount((String)session.getAttribute("coachId"),"코치");
		mav.addObject("accdto", accdto);
		HashMap<String, Object> resultMap = dao.coachProfile((String)session.getAttribute("coachId"));
		 List<CategoryDTO> list = cdao.categoryFind((String)session.getAttribute("coachId"));
	     mav.addObject("catelist", list);
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
		
		mav.addObject("mdto", mdto);
		mav.addObject("resultMap", resultMap);	
		mav.setViewName("coachMyPage/coachMyPageView");
		
		return mav;
	}
	
	
	
	/*받은요청서 목록가져오기*/
	@RequestMapping("checkRequest.do")
	public ModelAndView checkRequest(@RequestParam("id")String id,
			@RequestParam(value="cp", defaultValue = "1")int cp) {
		ModelAndView mav=new ModelAndView();
		//코치인지 일반회원인지 체크후 보내기
		MemberDTO mdto=myPagedao.memberProfile(id); //코치회원인지 일반회원인지 판단		
		if(mdto.getMem_type().equals("일반회원")) { //일반회원용 보낸요청목록
			HashMap<String, Object> map=new HashMap<String, Object>();
			map.put("id", id);
			//coachDAOImple에 토탈카운트 switch로 찾음
			map.put("methodKey","sendReqRequest");
			map.put("sqlKey", "sendRequestListSQL");
			/*페이지설정*/
			int totalCnt=dao.getTotalCnt(map); //테이블명써주기
			int listSize=3;
			int pageSize=5;
			String keywords="&id="+id;  //페이지이동시 검색키워드파라미터로보내기
			String pageStr=zipcok.page.CoachPageModule.makePage("checkRequest.do", totalCnt, cp, listSize, pageSize,keywords);
			mav.addObject("pageStr", pageStr);
				
			List<RequestFormDTO> list=	dao.searchRequestList(map, cp,listSize); //받은요청서목록정보
			mav.addObject("requestList", list);
			mav.setViewName("coachMyPage/checkRequestList");
			
		}else {//코치회원용 받은요청목록
			HashMap<String, Object> map=new HashMap<String, Object>();
			map.put("id", id);
			map.put("methodKey","receiveReqRequest");
			map.put("sqlKey", "receiveRequestListSQL");
			
			/*페이지설정*/
			int totalCnt=dao.getTotalCnt(map); //테이블명써주기
			int listSize=3;
			int pageSize=5;
			String keywords="&id="+id;  //페이지이동시 검색키워드파라미터로보내기
			String pageStr=zipcok.page.CoachPageModule.makePage("checkRequest.do", totalCnt, cp, listSize, pageSize,keywords);
			mav.addObject("pageStr", pageStr);
				
			List<RequestFormDTO> list=	dao.searchRequestList(map, cp,listSize); //받은요청서목록정보
			mav.addObject("requestList", list);
			mav.setViewName("coachMyPage/checkRequestList");
		}
		
		return mav;		
	}
	
	
	/*받은요청서 선택삭제하기*/
	@RequestMapping("requestDelete.do")
	public ModelAndView requestDelete(@RequestParam("req_idx")int req_idx,@RequestParam("mem_id")String mem_id) {
		
		int result=cdao.requestDelete(req_idx);
		String msg=result>0?"상담요청서가 삭제되었습니다":"삭제실패";
		System.out.println("-----기능수행------");
		ModelAndView mav=new ModelAndView();
		mav.addObject("msg", msg);
		mav.addObject("gopage", "checkRequest.do?id="+mem_id);
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
			List<LikeDTO> list=cdao.coachMypageHomeGymLikeList(cp, listSize, (String)session.getAttribute("coachId"));
			List<MemberAllDTO> memarr = new ArrayList<MemberAllDTO>();
			for(LikeDTO likedto : list) {
		    	  
		    	  MemberAllDTO dto = new MemberAllDTO();
		    	  dto = cdao.memberAllProfile2(likedto.getLike_target_id());
		    	  memarr.add(dto);
		    	 
		      }
			
			ModelAndView mav = new ModelAndView();
			mav.addObject("memarr", memarr);
			mav.addObject("list", list);
			mav.addObject("pageStr", pageStr);
			mav.setViewName("coachMyPage/coachMypageHomeGymLikeList");

			
			return mav;
		}
	
		
		//코치마이페이지 F&A/고객센터 작성글 목록
		@RequestMapping("/coachMypageWriteList.do")
		public ModelAndView coachMypageWriteList(HttpSession session,
				@RequestParam(value = "cp", defaultValue = "1")int cp) {
			
			int totalCnt=cdao.coachMypageWriteListTotalCnt((String)session.getAttribute("coachId"));
			int listSize=5;
			int pageSize=5;
			String pageStr=zipcok.page.MypagePageModule.makePage("coachMypageWriteList.do", totalCnt, cp, listSize, pageSize);
			List list = cdao.coachMypageWriteList(cp, listSize, (String)session.getAttribute("coachId"));
			ModelAndView mav = new ModelAndView();
			mav.addObject("list", list);
			mav.addObject("pageStr", pageStr);
			mav.setViewName("coachMyPage/coachMypageWriteList");
			
			return mav;
		}
		
		
		//코치마이페이지 작성글 삭제
		   @RequestMapping("coachMypageCheckDel.do")
		   public ModelAndView coachMypageWriteDelete(
				   HttpServletRequest req) {
			   
			   String[] checkArr=req.getParameterValues("checkRow");
			   ModelAndView mav=new ModelAndView();
			   HashMap<String, Object> map = new HashMap<String, Object>();
			   int count =0;
			   for(int i=0; i<checkArr.length; i++) {
				   count+=cdao.coachMypageWriteDelete(checkArr[i]);
			   }
			   
			   mav.addObject("msg", "게시글이 삭제되었습니다.");
			   mav.addObject("gourl", "coachMypageWriteList.do");
			   mav.setViewName("coachMyPage/coachMypageMsg");
			   return mav;
		   }
		
		//코치마이페이지 커뮤니티 작성글 목록
		@RequestMapping("/coachMypageCommWriteList.do")
		public ModelAndView coachMypageCommWriteList(HttpSession session,
				@RequestParam(value = "cp", defaultValue = "1")int cp) {
			
			int totalCnt=cdao.coachMypageCommWriteListTotalCnt((String)session.getAttribute("coachId"));
			int listSize=5;
			int pageSize=5;
			String pageStr=zipcok.page.MypagePageModule.makePage("coachMypageCommWriteList.do", totalCnt, cp, listSize, pageSize);
			List list = cdao.coachMypageCommWriteList(cp, listSize, (String)session.getAttribute("coachId"));
			ModelAndView mav = new ModelAndView();
			mav.addObject("list", list);
			mav.addObject("pageStr", pageStr);
			mav.setViewName("coachMyPage/coachMypageCommWriteList");
			
			return mav;
		}
		
		//코치마이페이지 커뮤니티 작성글 삭제
		   @RequestMapping("coachMypageCommCheckDel.do")
		   public ModelAndView coachMypageCommWriteDelete(
				   HttpServletRequest req) {
			   
			   String[] checkArr=req.getParameterValues("checkRow");
			   ModelAndView mav=new ModelAndView();
			   HashMap<String, Object> map = new HashMap<String, Object>();
			   int count =0;
			   for(int i=0; i<checkArr.length; i++) {
				   System.out.println(checkArr[i]);
				   count+=cdao.coachMypageCommWriteDelete(checkArr[i]);
			   }
			   
			   mav.addObject("msg", "게시글이 삭제되었습니다.");
			   mav.addObject("gourl", "coachMypageCommWriteList.do");
			   mav.setViewName("coachMyPage/coachMypageMsg");
			   return mav;
		   }
		
		
		@RequestMapping("/coachMypagePwdUpdateForm.do")
		public String coachMypagePwdUpdateForm() {
			
			return "coachMyPage/coachMypagePwdUpdate";
		}
		
		//비밀번호 변경
		@RequestMapping("/coachMypagePwdUpdate.do")
		public ModelAndView coachMypagePwdUpdate(MemberDTO dto,
				@RequestParam("mem_pwd")String mem_pwd,
				@RequestParam("mem_pwd2")String mem_pwd2,
				@RequestParam("mem_id")String mem_id) {
			
			ModelAndView mav=new ModelAndView();

			if(mem_pwd.equals(mem_pwd2)) {
				int result=cdao.coachMypagePwdUpdate(dto);
				mav.addObject("mem_id", mem_id);
				mav.addObject("msg", "비밀번호 수정 완료!");
				mav.addObject("gourl", "coachMyPage.do");
				mav.setViewName("coachMyPage/coachMypageMsg");
			}else {
				mav.addObject("msg", "잘못된 정보입니다.");
				mav.addObject("gourl", "coachMyPage.do");
				mav.setViewName("coachMyPage/coachMypageMsg");
			}
			return mav;
		}
		
		@RequestMapping("/coachMypageAddrUpdateForm.do")
		public String coachMypageAddrUpdateForm() {
			
			return "coachMyPage/coachMypageAddrUpdate";
		}
		
		
		//주소 변경
		@RequestMapping("/coachMypageAddrUpdate.do")
		public ModelAndView coachMypageAddrUpdate(MemberDTO dto,
				HttpSession session,
				@RequestParam("mem_zipcode")String mem_zipcode,
				@RequestParam("mem_addr")String mem_addr,
				@RequestParam("mem_detailaddr")String mem_detailaddr) {
			ModelAndView mav = new ModelAndView();
			dto.setMem_id((String)session.getAttribute("coachId"));
			int result = cdao.coachMypageAddrUpdate(dto);
			String msg=result>0?"주소변경 성공!":"주소변경 실패!";
			mav.addObject("msg", msg);
			mav.addObject("gourl", "coachMyPage.do");
			mav.setViewName("coachMyPage/coachMypagePopupMsg");
			return mav;
		}
		
		@RequestMapping("/coachMypageEmailUpdateForm.do")
		public String coachMypageEmailUpdateForm() {
			
			return "coachMyPage/coachMypageEmailUpdate";
		}
		
		
		//이메일 변경
		@RequestMapping("/coachMypageEmailUpdate.do")
		public ModelAndView coachMypageEmailUpdate(
				MemberDTO dto,
				HttpSession session,
				@RequestParam("mem_email") String mem_email) {
			
			ModelAndView mav= new ModelAndView();
			dto.setMem_id((String)session.getAttribute("coachId"));
			int result = cdao.coachMypageEmailUpdate(dto);
			String msg=result>0?"이메일 변경 성공!":"이메일 변경 실패!";
			mav.addObject("msg", msg);
			mav.addObject("gourl", "coachMyPage.do");
			mav.setViewName("coachMyPage/coachMypagePopupMsg");
			return mav;
			
		}
		
		@RequestMapping("/coachMypagePhoneUpdateForm.do")
		public String coachMypagePhoneUpdateForm() {
			
			return "coachMyPage/coachMypagePhoneUpdate";
		}
		
		
		//전화번호 변경
		@RequestMapping("/coachMypagePhonUpdate.do")
		public ModelAndView coachMypagePhoneUpdate(
				MemberDTO dto,
				HttpSession session,
				@RequestParam("mem_phone") String mem_phone) {
			
			ModelAndView mav= new ModelAndView();
			dto.setMem_id((String)session.getAttribute("coachId"));
			int result = cdao.coachMypagePhoneUpdate(dto);
			String msg=result>0?"전화번호 변경 성공!":"전화번호 변경 실패!";
			mav.addObject("msg", msg);
			mav.addObject("gourl", "coachMyPage.do");
			mav.setViewName("coachMyPage/coachMypagePopupMsg");
			return mav;
			
		}
		
	/*프로필사진수정하는 거*/	
	@RequestMapping("profileImgReUpload.do")
	public ModelAndView imgchange(@RequestParam("upload") MultipartFile upload,@RequestParam("id")String id) {
		ModelAndView mav=new ModelAndView();
	/*다중파일첨부 시 필요*/	
		
		/*파일복사및저장하기*/			
			System.out.println("사진원본이름:"+upload.getOriginalFilename());
			String mfile_path=c.getRealPath("/upload/member/"); //저장되는 경로
			String mfile_upload=copyInto( upload, mfile_path);	//파일저장후 새로운이름생성됨
			String mfile_orig=upload.getOriginalFilename(); //파일원본명
			String mfile_key="회원프로필"; //파일저장 구분키
			String mfile_mem_id=id;
			int mfile_size=(int)upload.getSize();
            String mfile_type=upload.getContentType();
			CoachFileDTO cdto=new CoachFileDTO(0, mfile_key, mfile_mem_id, mfile_upload, mfile_size, mfile_orig, mfile_path, mfile_type);	
	
		/*다중파일첨부 시 필요*/	
			CoachFileDTO origindto = cdao.findProfileDTO(id);//기존파일dto가져오기 용도:진짜파일삭제용
			int count=cdao.deleteProfileImg(cdto); //잇던거지우고 용도:db
			count = cdao.insertProfileImg(cdto); //다시만들어 용도:db
			String msg=count>0?"프로필 사진이 변경되었습니다" :"변경실패";
			System.out.println(msg);
			if(count>0) { //기존진짜파일 폴더내에서삭제하기
				 File file = new File(origindto.getMfile_path()+origindto.getMfile_upload());
				 if (file.exists()){
					 
					 if (file.delete()){
					        System.out.println("파일을 삭제 성공");
					      //파일 삭제 실패시
					      }else{
					        System.out.println("파일 삭제 실패");
					      }				
				 }else {
					 System.out.println("경로에파일없음");
				 }
			}
		mav.addObject("msg", msg);	
		mav.addObject("gopage", "coachMyPage.do?id="+id);	
		mav.setViewName("coach/joinMsg");
		return mav;
	}

	
	
	/*실제파일복사관련 메서드*/
	private String copyInto(MultipartFile upload,String path) {
		
		try {
			
			 /*파일이름중복없도록*/
	        Calendar cal = Calendar.getInstance()  ;
	        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyyMMdd_HHmmSS");
	        String time = dateFormat.format(cal.getTime());
	        String random=RandomStringUtils.randomAlphabetic(8);
	        String uploadName=time+random+upload.getOriginalFilename();
	        //현재시간+랜덤문자열+원본파일명을 더한 새로운 파일이름생성
	        
			System.out.println("파일새로운이름:"+uploadName);
	       
			
			byte bytes[]=upload.getBytes(); //복사할원본
			File outFile=new File(path+uploadName); //빈종이
			
			FileOutputStream fos=new FileOutputStream(outFile);
			fos.write(bytes);//복사성공
			fos.close();
			
			return uploadName;  //디비저장용
		} catch (IOException e) {
			System.out.println("파일존재하지않음");
			e.printStackTrace();
			return null;
		}
		
	}
	
	
	/*커리큘럼 수정하기view*/
	@RequestMapping("curriReWrite.do")
	public ModelAndView curriReWrite(HttpSession session) {
		ModelAndView mav=new ModelAndView();
		
		MemberDTO mdto=cdao.coachMypageProfile((String)session.getAttribute("coachId"));	
		HashMap<String, Object> resultMap = dao.coachProfile((String)session.getAttribute("coachId"));
		 List<CategoryDTO> list = cdao.categoryFind((String)session.getAttribute("coachId"));
	     mav.addObject("catelist", list);
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
		
		mav.addObject("mdto", mdto);
		mav.addObject("resultMap", resultMap);	
		
		mav.setViewName("coachMyPage/curriUpdateView");
		return mav;
	}
	
	
	/*운동커리큘럼새로등록기능*/
	@RequestMapping("NodataCurriInsert.do")
	public ModelAndView nodataCurriInsert(HttpServletRequest req) {
		String[] curri_mem_ids=req.getParameterValues("curri_mem_id");
		String[] curri_catenames=req.getParameterValues("curri_catename");
		String[] curri_orders=req.getParameterValues("curri_order");
		String[] curri_names=req.getParameterValues("curri_name");
		String[] curri_contents=req.getParameterValues("curri_content");
		
		for(int i=0; i<curri_mem_ids.length; i++) {
			String curri_mem_id = curri_mem_ids[i];
			String curri_catename = curri_catenames[i];
			String curri_orderss = curri_orders[i];
			int curri_order=Integer.parseInt(curri_orderss);
			String curri_name = curri_names[i];
			String curri_content = curri_contents[i];
			
			CurriDTO cdto=new CurriDTO(0, curri_mem_id, curri_catename, curri_order, curri_name, curri_content);
			cdao.curriInsert(cdto);
		}
		ModelAndView mav=new ModelAndView();
		mav.addObject("msg", "새로운 커리큘럼이 등록되었습니다.");	
		mav.addObject("gopage", "coachMyPage.do");	
		mav.setViewName("coach/joinMsg");
		return mav;
	}
	

	/*운동커리큘럼수정기능*/
	@RequestMapping("DataCurriInsert.do")
	public ModelAndView DataCurriInsert(HttpServletRequest req) {
		String[] curri_mem_ids=req.getParameterValues("curri_mem_id");
		String[] curri_catenames=req.getParameterValues("curri_catename");
		String[] curri_orders=req.getParameterValues("curri_order");
		String[] curri_names=req.getParameterValues("curri_name");
		String[] curri_contents=req.getParameterValues("curri_content");
		
		for(int i=0; i<curri_mem_ids.length; i++) {
			String curri_mem_id = curri_mem_ids[i];
			String curri_catename = curri_catenames[i];
			String curri_orderss = curri_orders[i];
			int curri_order=Integer.parseInt(curri_orderss);
			String curri_name = curri_names[i];
			String curri_content = curri_contents[i];
			
			CurriDTO cdto=new CurriDTO(0, curri_mem_id, curri_catename, curri_order, curri_name, curri_content);
			cdao.curriUpdate(cdto);
		}
		ModelAndView mav=new ModelAndView();
		mav.addObject("msg", "커리큘럼이 수정되었습니다.");	
		mav.addObject("gopage", "coachMyPage.do");	
		mav.setViewName("coach/joinMsg");
		return mav;
	}
	
	
	/*커리큘럼 삭제*/
	@RequestMapping("DeleteCurri.do")
	public ModelAndView deleteCurri(HttpSession session,@RequestParam("cate_name")String catename) {
		ModelAndView mav =new ModelAndView();
		CurriDTO cdto = new CurriDTO();
		cdto.setCurri_mem_id((String)session.getAttribute("coachId"));
		cdto.setCurri_catename(catename);
		cdao.curriDelete(cdto);
		mav.addObject("msg", "커리큘럼이 삭제되었습니다.");	
		mav.addObject("gopage", "coachMyPage.do");	
		mav.setViewName("coach/joinMsg");
		return mav;
	}
	
	
	
	
	/*카테고리 수정view*/
	@RequestMapping("categoryUpdate.do")
	public ModelAndView categoryUpdate(@RequestParam("mem_id")String id) {
		ModelAndView mav= new ModelAndView();
		     List<CategoryDTO> list = cdao.categoryFind(id);
		     mav.addObject("catelist", list);
		     mav.setViewName("coachMyPage/cateUpdate");
		return mav;
	}
	
	
	
	/*카테고리 수정완료*/
	@RequestMapping("categoryUpdateOK.do")
	public ModelAndView categoryUpdateOK(HttpServletRequest req,@RequestParam("mem_id")String id) {
		ModelAndView mav= new ModelAndView();
				
		List<CategoryDTO> list = cdao.categoryFind(id); //기존카테고리dto리스트
		List<String> oldcateNames = new ArrayList<String>();//기존카테고리이름리스트(최대2개)
		for(CategoryDTO dto : list) {
			oldcateNames.add(dto.getCate_name());
		}
		int count=0;
		/*1단계 다른거 새로등록하기*/
		List<String> staycateNames = new ArrayList<String>();//유지할 카테고리 이름들담을 arr
		String[] cateArr =req.getParameterValues("cate_name"); //금방받은체크박스
		List<String> newarr = new ArrayList<String>();//금방받은체크박스
		for(int i=0;i<cateArr.length;i++) {
			newarr.add(cateArr[i]);
				if(oldcateNames.contains(cateArr[i])) {//기존카테고리랑 같다면
					staycateNames.add(cateArr[i]);
					continue;
				}else {//새로운 카테고리라면
					String cate_mem_id=id;
					String cate_name=cateArr[i];
					CategoryDTO cateDto=new CategoryDTO(0, cate_mem_id, cate_name);
					System.out.println("새로추가할카테고리:"+cate_name);
					count+= cdao.categoryinsert(cateDto);
					oldcateNames.add(cate_name); //기존목록에 추가해버리고 다시비교할꺼임
				}		
		}
		
		for(String cate : oldcateNames) {
			if(!newarr.contains(cate)) { 
				HashMap<String, String> catemap = new HashMap<String, String>();
				catemap.put("cate_mem_id",id);
				catemap.put("cate_name", cate);
				System.out.println("삭제할카테고리:"+cate);
				 count+=cdao.categoryDelete(catemap);     
		
			}
			
		}
		String msg=count>1?"카테고리가 수정되었습니다":"카테고리수정실패";
		String gourl="coachMyPage.do";
		mav.addObject("msg",msg);
		mav.addObject("gourl",gourl);
	    mav.setViewName("coachMyPage/coachMypagePopupMsg");
		return mav;
	}
	
	
	
    @RequestMapping("coachmyHomeGymHavingCheck.do")
    public ModelAndView coachmyHomeGymHavingCheck(
  		  @RequestParam("mem_id")String user_id) {
  	  boolean check = cdao.coachmypageHomeGymCheck(user_id);
  	  String goPage = check?"coachmyHomeGymEnter.do?mem_id="+user_id:"HomeGymAdd.do";
  	  ModelAndView mav = new ModelAndView();
  	  mav.addObject("check", check);
  	  mav.addObject("goPage", goPage);
  	  mav.setViewName("coachMyPage/coachmypageHomeGymCheckMsg");
  	  return mav;
    }
    @RequestMapping("/coachmyHomeGymEnter.do")
    public ModelAndView coachmyHomeGymEnter(
  		  @RequestParam("mem_id")String user_id) {
  	  HomeGymDTO hgContent = cdao.coachmypageHomeGymInfo(user_id);
  	  hgContent.setHg_start_date(hgContent.getHg_start_date().substring(0, 10));
  	  hgContent.setHg_end_date(hgContent.getHg_end_date().substring(0, 10));
  	  List<HomeGymEquipmentDTO> eqContent = cdao.coachmypageHomeGymEqInfo(user_id);
  	  List<CoachFileDTO> imgContent = cdao.coachmypageHomeGymImgInfo(user_id);
  	  int like_count = cdao.coachmypageHomeGymLikeCount(user_id);
  	  List<ReviewDTO> reviewContent = cdao.coachHomeGymReview(user_id);
	  PaymentDTO paymentContent = cdao.coachmypageHomeGymPaymentFind(user_id);
  	  ModelAndView mav = new ModelAndView();
  	  mav.addObject("hgContent", hgContent);
  	  mav.addObject("eqContent", eqContent);
  	  mav.addObject("imgContent", imgContent);
  	  mav.addObject("like_count", like_count);
  	  mav.addObject("reviewContent", reviewContent);
	  mav.addObject("paymentContent", paymentContent);
  	  mav.setViewName("coachMyPage/coachMypageHomeGymInfo");
  	  return mav;
    }
    @RequestMapping("coachchangeStatus.do")
    public ModelAndView coachhomegymStatusChange(
  		  @RequestParam("hg_status")String hg_status,
  		  @RequestParam("hg_mem_id")String hg_mem_id ) {
  	  Map<String, String> map = new HashMap<String, String>();
  	  map.put("hg_status", hg_status);
  	  map.put("hg_mem_id", hg_mem_id);
  	  int result = cdao.coachmypageHomeGymStautsChange(map);
  	  ModelAndView mav = new ModelAndView();
  	  mav.addObject("hg_status", result);
  	  mav.setViewName("jsonView");
  	  return mav;
    }
    
    @RequestMapping("coachmypageHomeGymAddrUpdateForm.do")
    public ModelAndView coachmypageHomeGymAddrUpdateForm(
  		  @RequestParam("hg_mem_id")String hg_mem_id) {
  	  ModelAndView mav = new ModelAndView();
  	  mav.addObject("hg_mem_id", hg_mem_id);
  	  mav.setViewName("coachMyPage/coachMypageHomeGymAddrUpdate");
  	  return mav;
    }
    
    @RequestMapping("coachhomegymAddrUpdate.do")
    public ModelAndView coachmypageHomeGymAddrUpdate(
  		  	 @RequestParam("hg_mem_id")String hg_mem_id,
  	         @RequestParam("hg_faddr")String hg_faddr,
  	         @RequestParam("hg_saddr")String hg_saddr) {
  	  Map<String, String> map = new HashMap<String, String>();
  	  map.put("hg_mem_id", hg_mem_id);
  	  map.put("hg_faddr", hg_faddr);
  	  map.put("hg_saddr", hg_saddr);
  	  int result = cdao.coachmypageHomeGymAddrUpdate(map);
  	  String msg = result>0?"홈짐 주소가 정상적으로 수정되었습니다.":"홈짐 주소 수정에 오류가 발생하였습니다.";
  	  String gourl = "myHomeGymCheck.do?hg_mem_id="+hg_mem_id;
  	  ModelAndView mav = new ModelAndView();
  	  mav.addObject("msg", msg);
  	  mav.addObject("gourl", gourl);
  	  mav.setViewName("coachMyPage/coachMypagePopupMsg");
  	  return mav;
  	  }
    
    @RequestMapping("coachchangeStation.do")
    public ModelAndView coachmypageHomeGymStationUpdate(
  		  @RequestParam("hg_mem_id")String hg_mem_id,
  		  @RequestParam("hg_station")String hg_station
  		  ) {
  	  Map<String, String> map = new HashMap<String, String>();
  	  map.put("hg_mem_id", hg_mem_id);
  	  map.put("hg_station", hg_station);
  	  int result = cdao.coachmypageHomeGymStationUpdate(map);
  	  ModelAndView mav = new ModelAndView();
  	  mav.addObject("change_result", result);
  	  mav.addObject("change_station", hg_station);
  	  mav.setViewName("jsonView");
  	  return mav;
    }
    @RequestMapping("coachchangePerson_count.do")
    public ModelAndView coachmypageHomeGymPerson_countUpdate(
  		  @RequestParam("hg_mem_id")String hg_mem_id,
  		  @RequestParam("hg_person_count")int hg_person_count
  		  ) {
  	  Map<String, Object> map = new HashMap<String, Object>();
  	  map.put("hg_mem_id", hg_mem_id);
  	  map.put("hg_person_count", hg_person_count);
  	  int result = cdao.coachmypageHomeGymPerson_countUpdate(map);
  	  ModelAndView mav = new ModelAndView();
  	  mav.addObject("change_result", result);
  	  mav.addObject("change_person_count", hg_person_count);
  	  mav.setViewName("jsonView");
  	  return mav;
    }
    @RequestMapping("coachchangePrice.do")
    public ModelAndView coachmypageHomeGymPriceUpdate(
  		  @RequestParam("hg_mem_id")String hg_mem_id,
  		  @RequestParam("hg_price")int hg_price
  		  ) {
  	  Map<String, Object> map = new HashMap<String, Object>();
  	  map.put("hg_mem_id", hg_mem_id);
  	  map.put("hg_price", hg_price);
  	  int result = cdao.coachmypageHomeGymPriceUpdate(map);
  	  ModelAndView mav = new ModelAndView();
  	  mav.addObject("change_result", result);
  	  mav.addObject("change_price", hg_price);
  	  mav.setViewName("jsonView");
  	  return mav;
    }
    @RequestMapping("coachmypageEqListUpdate.do")
    public ModelAndView coachmypageHomeGymEqListUpdate(
  		  HttpServletRequest req,
  		  @RequestParam("mem_id")String mem_id) {
  	  String eq_name[] = req.getParameterValues("eq_name");
  	  String eq_count[] = req.getParameterValues("eq_count");
  	  cdao.coachmypageHomeGymEqAllDelete(mem_id);
  	  int eq_update_count = 0;
  	  for(int i = 0 ; i < eq_name.length ; i++) {
  		  Map<String, String> eq_data = new HashMap<String, String>();
  		  eq_data.put("eq_mem_id", mem_id);
  		  eq_data.put("eq_name", eq_name[i]);
  		  eq_data.put("eq_count", eq_count[i]);
  		  eq_update_count += cdao.coachmypageHomeGymEqUpdate(eq_data);
  	  }
  	  List<HomeGymEquipmentDTO> list = cdao.coachmypageHomeGymEqInfo(mem_id);
  	  ModelAndView mav = new ModelAndView();
  	  mav.addObject("change_result", eq_update_count);
  	  mav.addObject("change_eqlist", list);
  	  mav.setViewName("jsonView");
  	  return mav;
    }
    @RequestMapping("coachmypageUseDateUpdate.do")
    public ModelAndView coachmypageHomeGymUseDateUpdate(
  		  @RequestParam("hg_mem_id")String mem_id,
  		  @RequestParam("choice_start_date")String start_date,
  		  @RequestParam("choice_end_date")String end_date,
  		  @RequestParam("choice_not_date")String not_date) {
  	  Map<String, Object> map = new HashMap<String, Object>();
  	  map.put("hg_mem_id", mem_id);
  	  map.put("start_date", java.sql.Date.valueOf(start_date));
  	  map.put("end_date", java.sql.Date.valueOf(end_date));
  	  map.put("not_date", not_date);
  	  int result = cdao.coachmypageHomeGymUseDateUpdate(map);
  	  ModelAndView mav = new ModelAndView();
  	  mav.addObject("change_result", result);
  	  mav.addObject("change_start_date", start_date);
  	  mav.addObject("change_end_date", end_date);
  	  mav.addObject("change_not_date", not_date);
  	  mav.setViewName("jsonView");
  	  return mav;
    }
    @RequestMapping("coachmypageUseTimeUpdate.do")
    public ModelAndView coachmypageHomeGymUseTimeUpdate(
  		  @RequestParam("hg_mem_id")String mem_id,
  		  @RequestParam("choice_start_time")int start_time,
  		  @RequestParam("choice_end_time")int end_time) {
  	  Map<String, Object> map = new HashMap<String, Object>();
  	  map.put("hg_mem_id", mem_id);
  	  map.put("start_time", start_time);
  	  map.put("end_time", end_time);
  	  int result = cdao.coachmypageHomeGymUseTimeUpdate(map);
  	  ModelAndView mav = new ModelAndView();
  	  mav.addObject("change_result", result);
  	  mav.addObject("change_start_time", start_time);
  	  mav.addObject("change_end_time", end_time);
  	  mav.setViewName("jsonView");
  	  return mav;
    }
    @RequestMapping("coachAddrDetailsPopup.do")
    public ModelAndView coachmypageHomeGymaddrDetailsPopup(
    		@RequestParam("hg_mem_id")String hg_mem_id) {
    	HomeGymDTO dto = cdao.coachmypageHomeGymInfo(hg_mem_id);
    	ModelAndView mav = new ModelAndView();
    	mav.addObject("homegym", dto);
    	mav.setViewName("coachMyPage/HomegymDetailsAddrPopup");
    	return mav;
    }
    @RequestMapping(value = "coachReviewWritePopup", method=RequestMethod.GET)
    public ModelAndView coachmypageHomeGymReviewWriteForm(
    		@RequestParam("pd_idx")int pd_idx,
    		@RequestParam("target_id")String target_id,
    		@RequestParam("mem_id")String mem_id) {
    	ModelAndView mav = new ModelAndView();
    	mav.addObject("pd_idx", pd_idx);
    	mav.addObject("target_id", target_id);
    	mav.addObject("mem_id", mem_id);
    	mav.setViewName("coachMyPage/coachReviewWritePopup");
    	return mav;
    }
    @RequestMapping(value = "coachReviewWritePopup", method=RequestMethod.POST)
    public ModelAndView coachmypageHomeGymReviewWrite(ReviewDTO dto) {
    	int result = cdao.coachmypageHomeGymReviewAdd(dto);
    	String msg = result>0?"리뷰가 성공적으로 등록되었습니다.":"리뷰 등록에 에러가 발생했습니다.";
    	ModelAndView mav = new ModelAndView();
    	mav.addObject("msg", msg);
    	mav.addObject("gourl", "CmHomeGymPayList.do?mem_id="+dto.getRev_mem_id());
    	mav.setViewName("coachMyPage/coachMypagePayListMsg");
    	return mav;
    }
    @RequestMapping("coachSeeHomeGymReviewPopup.do")
    public ModelAndView coachmypageHomeGymReviewView(
    		@RequestParam("rev_pd_idx")int rev_pd_idx) {
    	ReviewDTO dto = cdao.coachmypageHomeGymReviewView(rev_pd_idx);
    	ModelAndView mav = new ModelAndView();
    	mav.addObject("review", dto);
    	mav.setViewName("coachMyPage/homegymReviewViewPopup");
    	return mav;
    }
    @RequestMapping("coachmypageHomeGymPaymentCancel.do")
    public ModelAndView coachmypageHomeGymPaymentCancel(
    		@RequestParam("pd_idx")int pd_idx,
    		@RequestParam("reser_idx")int reser_idx) {
    	int payment_result = cdao.coachmypagehomegympaymentCancel_payment(pd_idx);
    	int reservation_result = cdao.coachmypagehomegympaymentCancel_reservation(reser_idx);
    	ModelAndView mav = new ModelAndView();
    	mav.addObject("change_payment_result", payment_result);
    	mav.addObject("change_reservation_result", reservation_result);
    	mav.setViewName("jsonView");
    	return mav;
    }
}
