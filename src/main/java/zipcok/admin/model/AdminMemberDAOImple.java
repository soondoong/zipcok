package zipcok.admin.model;

import java.util.*;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import zipcok.member.model.MemberDTO;

@Service
public class AdminMemberDAOImple implements AdminMemberDAO {

	@Autowired	
	private SqlSessionTemplate sqlMap;
	
	
	@Override
	public int adminMemberTotalCnt(HashMap<String, Object> map) {
		int totalCnt = sqlMap.selectOne("adminMemberTotalCnt", map);
		return totalCnt;
	}

	@Override
	public List<MemberDTO> adminMemberList(HashMap<String, Object> map) {
		List<MemberDTO> list = sqlMap.selectList("adminMemberList", map);
		return list;
	}
	
	@Override
	public MemberDTO adminMemberManage(String mem_id) {
		MemberDTO dto=sqlMap.selectOne("adminMemberManage", mem_id);
		return dto;
	}
	
	@Override
	public int adminMemberPwdUpdate(MemberDTO dto) {
		int count = sqlMap.update("adminMemberPwdUpdate", dto);
	      return count;
	}
	
	@Override
	public int adminMemberNameUpdate(MemberDTO dto) {
		int count = sqlMap.update("adminMemberNameUpdate", dto);
	      return count;
	}
	
	@Override
	public int adminMemberPhoneUpdate(MemberDTO dto) {
		int count = sqlMap.update("adminMemberPhoneUpdate", dto);
	      return count;
	}
	
	
	@Override
	public int adminMemberEmailUpdate(MemberDTO dto) {
		int count = sqlMap.update("adminMemberEmailUpdate", dto);
		return count;
	}
	
	
	@Override
	public int adminMemberTypeUpdate(MemberDTO dto) {
		int count = sqlMap.update("adminMemberTypeUpdate", dto);
	      return count;
	}
	
	@Override
	public int adminMemberAddrUpdate(MemberDTO dto) {
		int count = sqlMap.update("adminMemberAddrUpdate", dto);
		return count;
	}

	
	
}
