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
	

}
