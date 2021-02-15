package zipcok.admin.model;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import zipcok.coach.model.CoachDTO;
import zipcok.member.model.MemberAllDTO;

@Service
public class AdminCoachMatchDAOImple implements AdminCoachMatchDAO {

	@Autowired	
	private SqlSessionTemplate sqlMap;
	
	//총게시물수
	@Override
	public int coachMatchTotalCnt(HashMap<String, Object> map) {
		int totalCnt=sqlMap.selectOne("cTotalCnt",map);
		return totalCnt;
	}
	
	//코치검색하기
	@Override
	public List<MemberAllDTO> coachMatchSearch(HashMap<String, Object> map) {
		List<MemberAllDTO> List=sqlMap.selectList("adminSearchCoach", map);
		return List;
	}
	
	//코치프로필 뽑기
	@Override
	public CoachDTO adminCoachProfile(String id) {
		CoachDTO dto=sqlMap.selectOne("adminCoachProfile", id);
		return dto;
	}
	//가입날짜,최근수정날짜 형변환
	@Override
	public PyoAdDTO adminToCharDate(String id) {
		PyoAdDTO dto2=sqlMap.selectOne("adminToCharDate",id);
		
		return dto2;
	}
	
	
	//활동지역 수정
	@Override
	public int adminCoachFlocUpdate(HashMap<String, Object> map) {
		int count = sqlMap.update("adminCoachFlocUpdate", map);
		return count;
	}
	
	//소개글수정
	@Override
	public int adminCoachIntroUpdate(HashMap<String, Object> map) {
		int count = sqlMap.update("adminCoachIntroUpdate", map);
		return count;
	}
	
	//준비물수정
	@Override
	public int adminCoachMatUpdate(HashMap<String, Object> map) {
		int count=sqlMap.update("adminCoachMatUpdate", map);
		return count;
		
	}
	
	//강의유형 수정
	@Override
	public int adminCoachExtypeUpdate(HashMap<String, Object> map) {
		int count = sqlMap.update("adminCoachExtypeUpdate", map);
		return count;
	}
	
	//경력 수정
	@Override
	public int adminCoachYearUpdate(HashMap<String, Object> map) {
		int count = sqlMap.update("adminCoachYearUpdate", map);
		return count;
	}
//////////////////////////////////취소환불관리//////////////////////////////////////
	
	//총게시물 수 구하기
	@Override
	public int CanTotalCnt(HashMap<String, Object> map) {
		int totalCnt = sqlMap.selectOne("canTotalCnt",map);
		return totalCnt==0?1:totalCnt;
	}
	//결제정보테이블에서 가져오기(셀렉트박스)
	@Override
	public List<AdminPaymentDetailsDTO> coachMatchCancelList(HashMap<String, Object> map) {
		List<AdminPaymentDetailsDTO> list = sqlMap.selectList("adminCoachCancelAllList",map);
		return list;
	}

	@Override
	public int CanSearchTotalCnt(HashMap<String, Object> map) {
		int totalCnt = sqlMap.selectOne("canSearchTotalCnt", map);
		return totalCnt==0?1:totalCnt;
	}
	
	
	//결제정보테이블에서 가져오기(검색)
	@Override
	public List<AdminPaymentDetailsDTO> adminCoachCancelSearchPd(HashMap<String, Object> map) {
		List<AdminPaymentDetailsDTO> list=sqlMap.selectList("adminCoachCancleSearchPd",map);
		return list;
	}
	//결제정보 승인으로 바꿔주기
	@Override
	public int adminCoachCancelUpdateStatus(int pd_idx) {
		int count = sqlMap.update("updateStatus", pd_idx);
		return count;
	}
}
