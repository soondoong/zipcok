package zipcok.member.model;

import java.util.*;

import org.mybatis.spring.SqlSessionTemplate;

public class MemberDAOImple implements MemberDAO {

	private SqlSessionTemplate sqlMap;

	public MemberDAOImple(SqlSessionTemplate sqlMap) {
		super();
		this.sqlMap = sqlMap;
	}

	@Override
	public int memberJoinSubmit(MemberDTO dto) {
		int count = sqlMap.insert("memberJoin", dto);
		return count;
	}

	@Override
	public String idCheck(String mem_id) {
		String str = sqlMap.selectOne("idCheck", mem_id);
		return str;
	}
	
	@Override
	public String pwdCheck(String mem_pwd) {
		String str = sqlMap.selectOne("pwdCheck", mem_pwd);
		return str;
	}
		
	@Override
	public String getMemberName(String mem_id) {
		String str = sqlMap.selectOne("getMemberName", mem_id);
		return str;
	}
	
}


