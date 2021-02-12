package zipcok.admin.model;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import zipcok.coach.model.CoachDTO;
import zipcok.member.model.MemberAllDTO;

@Service
public class AdminCoachMatchDAOImple implements AdminCoachMatchDAO {

	@Autowired	
	private SqlSessionTemplate sqlMap;
	
	
	@Override
	public int coachMatchTotalCnt(HashMap<String, Object> map) {
		int totalCnt=sqlMap.selectOne("cTotalCnt",map);
		return totalCnt;
	}
	
	@Override
	public List<MemberAllDTO> coachMatchSearch(HashMap<String, Object> map) {
		List<MemberAllDTO> List=sqlMap.selectList("adminSearchCoach", map);
		return List;
	}
	
	@Override
	public CoachDTO adminCoachProfile(String id) {
		CoachDTO dto=sqlMap.selectOne("adminCoachProfile", id);
		return dto;
	}
	
	@Override
	public List<String> adminToCharDate(String id) {
		List<String> dto2=sqlMap.selectOne("adminToCharDate",id);
		
		return dto2;
	}

}
