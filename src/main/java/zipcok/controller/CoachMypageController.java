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

import zipcok.coach.model.*;
import zipcok.coachmypage.model.CoachMypageDAO;
import zipcok.member.model.MemberDTO;


@Controller
public class CoachMypageController {

	@Autowired
	private CoachMypageDAO cdao;
	
	@Autowired
	private CoachDAO dao;

	@Autowired
ServletContext c;
	
	@RequestMapping("/coachMyPage.do")
	public ModelAndView coachMypageProfile(HttpSession session) {
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
			List list=cdao.coachMypageHomeGymLikeList(cp, listSize, (String)session.getAttribute("coachId"));
			ModelAndView mav = new ModelAndView();
			mav.addObject("list", list);
			mav.addObject("pageStr", pageStr);
			mav.setViewName("coachMyPage/coachMypageHomeGymLikeList");

			
			return mav;
		}
	
		
		//코치마이페이지 F&A/고객센터 작성글 목록
		@RequestMapping("/coachMypageWriteList.do")
		public ModelAndView coachMypageWriteList(HttpSession session,
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
		
		@RequestMapping("/coachMypageCommWriteList.do")
		public String coachMypageCommWriteList() {
			
			return "coachMyPage/coachMypageCommWriteList";
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
			cdao.curriInsert(cdto);
		}
		ModelAndView mav=new ModelAndView();
		mav.addObject("msg", "커리큘럼이 수정되었습니다.");	
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
	
}
