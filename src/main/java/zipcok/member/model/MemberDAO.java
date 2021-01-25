package zipcok.member.model;

import java.util.*;

public interface MemberDAO {

	public int memberJoinSubmit(MemberDTO dto);
	public int loginCheck(String mem_id);
}
