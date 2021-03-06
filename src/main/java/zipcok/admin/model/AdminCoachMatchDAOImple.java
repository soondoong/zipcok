package zipcok.admin.model;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import zipcok.chat.model.MessageDTO;
import zipcok.coach.model.CoachDTO;
import zipcok.coach.model.RequestFormDTO;
import zipcok.cpayment.model.Payment_RequestDTO;
import zipcok.member.model.MemberAllDTO;

@Service
public class AdminCoachMatchDAOImple implements AdminCoachMatchDAO {

	@Autowired	
	private SqlSessionTemplate sqlMap;
	
	
	//////////////////////////////코치관리////////////////////////
	//총게시물수
	@Override
	public int coachMatchTotalCnt(HashMap<String, Object> map) {
		int totalCnt=sqlMap.selectOne("cTotalCnt",map);
		return totalCnt==0?1:totalCnt;
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
	
	//코치아이디로 멤버테이블에서 코치이름 가져오기
	@Override
	public MemberAllDTO coachNameCall(String id) {
		MemberAllDTO dto=sqlMap.selectOne("adminCoachNameCall",id);
		return dto;
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
//////////////////////////////////코치매칭관리//////////////////////////////////////
	
	@Override
	public List<ReqFormMemberDTO> reqFormData(HashMap<String, Object> map) {
		List<ReqFormMemberDTO> list = sqlMap.selectList("reqFormMemberData", map);
		return list;
	}
	
	
	@Override
	public int ajaxCmTotalCnt(HashMap<String, Object> map) {
		int totalCnt = sqlMap.selectOne("ajaxCmTotalCnt", map);
		return totalCnt==0?1:totalCnt;
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
	
	
	/*마이페이지취소요청중으로 바꾸기*/
	@Override
	public int adminCoachPlzCancelUpdateStatus(int pd_idx) {
		int count = sqlMap.update("updateStatusToCanclePlz",pd_idx);
		return count;
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
	//pd_idx로 상담요청서 가져오기
	@Override
	public RequestFormDTO findRequestByPd_idx(int pd_idx) {
		 RequestFormDTO dto=sqlMap.selectOne("findRequestByPd_idx", pd_idx);
		return dto;
	}
	
	
	
	/*req_idx 로 채팅방정보다가져오기*/
	@Override
	public List<MessageDTO> searchAllMessagesByReqIdx(HashMap<String,Object> map) {
		int cp = (int)map.get("cp");
		int ls = (int)map.get("ls");
		int start=(cp-1)*ls+1;
		int end=cp*ls;
		
		map.put("start",start);
		map.put("end",end);
		
		 List<MessageDTO> list =sqlMap.selectList("searchMessages", map);
		return list;
	}
	
	
	/*관리자가 메세지내용바꾸기*/
	@Override
	public int MessagesManage(HashMap<String, Object> map) {
		int count =sqlMap.update("MessagesManage",map);
		return count;
	}
	
	/*관리자가 결제요청서 내용바꾸기*/
	@Override
	public int MessagesPaymentReqManage(HashMap<String, Object> map) {
		//메시지는 위에서 바꾸고 여기선 삭제해주자
		int count =sqlMap.delete("MessagesPaymentReqManage",map);
		return count;
	}
	
	@Override
	public Payment_RequestDTO findPaymentReqByMsgIdx(HashMap<String, Object> map) {
		Payment_RequestDTO dto = sqlMap.selectOne("findPaymentReqByMsgIdx",map);
		return dto;
	}
	
}
