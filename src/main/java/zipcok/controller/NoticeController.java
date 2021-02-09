package zipcok.controller;

import org.apache.commons.lang3.RandomStringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import zipcok.notice.model.NoticeDAO;
import zipcok.notice.model.NoticeDTO;
import zipcok.notice.model.ZipcokFileDTO;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.*;

import javax.servlet.ServletContext;
@Controller
public class NoticeController {
   
   @Autowired
   private NoticeDAO noticeDao;

   
   @Autowired
   ServletContext c;


	//공지사항 리스트,페이징
	@RequestMapping("noticeList.do")
	public ModelAndView goNoticeList(
			@RequestParam(value="cp",defaultValue = "1")int cp) {
		int totalCnt=noticeDao.getTotalCnt();
		int listSize=10;
		int pageSize=10;
		String pageStr=zipcok.page.PageModule.makePage("noticeList.do", totalCnt, cp, listSize, pageSize);
		noticeDao.zfileRealDelete();//del_yn 이 Y 인 데이터 삭제
		List list = noticeDao.noticeAllList(cp, listSize);
		ModelAndView mav=new ModelAndView();
		
		mav.addObject("pageStr",pageStr);
		mav.addObject("list",list);
		mav.setViewName("notice/noticeList");
		return mav;
	}
	
	
	
	//공지사항 글쓰기 페이지이동
	@RequestMapping("noticeWriteView.do")
	public String goNoticeWriteView() {
		return "notice/noticeWriteView";
	}

	
	
	//공지사항 글쓰기
	@RequestMapping("noticeWrite.do")
	public ModelAndView goNoticeWrite(NoticeDTO dto,
			@RequestParam("upload")List<MultipartFile> list) {
		int result=noticeDao.noticeWrite(dto);
		int maxIdx = noticeDao.noticeMaxIdx();
		
/*다중파일첨부 시 필요*/	
		
		
		ArrayList<ZipcokFileDTO> fileArr=new ArrayList<ZipcokFileDTO>();
		/*파일복사및저장하기*/
		for(int i=0;i<list.size();i++) {		
			if(!list.get(i).getOriginalFilename().equals("")) {
			System.out.println("사진원본이름:"+list.get(i).getOriginalFilename());
			int zfile_bbs_idx=maxIdx;
			String zfile_path=c.getRealPath("/upload/notice/"); //저장되는 경로
			String zfile_upload=copyInto( list.get(i), zfile_path);	//파일저장후 새로운이름생성됨
			String zfile_orig=list.get(i).getOriginalFilename(); //파일원본명
			String zfile_mem_id = "admin";
			String zfile_type = list.get(i).getContentType();
			int zfile_size=(int)(list.get(i).getSize());
			ZipcokFileDTO zdto=new ZipcokFileDTO(0, zfile_bbs_idx, zfile_mem_id, "", zfile_upload, zfile_size, zfile_orig, zfile_path, zfile_type,"N");
			
			fileArr.add(zdto);
			}
		}
		
/*다중파일첨부 시 필요*/		
		
		int count=noticeDao.noticeFileUpload(fileArr);
		if(count==fileArr.size()) {
			System.out.println("사진등록성공");
		}
		
		String msg=result>0?"공지사항이 성공적으로 등록되었습니다":"알 수 없는 오류";
		
		ModelAndView mav=new ModelAndView();
		mav.addObject("msg",msg);
		mav.addObject("gopage","noticeList.do");
		mav.setViewName("notice/noticeMsg");
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
	
	
	
	
	
	
	
	//컨텐츠보기
	@RequestMapping("noticeContent.do")
	public ModelAndView goNoticeContent(
			@RequestParam(value="bbs_idx",defaultValue = "0")int bbs_idx) {
		NoticeDTO dto=noticeDao.noticeContent(bbs_idx);
		noticeDao.noticeReadnum(bbs_idx);//조회수+1해주는 sql 실행
		
		int rnum=noticeDao.findRownum(bbs_idx);
		NoticeDTO prev=noticeDao.noticePrevNext(rnum-1);
		NoticeDTO next=noticeDao.noticePrevNext(rnum+1);
		
		List<ZipcokFileDTO> list=noticeDao.zfileSelect(bbs_idx);
		ModelAndView mav=new ModelAndView();
		mav.addObject("list",list);
		mav.addObject("dto",dto);
		mav.addObject("prev", prev);
		mav.addObject("next",next);
		mav.setViewName("notice/noticeContent");
		return mav;
	}
	
	
	
	//카테고리별 리스트검색
	@RequestMapping("noticeSearchList.do")
	public ModelAndView goNoticeSearchList(
			@RequestParam(value="bbs_category",required = false)String bbs_category,
			@RequestParam(value="cp",defaultValue = "1")int cp) {
		int totalCnt=noticeDao.getCateTotalCnt(bbs_category);
		int listSize=10;
		int pageSize=10;
		List list=noticeDao.noticeSearchList(cp, listSize, bbs_category);
		
		String keywords="&bbs_category="+bbs_category; //페이지이동시 검색키워드파라미터로보내기
		String pageStr=zipcok.page.NoticePageModule.makePage("noticeSearchList.do", totalCnt, cp, listSize, pageSize,keywords);
		
		ModelAndView mav=new ModelAndView();
		mav.addObject("pageStr",pageStr);
		mav.addObject("list",list);
		mav.addObject("category", bbs_category);
		mav.setViewName("notice/noticeList");
		return mav;
	}
	
	
	
	//수정페이지로 이동
	@RequestMapping("noticeUpdateView.do")
	public ModelAndView goNoticeUpdateeView(
		@RequestParam(value="bbs_idx",defaultValue = "0")int bbs_idx) {
		NoticeDTO dto=noticeDao.noticeContent(bbs_idx);
		
		List<ZipcokFileDTO> list=noticeDao.zfileSelect(bbs_idx);
		ModelAndView mav=new ModelAndView();
		
		mav.addObject("list",list);
		mav.addObject("dto",dto);
		mav.setViewName("notice/noticeUpdateView");
		return mav;
	}
	
	
	
	//수정하기
	@RequestMapping("noticeUpdate.do")
	public ModelAndView goNoticeUpdate(NoticeDTO dto,
			@RequestParam("upload")List<MultipartFile> list,
			@RequestParam("files")String files[],
			@RequestParam("del_yn")String del_yn[],
			@RequestParam("bbs_idx")int bbs_idx) {
		for(int i = 0 ; i < files.length ; i ++) {
			System.out.println(files[i]);
			if(del_yn[i].equals("Y")) {
				noticeDao.deleteFile(files[i]);
			}
		}
		//파일들의 del_yn을 바꿔준 후에
		noticeDao.zfileRealDelete();//del_yn 이 Y 인 데이터 삭제
		// 수정글내용은 수정해주기
			int result=noticeDao.noticeUpdate(dto);
		//새로등록한다고 올린파일은 디비에저장해주기	
			ArrayList<ZipcokFileDTO> fileArr=new ArrayList<ZipcokFileDTO>();
			/*파일복사및저장하기*/
			for(int i=0;i<list.size();i++) {
				if(!list.get(i).getOriginalFilename().equals("")) {//파일명이 빈값인 파일이 계속 추가돼서 조건 걸어놓음
				System.out.println("사진원본이름:"+list.get(i).getOriginalFilename());
				int zfile_bbs_idx=dto.getBbs_idx();
				String zfile_path=c.getRealPath("/upload/notice/"); //저장되는 경로
				String zfile_upload=copyInto( list.get(i), zfile_path);	//파일저장후 새로운이름생성됨
				String zfile_orig=list.get(i).getOriginalFilename(); //파일원본명
				String zfile_mem_id = "admin";
				String zfile_type = list.get(i).getContentType();
				int zfile_size=(int)(list.get(i).getSize());
				String del_yn_upload="N";
				ZipcokFileDTO zdto = new ZipcokFileDTO(0, zfile_bbs_idx, zfile_mem_id, "key", zfile_upload, zfile_size, zfile_orig, zfile_path, zfile_type, del_yn_upload);
		
				fileArr.add(zdto);
				}
			}
	/*다중파일첨부 시 필요*/
			int count=noticeDao.noticeFileUpload(fileArr);
				
			
			if(count==fileArr.size()) {
				System.out.println("사진등록성공");
			}			
			String msg=result>0?"공지사항이 수정되었습니다":"알 수 없는 오류";
		
		
			ModelAndView mav=new ModelAndView();
			mav.addObject("msg",msg);
			mav.addObject("gopage","noticeContent.do?bbs_idx="+bbs_idx);
			mav.setViewName("notice/noticeMsg");
			return mav;
		
	}
	
	//삭제하기
	@RequestMapping("noticeDelete.do")
	public ModelAndView goNoticeDelete(String bbs_idx) {
	      int bbs_idx2=Integer.parseInt(bbs_idx);
	      int result=noticeDao.noticeDelete(bbs_idx2);
	      noticeDao.noticeAndFileDel(bbs_idx2);
	      String msg=result>0?"공지사항이 삭제되었습니다":"알 수 없는 오류";
	      
	      ModelAndView mav=new ModelAndView();
	      mav.addObject("msg",msg);
	      mav.addObject("gopage", "noticeList.do");
	      mav.setViewName("notice/noticeMsg");
	      return mav;
	}
//	
//	//파일 삭제하기
//	@RequestMapping("deleteFile.do")
//	public ModelAndView deleteFile(
//			@RequestParam(value="zfile_bbs_idx",defaultValue = "1")int zfile_bbs_idx,
//			@RequestParam(value="del_yn")String del_yn[]) {
//		
//		int result=0;
//		for(int i=0;i<del_yn.length;i++) {
//		ZipcokFileDTO dto=new ZipcokFileDTO(zfile_bbs_idx, del_yn[i]);
//		result+=noticeDao.deleteFile(dto);
//		}
//		String msg=result==del_yn.length?"사진삭제 성공":"사진삭제 실패";
//		
//		ModelAndView mav=new ModelAndView();
//		mav.addObject("msg",msg);
//		mav.addObject("gopage", "noticeUpdateView.do");
//	      mav.setViewName("notice/noticeMsg");
//	      return mav;
//	}
}

