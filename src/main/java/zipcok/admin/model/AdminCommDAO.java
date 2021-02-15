package zipcok.admin.model;

import zipcok.comm.model.CommunityDTO;
import zipcok.member.model.MemberDTO;

public interface AdminCommDAO {

	public CommunityDTO searchComm(String com_name);//커뮤니티 정보 가져오기
	public MemberDTO searchMember(String mem_id);//아이디로 회원정보 가져오기
}
