package zipcok.mypage.model;

import java.util.*;

import org.apache.commons.collections.map.HashedMap;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import zipcok.coach.model.CoachFileDTO;
import zipcok.member.model.MemberAllDTO;
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
	
	/*프로필사진포함된 dto*/
	@Override
	public MemberAllDTO memberAllProfile(String mem_id) {
		MemberAllDTO dto= sqlMap.selectOne("memberAllProfile", mem_id);
		
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
	public int mypageWriteListTotalCnt(String mem_id) {
		int count=sqlMap.selectOne("mypageWriteListTotalCnt", mem_id);
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
	public int mypageHomeGymLikeListTotalCnt(String mem_id) {
		int count=sqlMap.selectOne("mypageHomeGymLikeListTotalCnt", mem_id);
		return count==0?1:count;
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
	
		//코치매칭 좋아요 총 수
		@Override
		public int mypageCoachMatchLikeListTotalCnt(String mem_id) {
			int count=sqlMap.selectOne("mypageCoachMatchLikeListTotalCnt", mem_id);
			return count==0?1:count;
		}
		
		//코치매칭 좋아요 목록
		@Override
		public List mypageCoachMatchLikeList(int cp, int ls, String mem_id) {
			int start=(cp-1)*ls+1;
			int end=cp*ls;
			Map map=new HashedMap();
			map.put("mem_id", mem_id);
			map.put("start", start);
			map.put("end", end);
			List list = sqlMap.selectList("mypageCoachMatchLikeList", map);
			
			return list;
		}
	
		@Override
		public int memberDelete(String mem_id) {
			int count = sqlMap.delete("memberDelete", mem_id);
			return count;
		}

	
}
