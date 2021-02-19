package zipcok.controller;

import javax.servlet.ServletContext;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.lang3.RandomStringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import zipcok.coach.model.CoachFileDTO;
import zipcok.homegym.model.HomeGymDAO;
import zipcok.member.model.MemberAllDTO;
import zipcok.member.model.MemberDAO;
import zipcok.member.model.MemberDTO;
import zipcok.mypage.model.MypageDAO;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.*;

@Controller
public class MemberController {

   @Autowired
   private MemberDAO mdao;
   
   @Autowired
   private MypageDAO mpdao;   //수연채팅방필요
   
   @Autowired
   private HomeGymDAO homegymDAO;
   
   @Autowired
   ServletContext c;
   
   @RequestMapping("/memberJoinForm.do")
   public String memberJoinForm() {
      return "member/memberJoin";
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
   
   
   
   
   
   
   @RequestMapping("/memberJoin.do")
   public ModelAndView memberJoinSubmit(
         MemberDTO dto,
         @RequestParam("upload")List<MultipartFile> list) {
      
	   String msg="";
       ModelAndView mav=new ModelAndView();
      
        /*다중파일첨부 시 필요*/   
   
      ArrayList<CoachFileDTO> fileArr=new ArrayList<CoachFileDTO>();
      /*파일복사및저장하기*/
      for(int i=0;i<list.size();i++) {      
         System.out.println("사진원본이름:"+list.get(i).getOriginalFilename());
         String mfile_path=c.getRealPath("/upload/member/"); //저장되는 경로  (이것각자수정)
         String mfile_upload=copyInto( list.get(i), mfile_path);   //파일저장후 새로운이름생성됨
         String mfile_orig=list.get(i).getOriginalFilename(); //파일원본명
         String mfile_key="회원프로필"; //파일저장 구분키    (이것각자수정)
         String mfile_mem_id=dto.getMem_id();   //(이것각자수정)
         int mfile_size=(int)(list.get(i).getSize());

         String mfile_type=list.get(i).getContentType();
         CoachFileDTO cdto=new CoachFileDTO(0, mfile_key, mfile_mem_id, mfile_upload, mfile_size, mfile_orig, mfile_path, mfile_type);
 
         
         if(mfile_size!=0) {
        	 fileArr.add(cdto);
    
           HashMap<String,Object> map=new HashMap<String,Object>();
           map.put("fileArr", fileArr);
           map.put("memberDTO", dto);
              
           int result=mdao.memberJoinSubmit(map);
           
           if(result>1) {
         	  msg="회원가입 성공! 환영합니다~";
         	  mav.addObject("msg", msg);
         	  mav.addObject("gourl", "loginForm.do");
              mav.setViewName("member/memberMsg");
           }else {
         	  msg="회원가입 실패! 정보를 확인해주세요~";
         	  mav.addObject("msg", msg);
         	  mav.addObject("gourl", "loginForm.do");
              mav.setViewName("member/memberMsg");
           }
    
         }else {
        	 msg="프로필 사진등록을 해주세요! (필수)";
        	 mav.addObject("msg", msg);
             mav.setViewName("member/profileImg_ok");
         }
               
      }
     
      
      return mav;
   }

   
   
   
   @RequestMapping("/loginForm.do")
   public String loginForm() {
      
      return "member/login";
   }
   
   @RequestMapping("/login.do")
   public ModelAndView loginCheck(MemberDTO dto,
         HttpServletRequest req, HttpServletResponse resp,
         @RequestParam("mem_id")String mem_id,
         @RequestParam("mem_pwd")String mem_pwd,
         HttpSession session) {
      
      ModelAndView mav=new ModelAndView();
      
      String str=mdao.idCheck(mem_id);      
      //String gourl="";
      //String msg="";
      
      if(str!=null) {
         String str2=mdao.pwdCheck(mem_id);
         if(str2.equals(mem_pwd)) {
            String type=mdao.typeCheck(mem_id);
            if(type.equals("일반회원")) {
               String dbname=mdao.getMemberName(mem_id);
               mav.addObject("msg", dbname+"님 환영합니다");
               mav.addObject("gourl", "index.do");
               mav.setViewName("member/loginMsg");
               session.setAttribute("sid", mem_id);
               session.setAttribute("sname", dbname);
               
               /*수연추가채팅용정보*/
               MemberDTO loginDTO = mpdao.memberProfile(mem_id);
               session.setAttribute("login", loginDTO);
               
               //사진도들어가
               MemberAllDTO loginDTO2 = mpdao.memberAllProfile(mem_id);
               session.setAttribute("loginAll", loginDTO2);
               
               /*수연추가채팅용정보*/
               String saveid=req.getParameter("saveid");
               if(saveid==null) {
                  Cookie ck=new Cookie("saveid", mem_id);
                  ck.setMaxAge(0);
                  resp.addCookie(ck);
               }else {
                  Cookie ck=new Cookie("saveid", mem_id);
                  ck.setMaxAge(60*60*24*30);
                  resp.addCookie(ck);
               }
            }else if(type.equals("코치회원")){
               String dbname=mdao.getMemberName(mem_id);
               mav.addObject("msg", dbname+"님 환영합니다");
               mav.addObject("gourl", "index.do");
               mav.setViewName("member/loginMsg");
               session.setAttribute("coachId", mem_id);
               session.setAttribute("sname", dbname);
               
               /*수연추가채팅용정보*/
               MemberDTO loginDTO = mpdao.memberProfile(mem_id);
               session.setAttribute("login", loginDTO);
               
               //사진도들어가
               MemberAllDTO loginDTO2 = mpdao.memberAllProfile(mem_id);
               session.setAttribute("loginAll", loginDTO2);
               /*수연추가채팅용정보*/
               String saveid=req.getParameter("saveid");
               if(saveid==null) {
                  Cookie ck=new Cookie("saveid", mem_id);
                  ck.setMaxAge(0);
                  resp.addCookie(ck);
               }else {
                  Cookie ck=new Cookie("saveid", mem_id);
                  ck.setMaxAge(60*60*24*30);
                  resp.addCookie(ck);
               }
            }
            
            
         }else {
            mav.addObject("msg", "아이디 또는 비밀번호가 잘못되었습니다");
            mav.addObject("gourl", "loginForm.do");
            mav.setViewName("member/loginMsg");
         }
      }else {
         mav.addObject("msg", "아이디 또는 비밀번호가 잘못되었습니다");
         mav.addObject("gourl", "loginForm.do");
         mav.setViewName("member/loginMsg");   
      }
      
      return mav;
   }

   @RequestMapping("/logout.do")
   public String logout( HttpSession session ) {
     
      session.invalidate();
      return "redirect:/index.do";
   }
   
   @RequestMapping("/idFindForm.do")
   public String idFindForm() {
      return "member/idFind";
   }
   
   @RequestMapping("/idFind.do")
   public ModelAndView idFind(@RequestParam("mem_email")String mem_email) {
      
      String mem_id=mdao.idFind(mem_email);
      ModelAndView mav=new ModelAndView();
      
      if(mem_id==null) {
         mav.addObject("msg", "해당 이메일로 가입하신 ID가 존재하지 않습니다.");
         mav.setViewName("member/idFind_ok");
      }else {
         mav.addObject("mem_id", mem_id);
         mav.addObject("msg", "찾으신 ID는 "+mem_id+" 입니다.");
         mav.setViewName("member/idFind_ok");
      }
      return mav;
   }
   
   @RequestMapping("/pwdFindForm.do")
   public String pwdFindForm() {
      
      return "member/pwdFindForm";
   }
   
   
   
   @RequestMapping("/pwdFind.do")
   public ModelAndView pwdFindSubmit(
         @RequestParam("code1") String code1,
         @RequestParam("code2") String code2,
         @RequestParam("mem_id") String mem_id,
         HttpSession session) {
      
      ModelAndView mav = new ModelAndView();
      String str = mdao.idCheck(mem_id);
      
      if(str!=null) {
         if(code1.equals(code2)) {
            mav.addObject("mem_id", mem_id);
            mav.addObject("msg","인증이 완료 되었습니다");
            mav.setViewName("member/pwdUpdate");
         }else {
            mav.addObject("msg","인증번호가 잘못되었습니다.");
            mav.addObject("gourl", "index.do");
            mav.setViewName("member/pwdFind_ok");   
         }
      }else {
         mav.addObject("msg","해당 아이디는 존재하지 않습니다.");
         mav.addObject("gourl", "index.do");
         mav.setViewName("member/pwdFind_ok");   
      }
      
      return mav;
   }
   
   @RequestMapping("/pwdUpdate.do")
   public ModelAndView pwdUpdate(MemberDTO dto,
         @RequestParam("mem_pwd")String mem_pwd,
         @RequestParam("mem_pwd2")String mem_pwd2,
         @RequestParam("mem_id")String mem_id) {
      
      ModelAndView mav=new ModelAndView();

      if(mem_pwd.equals(mem_pwd2)) {
         int result=mdao.pwdUpdate(dto);
         mav.addObject("msg", "비밀번호 수정 되었습니다. 다시 로그인해주세요~");
         mav.addObject("gourl", "loginForm.do");
         mav.setViewName("member/pwdUpdate_ok");
      }else {
         mav.addObject("msg", "잘못된 정보입니다 고객센터에 문의해주세요.");
         mav.addObject("gourl", "loginForm.do");
         mav.setViewName("member/pwdUpdate_ok");
      }
      return mav;
   }
   
   
   @RequestMapping("/idConfirm.do")
   public ModelAndView idConfirm(@RequestParam("mem_id") String mem_id) {
      
      int result = mdao.idConfirm(mem_id);
      ModelAndView mav = new ModelAndView();
      
      mav.addObject("result", result);
      mav.setViewName("jsonView");
      return mav;
   }
   
   @RequestMapping("/emailConfirm.do")
   public ModelAndView emailConfirm(@RequestParam("mem_email") String mem_email) {
      
      int result2 = mdao.emailConfirm(mem_email);
      ModelAndView mav = new ModelAndView();
      
      mav.addObject("result2", result2);
      mav.setViewName("jsonView");
      return mav;
   }
   
}