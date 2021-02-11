package zipcok.coachmypage.model;

import java.util.*;

import org.apache.commons.collections.map.HashedMap;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Service;

import zipcok.coach.model.CategoryDTO;
import zipcok.coach.model.CoachFileDTO;
import zipcok.coach.model.CurriDTO;
import zipcok.member.model.MemberDTO;

@Service
public class CoachMypageDAOImple implements CoachMypageDAO {

	private SqlSessionTemplate sqlMap;
	
	public CoachMypageDAOImple(SqlSessionTemplate sqlMap) {
		super();
		this.sqlMap = sqlMap;
	}
	
	/*상담요청서 삭제*/
	@Override
	public int requestDelete(int req_idx) {
		int count=sqlMap.delete("requestDelete",req_idx);
		return count;
	}
	
	/*상담요청서 yet을 ing 상담중으로 전환시키기*/
	@Override
	public int requestStatusChange(int req_idx) {
		 int count=sqlMap.update("requestStatusChange", req_idx);
		return count;
	}
	
	/*코치프로필사진삭제*/
	@Override
	public int deleteProfileImg(CoachFileDTO dto) {
	
		int count=sqlMap.delete("DelCmpProfileImg",dto);
		
		return count;
	}
	/*코치프로필사진등록*/
	@Override
	public int insertProfileImg(CoachFileDTO dto) {
		
	  int count=sqlMap.insert("insertCmpProfileImg",dto);
		
		return count;
	}
	/*파일진짜삭제하려면필요*/

@Override
public CoachFileDTO findProfileDTO(String id) {
	CoachFileDTO dto=sqlMap.selectOne("findFileDTO", id);
	return dto;
}
	
	
	@Override
	public int coachMypageHomeGymLikeListTotalCnt(String mem_id) {
		int count=sqlMap.selectOne("coachMypageHomeGymLikeListTotalCnt", mem_id);
		return count==0?1:count;
	}
	
	@Override
	public List coachMypageHomeGymLikeList(int cp, int ls, String mem_id) {
		int start=(cp-1)*ls+1;
		int end=cp*ls;
		Map map=new HashedMap();
		map.put("mem_id", mem_id);
		map.put("start", start);
		map.put("end", end);
		List list = sqlMap.selectList("coachMypageHomeGymLikeList", map);
		
		return list;
	}
	
	//F&A 고객센터 작성글 총 수
	@Override
	public int coachMypageWriteListTotalCnt(String mem_id) {
		int count=sqlMap.selectOne("coachMypageWriteListTotalCnt", mem_id);
		return count==0?1:count;
	}
	
	//F&A 고객센터 작성글 목록
	@Override
	public List coachMypageWriteList(int cp, int ls, String mem_id) {
		int start=(cp-1)*ls+1;
		int end=cp*ls;
		Map map=new HashedMap();
		map.put("mem_id", mem_id);
		map.put("start", start);
		map.put("end", end);
		List list = sqlMap.selectList("coachMypageWriteList", map);
		
		return list;
	}
	
	//코치마이페이지 일반프로필
	@Override
	public MemberDTO coachMypageProfile(String mem_id) {
		MemberDTO mdto = sqlMap.selectOne("coachMypageProfile", mem_id);
		return mdto;
	}
	
	@Override
	public int coachMypagePwdUpdate(MemberDTO dto) {
		int count = sqlMap.update("coachMypagePwdUpdate", dto);
		return count;
	}
	
	@Override
	public int coachMypageAddrUpdate(MemberDTO dto) {
		int count = sqlMap.update("coachMypageAddrUpdate", dto);
		return count;
	}
	
	@Override
	public int coachMypageEmailUpdate(MemberDTO dto) {
		int count = sqlMap.update("coachMypageEmailUpdate", dto);
		return count;
	}
	
	@Override
	public int coachMypagePhoneUpdate(MemberDTO dto) {
		int count = sqlMap.update("coachMypagePhoneUpdate", dto);
		return count;
	}
	
	/*아이디로카테고리찾기*/
	@Override
	public List<CategoryDTO> categoryFind(String id) {
		List<CategoryDTO> list= sqlMap.selectList("findCategories", id);
		
		return list;
	}
	
	
/*카테고리삭제 - 커리큘럼도 같이삭제해야함*/
@Override
public int categoryDelete(HashMap<String, String> map) {
	int count= sqlMap.delete("deleteCategories",map);
	count += sqlMap.delete("deleteCurri",map);
	return count;
}

@Override
public int categoryinsert(CategoryDTO dto) {
  int count = sqlMap.insert("insertCategory",dto);
	return count;
}

@Override
public int curriDelete(HashMap<String, String> map) {
	// TODO Auto-generated method stub
	return 0;
}

/*커리큘럼 등록*/
@Override
public void curriInsert(CurriDTO cdto) {
	 sqlMap.insert("curriInsert",cdto);		
}
	
}
