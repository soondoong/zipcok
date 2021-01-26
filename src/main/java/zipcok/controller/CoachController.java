package zipcok.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.HashMap;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpSession;

import org.apache.commons.lang3.RandomStringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import zipcok.coach.*;
import zipcok.coach.model.CoachDAO;
import zipcok.coach.model.CoachFileDTO;
import zipcok.coach.model.MainCoachDTO;

@Controller
public class CoachController {
	@Autowired
	CoachDAO dao;
	
	@Autowired
	ServletContext c;
	

	
	/*메인검색페이지 이동*/
	@RequestMapping("findCoachList.do")  
		public ModelAndView gotoCoachList() {
		HashMap<String, List<MainCoachDTO>> map=dao.mainCoachList();
		ModelAndView mav=new ModelAndView();
		mav.addObject("map",map);
		String path=c.getRealPath("/upload/coach/");
		mav.addObject("path", path);
		mav.setViewName("coach/coachListView");
		return mav;
	}
	
	/*코치매칭이용안내 이동*/
	@RequestMapping("coachMatchingInfo.do")
	public String coachMatchingInfo() {
		return "coach/matchingInfoView";
	}
			
	/*코치검색했을때 */
	@RequestMapping("searchCoach.do")
	public ModelAndView searchCoach(@RequestParam(value="location")String location,
			@RequestParam(value="extype")String extype,@RequestParam(value="category")String category,
			@RequestParam(value="cp", defaultValue = "1")int cp) {
		/*키워드 담기*/
		HashMap<String,Object> keywordMap=new HashMap<String,Object>();
		
		keywordMap.put("location",location);
		keywordMap.put("extype",extype);
		keywordMap.put("category",category);
		
		
		
		/*페이지설정*/
		int totalCnt=dao.getTotalCnt(keywordMap); //테이블명써주기
		int listSize=4;
		int pageSize=5;
		String keywords="&location="+location+"&extype="+extype+"&category="+category;  //페이지이동시 검색키워드파라미터로보내기
		String pageStr=zipcok.page.CoachPageModule.makePage("searchCoach.do", totalCnt, cp, listSize, pageSize,keywords);
		
		
		
		List<MainCoachDTO> list=dao.searchCoachList(keywordMap, cp, listSize);
		ModelAndView mav=new ModelAndView();
		mav.addObject("list", list);
		String path=c.getRealPath("/upload/coach/"); //사진경로
		mav.addObject("path", path);
		mav.addObject("keyword", keywordMap);
		mav.addObject("pageStr",pageStr);//페이지
		//mav.setViewName("jsonView");
		mav.setViewName("coach/searchCoachList");
		return mav;
	}
	
	/*코치등록안내 이동*/
	@RequestMapping("coachRegistInfoView.do")
		public String gotoCoachRegistInfo() {
		return "coach/coachRegistInfoView";
	}
		

	/*코치가입 이동*/
	@RequestMapping("coachRegistView.do")
		public String gotoCoachRegist() {
		return "coach/coachRegistView";
	}
	
	/*코치가입하기 기능*/
	@RequestMapping("coachJoin.do")
	public ModelAndView coachJoin(MainCoachDTO dto, @RequestParam("upload")List<MultipartFile> list) {
		ArrayList<CoachFileDTO> fileArr=new ArrayList<CoachFileDTO>();
		/*파일복사및저장하기*/
		for(int i=0;i<list.size();i++) {		
			System.out.println("사진원본이름:"+list.get(i).getOriginalFilename());
			String mfile_path=c.getRealPath("/upload/coach/"); //저장되는 경로
			String mfile_upload=copyInto( list.get(i), mfile_path);	//파일저장후 새로운이름생성됨
			String mfile_orig=list.get(i).getOriginalFilename(); //파일원본명
			String mfile_key="코치"; //파일저장 구분키
			String mfile_mem_id=dto.getCoach_mem_id();
			int mfile_size=(int)(list.get(i).getSize());

			String mfile_type=list.get(i).getContentType();
			CoachFileDTO cdto=new CoachFileDTO(0, mfile_key, mfile_mem_id, mfile_upload, mfile_size, mfile_orig, mfile_path, mfile_type);
			
			fileArr.add(cdto);
		}
		
		
		ModelAndView mav=new ModelAndView();
		int result=dao.coachJoin(dto);
		
		int count=dao.coachInfoFileUpload(fileArr);
		if(count==fileArr.size()) {
			System.out.println("사진등록성공");
		}
		
		String msg=result>0?"코치로 등록되었습니다":"코치 등록실패";
		mav.addObject("msg", msg);
		mav.addObject("gopage", "index.do");
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
	
}
