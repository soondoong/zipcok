package zipcok.coachmypage.model;

import java.util.*;

import org.apache.commons.collections.map.HashedMap;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Service;

import zipcok.coach.model.CategoryDTO;
import zipcok.coach.model.CoachFileDTO;
import zipcok.coach.model.CurriDTO;

import zipcok.homegym.model.PaymentDTO;
import zipcok.homegym.model.Payment_detailsDTO;
import zipcok.coach.model.ReviewDTO;
import zipcok.homegym.model.HomeGymDTO;
import zipcok.homegym.model.HomeGymEquipmentDTO;
import zipcok.homegym.model.HomeGymPayListDTO;
import zipcok.homegym.model.Pd_AllDTO;
import zipcok.member.model.MemberDTO;

@Service
public class CoachMypageDAOImple implements CoachMypageDAO {

	private SqlSessionTemplate sqlMap;
	
	public CoachMypageDAOImple(SqlSessionTemplate sqlMap) {
		super();
		this.sqlMap = sqlMap;
	}
	/*결제계좌 등록한거 찾기*/
	@Override
	public PaymentDTO getCoachAccount(String coachId, String key) {
		HashMap<String,Object> map = new HashMap<String, Object>();
		map.put("mem_id",coachId);
		map.put("key",key);
		PaymentDTO dto=sqlMap.selectOne("getCoachAccount", map);
		return dto;
	}
	
	/*상담요청서 삭제*/
	@Override
	public int requestDelete(int req_idx) {
		int count=sqlMap.delete("requestDelete",req_idx);
		return count;
	}
	
	/*상담요청서 대기중을  상담중으로 전환시키기*/
	@Override
	public int requestStatusChange(int req_idx) {
		 int count=sqlMap.update("requestStatusChange", req_idx);
		return count;
	}
	
	/*상담요청서 상담중을  결제완료로 전환시키기*/
	@Override
	public int reqStatusChangetoOk(int req_idx,String status) {
		HashMap<String,Object> map = new HashMap<String, Object>();
		map.put("status",status);
		map.put("req_idx",req_idx);
		 int count=sqlMap.update("reqStatusChangetoOk", map);
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
	
	//작성글 삭제
	@Override
	public int coachMypageWriteDelete(String checkArr) {
		int count =sqlMap.delete("coachMypageWriteDelete", checkArr);
		return count;
	}
	
	//커뮤니티 작성글 수
	@Override
	public int coachMypageCommWriteListTotalCnt(String ex_id) {
		int count=sqlMap.selectOne("coachMypageCommWriteListTotalCnt", ex_id);
		return count;
	}
	//커뮤니티 작성글 목록
	@Override
	public List coachMypageCommWriteList(int cp, int ls, String ex_id) {
		int start=(cp-1)*ls+1;
		int end=cp*ls;
		Map map=new HashedMap();
		map.put("ex_id", ex_id);
		map.put("start", start);
		map.put("end", end);
		List list = sqlMap.selectList("coachMypageCommWriteList", map);
		
		return list;
	}
	
	//커뮤니티 작성글 삭제
	@Override
	public int coachMypageCommWriteDelete(String checkArr) {
		int count = sqlMap.delete("coachMypageCommWriteDelete", checkArr);
		return count;
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


/*커리큘럼 등록*/
@Override
public void curriInsert(CurriDTO cdto) {
	 sqlMap.insert("curriInsert",cdto);		
}

/*커리큘럼 수정*/
@Override
public void curriUpdate(CurriDTO cdto) {
	
	sqlMap.update("curriUpdate",cdto);
}
/*커리큘럼삭제*/
@Override
public void curriDelete(CurriDTO cdto) {
	sqlMap.delete("deleteCurri",cdto);
}

//코치결제내역서 리스트
@Override
public List<Pd_AllDTO> CmPaymentList(HashMap<String, Object> map) {
	int cp = (int)map.get("cp");
	int ls = (int)map.get("ls");
	int start=(cp-1)*ls+1;
	int end=cp*ls;
	
	map.put("start",start);
	map.put("end",end);
	 List<Pd_AllDTO>  list = sqlMap.selectList(	"CmPaymentList", map);
	return list;
}
@Override
public List<ReviewDTO> coachHomeGymReview(String homegymId) {
	List<ReviewDTO> list = sqlMap.selectList("coachmypageHomeGymReviewSelectSQL", homegymId);
	return list;
}
@Override
public int coachmypageHomeGymAddrUpdate(Map<String, String> map) {
	int result = sqlMap.update("coachmypageHomeGymAddrUpdateSQL", map);
	return result;
}
@Override
public boolean coachmypageHomeGymCheck(String id) {
	int result = sqlMap.selectOne("coachmypageHomeGymCheckSQL", id);
	return result==0?false:true;
}
@Override
public int coachmypageHomeGymEqAllDelete(String mem_id) {
	int result = sqlMap.delete("coachmypageHomeGymEqAllDeleteSQL", mem_id);
	return result;
}
@Override
public List<HomeGymEquipmentDTO> coachmypageHomeGymEqInfo(String user_id) {
	List<HomeGymEquipmentDTO> list = sqlMap.selectList("coachmypageHomeGymEqInfoSQL", user_id);
	return list;
}
@Override
public int coachmypageHomeGymEqUpdate(Map<String, String> map) {
	int result = sqlMap.insert("coachmypageHomeGymEqUpdate", map);
	return result;
}
@Override
public List<CoachFileDTO> coachmypageHomeGymImgInfo(String user_id) {
	   List<CoachFileDTO> list = sqlMap.selectList("coachmypageHomeGymImgInfoSQL", user_id);
	   return list;
}
@Override
public HomeGymDTO coachmypageHomeGymInfo(String user_id) {
	   HomeGymDTO dto = sqlMap.selectOne("coachmypageHomeGymInfoSQL", user_id);
	   return dto;
}
@Override
public int coachmypageHomeGymLikeCount(String user_id) {
	   int count = sqlMap.selectOne("coachmypageHomeGymLikeCount", user_id);
	   return count;
}
@Override
public int coachmypageHomeGymPerson_countUpdate(Map<String, Object> map) {
	int result = sqlMap.update("coachmypageHomeGymPerson_countUpdateSQL", map);
	return result;
}
@Override
public int coachmypageHomeGymPriceUpdate(Map<String, Object> map) {
	int result = sqlMap.update("coachmypageHomeGymPriceUpdateSQL", map);
	return result;
}
@Override
public int coachmypageHomeGymStationUpdate(Map<String, String> map) {
	int result = sqlMap.update("coachmypageHomeGymStationUpdateSQL", map);
	return result;
}
@Override
public int coachmypageHomeGymStautsChange(Map<String, String> map) {
	int result = sqlMap.update("coachmypageHomeGymStatusChangeSQL", map);
	return result;
}
@Override
public int coachmypageHomeGymUseDateUpdate(Map<String, Object> map) {
	int result = sqlMap.update("coachmypageHomeGymUseDateUpdate", map);
	return result;
}
@Override
public int coachmypageHomeGymUseTimeUpdate(Map<String, Object> map) {
	int result = sqlMap.update("coachmypageHomeGymUseTimeUpdate", map);
	return result;
}
@Override
public int coachmypageHomeGymPayListTotalCnt(Map<String, Object> map) {
	int count = sqlMap.selectOne("coachmypageHomeGymPayListTotalCnt", map);
	return count==0?1:count;
}
@Override
public List<HomeGymPayListDTO> coachmypageHomeGymPayList(Map<String, Object> map) {
	int cp = (Integer)map.get("cp");
	int ls = (Integer)map.get("ls");
	int start=(cp-1)*ls+1;
	int end=cp*ls;
	map.put("start", start);
	map.put("end", end);
	List<HomeGymPayListDTO> list = sqlMap.selectList("coachmypageHomeGymPayList", map);
	return list;
}
@Override
public boolean coachmypageHomeGymReviewCheck(int pd_idx) {
	String ck = "";
	ck = sqlMap.selectOne("coachmypageHomeGymReviewCheck", pd_idx);
	return ck==""?false:true;
}
@Override
public String coachmypageHomeGymNickname(String pd_target_id) {
	String hg_nickname = sqlMap.selectOne("coachmypageHomeGymNickname", pd_target_id);
	return hg_nickname;
}
}
