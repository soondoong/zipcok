package zipcok.homegym.model;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import zipcok.coach.model.CoachFileDTO;
@Service
public class HomeGymDAOImple implements HomeGymDAO {

	@Autowired
	private SqlSessionTemplate sqlMap;
	
	public HomeGymDAOImple(SqlSessionTemplate sqlMap) {
		super();
		this.sqlMap = sqlMap;
	}
	
	@Override
	public boolean HomeGymCheck(String id) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public List<HomeGymDTO> HomeGymList(int cp, int listSize, String location, String year, String month, String day, int price, int person_count, String eq_option) {
		Map<String, Object> map = new HashMap<String, Object>();
		int start=(cp-1)*listSize+1;
		int end=cp*listSize;
		map.put("start", start);
		map.put("end", end);
		if(eq_option!=null)map.put("eq_option", eq_option);
		map.put("location", location);
		String select_date = year+'-'+month+'-'+day;
		map.put("select_date", select_date);
		map.put("select_date_date", java.sql.Date.valueOf(select_date));
		map.put("price", price);
		map.put("person_count", person_count);
		List<HomeGymDTO> list = sqlMap.selectList("hgListSQL", map);
		for(int i = 0 ; i < list.size(); i ++) {
			String hg_mem_id = list.get(i).getHg_mem_id();
			List<HomeGymEquipmentDTO> eq_list = sqlMap.selectList("hgEqList",hg_mem_id);
		}
		return list;
	}
	@Override
	public String HomeGymNickNameCheck(String hg_nickname) {
		String nickname = sqlMap.selectOne("hgNickNameCheckSQL", hg_nickname);
		return nickname;
	}
	
	@Override
	public int HomeGymAddPrice() {
		int avgPrice = sqlMap.selectOne("hgAvgPriceSQL");
		return avgPrice;
	}

	@Override
	public int HomeGymAdd(HomeGymDTO dto) {
		int hg_result = sqlMap.insert("hgAddSQL", dto);
		return hg_result;
	}
	
	@Override
	public int HomeGymImgUpload(ArrayList<CoachFileDTO> list) {
		int result = 0;
		for(int i = 0 ; i < list.size() ; i ++) {
			result += sqlMap.insert("hgImgAddSQL", list.get(i));
		}
		return result;
	}
	
	@Override
	public int HomeGymTotalCnt(String location, String year, String month, String day, int price, int person_count, String eq_option) {
		Map<String, Object> map = new HashMap<String, Object>();
		if(eq_option!=null)map.put("eq_option", eq_option);
		map.put("location", location);
		String select_date = year+'-'+month+'-'+day;		
		map.put("select_date", select_date);
		map.put("select_date_date", java.sql.Date.valueOf(select_date));
		map.put("price", price);
		map.put("person_count", person_count);
		
		int result = sqlMap.selectOne("homegymTotalCnt", map);
		return result==0?1:result;
	}
	
	@Override
	public List<HomeGymEquipmentDTO> EqList(String hg_mem_id) {
		List<HomeGymEquipmentDTO> list = sqlMap.selectList("hgEqList",hg_mem_id);
		return list;
	}

}
