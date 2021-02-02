package zipcok.homegym.model;

import java.util.ArrayList;
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
	public int HomeGymTotalCnt(Map<String, Object> options) {
		int result = sqlMap.selectOne("homegymTotalCntSQL", options);
		return result==0?1:result;
	}
	
	@Override
	public List<HomeGymDTO> HomeGymList(Map<String, Object> options) {
		List<HomeGymDTO> list = sqlMap.selectList("hgListSQL", options);
		return list;
	}
	@Override
	public List<HomeGymEquipmentDTO> UserEquipmentList(String userid) {
		List<HomeGymEquipmentDTO> list = sqlMap.selectList("userEquipmentListSQL", userid);
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


}
