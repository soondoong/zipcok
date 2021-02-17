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
import zipcok.coach.model.ReviewDTO;
import zipcok.homegym.model.HomeGymDAO;
import zipcok.homegym.model.HomeGymDTO;
import zipcok.homegym.model.HomeGymEquipmentDAO;
import zipcok.homegym.model.HomeGymEquipmentDTO;
import zipcok.homegym.model.HomeGymReservationDAO;
import zipcok.homegym.model.HomeGymReservationDTO;
import zipcok.homegym.model.PaymentDAO;
import zipcok.homegym.model.PaymentDTO;
import zipcok.homegym.model.Payment_detailsDAO;
import zipcok.homegym.model.Payment_detailsDTO;
import zipcok.member.model.MemberDTO;

@Controller
public class HomeGymController {
	
	@Autowired
	private HomeGymDAO homegymDAO;
	
	@Autowired
	private HomeGymEquipmentDAO homegymeqDAO;
	@Autowired
	private PaymentDAO homegympayDAO;
	@Autowired
	private HomeGymReservationDAO homegymreserDAO;
	@Autowired
	private Payment_detailsDAO homegympdDAO;
	
	@Autowired
	ServletContext c;

	@RequestMapping("HomeGymList.do")
	public ModelAndView HomeGymList(
			@RequestParam(value="cp",defaultValue = "1")int cp,
			@RequestParam(value="top_option_date", defaultValue = "")String date,
			@RequestParam(value="top_option_location", defaultValue = "전체")String location,
			@RequestParam(value="left_opton_price", defaultValue = "10")int price,
			@RequestParam(value="left_option_person_count", defaultValue = "1")int person_count,
			HttpServletRequest req,
			HttpSession session
			) {
		String keywords = "";
		keywords += "&top_option_location="+location;
		if(date.length()==0 || date ==null) {
			date = "1900-01-01";
		}
		keywords += "&top_option_date="+date;
		String eq_options = "";
		String eq_option_s[] = req.getParameterValues("left_option_eq");
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
		if(eq_option_s!=null)options.put("eq_option_s", eq_option_s);
		options.put("eq_options", eq_options);
		options.put("location", location);
		options.put("choice_date", date);
		options.put("choice_date_d", java.sql.Date.valueOf(date));
		options.put("price", price);
		options.put("person_count", person_count);		
		List<HomeGymDTO> list = homegymDAO.HomeGymList(options);	

		for(int i = 0 ; i < list.size() ; i++) {
			list.get(i).setHg_faddr(list.get(i).getHg_faddr().substring(0, list.get(i).getHg_faddr().indexOf("구")+1));

			String file_upload = homegymDAO.HomeGymIdImgSelect(list.get(i).getHg_mem_id());
			list.get(i).setHg_upload(file_upload);
			List<HomeGymEquipmentDTO> eq_list = homegymeqDAO.UserEquipmentList(list.get(i).getHg_mem_id());
			list.get(i).setHg_eq_list(eq_list);
			Map<String, String> like_option = new HashMap<String, String>();
			if((String)session.getAttribute("sid")!=null) {
				String user_id = (String)session.getAttribute("sid");
				String target_id = list.get(i).getHg_mem_id();
				like_option.put("like_mem_id", user_id);
				like_option.put("like_target_id", target_id);
				int result = homegymDAO.HomeGymLikeSelect(like_option);
				list.get(i).setHg_like(result);
			}
			else if((String)session.getAttribute("coachId")!=null) {
				String user_id = (String)session.getAttribute("coachId");
				String target_id = list.get(i).getHg_mem_id();
				like_option.put("like_mem_id", user_id);
				like_option.put("like_target_id", target_id);
				int result = homegymDAO.HomeGymLikeSelect(like_option);
				list.get(i).setHg_like(result);
			}
		}
		int totalCnt = homegymDAO.HomeGymTotalCnt(options)==0?1:homegymDAO.HomeGymTotalCnt(options);
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
	public ModelAndView HomeGymContent(
			@RequestParam(value = "hg_mem_id")String homegymId,
			HttpSession session) {
		HomeGymDTO hgContent = homegymDAO.HomeGymContent(homegymId);
		hgContent.setHg_faddr(hgContent.getHg_faddr().substring(0, hgContent.getHg_faddr().indexOf("구")+1));
		List<HomeGymEquipmentDTO> eqContent = homegymeqDAO.HomeGymEquipmentContent(homegymId);
		List<CoachFileDTO> imgContent = homegymDAO.HomeGymImageContent(homegymId);
		List<ReviewDTO> reviewList = homegymDAO.HomeGymReview(homegymId);
		Map<String, String> like_option = new HashMap<String, String>();
		int like_result = 0;
		if((String)session.getAttribute("sid")!=null) {
			String user_id = (String)session.getAttribute("sid");
			String target_id = hgContent.getHg_mem_id();
			like_option.put("like_mem_id", user_id);
			like_option.put("like_target_id", target_id);
			like_result = homegymDAO.HomeGymLikeSelect(like_option);
		}
		else if((String)session.getAttribute("coachId")!=null) {
			String user_id = (String)session.getAttribute("coachId");
			String target_id = hgContent.getHg_mem_id();
			like_option.put("like_mem_id", user_id);
			like_option.put("like_target_id", target_id);
			like_result = homegymDAO.HomeGymLikeSelect(like_option);
		}
		double star_avg = homegymDAO.HomeGymReviewStarAvg(homegymId);
		ModelAndView mav = new ModelAndView();
		mav.addObject("hgContent", hgContent);
		mav.addObject("eqContent", eqContent);
		mav.addObject("imgContent", imgContent);
		mav.addObject("reviewList", reviewList);
		mav.addObject("like_result", like_result);
		mav.addObject("star_avg", star_avg);
		mav.setViewName("homegym/hgContent");
		return mav;
	}
	
	@RequestMapping(value="HomeGymReservation.do")
	public ModelAndView HomeGymReservationForm(HomeGymReservationDTO dto, HttpSession session) {
		String user_id = "";
		if(session.getAttribute("sid")!=null)user_id = (String)session.getAttribute("sid");
		else if(session.getAttribute("coachId")!=null)user_id = (String)session.getAttribute("coachId");
		dto.setMem_id(user_id);
		ModelAndView mav = new ModelAndView();
		mav.addObject("reserInfo", dto);
		mav.setViewName("homegym/hgPaymentPage");
		return mav;
	}
	@RequestMapping(value = "HomeGymPayPage.do")
	public ModelAndView HomeGymPaymentForm(@RequestParam("reser_idx")int reser_idx) {
		HomeGymReservationDTO dto = homegymreserDAO.homeGymReservationSelect(reser_idx);
		ModelAndView mav = new ModelAndView();
		mav.addObject("reservationInfo", dto);
		mav.setViewName("homegym/hgPaymentPage");
		return mav;
	}
	
	@RequestMapping("HomeGymUseNotice.do")
	public String HomeGymMainForm() {
		return "homegym/hgUseNotice";
	}
	
	@RequestMapping("HomeGymAddNotice.do")
	public ModelAndView HomeGymAddNoticeForm(
			HttpSession session) {
		int check_result = 0;

		ModelAndView mav = new ModelAndView();
		mav.addObject("check_result", check_result);
		mav.setViewName("homegym/hgAddNotice");
		return mav;
	}
	
	@RequestMapping(value = "HomeGymAdd.do", method = RequestMethod.GET)
	public ModelAndView HomeGymAddForm(HttpSession session) {
		String mem_id = "";
		if(session.getAttribute("sid")!=null) {
			mem_id = (String)session.getAttribute("sid");
		}else if(session.getAttribute("coachId")!=null) {
			mem_id = (String)session.getAttribute("coachId");
		}
		boolean hg_check = homegymDAO.HomeGymCheck(mem_id);
		ModelAndView mav = new ModelAndView();
		mav.addObject("hg_check", hg_check);
		mav.setViewName("homegym/hgAddView");
		return mav;
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
		int result = 0;
		if(homegymDAO.HomeGymAddPrice()!=null) {
			result = Integer.parseInt(homegymDAO.HomeGymAddPrice());
		}
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("avgPrice", result);
		mav.setViewName("jsonView");
		return mav;
	}
	
	@RequestMapping(value = "HomeGymAdd.do", method = RequestMethod.POST)
	public ModelAndView HomeGymAdd(HomeGymDTO dto, String eq_name[], int eq_count[],
			@RequestParam("upload")List<MultipartFile> list) {
		dto.setHg_comeinfo(dto.getHg_comeinfo().replaceAll("\n", "<br>"));
		dto.setHg_info(dto.getHg_info().replaceAll("\n", "<br>"));
		int hg_result = homegymDAO.HomeGymAdd(dto);
		String user_id = dto.getHg_mem_id();
		int eq_result = 0;
		for(int i = 0; i < eq_name.length; i++) {
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("eq_mem_id", user_id);
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
			String mfile_mem_id=user_id;
			int mfile_size=(int)(list.get(i).getSize());

			String mfile_type=list.get(i).getContentType();
			CoachFileDTO cdto=new CoachFileDTO(0, mfile_key, mfile_mem_id, mfile_upload, mfile_size, mfile_orig, mfile_path, mfile_type);
			
			fileArr.add(cdto);
		}
		int fu_result = homegymDAO.HomeGymImgUpload(fileArr);
		ModelAndView mav = new ModelAndView();
		String msg = hg_result>0&&eq_result>0&&fu_result>0?"홈짐 등록이 정상적으로 처리되었습니다.":"등록에 실패하였습니다.";
		String goPage = msg.equals("홈짐 등록이 정상적으로 처리되었습니다.")?"HomeGymPaymentAdd.do?mem_id="+user_id:"HomeGymList.do";
		mav.addObject("msg", msg);
		mav.addObject("goPage", goPage);
		mav.setViewName("homegym/hgMsg");
		return mav;
	}
	
	private String copyInto(MultipartFile upload, String path) {
		
		try {
	        Calendar cal = Calendar.getInstance();
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
	
	@RequestMapping(value = "HomeGymPaymentAdd.do", method = RequestMethod.GET)
	public ModelAndView HomeGymPaymentAddForm(@RequestParam("mem_id")String mem_id) {
		ModelAndView mav = new ModelAndView();
		mav.addObject("mem_id", mem_id);
		mav.setViewName("homegym/hgPaymentAddView");
		return mav;
	}
	@RequestMapping(value = "HomeGymPaymentAdd.do", method = RequestMethod.POST)
	public ModelAndView HomeGymPaymentAdd(PaymentDTO dto,
			@RequestParam("hg_mem_id")String user_id) {
		dto.setHg_mem_id(user_id);
		int result = homegympayDAO.HomeGymPaymentAdd(dto);
		ModelAndView mav = new ModelAndView();
		String msg = result>0?"계좌가 성공적으로 등록되었습니다.":"계좌 등록에 오류가 발생하였습니다.";
		String goPage = result>0?"myHomeGymHavingCheck.do?mem_id="+user_id:"HomeGymPaymentAdd.do";
		mav.addObject("msg", msg);
		mav.addObject("goPage", goPage);
		mav.setViewName("homegym/hgMsg");
		return mav;
	}
	
	@RequestMapping("HomeGymAddrPopup.do")
	public String HomeGymAddrPopup() {
		return "homegym/hgAddrPopup";
	}
	
	@RequestMapping("HomeGymPayListAdd.do")
	public ModelAndView HomeGymPayListAdd(
			HomeGymReservationDTO dto,
			Payment_detailsDTO dto2,
			HttpSession session) {
		int reser_result = homegymreserDAO.HomeGymReservationAdd(dto);
		int max_reserIdx = homegymreserDAO.HomeGymReservationMaxIdxFind();
		dto2.setPd_req_idx(max_reserIdx);
		int pd_result = homegympdDAO.PaymentListAdd(dto2);
		String goPage = "";
		if(reser_result>0 && pd_result>0) {
		if(session.getAttribute("sid")!=null) {
			goPage = "memberProfileForm.do";
		}else if(session.getAttribute("coachId")!=null) {
			goPage = "coachMyPage.do";
		}
		}else {
			goPage = "index.do";
		}
		ModelAndView mav = new ModelAndView();
		mav.addObject("pd_result", pd_result);
		mav.addObject("reser_result", reser_result);
		mav.addObject("goPage", goPage);
		mav.setViewName("homegym/hgPayListMsg");
		return mav;
	}
	@RequestMapping("HomegymLikeOn.do")
	public ModelAndView HomeGymLikeOn(
			@RequestParam("user_id")String user_id,
			@RequestParam("target_id")String target_id) {
		Map<String, String> map = new HashMap<String, String>();
		map.put("like_mem_id", user_id);
		map.put("like_target_id", target_id);
		int result = homegymDAO.HomeGymLikeInsert(map);
		ModelAndView mav = new ModelAndView();
		mav.addObject("on_check", result);
		mav.setViewName("jsonView");
		return mav;
	}
	@RequestMapping("HomegymLikeOff.do")
	public ModelAndView HomeGymLikeOff(
			@RequestParam("user_id")String user_id,
			@RequestParam("target_id")String target_id) {
		Map<String, String> map = new HashMap<String, String>();
		map.put("like_mem_id", user_id);
		map.put("like_target_id", target_id);
		int result = homegymDAO.HomeGymLikeDelete(map);
		ModelAndView mav = new ModelAndView();
		mav.addObject("off_check", result);
		mav.setViewName("jsonView");
		return mav;
	}
}
