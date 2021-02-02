package zipcok.mypage.model;

import java.util.*;

import org.apache.commons.collections.map.HashedMap;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

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
	public CoachFileDTO memberProfilePhoto(String mem_id) {
		CoachFileDTO cdto = sqlMap.selectOne("memberProfilePhoto", mem_id);
		return cdto;
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
	
	//F&A 고객센터 작성글 총 수
	@Override
	public int mypageWriteListTotalCnt() {
		int count=sqlMap.selectOne("mypageWriteListTotalCnt");
		return count==0?1:count;
	}
	
	//F&A 고객센터 작성글 목록
	@Override
	public List mypageWriteList(int cp, int ls, String mem_id) {
		int start=(cp-1)*ls+1;
		int end=cp*ls;
		Map map=new HashedMap();
		map.put("mem_id", mem_id);
		map.put("start", start);
		map.put("end", end);
		List list = sqlMap.selectList("mypageWriteList", map);
		
		return list;
	}
	
	//홈짐 좋아요 총 수
	@Override
	public int mypageHomeGymLikeListTotalCnt() {
		int count=sqlMap.selectOne("mypageHomeGymLikeListTotalCnt");
		return count==0?1:count;
	}
	
	//홈짐 좋아요 키 구분
	@Override
	public String likeListKey(String mem_id) {
		String str = sqlMap.selectOne("mypageLikeListKey", mem_id);
		return str;
	}
	
	//홈짐 좋아요 목록
	@Override
	public List mypageHomeGymLikeList(int cp, int ls, String mem_id) {
		int start=(cp-1)*ls+1;
		int end=cp*ls;
		Map map=new HashedMap();
		map.put("mem_id", mem_id);
		map.put("start", start);
		map.put("end", end);
		List list = sqlMap.selectList("mypageHomeGymLikeList", map);
		
		return list;
	}
	

	
}
