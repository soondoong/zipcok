package zipcok.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;

import javax.servlet.ServletContext;
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
import zipcok.comm.model.ExBbsDAO;
import zipcok.comm.model.ExBbsDTO;
import zipcok.comm.model.ExReBbsDTO;
import zipcok.comm.model.FoodBbsDAO;
import zipcok.comm.model.BbsFileDAO;
import zipcok.comm.model.BbsFileDTO;

@Controller
public class CommDailyController {
	
	@Autowired
	private ExBbsDAO exBbsDao;
	@Autowired
	private BbsFileDAO bbsFileDao;
	
	@Autowired
	ServletContext c;
	
	//일일 운동 게시판 목록보기
	@RequestMapping("commDailyList.do")
	public ModelAndView dailyList(@RequestParam(value="cp",defaultValue = "1")int cp) {
		int totalCnt=exBbsDao.getTotalCnt();
		int listSize=5;
		int pageSize=5;
		String pageStr=zipcok.page.CommPageModule.makePage("commDailyList.do", totalCnt, cp, listSize, pageSize);
		List<ExBbsDTO> list=exBbsDao.dailyList(cp, listSize);
		for(int i=0;i<list.size();i++) {
			int idx=list.get(i).getEx_idx();
			int recnt=exBbsDao.dailyGetTotalRe(idx);
			int count=exBbsDao.dailySetTotalRe(recnt, idx);
		}
		ModelAndView mav=new ModelAndView();
		mav.addObject("list", list);
		mav.addObject("pageStr", pageStr);
		mav.setViewName("comm/commDailyList");
		return mav;
	}
	
	//일일 운동 게시판 글쓰기 입장
	@RequestMapping(value="commDailyWrite.do", method=RequestMethod.GET)
	public String dailyWriteForm() {
		return "comm/commDailyWrite";
	}
	
	//일일 운동 게시판 글쓰기 실행 & 파일첨부
	@RequestMapping(value="commDailyWrite.do", method=RequestMethod.POST)
	public ModelAndView DailyWriteSubmit(ExBbsDTO dto, @RequestParam("upload")List<MultipartFile> list,HttpSession session) {
		int result=exBbsDao.dailyWrite(dto);
		System.out.println(dto.getEx_comm_idx());
		String msg=result>0?"글쓰기 성공!":"글쓰기 실패!";
		
		ArrayList<BbsFileDTO> fileArr=new ArrayList<BbsFileDTO>();
		/*파일복사및저장하기*/
		for(int i=0;i<list.size();i++) {		
			System.out.println("사진원본이름:"+list.get(i).getOriginalFilename());
			String bfile_path=c.getRealPath("/upload/comm/"); //저장되는 경로
			String bfile_rename=copyInto(list.get(i), bfile_path);	//파일저장후 새로운이름생성됨
			String bfile_origin=list.get(i).getOriginalFilename(); //파일원본명
			String bfile_meal="아침"; //파일저장 구분키
			System.out.println(session.getAttribute("com_idx"));
			String bfile_comm=String.valueOf(session.getAttribute("com_idx"));
			int bfile_size=(int)(list.get(i).getSize());
			String bfile_type=list.get(i).getContentType();
		//	BbsFileDTO bdto=new BbsFileDTO(0, "0", bfile_rename, bfile_size, bfile_origin, bfile_path, bfile_type, bfile_comm, bfile_meal);
			
			//fileArr.add(bdto);
		}		
		/*다중파일첨부 시 필요*/	
		
		int count=bbsFileDao.bbsFileUpload(fileArr); 
		if(count==fileArr.size()) {
			System.out.println("사진등록성공");
		}
		
		ModelAndView mav=new ModelAndView();
		mav.addObject("msg", msg);
		mav.addObject("gopage", "commDailyList.do");
		mav.setViewName("comm/commDailyMsg");
		return mav;
	}
	
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
		
	// 첨부 파일 삭제
	@RequestMapping("commFileDelte.do")
	public ModelAndView deleteFile(BbsFileDTO dto) {
		fileDel(dto.getBfile_path(),dto.getBfile_rename());
		//int result=bbsFileDao.db삭제하는 dao메소드
		//String msg=result>0?"파일 삭제 성공!":"파일 삭제 실패!";
		ModelAndView mav=new ModelAndView();
		//mav.addObject("msg", msg);
		return mav;
	}
	
		private void fileDel(String path,String name) {
			File f=new File(path+'/'+name);
			if(f.isFile()) {
				f.delete();
			}
		
	}
	
	//일일 운동 게시판 글보기
	@RequestMapping("commDailyContent.do")
	public ModelAndView dailyContent(int ex_idx) {
		int result=exBbsDao.dailyReadnum(ex_idx);
		ExBbsDTO dto=exBbsDao.dailyContent(ex_idx);
		List list=exBbsDao.dailyReList(ex_idx);
		int recnt=exBbsDao.dailyGetTotalRe(ex_idx);
		String bfile_bbs="0";
		//List<BbsFileDTO> filelist=bbsFileDao.bbsFileList(bfile_bbs, ex_idx);
		ModelAndView mav=new ModelAndView();
		mav.addObject("dto", dto);
		mav.addObject("list", list);
		mav.addObject("recnt", recnt);
		//mav.addObject("filelist", filelist);
		mav.setViewName("comm/commDailyContent");
		return mav;
	}
	
	//일일 운동 게시판 글수정 입장
	@RequestMapping(value="commDailyUpdate.do", method=RequestMethod.GET)
	public ModelAndView dailyUpdateForm(int ex_idx) {
		ExBbsDTO dto=exBbsDao.dailyContent(ex_idx);
		ModelAndView mav=new ModelAndView();
		mav.addObject("dto", dto);
		mav.setViewName("comm/commDailyUpdate");
		return mav;
	}
	
	//일일 운동 게시판 글수정 실행
	@RequestMapping(value="commDailyUpdate.do", method=RequestMethod.POST)
	public ModelAndView dailyUpdateSubmit(ExBbsDTO dto, @RequestParam(value="ex_idx")String idx_s) {
		int ex_idx=Integer.parseInt(idx_s);
		dto.setEx_idx(ex_idx);
		int result=exBbsDao.dailyUpdate(dto);
		String msg=result>0?"글수정 성공!":"글수정 실패!";
		ModelAndView mav=new ModelAndView();
		mav.addObject("msg", msg);
		mav.addObject("gopage", "commDailyContent.do?ex_idx="+ex_idx);
		mav.setViewName("comm/commDailyMsg");
		return mav;
	}
	
	//일일 운동 게시판 글삭제
	@RequestMapping("commDailyDelete.do")
	public ModelAndView dailyDelete(String ex_idx) {
		int ex_idx2=Integer.parseInt(ex_idx);
		int result=exBbsDao.dailyDelete(ex_idx2);
		String msg=result>0?"글삭제 성공!":"글삭제 실패!";
		ModelAndView mav=new ModelAndView();
		mav.addObject("msg", msg);
		mav.addObject("gopage", "commDailyList.do");
		mav.setViewName("comm/commDailyMsg");
		return mav;	
	}
	
	//일일 운동 게시판 댓글작성
	@RequestMapping("commDailyReWrite.do")
	public ModelAndView dailyReWrite(int re_idx, int ex_idx, ExReBbsDTO dto) {
		if(re_idx==0) {
			dto.setRe_sunbun(1);
		}else {
			int max=exBbsDao.dailyGetMaxSunbun(re_idx);
			dto.setRe_sunbun(max);
		}
		dto.setRe_bbs_idx(ex_idx);
		int result=exBbsDao.dailyReWrite(dto);
		String msg=result>0?"댓글 작성 성공!":"댓글 작성 실패!";
		ModelAndView mav=new ModelAndView();
		mav.addObject("msg", msg);
		mav.addObject("gopage", "commDailyContent.do?ex_idx="+ex_idx);
		mav.setViewName("comm/commDailyMsg");
		return mav;
	}
	
	//일일 운동 게시판 댓글삭제
	@RequestMapping("commDailyReDelete.do")
	public ModelAndView dailyReDelete(int re_lev,int ex_idx, int re_group, int re_idx) {
		int result=0;
		int re_lev_p=re_lev;
		if(re_lev_p==1) {
			result=exBbsDao.dailyReDelete(re_group);
		}else if(re_lev_p==2) {
			result=exBbsDao.dailyReReDelete(re_idx);
		}
		String msg=result>0?"댓글삭제 성공!":"댓글삭제 실패!";
		ModelAndView mav=new ModelAndView();
		mav.addObject("msg", msg);
		mav.addObject("gopage", "commDailyContent.do?ex_idx="+ex_idx);
		mav.setViewName("comm/commDailyMsg");
		return mav;
	}
	
	//일일 운동 게시판 대댓글작성
	@RequestMapping("commDailyReReWrite.do")
	public ModelAndView dailyReReWrite(ExReBbsDTO dto, int re_group,int re_bbs_idx,int ex_idx) {
		int re_sunbun_p=exBbsDao.dailyGetSunbun_p(re_group);
		exBbsDao.dailyReUpdate(re_bbs_idx, re_sunbun_p+1);
		dto.setRe_sunbun(re_sunbun_p+1);
		int result=exBbsDao.dailyReReWrite(dto);
		String msg=result>0?"대댓글작성 성공!":"대댓글작성 실패!";
		ModelAndView mav=new ModelAndView();
		mav.addObject("msg", msg);
		mav.addObject("gopage", "commDailyContent.do?ex_idx="+ex_idx);
		mav.setViewName("comm/commDailyMsg");
		return mav;
	}
	
}

