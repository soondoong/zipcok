package zipcok.admin.model;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import zipcok.member.model.MemberAllDTO;

@Service
public class AdminCoachMatchDAOImple implements AdminCoachMatchDAO {

	@Autowired	
	private SqlSessionTemplate sqlMap;
	
	
	@Override
	public List<MemberAllDTO> coachMatchSearch(HashMap<String, Object> map) {
		List<MemberAllDTO> List=sqlMap.selectList("adminSearchCoach", map);
		
		return List;
	}

}
