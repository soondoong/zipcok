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
import javax.servlet.http.HttpServletRequest;

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
			@RequestParam(value="top_option_date", defaultValue = "")String date,
			@RequestParam(value="top_option_location", defaultValue = "전체")String location,
			@RequestParam(value="left_opton_price", defaultValue = "10")int price,
			@RequestParam(value="left_option_person_count", defaultValue = "1")int person_count,
			HttpServletRequest req
			) {
		String keywords = "";
		keywords += "&top_option_location="+location;
		if(date.length()==0 || date ==null) {
			date = "1900-01-01";
		}
		keywords += "&top_option_date="+date;
		String eq_option_s[] = req.getParameterValues("left_option_eq");
		String eq_options = "";
		if(eq_option_s!=null) {
			for(int i = 0 ; i < eq_option_s.length ; i ++) {
				eq_options += eq_option_s[i];
				keywords += "&left_option_eq="+eq_option_s[i];
				if(i!=eq_option_s.length-1) {
					eq_options += ",";
				}
			}
		}
		keywords += "&left_option_price="+price;
		keywords += "&left_option_person_count="+person_count;
		int listSize = 5;
		int pageSize = 5;
		Map<String, Object> options = new HashMap<String, Object>();
		int start=(cp-1)*listSize+1;
		int end=cp*listSize;
		options.put("start", start);
		options.put("end", end);
		options.put("location", location);
		options.put("choice_date", date);
		options.put("choice_date_d", java.sql.Date.valueOf(date));
		options.put("price", price);
		options.put("person_count", person_count);
		int totalCnt = homegymDAO.HomeGymTotalCnt(options);
		List<HomeGymDTO> list = homegymDAO.HomeGymList(options);
		for(int i = 0 ; i < list.size() ; i++) {
			list.get(i).setHg_eq_list(homegymDAO.UserEquipmentList(list.get(i).getHg_mem_id())); 
		}
		String pageStr = zipcok.page.HomeGymPageModule.makePage("HomeGymList.do", totalCnt, cp, listSize, pageSize, keywords );
		Map<String, Object> keywordMap = new HashMap<String, Object>();
		keywordMap.put("eq_options", eq_options);
		keywordMap.put("location", location);
		if(!date.equals("1900-01-01"))	keywordMap.put("date", date);
		keywordMap.put("price", price);
		keywordMap.put("person_count", person_count);
		

		ModelAndView mav = new ModelAndView();
		mav.addObject("totalCnt", totalCnt);
		mav.addObject("pageStr", pageStr);
		mav.addObject("HomeGymList", list);
		mav.addObject("keywordMap", keywordMap);
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
	public ModelAndView HomeGymAdd(HomeGymDTO dto, String eq_name[], int eq_count[],
			@RequestParam("upload")List<MultipartFile> list) {
		int hg_result = homegymDAO.HomeGymAdd(dto);
		int eq_result = 0;
		for(int i = 0; i < eq_name.length; i++) {
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("eq_mem_id", dto.getHg_mem_id());
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
			String mfile_mem_id=dto.getHg_mem_id();
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
