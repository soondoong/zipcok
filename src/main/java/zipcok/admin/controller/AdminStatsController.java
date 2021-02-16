package zipcok.admin.controller;

import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.google.gson.JsonArray;
import java.util.*;

import zipcok.admin.model.AdminCoachTongGyeDTO;
import zipcok.admin.model.AdminTongGyeDAO;
import zipcok.admin.model.GraphDTO;

@Controller
public class AdminStatsController {
		@Autowired
		AdminTongGyeDAO tonggyyedao;
	
	@RequestMapping("admin_statHomegymSales.do")
	public ModelAndView statHomegymSales() {
		
		ModelAndView mav=new ModelAndView();
		mav.setViewName("admin/admin_stat/admin_statHomegymSales");
		return mav;
	}
	/*코치매출통계-============start================*코치매출통계*/
	@RequestMapping("admin_statCoachSales.do")
	public ModelAndView statCoachSales() {
		
		ModelAndView mav=new ModelAndView();
		mav.setViewName("admin/admin_stat/admin_statCoachSales");
		return mav;
	}
	

	@RequestMapping("searchCoachTongGye.do")
	public ModelAndView searchCoachTongGye(@RequestParam("startDate") String startDate,
			@RequestParam("endDate") String endDate) {
		System.out.println(startDate +"/"+endDate);
		//검색조회결과
		ModelAndView mav=new ModelAndView();
		HashMap<String,Object> map = new 	HashMap<String,Object>();
		map.put("startDate",startDate);
		map.put("endDate",endDate);
		map.put("pd_key","코치");
		
		AdminCoachTongGyeDTO tonggyedto=  tonggyyedao.searchCoachTongGye(map);
		tonggyedto.setStartDate(startDate);
		tonggyedto.setEndDate(endDate);
		mav.addObject("tonggyedto", tonggyedto);
		
		
		//그래프에넣을 월간 총매칭수,매출,순수익값
		map.put("graphKey", "month");
		List<GraphDTO> list=  tonggyyedao.graphMonthCoachSales(map);
		
		// jsonArray 생성 수제로만든다
		/*StringBuffer j = new StringBuffer();
		j.append("[");
		for(int i=0; i<g.size();i++) {
			if(i == (g.size()-1)) { //마지막이라면
				j.append("{ y :"+g.get(i).gety()+", a:"+g.get(i).getSumAllMatch()+",b:"+g.get(i).getSumAllSell()+",c:"+g.get(i).getSumResultSell()+"}]");
			}else {
				j.append("{ y :"+g.get(i).gety()+", a:"+g.get(i).getSumAllMatch()+",b:"+g.get(i).getSumAllSell()+",c:"+g.get(i).getSumResultSell()+"},");
			}
			
		}*/
		//뭔가 스트링값이라서 데이터 취급을안하는듯함
		
		
		mav.addObject("graphdata", list);
		mav.setViewName("admin/admin_stat/admin_statCoachSales");
		return mav;
	}
	

	
	/*코치매출통계-===========end=================*코치매출통계*/
	

	@RequestMapping("admin_statCoachRegist.do")
	public ModelAndView statCoachRegist() {
		
		ModelAndView mav=new ModelAndView();
		mav.setViewName("admin/admin_stat/admin_statCoachRegist");
		return mav;
	}
	
	@RequestMapping("admin_statHomegymRegist.do")
	public ModelAndView statHomeGymRegist() {
		
		ModelAndView mav=new ModelAndView();
		mav.setViewName("admin/admin_stat/admin_statHomegymRegist");
		return mav;
	}
}
