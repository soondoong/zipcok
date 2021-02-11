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
	public int adminMemberTotalCnt(Map<String, Object> map) {
		int totalCnt = sqlMap.selectOne("totalCnt", map);
		return totalCnt;
	}

	@Override
	public List<MemberDTO> adminMemberList(Map<String, Object> map) {
		List<MemberDTO> list = sqlMap.selectList("adminMemberList", map);
		return list;
	}
	
	
}
