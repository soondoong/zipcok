package zipcok.comm.model;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import zipcok.member.model.MemberAllDTO;

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
	
	//커뮤니티 소속 멤버 아이디 가져오기
	@Override
	public List<String> getMemberId(int uc_comm_idx) {
		List<String> memberIdList=sqlMap.selectList("getMemberIdSQL",uc_comm_idx);
		return memberIdList;
	}
	
	//회원 정보 가져오기
	@Override
	public MemberAllDTO memberList(String mem_id) {
		MemberAllDTO memberList=sqlMap.selectOne("memberListSQL",mem_id);
		return memberList;
	}
	
	//날짜에 맞는 게시물 찾기
	@Override
	public ExBbsDTO getDayContent(String ex_id, String ex_writedate, int ex_comm_idx) {
		Map map=new HashMap();
		map.put("ex_id", ex_id);
		map.put("ex_writedate", ex_writedate);
		map.put("ex_comm_idx", ex_comm_idx);
		ExBbsDTO dayContent=sqlMap.selectOne("getDayContentSQL",map);
		return dayContent;
	}
	
	//운동글에 답글 달았는지 찾기 -> 리턴값 날짜로
	@Override
	public List<String> getDayGroup(String ex_id, int ex_comm_idx, int ex_group) {
		Map map=new HashMap();
		map.put("ex_id", ex_id);
		map.put("ex_comm_idx", ex_comm_idx);
		map.put("ex_group", ex_group);
		List<String> getDayGroup=sqlMap.selectList("getDayGroupSQL",map);
		return getDayGroup;
	}

}
