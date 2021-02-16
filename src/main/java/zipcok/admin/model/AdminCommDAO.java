package zipcok.admin.model;

import java.util.List;

import zipcok.comm.model.CommunityDTO;
import zipcok.member.model.MemberDTO;

public interface AdminCommDAO {

	public List<CommunityDTO> searchComm(String com_name);//커뮤니티 정보 가져오기
	public String adminGetCoachId(int com_idx);//커뮤니티 번호로 코치 아이디 가져오기
	public MemberDTO searchMember(String mem_id);//아이디로 회원정보 가져오기
	public List<String> getCommMember(int uc_comm_idx);//커뮤니티 소속 회원 불러오기
	public int getAllBbsCount(int ex_comm_idx);//커뮤니티 번호로 총 게시물 수 구하기
	public int getAllRepleCount(int re_comm_idx);//커뮤니티 번호로 댓글 수 구하기
	public String getActDate(int ex_comm_idx);//최근 게시물 올린 날짜 구하기
	public int getComMemSum(String com_coach_id);//관리 회원 수 구하기
	public int getActMemSum(int ex_comm_idx);//활동 회원 수 구하기
	public List<String> getStartDate(int ex_comm_idx,String ex_id);//최근 활동 날짜 구하기
}
