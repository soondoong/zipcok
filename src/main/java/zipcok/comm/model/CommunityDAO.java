package zipcok.comm.model;

import java.util.*;
import zipcok.member.model.MemberAllDTO;

public interface CommunityDAO {
	
	public List<Integer> commList(String mem_id, String mem_type);//커뮤니티 리스트 가져오기
	public String getCommName(int com_idx);//커뮤니티 이름 가져오기
	public String getCaochName(String com_coach_id);//코치 이름 가져오기
	public CommunityDTO getComInfo(int com_idx);//커뮤니티 정보 DTO 가져오기
	public List<String> getMemberId(int uc_comm_idx);//커뮤니티 소속 멤버 아이디 가져오기
	public MemberAllDTO memberList(String mem_id);//회원 정보 가져오기
	public ExBbsDTO getDayContent(String ex_id, String ex_writedate, int ex_comm_idx);//날짜에 맞는 게시물 찾기
	public List<Integer> getDayGroup(String ex_id, int ex_comm_idx, int ex_group);//운동글에 답글 달았는지 찾기 -> 리턴값 날짜로
	
	

}
