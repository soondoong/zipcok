package zipcok.comm.model;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class CommunityDAOImple implements CommunityDAO {

	@Autowired
	private SqlSessionTemplate sqlMap;
	
	//커뮤니티 정보 가져와서 심어주는 메소드
	@Override
	public CommunityDTO commList(String mem_id, String mem_type) {
		int com_idx=0;
		if(mem_type.equals("코치회원")){
			com_idx=sqlMap.selectOne("coachcommListSQL",mem_id);
		}
		else if(mem_type.equals("일반회원")) {
			com_idx=sqlMap.selectOne("normalcommListSQL",mem_id);
		}
		CommunityDTO dto=sqlMap.selectOne("commListSQL",com_idx);
		return dto;
	}
	
	@Override
	public String getCaochName(String com_coach_id) {
		String mem_name=sqlMap.selectOne("getCaochNameSQL",com_coach_id);
		return mem_name;
	}

}
