package zipcok.homegym.model;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import zipcok.coach.model.CoachFileDTO;
import zipcok.coach.model.ReviewDTO;
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
		int result = sqlMap.selectOne("homegymCheckSQL", id);
		return result==1?false:true;
	}
	@Override
	public HomeGymDTO HomeGymContent(String homegymId) {
		HomeGymDTO dto = sqlMap.selectOne("hgContentSQL", homegymId);
		return dto;
	}
	@Override
		public List<CoachFileDTO> HomeGymImageContent(String homegymId) {
		List<CoachFileDTO> list = sqlMap.selectList("hgImageContentSQL", homegymId);
		return list;
	}
	
	@Override
	public List<HomeGymDTO> HomeGymList(Map<String, Object> options) {
		List<HomeGymDTO> list = sqlMap.selectList("hgListSQL", options);
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
	public List<ReviewDTO> HomeGymReview(String homegymId) {
		List<ReviewDTO> list = sqlMap.selectList("homegymReviewSelectSQL", homegymId);
		return list;
	}
	@Override
	public String HomeGymIdImgSelect(String homegymId) {
		String file_upload = sqlMap.selectOne("homegymImgUploadSelectSQL", homegymId);
		return file_upload;
	}
}
