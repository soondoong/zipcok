package zipcok.member.model;

import java.util.*;

public interface MemberDAO {

	public int memberJoinSubmit(HashMap<String,Object> map);
	public String idCheck(String mem_id);
	public String pwdCheck(String mem_id);
	public String getMemberName(String mem_id);
	public String idFind(String mem_email);
	public String pwdFind(String mem_id);
	public int pwdUpdate(String mem_id);
	
}
