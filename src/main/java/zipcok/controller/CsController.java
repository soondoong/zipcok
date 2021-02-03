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
import javax.websocket.Session;

import org.apache.commons.lang3.RandomStringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import zipcok.cs.model.CsDAO;
import zipcok.cs.model.CsDTO;
import zipcok.cs.model.CsReDTO;
import zipcok.cs.model.CsZipcokFileDTO;


@Controller
public class CsController {

	@Autowired
	private CsDAO csDao;
	
	@Autowired
	ServletContext c;
	
	@RequestMapping("csPlzLogin.do")
	public ModelAndView csPlzLogin() {
		ModelAndView mav=new ModelAndView();
		mav.addObject("msg","로그인 후 이용 가능합니다");
		mav.addObject("gopage","csList.do");
		mav.setViewName("cs/csMsg");
		return mav;
	}
	
	//고객센터 리스트뽑기
	@RequestMapping("csList.do")
	public ModelAndView csList(
			@RequestParam(value="cp",defaultValue = "1")int cp) {
		int totalCnt=csDao.getTotalCnt();
		int listSize=10;
		int pageSize=10;
		String pageStr=zipcok.page.PageModule.makePage("csList.do", totalCnt, cp, listSize, pageSize);
		
		List list = csDao.csAllList(cp, listSize);
		ModelAndView mav=new ModelAndView();
		
		mav.addObject("pageStr",pageStr);
		mav.addObject("list",list);
		mav.setViewName("cs/csList");
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
	
		//고객센터 글쓰기 페이지이동
		@RequestMapping("csWriteView.do")
		public String goCsWriteView() {
			return "cs/csWriteView";
		}
		
		//고객센터 글쓰기
		@RequestMapping("csWrite.do")
		public ModelAndView goCsWrite(CsDTO dto,
				@RequestParam("upload")List<MultipartFile> list,
				@RequestParam("bbs_mem_id")String bbs_mem_id) {
			int result=csDao.csWrite(dto);
			int maxIdx=csDao.csMaxIdx();
			
			/*다중파일첨부 시 필요*/	
			
			
			ArrayList<CsZipcokFileDTO> fileArr=new ArrayList<CsZipcokFileDTO>();
			/*파일복사및저장하기*/
			for(int i=0;i<list.size();i++) {		
				System.out.println("사진원본이름:"+list.get(i).getOriginalFilename());
				int zfile_bbs_idx=maxIdx;
				String zfile_path=c.getRealPath("/upload/cs/"); //저장되는 경로
				String zfile_upload=copyInto( list.get(i), zfile_path);	//파일저장후 새로운이름생성됨
				String zfile_orig=list.get(i).getOriginalFilename(); //파일원본명
				String zfile_mem_id = bbs_mem_id;
				String zfile_type = list.get(i).getContentType();
				int zfile_size=(int)(list.get(i).getSize());
				String del_yn="N";
				CsZipcokFileDTO cdto=new CsZipcokFileDTO(0, zfile_bbs_idx, zfile_mem_id,"", zfile_upload, zfile_size, zfile_orig, zfile_path, zfile_type,del_yn);
				
				fileArr.add(cdto);
			}
	/*다중파일첨부 시 필요*/		
			
			int count=csDao.csFileUpload(fileArr);
			if(count==fileArr.size()) {
				System.out.println("사진등록성공");
			}
			
			String msg=result>0?"문의가 등록되었습니다!":"등록 실패했습니다";
			ModelAndView mav=new ModelAndView();
			mav.addObject("msg",msg);
			mav.addObject("gopage","csList.do");
			mav.setViewName("cs/csMsg");
			return mav;
		}
		
		
		
		//수정 페이지이동
		@RequestMapping("csUpdateView.do")
		public ModelAndView goCsUpdateView(
				@RequestParam(value="bbs_idx",defaultValue = "0")int bbs_idx) {
			CsDTO dto=csDao.csContent(bbs_idx);
			
			List<CsZipcokFileDTO> list=csDao.CsZfileSelect(bbs_idx);
			ModelAndView mav=new ModelAndView();
			
			mav.addObject("list",list);
			mav.addObject("dto",dto);
			mav.setViewName("cs/csUpdateView");
			return mav;
		}
		
		//고객센터 수정하기
		@RequestMapping("csUpdate.do")
		public ModelAndView goCsUpdate(CsDTO dto,CsZipcokFileDTO zdto,
				@RequestParam("upload")List<MultipartFile> list) {
			int result=csDao.csUpdate(dto);
			int csMaxIdx=csDao.csMaxIdx();
			
			ArrayList<CsZipcokFileDTO> fileArr=new ArrayList<CsZipcokFileDTO>();
			
			/*파일복사및저장하기*/
			for(int i=0;i<list.size();i++) {
				System.out.println("사진원본이름:"+list.get(i).getOriginalFilename());
				int zfile_bbs_idx=csMaxIdx;
				String zfile_path=c.getRealPath("/upload/cs/"); //저장되는 경로
				String zfile_upload=copyInto( list.get(i), zfile_path);	//파일저장후 새로운이름생성됨
				String zfile_orig=list.get(i).getOriginalFilename(); //파일원본명
				String zfile_mem_id = "admin";
				String zfile_type = list.get(i).getContentType();
				int zfile_size=(int)(list.get(i).getSize());
				System.out.println(zdto.getDel_yn());
				String del_yn=zdto.getDel_yn();
				zdto = new CsZipcokFileDTO(0, zfile_bbs_idx, zfile_mem_id, "", zfile_upload, zfile_size, zfile_orig, zfile_path, zfile_type, del_yn);
		
				fileArr.add(zdto);
			}
			/*다중파일첨부 시 필요*/
			int count=csDao.csFileUpload(fileArr);
			if(count==fileArr.size()) {
				System.out.println("사진등록성공");
			}	
			String msg=result>0?"수정이 완료되었습니다":"수정 실패했습니다";
			
			ModelAndView mav=new ModelAndView();
			mav.addObject("msg",msg);
			mav.addObject("gopage","csList.do");
			mav.setViewName("cs/csMsg");
			return mav;
		}
		
		//컨텐츠보기
		@RequestMapping("csContent.do")
		public ModelAndView goCsContent(
				@RequestParam(value="bbs_idx",defaultValue = "0")int bbs_idx) {
			CsDTO dto=csDao.csContent(bbs_idx);
			csDao.csReadnum(bbs_idx);//조회수 증가
			
			
			
			List<CsZipcokFileDTO> list=csDao.CsZfileSelect(bbs_idx);
			ModelAndView mav=new ModelAndView();
			mav.addObject("csFileList",list);
			mav.addObject("dto",dto);
			mav.setViewName("cs/csContent");
			return mav;
		}
		
		//고객센터 게시판 답변작성
		@RequestMapping("csReWrite.do")
		public ModelAndView csReWrite(
				@RequestParam("bbs_idx")int bbs_idx, CsReDTO dto) {
			
			
			dto.setRe_bbs_idx(bbs_idx);
			int result=csDao.csReWrite(dto);
			System.out.println(dto.getRe_bbs_idx());
			String msg=result>0?"답변 작성 성공!":"답변 작성 실패!";
			ModelAndView mav=new ModelAndView();
			mav.addObject("msg", msg);
			mav.addObject("gopage", "csContent.do?bbs_idx="+bbs_idx);
			mav.setViewName("cs/csMsg");
			return mav;
		}
}
