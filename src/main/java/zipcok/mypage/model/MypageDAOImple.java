package zipcok.mypage.model;

import java.util.*;

import org.mybatis.spring.SqlSessionTemplate;

import zipcok.coach.model.CoachFileDTO;
import zipcok.member.model.MemberDTO;

public class MypageDAOImple implements MypageDAO {

	private SqlSessionTemplate sqlMap;
	
	public MypageDAOImple(SqlSessionTemplate sqlMap) {
		super();
		this.sqlMap = sqlMap;
	}
	
	
	@Override
	public MemberDTO memberProfile(String mem_id) {   //이거어차피한명인데 왜 리스트로 받아오는겨?-수연
		
		MemberDTO dto= sqlMap.selectOne("memberProfile", mem_id);
		
		return dto;
	}
	
	@Override
	public int mypagePwdUpdate(MemberDTO dto) {
		int count = sqlMap.update("mypagePwdUpdate", dto);
		return count;
	}
	
	@Override
	public int mypageAddrUpdate(MemberDTO dto) {
		int count = sqlMap.update("mypageAddrUpdate", dto);
		return count;
	}
	
	@Override
	public int mypageEmailUpdate(MemberDTO dto) {
		int count = sqlMap.update("mypageEmailUpdate", dto);
		return count;
	}
	
	@Override
	public int mypagePhoneUpdate(MemberDTO dto) {
		int count = sqlMap.update("mypagePhoneUpdate", dto);
		return count;
	}
	
	@Override
	public List memberProfilePhoto(String mfile_mem_id) {
		List list = sqlMap.selectList("memberProfilePhoto", mfile_mem_id);
		return list;
	}
	
}
