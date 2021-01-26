package zipcok.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

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
	public ModelAndView HomeGymAdd(HomeGymDTO dto, String eq_name[], int eq_count[], String eq_mem_id) {
		int hg_result = homegymDAO.HomeGymAdd(dto);
		int eq_result = 0;
		for(int i = 0 ; i < eq_name.length; i++) {
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("eq_mem_id", eq_mem_id);
			map.put("eq_name", eq_name[i]);
			map.put("eq_count", eq_count[i]);
			eq_result = homegymeqDAO.HomeGymEquipmentAdd(map);
		}

		ModelAndView mav = new ModelAndView();
		String msg = hg_result>0&&eq_result>0?"홈짐 등록이 정상적으로 처리되었습니다.":"등록에 실패하였습니다.";
		mav.addObject("msg", msg);
		mav.addObject("goPage", "HomeGymList.do");
		mav.setViewName("homegym/hgMsg");
		return mav;
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
