package zipcok.mypage.model;

import java.util.*;

import org.mybatis.spring.SqlSessionTemplate;

import zipcok.member.model.MemberDTO;

public class MypageDAOImple implements MypageDAO {

	private SqlSessionTemplate sqlMap;
	
	public MypageDAOImple(SqlSessionTemplate sqlMap) {
		super();
		this.sqlMap = sqlMap;
	}
	
	
	@Override
	public List memberProfile(String mem_id) {
		
		List list = sqlMap.selectList("memberProfile", mem_id);
		
		return list;
	}
	
	@Override
	public int mypagePwdUpdate(MemberDTO dto) {
		int count = sqlMap.update("mypagePwdUpdate", dto);
		return count;
	}
	
	
}
