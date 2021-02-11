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
	
	//커뮤니티 리스트 가져오기
	@Override
	public List<Integer> commList(String mem_id, String mem_type) {
		List<Integer> com_idx=new ArrayList<Integer>();
		if(mem_type.equals("코치회원")){
			com_idx=sqlMap.selectList("coachcommListSQL",mem_id);
		}
		else if(mem_type.equals("일반회원")) {
			com_idx=sqlMap.selectList("normalcommListSQL",mem_id);
		}
		return com_idx;
	}
	
	//커뮤니티 이름 가져오기
	@Override
	public String getCommName(int com_idx) {
		String com_name=sqlMap.selectOne("getCommNameSQL",com_idx);
		return com_name;
	}
	
	//코치 이름 가져오기
	@Override
	public String getCaochName(String com_coach_id) {
		String mem_name=sqlMap.selectOne("getCaochNameSQL",com_coach_id);
		return mem_name;
	}
	
	//커뮤니티 정보 DTO 가져오기
	@Override
	public CommunityDTO getComInfo(int com_idx) {
		CommunityDTO dto=sqlMap.selectOne("getComInfoSQL",com_idx);
		return dto;
	}

}
