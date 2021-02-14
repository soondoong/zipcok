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
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import zipcok.coach.model.CoachDAO;
import zipcok.coach.model.CoachFileDTO;
import zipcok.coach.model.ReviewDTO;
import zipcok.homegym.model.HomeGymDTO;
import zipcok.homegym.model.HomeGymEquipmentDTO;
import zipcok.homegym.model.Pd_AllDTO;
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
   
   
   @RequestMapping("mypageHomeGymPayList.do")
   public String mypageHomeGymPayList() {
      
      return "mypage/mypageHomeGymPayList";
   }
   
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
      int listSize=3;
      int pageSize=3;
      String pageStr=zipcok.page.MypagePageModule.makePage("mypageWriteList.do", totalCnt, cp, listSize, pageSize);
      List list = dao.mypageWriteList(cp, listSize, (String)session.getAttribute("sid"));
      ModelAndView mav = new ModelAndView();
      mav.addObject("list", list);
      mav.addObject("pageStr", pageStr);
      mav.setViewName("mypage/mypageWriteList");
      
      return mav;
   }
   
   @RequestMapping("/mypageCommWriteList.do")
   public String mypageCommWriteList() {
      
      return "mypage/mypageCommWriteList";
   }
   
   
   //마이페이지 홈짐 좋아요 목록
   @RequestMapping("/mypageHomeGymLikeList.do")
   public ModelAndView mypageHomeGymLikeList(HttpSession session,
         @RequestParam(value = "cp", defaultValue = "1")int cp) {
      
      int totalCnt=dao.mypageHomeGymLikeListTotalCnt((String)session.getAttribute("sid"));
      int listSize=3;
      int pageSize=3;
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
         int listSize=3;
         int pageSize=3;
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
      @RequestMapping("/myHomeGymCheck.do")
      public ModelAndView myHomeGymEnter(
    		  @RequestParam("mem_id")String user_id) {
    	  HomeGymDTO hgContent = dao.mypageHomeGymInfo(user_id);
    	  hgContent.setHg_start_date(hgContent.getHg_start_date().substring(0, 10));
    	  hgContent.setHg_end_date(hgContent.getHg_end_date().substring(0, 10));
    	  List<HomeGymEquipmentDTO> eqContent = dao.mypageHomeGymEqInfo(user_id);
    	  List<CoachFileDTO> imgContent = dao.mypageHomeGymImgInfo(user_id);
    	  int like_count = dao.mypageHomeGymLikeCount(user_id);
    	  List<ReviewDTO> reviewContent = dao.HomeGymReview(user_id);
    	  ModelAndView mav = new ModelAndView();
    	  mav.addObject("hgContent", hgContent);
    	  mav.addObject("eqContent", eqContent);
    	  mav.addObject("imgContent", imgContent);
    	  mav.addObject("like_count", like_count);
    	  mav.addObject("reviewContent", reviewContent);
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
}