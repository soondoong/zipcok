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

import zipcok.coach.model.CoachDAO;
import zipcok.coach.model.CoachFileDTO;
import zipcok.coach.model.ReviewDTO;
import zipcok.cs.model.CsDTO;
import zipcok.homegym.model.HomeGymDTO;
import zipcok.homegym.model.HomeGymEquipmentDTO;
import zipcok.homegym.model.PaymentDTO;
import zipcok.homegym.model.Pd_AllDTO;
import zipcok.homegym.model.Pd_HgAllDTO;
import zipcok.member.model.MemberDAO;
import zipcok.member.model.MemberDTO;
import zipcok.mypage.model.LikeDTO;
import zipcok.mypage.model.MypageDAO;

@Controller
public class MypageController {
   
   @Autowired
   private MypageDAO dao;
   @Autowired
   private CoachDAO cdao;
   @Autowired
   ServletContext c;
   
   //마이페이지 내프로필
   @RequestMapping("/memberProfileForm.do")
   public ModelAndView memberProfileForm(
         HttpSession session) {
      ModelAndView mav= new ModelAndView();
      MemberDTO dto=dao.memberProfile((String)session.getAttribute("sid"));
      CoachFileDTO cdto=dao.memberProfilePhoto((String)session.getAttribute("sid"));
      
   
      mav.addObject("dto", dto);
      mav.addObject("cdto", cdto);
      mav.setViewName("mypage/memberProfile");
      return mav;
   }
   
   @RequestMapping("/mypagePwdUpdateForm.do")
   public String mypagePwdUpdateForm() {
      
      return "mypage/mypagePwdUpdate";
   }
   
   
   /*프로필사진수정하는 거*/   
   @RequestMapping("moProfileImgReUpload.do")
   public ModelAndView imgchange(@RequestParam("upload") MultipartFile upload,@RequestParam("id")String id) {
      ModelAndView mav=new ModelAndView();
   /*다중파일첨부 시 필요*/   
      
      /*파일복사및저장하기*/         
         System.out.println("사진원본이름:"+upload.getOriginalFilename());
         String mfile_path=c.getRealPath("/upload/member/"); //저장되는 경로
         String mfile_upload=copyInto( upload, mfile_path);   //파일저장후 새로운이름생성됨
         String mfile_orig=upload.getOriginalFilename(); //파일원본명
         String mfile_key="회원프로필"; //파일저장 구분키
         String mfile_mem_id=id;
         int mfile_size=(int)upload.getSize();
            String mfile_type=upload.getContentType();
         CoachFileDTO cdto=new CoachFileDTO(0, mfile_key, mfile_mem_id, mfile_upload, mfile_size, mfile_orig, mfile_path, mfile_type);   
   
      /*다중파일첨부 시 필요*/   
         CoachFileDTO origindto = dao.moFindProfileDTO(id);//기존파일dto가져오기 용도:진짜파일삭제용
         int count=dao.moDeleteProfileImg(cdto); //잇던거지우고 용도:db
         count = dao.moInsertProfileImg(cdto); //다시만들어 용도:db
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
      mav.addObject("gourl", "memberProfileForm.do?id="+id);   
      mav.setViewName("mypage/mypageMsg");
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
   
   
 
 
   
   
   
   
   //비밀번호 변경
   @RequestMapping("/mypagePwdUpdate.do")
   public ModelAndView mypagePwdUpdate(MemberDTO dto,
         @RequestParam("mem_pwd")String mem_pwd,
         @RequestParam("mem_pwd2")String mem_pwd2,
         @RequestParam("mem_id")String mem_id) {
      
      ModelAndView mav=new ModelAndView();

      if(mem_pwd.equals(mem_pwd2)) {
         int result=dao.mypagePwdUpdate(dto);
         mav.addObject("mem_id", mem_id);
         mav.addObject("msg", "비밀번호 수정 완료!");
         mav.addObject("gourl", "memberProfileForm.do");
         mav.setViewName("mypage/mypageMsg");
      }else {
         mav.addObject("msg", "잘못된 정보입니다 고객센터에 문의해주세요.");
         mav.addObject("gourl", "memberProfileForm.do");
         mav.setViewName("mypage/mypageMsg");
      }
      return mav;
   }
   
   @RequestMapping("/mypageAddrUpdateForm.do")
   public String mypageAddrUpdateForm() {
      
      return "mypage/mypageAddrUpdate";
   }
   
   
   //주소 변경
   @RequestMapping("/mypageAddrUpdate.do")
   public ModelAndView mypageAddrUpdate(MemberDTO dto,
         HttpSession session,
         @RequestParam("mem_zipcode")String mem_zipcode,
         @RequestParam("mem_addr")String mem_addr,
         @RequestParam("mem_detailaddr")String mem_detailaddr) {
      ModelAndView mav = new ModelAndView();
      dto.setMem_id((String)session.getAttribute("sid"));
      int result = dao.mypageAddrUpdate(dto);
      String msg=result>0?"주소변경 성공!":"주소변경 실패!";
      mav.addObject("msg", msg);
      mav.addObject("gourl", "memberProfileForm.do");
      mav.setViewName("mypage/mypagePopupMsg");
      return mav;
   }
   
   @RequestMapping("/mypageEmailUpdateForm.do")
   public String mypageEmailUpdateForm() {
      
      return "mypage/mypageEmailUpdate";
   }
   
   
   //이메일 변경
   @RequestMapping("/mypageEmailUpdate.do")
   public ModelAndView mypageEmailUpdate(
         MemberDTO dto,
         HttpSession session,
         @RequestParam("mem_email") String mem_email) {
      
      ModelAndView mav= new ModelAndView();
      dto.setMem_id((String)session.getAttribute("sid"));
      int result = dao.mypageEmailUpdate(dto);
      String msg=result>0?"이메일 변경 성공!":"이메일 변경 실패!";
      mav.addObject("msg", msg);
      mav.addObject("gourl", "memberProfileForm.do");
      mav.setViewName("mypage/mypagePopupMsg");
      return mav;
      
   }
   
   @RequestMapping("/mypagePhoneUpdateForm.do")
   public String mypagePhoneUpdateForm() {
      
      return "mypage/mypagePhoneUpdate";
   }
   
   
   //전화번호 변경
   @RequestMapping("/mypagePhonUpdate.do")
   public ModelAndView mypagePhoneUpdate(
         MemberDTO dto,
         HttpSession session,
         @RequestParam("mem_phone") String mem_phone) {
      
      ModelAndView mav= new ModelAndView();
      dto.setMem_id((String)session.getAttribute("sid"));
      int result = dao.mypagePhoneUpdate(dto);
      String msg=result>0?"전화번호 변경 성공!":"전화번호 변경 실패!";
      mav.addObject("msg", msg);
      mav.addObject("gourl", "memberProfileForm.do");
      mav.setViewName("mypage/mypagePopupMsg");
      return mav;
      
   }
   /*코치매칭 결제내역리스트*/
   @RequestMapping("mypageCoachMatchPayList.do")
   public ModelAndView mypageCoachMatchPayList(@RequestParam("mem_id")String mem_id,
		   @RequestParam(value="cp", defaultValue = "1")int cp) {
	   
		int listSize=5;
		int pageSize=5;
	      HashMap<String,Object> map = new HashMap<String, Object>();
	      map.put("mem_id",mem_id);
	      map.put("cp",cp);
	      map.put("ls",listSize);
		/*페이지설정*/
		int totalCnt=dao.getTotalCntPaymentList(map);

		String keywords="&mem_id="+mem_id;  //페이지이동시 검색키워드파라미터로보내기
		String pageStr=zipcok.page.CoachPageModule.makePage("mypageCoachMatchPayList.do", totalCnt, cp, listSize, pageSize,keywords);
		map.put("pdSenderKey","pd_mem_id");
		map.put("pdKey","코치");
		List<Pd_AllDTO> pdList=dao.coachPaymentList(map);
		ModelAndView mav= new ModelAndView();
		
		//후기존재하는지여부체크
		List review_idxList= dao.reviewExistCheck(map);
		mav.addObject("review_idxList", review_idxList);
		mav.addObject("pdList", pdList);
		mav.addObject("pageStr", pageStr);
		mav.setViewName("mypage/mypageCoachMatchPayList");
      return mav;
   }
   
   
   /*코치매칭 후기작성용 팝업창이동*/
   @RequestMapping("CoachReviewWritePopup.do")
   public ModelAndView  CoachReviewWritePopup (@RequestParam("pd_idx")int pd_idx,
		   @RequestParam("coach_name")String coach_name,
		   @RequestParam("coach_id")String coach_id,
		   @RequestParam("catename")String catename) {
	   
	   HashMap<String, Object> map = new HashMap<String, Object>();
	   map.put("pd_idx", pd_idx);
	   map.put("coach_name", coach_name);
	   map.put("coach_id", coach_id);
	   map.put("catename", catename);
	   ModelAndView mav= new ModelAndView();
	   mav.addObject("map", map);
	   mav.setViewName("mypage/ReviewWritePopup");
	   return mav;
   }
   /*코치후기작성하기*/
   @RequestMapping("coachStarReviewAdd.do")
   public ModelAndView coachStarReviewAdd(ReviewDTO rdto,HttpServletRequest req) {
	   //String starnum_s = req.getParameter("");
	   int result=dao.coachStarReviewAdd(rdto);
	   String msg=result>0?"후기가 등록되었습니다":"후기등록 실패";
	   ModelAndView mav=new ModelAndView();
	   mav.addObject("msg", msg);
	   mav.addObject("gourl", "mypageCoachMatchPayList.do?mem_id="+rdto.getRev_mem_id());
	   mav.setViewName("mypage/mypagePopupMsg");
	   return mav;
   }
   

   /*코치후기작성한거 보기*/
  @RequestMapping("seeCoachReviewPopup.do")
   public ModelAndView seeCoachReviewPopup(@RequestParam("pd_idx")int pd_idx,
		   @RequestParam("coach_name")String coach_name,
		   @RequestParam("coach_id")String coach_id,
		   @RequestParam("catename")String catename,
		   @RequestParam("rev_idx")int rev_idx) {
	   ModelAndView mav= new ModelAndView();
	   HashMap<String, Object> map = new HashMap<String, Object>();
	   map.put("pd_idx", pd_idx);
	   map.put("coach_name", coach_name);
	   map.put("coach_id", coach_id);
	   map.put("catename", catename);
	   mav.addObject("map", map);
	   	ReviewDTO revdto= dao.showReview(rev_idx);
	   mav.addObject("revdto", revdto);
	   mav.setViewName("mypage/coachReviewViewPopup");
	   return mav;
   }
   
   
   
   //마이페이지 F&A/고객센터 작성글 목록
   @RequestMapping("/mypageWriteList.do")
   public ModelAndView mypageWriteList(HttpSession session,
         @RequestParam(value = "cp", defaultValue = "1")int cp) {
      
      int totalCnt=dao.mypageWriteListTotalCnt((String)session.getAttribute("sid"));
      int listSize=5;
      int pageSize=5;
      String pageStr=zipcok.page.MypagePageModule.makePage("mypageWriteList.do", totalCnt, cp, listSize, pageSize);
      List list = dao.mypageWriteList(cp, listSize, (String)session.getAttribute("sid"));
      ModelAndView mav = new ModelAndView();
      mav.addObject("list", list);
      mav.addObject("pageStr", pageStr);
      mav.setViewName("mypage/mypageWriteList");
      
      return mav;
   }
   
   
   //마이페이지 작성글 삭제
   @RequestMapping("mypageCheckDel.do")
   public ModelAndView mypageWriteDelete(
		   HttpServletRequest req) {
	   
	   String[] checkArr=req.getParameterValues("checkRow");
	   ModelAndView mav=new ModelAndView();
	   HashMap<String, Object> map = new HashMap<String, Object>();
	   int count =0;
	   for(int i=0; i<checkArr.length; i++) {
		   count+=dao.mypageWriteDelete(checkArr[i]);
	   }
	   
	   mav.addObject("msg", "게시글이 삭제되었습니다.");
	   mav.addObject("gourl", "mypageWriteList.do");
	   mav.setViewName("mypage/mypageMsg");
	   return mav;
   }
   
   
   
   //마이페이지 커뮤니티 작성글 목록
   @RequestMapping("/mypageCommWriteList.do")
   public ModelAndView mypageCommWriteList(HttpSession session,
         @RequestParam(value = "cp", defaultValue = "1")int cp) {
      
      int totalCnt=dao.mypageCommWriteListTotalCnt((String)session.getAttribute("sid"));
      int listSize=5;
      int pageSize=5;
      String pageStr=zipcok.page.MypagePageModule.makePage("mypageCommWriteList.do", totalCnt, cp, listSize, pageSize);
      List list = dao.mypageCommWriteList(cp, listSize, (String)session.getAttribute("sid"));
      ModelAndView mav = new ModelAndView();
      mav.addObject("list", list);
      mav.addObject("pageStr", pageStr);
      mav.setViewName("mypage/mypageCommWriteList");
      
      return mav;
   }
   
   
   //마이페이지 커뮤니티 작성글 삭제
   @RequestMapping("mypageCommCheckDel.do")
   public ModelAndView mypageCommWriteDelete(
		   HttpServletRequest req) {
	   
	   String[] checkArr=req.getParameterValues("checkRow");
	   ModelAndView mav=new ModelAndView();
	   HashMap<String, Object> map = new HashMap<String, Object>();
	   int count =0;
	   for(int i=0; i<checkArr.length; i++) {
		   count+=dao.mypageCommWriteDelete(checkArr[i]);
		   count+=dao.mypageCommWriteDeleteRebbs(checkArr[i]);
	   }
	   
	   mav.addObject("msg", "게시글이 삭제되었습니다.");
	   mav.addObject("gourl", "mypageCommWriteList.do");
	   mav.setViewName("mypage/mypageMsg");
	   return mav;
   }
   
   
   
   //마이페이지 홈짐 좋아요 목록
   @RequestMapping("/mypageHomeGymLikeList.do")
   public ModelAndView mypageHomeGymLikeList(HttpSession session,
         @RequestParam(value = "cp", defaultValue = "1")int cp) {
      
      int totalCnt=dao.mypageHomeGymLikeListTotalCnt((String)session.getAttribute("sid"));
      int listSize=5;
      int pageSize=5;
      String pageStr=zipcok.page.MypagePageModule.makePage("mypageHomeGymLikeList.do", totalCnt, cp, listSize, pageSize);
      List list=dao.mypageHomeGymLikeList(cp, listSize, (String)session.getAttribute("sid"));
      ModelAndView mav = new ModelAndView();
      mav.addObject("list", list);
      mav.addObject("pageStr", pageStr);
      mav.setViewName("mypage/mypageHomeGymLikeList");

      
      return mav;
   }
   
      //마이페이지 코치매칭 좋아요 목록
      @RequestMapping("/mypageCoachMatchLikeList.do")
      public ModelAndView mypageCoachMatchLikeList(HttpSession session,
            @RequestParam(value = "cp", defaultValue = "1")int cp) {
         System.out.println("코치좋아요목록");
         int totalCnt=dao.mypageCoachMatchLikeListTotalCnt((String)session.getAttribute("sid"));
         int listSize=5;
         int pageSize=5;
         String pageStr2=zipcok.page.MypagePageModule.makePage("mypageCoachMatchLikeList.do", totalCnt, cp, listSize, pageSize);
         List list2=dao.mypageCoachMatchLikeList(cp, listSize, (String)session.getAttribute("sid"));
         ModelAndView mav = new ModelAndView();
         mav.addObject("list2", list2);
         mav.addObject("pageStr2", pageStr2);
         mav.setViewName("mypage/mypageCoachMatchLikeList");

         
         return mav;
      }
      
      //회원탈퇴 폼
//      @RequestMapping("/memberDeleteForm.do")
//      public String memberDeleteForm() {
//         
//         return "mypage/memberDeleteForm";
//      }
      
      //회원탈퇴
//      @RequestMapping("/memberDelete.do")
//      public ModelAndView memberDelete(HttpSession session,
//            @RequestParam("mem_pwd")String mem_pwd,
//            @RequestParam("mem_pwd2")String mem_pwd2) {
//         
//         ModelAndView mav = new ModelAndView();
//         if(mem_pwd.equals(mem_pwd2)) {
//            int result=dao.memberPhotoDelete((String)session.getAttribute("sid"));
//            int result2=dao.memberDelete((String)session.getAttribute("sid"));
//            System.out.println(result);
//            System.out.println(result2);
//            if(result>0 && result2>0) {
//               session.invalidate();
//               mav.addObject("msg", "회원탈퇴 하셨습니다~");
//               mav.addObject("gourl", "index.do");
//               mav.setViewName("mypage/mypageMsg");
//            }else {
//               mav.addObject("msg", "고객센터에 문의 바랍니다.");
//               mav.addObject("gourl", "index.do");
//               mav.setViewName("mypage/mypageMsg");
//            }
//            
//         }else {
//            mav.addObject("msg", "비밀번호가 일치하지않습니다.");
//            mav.addObject("gourl", "memberProfileForm.do");
//            mav.setViewName("mypage/mypageMsg");
//         }
//         return mav;
//      }
      @RequestMapping("myHomeGymHavingCheck.do")
      public ModelAndView myHomeGymHavingCheck(
    		  @RequestParam("mem_id")String user_id) {
    	  boolean check = dao.mypageHomeGymCheck(user_id);
    	  String goPage = check?"myHomeGymEnter.do?mem_id="+user_id:"HomeGymAdd.do";
    	  ModelAndView mav = new ModelAndView();
    	  mav.addObject("check", check);
    	  mav.addObject("goPage", goPage);
    	  mav.setViewName("mypage/mypageHomeGymCheckMsg");
    	  return mav;
      }
      @RequestMapping("/myHomeGymEnter.do")
      public ModelAndView myHomeGymEnter(
    		  @RequestParam("mem_id")String user_id) {
    	  HomeGymDTO hgContent = dao.mypageHomeGymInfo(user_id);
    	  hgContent.setHg_start_date(hgContent.getHg_start_date().substring(0, 10));
    	  hgContent.setHg_end_date(hgContent.getHg_end_date().substring(0, 10));
    	  List<HomeGymEquipmentDTO> eqContent = dao.mypageHomeGymEqInfo(user_id);
    	  List<CoachFileDTO> imgContent = dao.mypageHomeGymImgInfo(user_id);
    	  int like_count = dao.mypageHomeGymLikeCount(user_id);
    	  List<ReviewDTO> reviewContent = dao.HomeGymReview(user_id);
    	  PaymentDTO paymentContent = dao.mypageHomeGymPaymentFind(user_id);
    	  ModelAndView mav = new ModelAndView();
    	  mav.addObject("hgContent", hgContent);
    	  mav.addObject("eqContent", eqContent);
    	  mav.addObject("imgContent", imgContent);
    	  mav.addObject("like_count", like_count);
    	  mav.addObject("reviewContent", reviewContent);
    	  mav.addObject("paymentContent", paymentContent);
    	  mav.setViewName("mypage/mypageHomeGymInfo");
    	  return mav;
      }
      
      @RequestMapping("checkPMRequest.do")
      public ModelAndView checkPMRequest(@RequestParam("id")String id) {
         ModelAndView mav = new ModelAndView();
         mav.setViewName("mypage/PMrequestList");
         return mav;
      }
      @RequestMapping("changeStatus.do")
      public ModelAndView homegymStatusChange(
    		  @RequestParam("hg_status")String hg_status,
    		  @RequestParam("hg_mem_id")String hg_mem_id ) {
    	  Map<String, String> map = new HashMap<String, String>();
    	  map.put("hg_status", hg_status);
    	  map.put("hg_mem_id", hg_mem_id);
    	  int result = dao.mypageHomeGymStautsChange(map);
    	  ModelAndView mav = new ModelAndView();
    	  mav.addObject("hg_status", result);
    	  mav.setViewName("jsonView");
    	  return mav;
      }
      
      @RequestMapping("mypageHomeGymAddrUpdateForm.do")
      public ModelAndView mypageHomeGymAddrUpdateForm(
    		  @RequestParam("hg_mem_id")String hg_mem_id) {
    	  ModelAndView mav = new ModelAndView();
    	  mav.addObject("hg_mem_id", hg_mem_id);
    	  mav.setViewName("mypage/mypageHomeGymAddrUpdate");
    	  return mav;
      }
      
      @RequestMapping("homegymAddrUpdate.do")
      public ModelAndView mypageHomeGymAddrUpdate(
    		  	 @RequestParam("hg_mem_id")String hg_mem_id,
    	         @RequestParam("hg_faddr")String hg_faddr,
    	         @RequestParam("hg_saddr")String hg_saddr) {
    	  Map<String, String> map = new HashMap<String, String>();
    	  map.put("hg_mem_id", hg_mem_id);
    	  map.put("hg_faddr", hg_faddr);
    	  map.put("hg_saddr", hg_saddr);
    	  int result = dao.mypageHomeGymAddrUpdate(map);
    	  String msg = result>0?"홈짐 주소가 정상적으로 수정되었습니다.":"홈짐 주소 수정에 오류가 발생하였습니다.";
    	  String goUrl = "myHomeGymCheck.do?hg_mem_id="+hg_mem_id;
    	  ModelAndView mav = new ModelAndView();
    	  mav.addObject("msg", msg);
    	  mav.addObject("gourl", goUrl);
    	  mav.setViewName("mypage/mypagePopupMsg");
    	  return mav;
    	  }
      
      @RequestMapping("changeStation.do")
      public ModelAndView mypageHomeGymStationUpdate(
    		  @RequestParam("hg_mem_id")String hg_mem_id,
    		  @RequestParam("hg_station")String hg_station
    		  ) {
    	  Map<String, String> map = new HashMap<String, String>();
    	  map.put("hg_mem_id", hg_mem_id);
    	  map.put("hg_station", hg_station);
    	  int result = dao.mypageHomeGymStationUpdate(map);
    	  ModelAndView mav = new ModelAndView();
    	  mav.addObject("change_result", result);
    	  mav.addObject("change_station", hg_station);
    	  mav.setViewName("jsonView");
    	  return mav;
      }
      @RequestMapping("changePerson_count.do")
      public ModelAndView mypageHomeGymPerson_countUpdate(
    		  @RequestParam("hg_mem_id")String hg_mem_id,
    		  @RequestParam("hg_person_count")int hg_person_count
    		  ) {
    	  Map<String, Object> map = new HashMap<String, Object>();
    	  map.put("hg_mem_id", hg_mem_id);
    	  map.put("hg_person_count", hg_person_count);
    	  int result = dao.mypageHomeGymPerson_countUpdate(map);
    	  ModelAndView mav = new ModelAndView();
    	  mav.addObject("change_result", result);
    	  mav.addObject("change_person_count", hg_person_count);
    	  mav.setViewName("jsonView");
    	  return mav;
      }
      @RequestMapping("changePrice.do")
      public ModelAndView mypageHomeGymPriceUpdate(
    		  @RequestParam("hg_mem_id")String hg_mem_id,
    		  @RequestParam("hg_price")int hg_price
    		  ) {
    	  Map<String, Object> map = new HashMap<String, Object>();
    	  map.put("hg_mem_id", hg_mem_id);
    	  map.put("hg_price", hg_price);
    	  int result = dao.mypageHomeGymPriceUpdate(map);
    	  ModelAndView mav = new ModelAndView();
    	  mav.addObject("change_result", result);
    	  mav.addObject("change_price", hg_price);
    	  mav.setViewName("jsonView");
    	  return mav;
      }
      @RequestMapping("mypageEqListUpdate.do")
      public ModelAndView mypageHomeGymEqListUpdate(
    		  HttpServletRequest req,
    		  @RequestParam("mem_id")String mem_id) {
    	  String eq_name[] = req.getParameterValues("eq_name");
    	  String eq_count[] = req.getParameterValues("eq_count");
    	  dao.mypageHomeGymEqAllDelete(mem_id);
    	  int eq_update_count = 0;
    	  for(int i = 0 ; i < eq_name.length ; i++) {
    		  Map<String, String> eq_data = new HashMap<String, String>();
    		  eq_data.put("eq_mem_id", mem_id);
    		  eq_data.put("eq_name", eq_name[i]);
    		  eq_data.put("eq_count", eq_count[i]);
    		  eq_update_count += dao.mypageHomeGymEqUpdate(eq_data);
    	  }
    	  List<HomeGymEquipmentDTO> list = dao.mypageHomeGymEqInfo(mem_id);
    	  ModelAndView mav = new ModelAndView();
    	  mav.addObject("change_result", eq_update_count);
    	  mav.addObject("change_eqlist", list);
    	  mav.setViewName("jsonView");
    	  return mav;
      }
      @RequestMapping("mypageUseDateUpdate.do")
      public ModelAndView mypageHomeGymUseDateUpdate(
    		  @RequestParam("hg_mem_id")String mem_id,
    		  @RequestParam("choice_start_date")String start_date,
    		  @RequestParam("choice_end_date")String end_date,
    		  @RequestParam("choice_not_date")String not_date) {
    	  Map<String, Object> map = new HashMap<String, Object>();
    	  map.put("hg_mem_id", mem_id);
    	  map.put("start_date", java.sql.Date.valueOf(start_date));
    	  map.put("end_date", java.sql.Date.valueOf(end_date));
    	  map.put("not_date", not_date);
    	  int result = dao.mypageHomeGymUseDateUpdate(map);
    	  ModelAndView mav = new ModelAndView();
    	  mav.addObject("change_result", result);
    	  mav.addObject("change_start_date", start_date);
    	  mav.addObject("change_end_date", end_date);
    	  mav.addObject("change_not_date", not_date);
    	  mav.setViewName("jsonView");
    	  return mav;
      }
      @RequestMapping("mypageUseTimeUpdate.do")
      public ModelAndView mypageHomeGymUseTimeUpdate(
    		  @RequestParam("hg_mem_id")String mem_id,
    		  @RequestParam("choice_start_time")int start_time,
    		  @RequestParam("choice_end_time")int end_time) {
    	  Map<String, Object> map = new HashMap<String, Object>();
    	  map.put("hg_mem_id", mem_id);
    	  map.put("start_time", start_time);
    	  map.put("end_time", end_time);
    	  int result = dao.mypageHomeGymUseTimeUpdate(map);
    	  ModelAndView mav = new ModelAndView();
    	  mav.addObject("change_result", result);
    	  mav.addObject("change_start_time", start_time);
    	  mav.addObject("change_end_time", end_time);
    	  mav.setViewName("jsonView");
    	  return mav;
      }
      
      /*홈짐 결제내역리스트*/
      @RequestMapping("mypageHomeGymPayList.do")
      public ModelAndView mypageHomeGymPayList(@RequestParam("mem_id")String mem_id,
   		   @RequestParam(value = "cp1", defaultValue = "1")int cp1,
   			@RequestParam(value = "cp2", defaultValue = "1")int cp2) {
   	   
   	   int listSize=5;
   		int pageSize=5;
   		Map<String, Object> map = new HashMap<String, Object>();
   		map.put("mem_id", mem_id);
   		map.put("cp1", cp1);
   		map.put("cp2", cp2);
   		map.put("ls", listSize);
   		int totalCnt1 = dao.mypageHomeGymPayListTotalCnt(map);//내 홈짐 결제 리스트 totalCnt
   		int totalCnt2 = dao.mypageMyPayListTotalCnt(map);
   		String keywords = "&mem_id="+mem_id;
   			
   		String homegymPayListpageStr = zipcok.page.CoachMyPagePageModule1.makePage("mypageHomeGymPayList.do", totalCnt1, cp1, listSize, pageSize, keywords);
   		
   		String myPayListpageStr = zipcok.page.CoachMyPagePageModule2.makePage("mypageHomeGymPayList.do", totalCnt2, cp2, listSize, pageSize, keywords);
   		List<Pd_HgAllDTO> list = dao.mypageHomeGymPayList(map);
   		if(list!=null) {
   			for(int i = 0; i < list.size() ; i++) {
   				boolean ck = dao.mypageHomeGymReviewCheck(list.get(i).getPd_idx());
   				list.get(i).setReviewCheck(ck);
   				list.get(i).setReser_date(list.get(i).getReser_date().substring(0,10));
   			}
   		}
   		List<Pd_HgAllDTO> list2 = dao.mypageMyPayList(map);
   		if(list2!=null) {
   			for(int i = 0 ; i < list2.size() ; i++) {
   				list2.get(i).setReser_date(list2.get(i).getReser_date().substring(0,10));
   				boolean ck = dao.mypageMyReviewCheck(list2.get(i).getPd_idx());
   				System.out.println(ck);
   				list2.get(i).setReviewCheck(ck);
   				String hg_nickname = dao.mypageHomeGymNickname(list2.get(i).getPd_target_id());
   				list2.get(i).setHg_nickname(hg_nickname);
   			}
   		}
   		ModelAndView mav = new ModelAndView();
   		mav.addObject("homegymPayList", list);
   		mav.addObject("myPayList", list2);
   		mav.addObject("homegymPayListpageStr", homegymPayListpageStr);
   		mav.addObject("myPayListpageStr", myPayListpageStr);
   		mav.setViewName("mypage/mypageHomeGymPayList");
        return mav;
      }
      //////////////////////////////////////////////////////////////////////
      @RequestMapping("mypageAddrDetailsPopup.do")
      public ModelAndView mypageHomeGymaddrDetailsPopup(
      		@RequestParam("hg_mem_id")String hg_mem_id) {
      	HomeGymDTO dto = dao.mypageHomeGymInfo(hg_mem_id);
      	ModelAndView mav = new ModelAndView();
      	mav.addObject("homegym", dto);
      	mav.setViewName("coachMyPage/HomegymDetailsAddrPopup");
      	return mav;
      }
      @RequestMapping(value = "mypageReviewWritePopup", method=RequestMethod.GET)
      public ModelAndView mypageHomeGymReviewWriteForm(
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
      @RequestMapping(value = "mypageReviewWritePopup", method=RequestMethod.POST)
      public ModelAndView mypageHomeGymReviewWrite(ReviewDTO dto) {
      	int result = dao.mypageHomeGymReviewAdd(dto);
      	String msg = result>0?"리뷰가 성공적으로 등록되었습니다.":"리뷰 등록에 에러가 발생했습니다.";
      	ModelAndView mav = new ModelAndView();
      	mav.addObject("msg", msg);
      	mav.addObject("gourl", "mypageHomeGymPayList.do?mem_id="+dto.getRev_mem_id());
      	mav.setViewName("coachMyPage/coachMypagePayListMsg");
      	return mav;
      }
      @RequestMapping("mypageSeeHomeGymReviewPopup.do")
      public ModelAndView mypageHomeGymReviewView(
      		@RequestParam("rev_pd_idx")int rev_pd_idx) {
      	ReviewDTO dto = dao.mypageHomeGymReviewView(rev_pd_idx);
      	ModelAndView mav = new ModelAndView();
      	mav.addObject("review", dto);
      	mav.setViewName("coachMyPage/homegymReviewViewPopup");
      	return mav;
      }
      @RequestMapping("mypageHomeGymPaymentCancel.do")
      public ModelAndView mypageHomeGymPaymentCancel(
      		@RequestParam("pd_idx")int pd_idx,
      		@RequestParam("reser_idx")int reser_idx) {
      	int payment_result = dao.mypagehomegympaymentCancel_payment(pd_idx);
      	int reservation_result = dao.mypagehomegympaymentCancel_reservation(reser_idx);
      	ModelAndView mav = new ModelAndView();
      	mav.addObject("change_payment_result", payment_result);
      	mav.addObject("change_reservation_result", reservation_result);
      	mav.setViewName("jsonView");
      	return mav;
      }
}