package zipcok.admin.model;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import zipcok.comm.model.CommunityDTO;
import zipcok.member.model.MemberDTO;

@Service
public class AdminCommDAOImple implements AdminCommDAO {
	
	@Autowired	
	private SqlSessionTemplate sqlMap;
	
	//커뮤니티 정보 가져오기
	@Override
	public List<CommunityDTO> searchComm(String com_name) {
		Map map=new HashMap();
		map.put("com_name", com_name);
		List<CommunityDTO> dto=sqlMap.selectList("searchCommSQL",map);
		return dto;
	}
	
	//아이디로 회원정보 가져오기
	@Override
	public MemberDTO searchMember(String mem_id) {
		MemberDTO dto=sqlMap.selectOne("searchMemberSQL",mem_id);
		return dto;
	}
	
	//커뮤니티 소속 회원 불러오기
	@Override
	public List<String> getCommMember(int uc_comm_idx) {
		List<String> list=sqlMap.selectList("getCommMemberSQL",uc_comm_idx);
		return list;
	}

}
