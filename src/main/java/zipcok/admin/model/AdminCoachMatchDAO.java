package zipcok.admin.model;
import java.sql.*;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import zipcok.chat.model.MessageDTO;
import zipcok.coach.model.CoachDTO;
import zipcok.coach.model.RequestFormDTO;
import zipcok.cpayment.model.Payment_RequestDTO;
import zipcok.member.model.MemberAllDTO;

public interface AdminCoachMatchDAO {
	//////////////////////////////////코치정보관리//////////////////////////////////////
	public int coachMatchTotalCnt(HashMap<String, Object> map);//코치관리페이지 총 게시물 수 구하기
	public List<MemberAllDTO> coachMatchSearch(HashMap<String, Object> map);//코치관리페이지 리스트 뽑기
	public CoachDTO adminCoachProfile(String id);//코치정보가져오기
	public PyoAdDTO adminToCharDate(String id);//가입날짜,최근수정날짜 가져오기
	public int adminCoachIntroUpdate(HashMap<String, Object> map);//소개글수정
	public int adminCoachMatUpdate(HashMap<String, Object> map);//준비물수정
	public int adminCoachExtypeUpdate(HashMap<String, Object> map);//강의유형수정
	public int adminCoachYearUpdate(HashMap<String, Object> map);//경력수정
	public int adminCoachFlocUpdate(HashMap<String, Object> map);//활동지역수정
	//////////////////////////////////코치매칭관리//////////////////////////////////////
	public List<ReqFormMemberDTO> reqFormData(HashMap<String, Object> map);//매칭정보 가져오기
	public int ajaxCmTotalCnt(HashMap<String, Object> map); // ajax 페이징하기위해 총 게시물 수 구하기
	//////////////////////////////////취소환불관리//////////////////////////////////////
	public int CanTotalCnt(HashMap<String, Object> map);//환불여부로 총게시물 수 구하기
	public List<AdminPaymentDetailsDTO> coachMatchCancelList(HashMap<String, Object> map);//환불여부로 정보 가져오기
	public int CanSearchTotalCnt(HashMap<String, Object> map);//검색으로 총게시물 수 구하기
	public List<AdminPaymentDetailsDTO> adminCoachCancelSearchPd(HashMap<String, Object> map);//아이디로 환불정보 가져오기
	public int adminCoachCancelUpdateStatus(int pd_idx);//환불승인버튼누르면 수정해주기
	public int adminCoachPlzCancelUpdateStatus(int pd_idx);//마이페이지 취소요청중으로 수정해주기
	public RequestFormDTO findRequestByPd_idx(int pd_idx);//결제내역서 idx로 상담요청서찾기
	public MemberAllDTO coachNameCall(String id);//코치아이디로 코치이름 가져오기
	
	public List<MessageDTO> searchAllMessagesByReqIdx(HashMap<String,Object> map); //req_idx로 채팅방정보다가져오기
	public int MessagesManage(HashMap<String,Object> map); //메세지내용 바꾸기
	public int MessagesPaymentReqManage(HashMap<String,Object> map); //결제요청서와 메세지내용 바꾸기
	public Payment_RequestDTO findPaymentReqByMsgIdx(HashMap<String,Object> map); //msg_idx로 결제요청서 정보찾기
}
