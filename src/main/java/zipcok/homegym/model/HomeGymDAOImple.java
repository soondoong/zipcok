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
	public List<HomeGymDTO> HomeGymList(int cp, int listSize) {
		Map<String, Integer> map = new HashMap<String, Integer>();
		int start=(cp-1)*listSize+1;
		int end=cp*listSize;
		map.put("start", start);
		map.put("end", end);
		List<HomeGymDTO> list = sqlMap.selectList("hgListSQL", map);
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
	public int HomeGymTotalCnt() {
		int result = sqlMap.selectOne("homegymTotalCnt");
		return result;
	}

}
