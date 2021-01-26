package zipcok.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.lang3.RandomStringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import zipcok.coach.model.CoachFileDTO;
import zipcok.homegym.model.HomeGymDAO;
import zipcok.homegym.model.HomeGymDTO;
import zipcok.homegym.model.HomeGymEquipmentDAO;
import zipcok.homegym.model.HomeGymEquipmentDTO;

@Controller
public class HomeGymController {
	
	@Autowired
	private HomeGymDAO homegymDAO;
	
	@Autowired
	private HomeGymEquipmentDAO homegymeqDAO;

	@RequestMapping("HomeGymList.do")
	public ModelAndView HomeGymList() {
		List<HomeGymDTO> list = homegymDAO.HomeGymList();
		ModelAndView mav = new ModelAndView();
		mav.addObject("HomeGymList", list);
		mav.setViewName("homegym/hgList");
		return mav;
	}
	
	@RequestMapping("HomeGymContent.do")
	public String HomeGymContent() {
		return "homegym/hgContent";
	}
	
	@RequestMapping("HomeGymReservation.do")
	public String HomeGymReservation() {
		return "homegym/hgReservationView";
	}
	
	@RequestMapping("HomeGymUseNotice.do")
	public String HomeGymMainForm() {
		return "homegym/hgUseNotice";
	}
	
	@RequestMapping("HomeGymAddNotice.do")
	public String HomeGymAddNoticeForm() {
		return "homegym/hgAddNotice";
	}
	
	@RequestMapping(value = "HomeGymAdd.do", method = RequestMethod.GET)
	public String HomeGymAddForm() {
		return "homegym/hgAddView";
	}
	
	@RequestMapping(value = "HomeGymAdd.do", method = RequestMethod.POST)
	public ModelAndView HomeGymAdd(
			HomeGymDTO dto,
			String eq_name[],
			int eq_count[],
			String eq_mem_id,
			@RequestParam("upload")List<MultipartFile> list) {
		int hg_result = homegymDAO.HomeGymAdd(dto);
		int eq_result = 0;
		for(int i = 0; i < eq_name.length; i++) {
			System.out.println(i);
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("eq_mem_id", eq_mem_id);
			map.put("eq_name", eq_name[i]);
			map.put("eq_count", eq_count[i]);
			eq_result = homegymeqDAO.HomeGymEquipmentAdd(map);
		}
//		ArrayList<CoachFileDTO> fileArr=new ArrayList<CoachFileDTO>();
//		for(int i=0;i<list.size();i++) {		
//			System.out.println("사진원본이름:"+list.get(i).getOriginalFilename());
//			String mfile_upload=copyInto( list.get(i));
//			String mfile_orig=list.get(i).getOriginalFilename();
//			String mfile_key="홈짐";
//			String mfile_mem_id=eq_mem_id;
//			int mfile_size=(int)(list.get(i).getSize());
//			String mfile_path="c:/kang/upload/homegymInfo/";
//			String mfile_type=list.get(i).getContentType();
//			CoachFileDTO cdto=new CoachFileDTO(0, mfile_key, mfile_mem_id, mfile_upload, mfile_size, mfile_orig, mfile_path, mfile_type);
//			
//			fileArr.add(cdto);
//		}
//		int fu_result = homegymDAO.HomeGymImgUpload(fileArr);
		ModelAndView mav = new ModelAndView();
		String msg = hg_result>0&&eq_result>0?"홈짐 등록이 정상적으로 처리되었습니다.":"등록에 실패하였습니다.";
		mav.addObject("msg", msg);
		mav.addObject("goPage", "HomeGymList.do");
		mav.setViewName("homegym/hgMsg");
		return mav;
	}
	/*실제파일복사관련 메서드*/
	private String copyInto(MultipartFile upload) {
		
		try {
			
			 /*파일이름중복없도록*/
	        Calendar cal = Calendar.getInstance()  ;
	        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyyMMdd_HHmmSS");
	        String time = dateFormat.format(cal.getTime());
	        String random=RandomStringUtils.randomAlphabetic(8);
	        String uploadName=time+random+upload.getOriginalFilename();
	        //현재시간+랜덤문자열+원본파일명을 더한 새로운 파일이름생성
	        
	      //System.out.println("writer:"+writer);
			System.out.println("파일새로운이름:"+uploadName);
	       
			byte bytes[]=upload.getBytes(); //복사할원본
			File outFile=new File("c:/kang/upload/homegymInfo/"+uploadName); //빈종이
			//이렇게하면 파일 덮어쓰기되서 나중에중복이름처리 생각해야댐 
			//Stream = 1바이트체계  Reader=2바이트체계
			
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
	
	@RequestMapping("HomeGymCardAdd.do")
	public String HomeGymCardAddForm() {
		return "homegym/hgCardAddView";
	}
	@RequestMapping("HomeGymAddrPopup.do")
	public String HomeGymAddrPopup() {
		return "homegym/hgAddrPopup";
	}
}
