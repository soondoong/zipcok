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

import javax.servlet.ServletContext;

import org.apache.commons.lang3.RandomStringUtils;
import org.springframework.beans.factory.annotation.Autowired;
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

@Controller
public class HomeGymController {
	
	@Autowired
	private HomeGymDAO homegymDAO;
	
	@Autowired
	private HomeGymEquipmentDAO homegymeqDAO;
	
	@Autowired
	ServletContext c;

	@RequestMapping("HomeGymList.do")
	public ModelAndView HomeGymList(
			@RequestParam(value="cp",defaultValue = "1")int cp,
			@RequestParam(value="top_option_date", defaultValue = "1900-01-01")String date,
			@RequestParam(value="top_option_location", defaultValue = "전체")String location
			) {
		
		String year = date.substring(0, 4);
		String month = date.substring(5, 7);
		String day = date.substring(8, 10);
		int totalCnt = homegymDAO.HomeGymTotalCnt(location, year, month, day);
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("location", location);
		if(!date.equals("1900-01-01"))map.put("date", date);
		
		int listSize = 5;
		int pageSize = 5;
		String pageStr = zipcok.page.PageModule.makePage("HomeGymList.do", totalCnt, cp, listSize, pageSize);
		List<HomeGymDTO> list = homegymDAO.HomeGymList(cp, listSize, location, year, month, day);
		ModelAndView mav = new ModelAndView();
		mav.addObject("totalCnt", totalCnt);
		mav.addObject("pageStr", pageStr);
		mav.addObject("HomeGymList", list);
		mav.addObject("keywordMap", map);
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
	
	@RequestMapping(value = "HomeGymNickNameCheck.do")
	public ModelAndView HomeGymNicNameCheck(@RequestParam("hg_nickname")String hg_nickname) {
		String nickname = homegymDAO.HomeGymNickNameCheck(hg_nickname);
		String msg = "";
		if(nickname==null) msg = "0";
		else msg = "1";
		ModelAndView mav = new ModelAndView();
		mav.addObject("hg_NickNameCheck", msg);
		mav.setViewName("jsonView");
		return mav;
	}
	@RequestMapping(value = "avgPrice.do")
	public ModelAndView HomeGymAvgPrice() {
		int result = homegymDAO.HomeGymAddPrice();
		ModelAndView mav = new ModelAndView();
		mav.addObject("avgPrice", result);
		mav.setViewName("jsonView");
		return mav;
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
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("eq_mem_id", eq_mem_id);
			map.put("eq_name", eq_name[i]);
			map.put("eq_count", eq_count[i]);
			eq_result = homegymeqDAO.HomeGymEquipmentAdd(map);
		}
		ArrayList<CoachFileDTO> fileArr=new ArrayList<CoachFileDTO>();
		/*파일복사및저장하기*/
		for(int i=0;i<list.size();i++) {		
			String mfile_path=c.getRealPath("/upload/homegymInfo/"); //저장되는 경로
			String mfile_upload=copyInto( list.get(i), mfile_path);	//파일저장후 새로운이름생성됨
			String mfile_orig=list.get(i).getOriginalFilename(); //파일원본명
			String mfile_key="홈짐"; //파일저장 구분키
			String mfile_mem_id=eq_mem_id;
			int mfile_size=(int)(list.get(i).getSize());

			String mfile_type=list.get(i).getContentType();
			CoachFileDTO cdto=new CoachFileDTO(0, mfile_key, mfile_mem_id, mfile_upload, mfile_size, mfile_orig, mfile_path, mfile_type);
			
			fileArr.add(cdto);
		}
		int fu_result = homegymDAO.HomeGymImgUpload(fileArr);
		ModelAndView mav = new ModelAndView();
		String msg = hg_result>0&&eq_result>0&&fu_result>0?"홈짐 등록이 정상적으로 처리되었습니다.":"등록에 실패하였습니다.";
		mav.addObject("msg", msg);
		mav.addObject("goPage", "HomeGymList.do");
		mav.setViewName("homegym/hgMsg");
		return mav;
	}
	private String copyInto(MultipartFile upload, String path) {
		
		try {
	        Calendar cal = Calendar.getInstance()  ;
	        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyyMMdd_HHmmSS");
	        String time = dateFormat.format(cal.getTime());
	        String random=RandomStringUtils.randomAlphabetic(8);
	        String uploadName=time+random+upload.getOriginalFilename();
			byte bytes[]=upload.getBytes();
			File outFile=new File(path+uploadName);
			FileOutputStream fos=new FileOutputStream(outFile);
			fos.write(bytes);
			fos.close();
			return uploadName;
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
