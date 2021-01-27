
package zipcok.controller;

import javax.servlet.ServletContext;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.lang3.RandomStringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import zipcok.coach.model.CoachFileDTO;
import zipcok.member.model.MemberDAO;
import zipcok.member.model.MemberDTO;

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
	public ModelAndView memberJoinSubmit(MemberDTO dto, @RequestParam("upload")List<MultipartFile> list) {
		
		
		
        /*다중파일첨부 시 필요*/	
	
		ArrayList<CoachFileDTO> fileArr=new ArrayList<CoachFileDTO>();
		/*파일복사및저장하기*/
		for(int i=0;i<list.size();i++) {		
			System.out.println("사진원본이름:"+list.get(i).getOriginalFilename());
			String mfile_path=c.getRealPath("/upload/member/"); //저장되는 경로  (이것각자수정)
			String mfile_upload=copyInto( list.get(i), mfile_path);	//파일저장후 새로운이름생성됨
			String mfile_orig=list.get(i).getOriginalFilename(); //파일원본명
			String mfile_key="회원프로필"; //파일저장 구분키    (이것각자수정)
			String mfile_mem_id=dto.getMem_id();   //(이것각자수정)
			int mfile_size=(int)(list.get(i).getSize());

			String mfile_type=list.get(i).getContentType();
			CoachFileDTO cdto=new CoachFileDTO(0, mfile_key, mfile_mem_id, mfile_upload, mfile_size, mfile_orig, mfile_path, mfile_type);
			
			fileArr.add(cdto);
		}
		
		/*다중파일첨부 시 필요*/		
		
		
		
		HashMap<String,Object> map=new HashMap<String,Object>();
		map.put("fileArr", fileArr);
		map.put("memberDTO", dto);	
		
		int result=mdao.memberJoinSubmit(map);
		String msg=result>1?"회원가입 성공!":"회원가입 실패!";
		ModelAndView mav=new ModelAndView();
		mav.addObject("msg", msg);
		mav.setViewName("member/memberMsg");
		return mav;
	}
	
	
	
	
	@RequestMapping("/loginForm.do")
	public String loginForm() {
		
		return "member/login";
	}
	
	@RequestMapping("/login.do")
	public ModelAndView loginCheck(
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
				String dbname=mdao.getMemberName(mem_id);
				mav.addObject("msg", dbname+"님 환영합니다");
				mav.addObject("gourl", "index.do");
				mav.setViewName("member/loginMsg");
				session.setAttribute("sid", mem_id);
				session.setAttribute("sname", dbname);
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
	public String logout(HttpServletRequest req) {
		
		HttpSession session=req.getSession();
		session.invalidate();
		return "redirect:/index.do";
	}
	
	@RequestMapping("/idCheckForm.do")
	public String idCheckForm() {
		
		return "member/idCheck";
	}


	
}
