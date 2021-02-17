package zipcok.comm.model;

import java.util.List;

import zipcok.cpayment.model.Payment_RequestDTO;
import zipcok.comm.model.CommunityDTO;
import zipcok.comm.model.Users_communityDTO;
import zipcok.member.model.MemberDTO;
import zipcok.homegym.model.Payment_detailsDTO;

public interface CommManageDAO {
	
	public List<Payment_detailsDTO> paymentList(String pd_target_id); //결제한 수강생 내역 가져오기
	public List<Payment_detailsDTO> paymentList_finish(String pd_target_id);
	public List<CommunityDTO> manageCommList(String com_coach_id);//개설 커뮤니티 정보 가져오기
	public int manageCommPlus(String com_coach_id,String com_name);//커뮤니티 개설하기
	public List<Users_communityDTO> commUsersList(int uc_comm_idx);//커뮤니티 소속 회원들 이름 리스트 만들기
	public String commUserGetName(String mem_id);//아이디로 회원 이름 가져오는 메소드
	public List<MemberDTO> commUserIdSearch(String mem_id);//커뮤니티 유저 찾기
	public String getCommName(int uc_comm_idx);//커뮤니티 이름 찾기
	public int commMemPlus(String uc_mem_id, int uc_comm_idx, String com_name);//수강생 추가
	public int commMemSumPlus(int com_idx);//총 수강생 수 더하기

}
