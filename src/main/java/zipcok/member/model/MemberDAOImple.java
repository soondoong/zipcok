package zipcok.member.model;

import java.util.*;

import org.mybatis.spring.SqlSessionTemplate;

public class MemberDAOImple implements MemberDAO {
	
	private SqlSessionTemplate sqlMap;
	
	public MemberDAOImple() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	@Override
	public int memberJoinSubmit(MemberDTO dto) {
		// TODO Auto-generated method stub
		return 0;
	}
	
	
	
}
