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
	public int loginCheck(String mem_id) {
		int count = sqlMap.selectOne("loginCheck", mem_id);
		return count;
	}

}
