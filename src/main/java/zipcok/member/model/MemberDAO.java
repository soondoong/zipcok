package zipcok.member.model;

import java.util.*;

public interface MemberDAO {

	public int memberJoinSubmit(MemberDTO dto);
	public String idCheck(String mem_id);
	public String pwdCheck(String mem_pwd);
	public String getMemberName(String mem_id);
	public boolean idTwoCheck(String mem_id);
}
