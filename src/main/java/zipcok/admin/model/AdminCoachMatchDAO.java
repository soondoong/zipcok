package zipcok.admin.model;
import java.sql.*;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import zipcok.coach.model.CoachDTO;
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
	
	//////////////////////////////////취소환불관리//////////////////////////////////////
	public int CanTotalCnt(HashMap<String, Object> map);//환불여부로 총게시물 수 구하기
	public List<AdminPaymentDetailsDTO> coachMatchCancelList(HashMap<String, Object> map);//환불여부로 정보 가져오기
	public int CanSearchTotalCnt(HashMap<String, Object> map);//검색으로 총게시물 수 구하기
	public List<AdminPaymentDetailsDTO> adminCoachCancelSearchPd(HashMap<String, Object> map);//아이디로 환불정보 가져오기
	public int adminCoachCancelUpdateStatus(int pd_idx);
}
